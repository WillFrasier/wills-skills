# App Context (template — fill me in)

> **This is the only app-specific file in this skill.** Fill in every section below
> for your product before using the skill. Everything else in the skill is
> product-agnostic. Keep the section headings so the skill's instructions still
> resolve.

## 1. Product

- **Name**: [product name as it should appear in the Canva Design Brief]
- **Domain**: `[your domain]` (used in the Design Brief and as the CTA text)

## 2. Brand tokens

Define both themes; dark is the skill's default, light is opt-in via `ad.json`
`"theme": "light"`.

### Dark theme

| Token | Hex |
|---|---|
| `bg` | `[hex]` |
| `surface` | `[hex]` |
| `line` | `[hex]` |
| `text` | `[hex]` |
| `muted` | `[hex]` |
| `accent` | `[hex]` |
| `brand-gradient` | `[stops]` |

### Light theme

Same tokens, light-theme values.

Notes the skill enforces: exactly one accent element per ad; the gradient is only
for display text and decorative masks, never as a panel background. List any brand
assets the gradient or masks apply to (e.g. a wave SVG) and where they live:
`[path]`.

## 3. Typography

Faces per role, with sizes, tracking, and leading. Include where the font files
live in the repo — local files, never a CDN, so renders are reproducible. If a
face isn't web-available, note the web fallback.

| Role | Face | Size | Tracking | Leading |
|---|---|---|---|---|
| Display | `[face]` | `[range]` | `[tracking]` | `[leading]` |
| Headline | `[face]` | `[range]` | `[tracking]` | `[leading]` |
| Subhead | `[face]` | `[range]` | `[tracking]` | `[leading]` |
| Uppercase label | `[face]` | `[range]` | `[tracking]` | `[leading]` |
| Callout | `[face]` | `[range]` | `[tracking]` | `[leading]` |
| Caption | `[face]` | `[range]` | `[tracking]` | `[leading]` |
| Stat | `[face]` | `[range]` | `[tracking]` | `[leading]` |

## 4. Where ads live

The ads directory (referenced as `<ads-dir>` by the skill). Renders are saved to
`<ads-dir>/<ad-id>/ad-<placement>.png`.
