---
name: ad-render
description: Turn approved ad copy plus supplied images into a finished ad image at exact platform dimensions. Generates the design via Canva, exports to PNG, and refuses to ship anything that fails a visual QA gate. Use whenever the user asks to render, produce, redo, resize, or fix an ad visual, ad creative, ad image, or a set of size variants, or points at an ad folder containing ad.json. Also use when an existing ad visual is described as generic, off-brand, cropped, illegible, or "not production ready". This skill does visual production only; it does not write, rewrite, or strategise copy.
---

# ad-render

Visual production. Copy and strategy are decided upstream and arrive as data. This skill typesets that copy into a layout, treats the supplied imagery, renders via the Canva MCP to exact pixels, and refuses to ship anything that fails a visual QA gate.

**In**: `ad.json` + asset files
**Out**: `ad-<placement>.png` at exact dimensions, plus a `Design` section in the README that records the Canva design_id so a human can reopen the design in Canva and tweak.

> **`references/app-context.md` is the only app-specific file in this skill.** It
> defines `<ads-dir>`, the product name and domain, the brand tokens, and the type
> scale. Load it before rendering. If it is unfilled or describes a different
> product than the one you're rendering for, say so and ask for the right context
> rather than rendering against the wrong brand.

---

## Boundaries

| Do | Do not |
|---|---|
| Fit, break, and typeset supplied copy | Write, rewrite, or "improve" copy |
| Report that copy overflows and by how much | Silently truncate, shrink type, or paraphrase to fit |
| Crop, frame, and treat supplied images | Generate imagery, or substitute stock when an asset is missing |
| Pick a layout that suits the supplied assets | Pick a messaging angle |
| Refuse to render and say why | Ship something that fails QA because it is close |

If copy will not fit, that is a finding to report upstream, not a problem to solve here. Report the field, the budget, the actual length, and stop.

---

## Step 1: Read the input contract

Read `ad.json` from the ad folder. Expected shape:

```json
{
  "id": "ad-07-example",
  "placements": ["reddit-feed"],
  "copy": {
    "headline": "[headline, verbatim from upstream copy]",
    "subhead": "[subhead or null]",
    "callout": "[short callout or null]",
    "stat_value": null,
    "stat_caption": null,
    "cta": "[bare domain]"
  },
  "assets": [
    {
      "path": "assets/screenshot.png",
      "role": "screenshot",
      "focus": { "x": 210, "y": 640, "w": 1180, "h": 420 },
      "note": "[what part of the UI must stay legible]"
    },
    { "path": "assets/logo.png", "role": "logo" }
  ]
}
```

**Asset roles** determine everything downstream:

| Role | Meaning | Treatment |
|---|---|---|
| `screenshot` | Real product UI. The strongest asset you can be given. | Crop to `focus`, frame, annotate |
| `photo` | A real photograph | Crop to focus, duotone or scrim, never decorate |
| `reference` | **Style direction, not content.** Do not composite it into the ad. | Read palette, weight, density; then discard |
| `logo` | Brand mark | Corner lockup, fixed size |
| `texture` | Background material | Behind everything, low contrast, opt-in only |

`focus` is a rect in the asset's own pixel space marking the region that must remain legible. If a `screenshot` asset has no `focus`, ask for one. Guessing which part of a UI matters is how you get an unreadable 200px-wide thumbnail.

Missing `ad.json`: accept a copy block plus file paths inline and construct the contract yourself, but write it to disk before rendering so the render is reproducible.

---

## Step 2: Resolve placement to a canvas

| Placement | Canvas | Notes |
|---|---|---|
| `reddit-feed` | 1080x1350 | Default. Mobile-dominant feed. |
| `reddit-conversation` | 1080x1080 | Smaller render, coarser detail |
| `og` | 1200x630 | Link preview |
| `x-feed` | 1600x900 | |
| `linkedin-feed` | 1200x1200 | |

Safe area is a 60px inset on all sides at 1080 wide, scaled proportionally. Nothing but full-bleed background crosses it.

Multiple placements in one run: render each independently from the same contract. Never scale one output to another size. Re-typeset per canvas, because line breaks that work at 4:5 do not survive at 16:9.

---

## Step 3: Select a layout from the assets

