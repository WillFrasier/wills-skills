# Layouts and visual system

Geometry given at 1080x1350. Scale proportionally for other canvases and re-typeset; do not resample a finished render.

## Tokens

Token names and uses are fixed below. Their hex values, the brand gradient stops, and the wave mask assets live in `references/app-context.md` — the only app-specific file in this skill. Dark theme is default for ads; light theme is opt-in via `ad.json` `"theme": "light"`.

| Token | Use |
|---|---|
| `bg` | Canvas |
| `surface` | Image frames, panels |
| `line` | 1px borders, rules |
| `text` | Headlines, primary copy |
| `muted` | Captions, logo lockup, metadata |
| `accent` | Exactly one element per ad |
| `brand-gradient` | h1 text, wave masks |

One accent per ad. If two things are emphasised, nothing is. No shadows, no glows. Flat fills only. The brand gradient is allowed for h1 text (`background-clip: text`) and for the wave decorative element; it is not used as a background fill behind body copy.

## Brand gradient

The brand gradient is a key visual asset used in the logo and h1 treatments. Gradient stops per theme live in `references/app-context.md`.

Use `background-clip: text` with the gradient for h1 display text. Use the gradient as a mask fill for the wave SVG from the brand kit (asset paths in app-context). Do not use the gradient as a panel background or scrim.

## Type

Faces per role and the font file locations live in `references/app-context.md` (§ Typography) — they are brand-specific. The sizes below are part of the layout geometry; keep them unless you deliberately re-scale the layouts.

| Role | Size | Tracking | Leading |
|---|---|---|---|
| Display | 96-120px | -0.03em | 1.05 |
| Headline | 72-96px | -0.02em | 1.1 |
| Subhead | 44-56px | 0 | 1.35 |
| Uppercase label | 36-44px | 0.05em | 1.3 |
| Callout | 36-44px | 0 | 1.3 |
| Caption | 36-40px | 0.01em | 1.3 |
| Stat | 220-280px | -0.04em | 1.0 |

Left-align by default. Ragged right. Centre only in L4, and never more than three lines. Never letterspace body copy. Two weights maximum per ad.

## Copy budgets

Hard limits. Over budget is a stop condition, not a typesetting problem.

| Field | L1 | L2 | L3 | L4 | L5 | L6 |
|---|---|---|---|---|---|---|
| `headline` | 60 | 72 | 54 | 64 | 96 | 56 |
| `subhead` | 120 | 120 | 90 | - | 140 | - |
| `callout` | 90 | - | - | - | - | 60 each |
| `stat_value` | - | - | - | 8 | - | - |
| `stat_caption` | - | - | - | 40 | - | - |
| `cta` | 24 | 24 | 24 | 24 | 24 | 24 |

---

## L1-annotated

Framed screenshot crop with a single callout pinned to the focus region. The default when a real product screenshot exists. Highest-credibility layout available.

```
y   60- 140  logo, left, 132w, muted
y  180- 400  headline, 2 lines max
y  440-1060  image frame, full safe width, 16r, 1px line, surface behind
             crop scaled so focus fills 70-85% of frame width
     ~pinned callout: mono on accent fill, 12px pad, 0deg,
             left edge aligned to focus region's left edge,
             vertically adjacent to it, never covering it
y 1120-1220  subhead, muted
y 1250-1290  cta, muted, accent underline
```

The callout is the only accent element. Do not also accent the headline.

## L2-showcase

Screenshot with no annotation. Larger crop, more room to read the UI itself.

```
y   60- 140  logo
y  180- 320  headline, 1-2 lines
y  360-1140  image frame, full safe width, taller crop
y 1200-1290  subhead + cta on one baseline, muted
```

Use when the UI is self-explanatory. If it needs pointing at, use L1.

## L3-scrim

Full-bleed photograph. Type in the lower third over a scrim.

```
full bleed   image, cropped to focus, saturation -20%
y  810-1350  linear scrim, transparent to bg, no hard edge
y  940-1140  headline, 2-3 lines
y 1180-1250  subhead, muted
y 1280-1310  logo + cta, one baseline
```

Scrim must reach 4.5:1 contrast under every glyph. Verify against the actual crop, not the average.

## L4-stat

One number. Nothing else competing.

```
y   60- 140  logo
y  380- 720  stat_value, 280px, centred, single line
y  724- 728  4px accent rule, width = stat_value width
y  760- 830  stat_caption, muted, centred
y  900-1020  headline, 64px, centred, 2 lines max
y 1250-1290  cta
```

If `stat_value` exceeds 8 characters, this is the wrong layout.

## L5-type

Type only. Nothing on the canvas but words.

```
y   60- 140  logo
y  420- 980  headline, 120px, 4 lines max, left
             one clause in accent, never a whole line
y 1060-1180  subhead, 48px, muted
y 1250-1290  cta
```

No texture, no ornament, no background shape. The restraint is the design. Weakest layout when a real screenshot was available and unused.

## L6-split

Two screenshots, stacked. Comparison or before/after.

```
y  140- 690  panel A: bg, crop A + callout A label
y  700- 704  accent rule, full bleed
y  714-1240  panel B: surface, crop B + callout B label
y 1270-1310  logo left, cta right
```

Stack vertically. Two side-by-side columns are unreadable at 4:5 on a phone. Callout labels within 5 characters of each other in length, or the panels look unbalanced.

---

## Adding a layout

Add a component. Never parameterise an existing layout into flexibility; that is how a design system becomes a template engine that produces mush. Six opinionated layouts beat one configurable one.