# Image treatment

The supplied image is usually the highest-value element in the ad and the one most often wasted. A full-page UI screenshot dropped into a frame is decoration. A hard crop on one legible finding is evidence.

## Screenshots

### 1. Crop to focus

Start from `focus`, not from the asset bounds.

```
pad     = 0.12 * max(focus.w, focus.h)
crop    = expand(focus, pad), clamped to asset bounds
```

Then extend the crop outward, but only to include structural context that makes the focus region intelligible: the column header above it, the row label to its left, the panel edge that shows it is part of a UI. Stop there. Everything else is noise competing for the 200px of legibility you actually get in a feed.

Never crop through a glyph. Snap crop edges to whitespace.

### 2. Verify legibility, then scale

```
final_px = source_glyph_px * (frame_width / crop.w)
```

`final_px` for the smallest text inside the focus region must be **28px or greater**. If it is not:

1. Crop tighter. Usually there is context in the crop that is not earning its place.
2. If already tight, request a higher-resolution source export.
3. Never upscale past 1.5x. Soft UI text reads as a fake mockup, which destroys the credibility the screenshot was there to provide.

### 3. Frame

```
radius        16px
border        1px, `line` token (value per theme in app-context)
background    `surface` token, visible only if the crop has transparency
shadow        none
tilt          none
device bezel  none
reflection    none
```

Explicitly forbidden: laptop and phone bezels, floating perspective mockups, browser chrome you did not screenshot, fake macOS traffic lights, and drop shadows. Each one announces "marketing asset" and undoes the point.

If the source has real browser or app chrome, keep it or crop it out cleanly at a natural edge. Do not half-crop it.

### 4. Redact

Before rendering, scan the crop for anything that should not ship: real customer names, email addresses, API keys, internal URLs, unreleased feature names, private user content you do not have rights to publish.

Redact by cropping it out. If it cannot be cropped out, cover it with a flat `surface` rectangle at the same radius. Never blur; blur reads as a cover-up and invites zooming.

Flag every redaction in the write-back.

### 5. Annotate (L1 only, once)

The callout is a label, not a diagram.

- Mono text on a flat `accent` fill, 12px padding, 4px radius
- Zero rotation
- Left edge aligned to the focus region's left edge
- Placed directly above or below the focus region, never overlapping it
- No arrows, no circles, no hand-drawn scribble effect, no highlighter marker
- One per ad

If the focus region cannot be identified without an arrow, the crop is wrong. Fix the crop.

## Photographs

- Crop to focus, same procedure.
- Desaturate 20%, or apply a duotone in `bg` and `muted`. Full-colour stock photography does not sit with a flat brand palette.
- Scrim before type, always. Verify 4.5:1 against the darkest and lightest pixel under each glyph, not the average.
- No filters, no vignettes, no grain overlays.

## Reference images

A `reference` asset is direction, not content.

Extract, then discard the image:
- Palette, mapped onto the nearest token, not sampled literally
- Type weight and density: is it sparse and huge, or dense and small
- Composition rhythm: where does the eye land first

Never composite, trace, or reproduce a reference asset. If the user wants the reference in the ad, they should have supplied it with `role: screenshot` or `role: photo`.

## Multiple assets

Two screenshots go to L6. Three or more is not a layout, it is a carousel; ask which two matter, or split into separate ads. Never build a collage.

## Missing assets

If the contract supplies no `screenshot` or `photo`, use L4 or L5. Do not generate an image, do not pull stock, do not reach for a texture to fill space. A well-set type-only ad beats a decorated one, and an empty region is a legitimate design decision.

## Asset audit

State in the write-back, in one line, what the image is doing:

- **Evidence** - it proves the claim. Correct use.
- **Context** - it shows what the product is. Acceptable.
- **Decoration** - it fills space. Wrong layout or wrong asset; say so.

If the honest answer is decoration, recommend L5 and re-render without it.