Layout follows what you were given, not what the copy says. Full specs in `references/layouts.md`.

| Assets supplied | Layout | |
|---|---|---|
| `screenshot` + `focus` | `L1-annotated` | Framed crop, one callout pinned to the focus region |
| `screenshot`, no callout copy | `L2-showcase` | Larger crop, headline above, no annotation |
| `photo` | `L3-scrim` | Full-bleed image, gradient scrim, type in the lower third |
| No image, `stat_value` present | `L4-stat` | One number. Nothing else competing. |
| No image, no stat | `L5-type` | Type only |
| Two `screenshot` assets | `L6-split` | Stacked panels, hard rule |

If a `reference` asset was supplied, read it for palette, type weight, and visual density, then apply those within the layout you selected. Never trace it, never composite it.

---

## Step 4: Fit the copy

Each layout declares per-field character budgets. Check every field before rendering.

Within budget, typeset:
- Break headlines at clause boundaries. Never mid-clause, never mid-word, never hyphenate.
- Balance ragged edges: no line shorter than 40% of the longest.
- Maximum two type weights per ad.
- Minimum 32px at 1080 wide, after any scaling.

Over budget, stop and report:

```
COPY OVERFLOW - not rendered
  headline: 78 chars, budget 60 (over by 18)
  callout:  94 chars, budget 90 (over by 4)
Layout L1-annotated. Send back to copy for a trim, or approve a layout change to L5-type (headline budget 96).
```

Do not render a "close enough" version alongside the report. It will get used.

---

## Step 5: Treat the imagery

This is where most ads are won or lost. Full procedure in `references/image-treatment.md`. Summary:

1. Crop to `focus` plus padding, not to the whole asset.
2. Scale so the smallest text inside the focus region lands at 28px or larger on the final canvas. If that is impossible, the crop is too wide. Crop tighter.
3. Frame per the layout: 16px radius, 1px `line` token border (value per theme in app-context), no drop shadow, no perspective tilt, no laptop bezel, no floating device mockup.
4. Annotate at most once, anchored to the focus region.
5. Never upscale past 1.5x. Ask for a higher-resolution export instead.

---

## Step 6: Render via Canva MCP

The render runs entirely against the user's Canva account via the `user-canva` MCP server. Do not run Playwright, headless Chrome, satori, or any local image library. The Canva render is the source of truth.

### 6a. Confirm Canva MCP is connected

Before anything else, check `GetMcpTools` for the `user-canva` server. If it is missing or in `needsAuth`, stop and tell the user to enable the Canva MCP. Do not silently fall back to a local render — that defeats the purpose of this skill.

### 6b. Upload local assets into Canva

For every `screenshot`, `photo`, or `logo` asset whose `path` is a local filesystem path, push it into the user's Canva account first. `generate-design` consumes assets by Canva `asset_id`, not local path.

```
upload-asset-from-url  url=<file:// absolute path OR http(s) URL>
```

Local files are not directly fetchable. Workarounds:
- If the project is running on a dev server with the asset in `public/`, build the URL from `NEXT_PUBLIC_*` env or `http://localhost:<port>/<asset-path>` and pass that.
- Otherwise, ask the user to drop the asset into Canva manually and supply the resulting `asset_id`. Record that `asset_id` in `ad.json` under the asset entry so future runs are reproducible.

Record every returned `asset_id` keyed by the asset's role (`screenshot`, `logo`, etc.). You will pass them to `generate-design` in the next step.

### 6c. Select a Canva design_type

`generate-design` takes an enum-locked `design_type`. The mapping below picks the closest preset for the target canvas; you will resize or re-export to exact pixels in step 6f.

| Target canvas | Canva `design_type` | Native output | Adjustment |
|---|---|---|---|
| 1080x1350 (reddit-feed) | `instagram_post` | 1080x1350 | None — match |
| 1080x1080 (reddit-conversation) | `facebook_post` | 940x788 | Resize to 1080x1080 after generation, or pick `instagram_post` and resize |
| 1200x630 (og) | `twitter_post` | 1600x900 | Resize |
| 1600x900 (x-feed) | `twitter_post` | 1600x900 | None — match |
| 1200x1200 (linkedin-feed) | `instagram_post` | 1080x1350 | Resize to 1200x1200 |

For any canvas the enum does not natively produce, generate the closest preset, then call `resize-design` with the exact target `width`/`height` before exporting. `resize-design` re-typesets text rather than stretching pixels.

### 6d. Build the Canva generation query

The `query` parameter is the only signal the AI uses. It must include layout geometry, copy text verbatim, asset roles, brand tokens, and the auto-fail vocabulary to forbid. Use this template — replace bracketed fields only:

```
**Design Brief**
- Title: [ad id from ad.json]
- Format: Reddit ad, [width]x[height] px
- Product: [product name (domain) from app-context]
- Visual concept: [one-sentence summary of the layout chosen in Step 3]

**Layout** (top to bottom)
- y 60-140: logo lockup, top-left, ~132px wide, muted white at 80% opacity
- y [headline band]: headline, [font], [size]px, [color], [align]
  - exact text: "[headline from ad.json]"
- y [image band]: framed image, full safe width, 16px corner radius, 1px line-token border, NO drop shadow, NO tilt
  - asset_id: [screenshot asset_id]
  - contains: [verbatim caption or summary of what the image shows]
- y [subhead band]: subhead, [font], [size]px, muted token
  - exact text: "[subhead from ad.json]"
- y [cta band]: cta, [font], [size]px, white with 4px accent underline
  - exact text: "[cta from ad.json]"

**Brand tokens** (values from app-context; theme per `ad.json`)
- Background canvas: [bg]
- Surface (image frame): [surface]
- Border: [line]
- Headline text: [text]
- Muted text: [muted]
- Accent (exactly one element): [accent]
- Typography: [headline face] for the headline, [body face] for body, [logo face] for the logo

**Strict prohibitions** (auto-fail if any of these appear)
- No drop shadows, no glows, no gradient meshes, no bokeh, no lens flare
- No waveform, no speedometer, no node cloud, no glowing brain, no circuit board
- No fake UI, no perspective-tilted device mockup, no laptop/phone bezel
- No watermark, no AI badge, no "made with" footer
- No more than ONE accent-coloured element. The accent is reserved for the cta underline.
- No text smaller than 32px on the final canvas
- No element crossing the 60px safe inset on any side
- Logo width must be <=12% of frame width
- Frame the screenshot at 16px radius with a 1px line-token border, no shadow, no tilt

**Quality checklist**
- Headline breaks at a clause boundary, never mid-word
- The supplied screenshot is the visual evidence, not decoration
- The CTA reads as a domain, not as a button label
```

Keep the query under ~1500 words. More text does not improve the result; it dilutes the brief.

### 6e. Generate, then promote

Call `generate-design` with the query and the chosen `design_type`. Pass `asset_ids` in the same order the layout lists them.

The tool returns one or more candidates, each with a `candidate_id`, `preview_url`, and `job_id`. Pick the strongest candidate (closest to the brief, no auto-fail vocabulary). If none of the candidates is acceptable, refine the query and retry — do **not** ship a candidate that violates the prohibitions.

Promote the chosen candidate:

```
create-design-from-candidate  job_id=<job_id>  candidate_id=<candidate_id>
```

This returns a `design_id` (starts with `D`). Record it.

### 6f. Resize to exact pixels if needed

If the canvas generated does not match the placement spec to the pixel, call `resize-design` with the exact `width` and `height` from Step 2. `resize-design` re-flows text. Do not stretch pixels — if `resize-design` is unavailable for this design, fall through to `export-design` and rely on the explicit `width`/`height` there to enforce the canvas size.

### 6g. Export

Before calling `export-design`, call `get-export-formats` with the `design_id` and confirm `png` is supported. Then:

```
export-design
  design_id=<design_id>
  format={
    "type": "png",
    "width": <exact pixels from Step 2>,
    "height": <exact pixels from Step 2>,
    "lossless": true,
    "export_quality": "pro"
  }
```

The response contains a download URL. Download the PNG and save it to `<ads-dir>/<ad-id>/ad-<placement>.png`. The filename convention is fixed; do not rename it to `ad-image.png` or `hero.png`.

If the Canva MCP is unavailable at export time (auth expired, server unreachable), do not ship a placeholder. Tell the user, then point them at the design URL so they can export manually.

---

## Step 7: QA gate (blocking)

Open the exported PNG. A successful `export-design` call is not evidence of a usable image.

**Hard fails, re-render:**
- [ ] Dimensions differ from the placement spec by even one pixel
- [ ] More than one page or frame
- [ ] Any text truncated, clipped, hyphenated, or ending mid-clause
- [ ] Any glyph smaller than 32px
- [ ] Any element crossing the 60px safe inset
- [ ] Text sitting on image with contrast below 4.5:1
- [ ] `focus` region present but not legible at 200px preview width
- [ ] Image upscaled past 1.5x, or visibly soft
- [ ] Colour or font outside the brand token set (tokens and faces per app-context; dark or light palette per `ad.json` theme)
- [ ] Logo absent, or wider than 12% of the frame
- [ ] More than one accent-coloured element
- [ ] File over 3MB

**Auto-fail visual vocabulary.** These are the tells that read as AI-generated:
watercolour and ink washes, paper texture, empty studio voids, hands on keyboards, gradient mesh, bokeh, lens flare, glowing brains, node clouds, circuit boards, robot hands, speedometers, waveforms, dataless upward arrows, fake UI, perspective-tilted device mockups.

**Then, one line each:**
- *Thumb*: at 200px wide, is the primary message legible?
- *Frame*: does anything touch or crowd an edge?
- *Asset*: is the supplied image doing work, or is it decoration?

If the asset is decoration, say so. That is a signal the wrong layout was chosen, or that the wrong asset was supplied.

---

## Step 8: Write back

Append a `## Render` block to `<ads-dir>/<ad-id>/README.md`:

```markdown
## Render

- Placement: reddit-feed (1080x1350)
- Layout: L2-showcase
- Canva: design_id=DAGx... job_id=abc123 candidate_id=def456
- Assets: report-finding.png (screenshot, asset_id=MAx..., focus x,y,w,h)
- Copy fit: headline 78/96, subhead 32/120, cta 22/24
- Output: ad-reddit-feed.png (412 KB)
- QA: pass
- Thumb / Frame / Asset: [one line each]
- Reopen in Canva: <design_url>
```

`design_url` is the edit URL on the returned design summary. It is the tweak-and-re-render path for a human.

---

## Errors

| Symptom | Cause | Action |
|---|---|---|
| Copy overflow | Upstream copy exceeds layout budget | Report and stop. Do not trim. |
| `focus` missing on a screenshot | Contract incomplete | Ask. Do not guess. |
| Focus region illegible at 200px | Crop too wide, or source too low-res | Crop tighter, then request a higher-res export |
| Canva MCP missing or `needsAuth` | Server not connected | Stop. Tell the user to enable the Canva MCP. Do not fall back to local rendering. |
| `upload-asset-from-url` rejects a `file://` path | Local files not fetchable over HTTP | Either serve the file from a running dev server, or ask the user to upload it manually and supply the asset_id. |
| `design_type` not in enum | Wrong preset for the placement | Use the closest preset, then `resize-design` to exact pixels. |
| `generate-design` returns no usable candidate | Query too vague, or prohibitions not respected | Refine the query and retry. Do not pick a candidate that violates the prohibitions. |
| `resize-design` rejects the size | Outside the supported range (40–25000 px) | Pick a preset closer to the target, or accept a small scale and document it. |
| `export-design` returns a wrong-size PNG | `width`/`height` not honored by this design | Re-export with the explicit dimensions, or skip the resize and let the export enforce the canvas. |
| No usable asset supplied | Contract has only `reference` or nothing | Use L4/L5. Do not generate or substitute an image. |

---

## Related

- `references/app-context.md` - the only app-specific file: product, brand tokens, type scale, output paths
- `references/layouts.md` - the six layouts, geometry and copy budgets
- `references/image-treatment.md` - screenshot cropping, framing, annotation
- Upstream: whichever skill produces `ad.json`. This skill consumes it and does not modify it.
- Canva MCP server: `user-canva`. Tools used: `upload-asset-from-url`, `generate-design`, `create-design-from-candidate`, `resize-design`, `get-export-formats`, `export-design`, `get-design`.
