---
name: ad-design
description: Create unique Canva designs for Reddit ads. Reads the ad's README.md (from the ad-copy skill), generates original visual concepts via Canva MCP. Use when you have ad copy and need a 1080x1080 Reddit ad image.
---

# ad-design — Reddit Ad Visual Creator

Create original, unique Canva designs for Reddit ads. Each ad gets a distinct visual concept tied to its message — no templated copy-paste with different wording.

**Input**: Ad folder path (e.g., `<ads-dir>/ad-NN-feature-name/`)  
**Output**: Canva design URL + exported PNG

> **`references/app-context.md` is the only app-specific file in this skill.** It
> defines `<ads-dir>`, the product name and domain, brand assets, palette,
> typography, and the visual concept library. Load it first. If it is unfilled or
> describes a different product than the one you're designing for, say so and ask
> for the right context rather than designing against the wrong brand.

---

## Step 0: Load context (required before designing)

Read these before creating the design:

1. **`references/app-context.md`** — product, brand assets, palette, typography, visual concept library
2. **`<ads-dir>/ad-NN-feature-name/README.md`** — the ad copy, visual direction, Canva brief
3. **Any ad strategy or design-spec source listed in app-context § Context sources** — design specs, brand guidelines

---

## Step 1: Parse the README

Extract from the README:

- **Headline**: The Reddit headline
- **Body text**: The primary text
- **CTA**: The call to action (visible text in the ad image — keep this clean, e.g. the bare domain from app-context § Product)
- **Destination URL**: The full UTM-tagged URL (from "Destination URL (UTM-tagged)" section) — this is the click destination for Reddit Ads Manager, NOT text to render in the image
- **Visual concept**: From "Visual direction" section
- **Real finding**: From "The proof" section (if available)
- **Brand assets needed**: Logo, colors, any specific imagery

If the README doesn't have a "Visual concept" section, create one based on the
ad's angle. App-context § Visual concept library maps angles to concept
directions and has worked examples.

---

## Step 2: Craft the Canva generation query

Build a detailed `generate-design` query that creates a unique visual concept.

### 2a. Query structure

The query must include ALL of these sections:

```
**Design Brief**
- **Title**: [Ad headline]
- **Format**: Reddit ad, square 1080x1080px
- **Product**: [product name (domain) from app-context]
- **Visual concept**: [Unique concept from README]

**Visual Description**
[Detailed description of the visual approach — layout, imagery, text placement]

**Text Content**
- Headline: "[headline from README]"
- Body: "[body text from README]"
- CTA: "[CTA from README — visible text only, e.g. the bare domain, NOT the full UTM URL]"
- Logo: [product] logo (small, bottom corner)

**Brand Guidelines**
- Background: [background colors from app-context § Palette]
- Accent: [accent colors from app-context § Palette]
- Typography: [typefaces from app-context § Typography]
- Logo: Use the [product] logo from the brand assets path in app-context
- [Any "never" imagery rules from app-context § Palette]

**Composition**
[Specific layout instructions — where text goes, where visual elements go]
```

### 2b. Visual concept examples

App-context § Visual concept library maps the product's ad angles to concept
directions. Every ad gets a concept tied to its own message and real proof — no
templated reuse across ads.

**Note**: The visible CTA text in the image is always the bare domain. The UTM-tagged URL (e.g. `[domain]?utm_source=reddit&utm_medium=cpc&utm_campaign=ad-01-example`) is the click destination set in Reddit Ads Manager, not text rendered in the image.

### 2c. Ensure originality

**Checklist**:
- [ ] This concept is specific to this ad's message (not generic)
- [ ] Uses real data from the README (identifiers, finding details)
- [ ] Different from other ads in `<ads-dir>/` (check existing ads)
- [ ] No clipart, no stock photos, no generic "AI" visuals
- [ ] Professional quality matching Stripe/Shopify ad aesthetic

---

## Step 3: Generate the design via Canva MCP

Use `generate-design` with these parameters:

```json
{
  "query": "[Full query from Step 2]",
  "design_type": "instagram_post",
  "user_intent": "Create a Reddit ad image for [product], 1080x1080 square format"
}
```

**Note**: `instagram_post` creates 1080x1350 (4:5) by default. The query must specify "square 1080x1080" to override.

### 3a. Handle the response

The tool returns:
- `candidate_id`: ID for the generated design candidate
- `preview_url`: URL to preview the design
- `job_id`: Job ID for creating the design

**Show the preview URL to the user** and ask:
- "Does this match the visual concept?"
- "Should I create it from this candidate, or regenerate with different instructions?"

### 3b. Create the design

If the user approves, use `create-design-from-candidate`:

```json
{
  "job_id": "[job_id from generate-design]",
  "candidate_id": "[candidate_id from generate-design]"
}
```

This adds the design to the user's Canva account.

---

## Step 4: Export the design

Use `export-design` to get a PNG file:

```json
{
  "design_id": "[design_id from create-design-from-candidate]",
  "format": "png",
  "user_intent": "Export Reddit ad as PNG for use in ad campaigns"
}
```

**Save the exported PNG** to `<ads-dir>/ad-NN-feature-name/ad-image.png`.

---

## Step 5: Update README with design details

Add a "## Design" section to the README:

```markdown
## Design

**Canva design ID**: [design_id]
**Preview URL**: [preview_url]
**Exported PNG**: ad-image.png

### Visual concept used:
[Description of the unique visual approach]

### Canva generation notes:
- [Any issues encountered]
- [What was adjusted from the initial concept]
```

---

## Step 6: Output summary

Present the completed design to the user:

```markdown
## Ad Design Complete

**Ad**: ad-NN-feature-name
**Design ID**: [design_id]
**Preview**: [preview_url]
**Exported**: <ads-dir>/ad-NN-feature-name/ad-image.png

### Visual concept:
[Description of what was created]

### Next steps:
1. Review the design at [preview_url]
2. If changes needed, run `/ad-design` again with feedback
3. Download the PNG and upload to Reddit Ads Manager

All files saved to: `<ads-dir>/ad-NN-feature-name/`
```

---

## Error handling

- **README not found**: Ask user to run `/ad-copy` first
- **Canva MCP not available**: Tell user to connect Canva MCP
- **Design generation fails**: Try a simpler visual concept, or break the query into smaller parts
- **Export fails**: Check design_id is correct, try again
- **Preview URL doesn't match concept**: Regenerate with more specific query

---

## Related skills

- **ad-research**: First step — provides research brief
- **ad-copy**: Second step — provides README with copy + visual direction
- **ad-render**: Alternative production path — typesets approved copy plus supplied assets at exact pixels via an `ad.json` contract
- **copy-writer**: Reference for brand voice and copy rules

---

## Canva MCP tools reference

- `generate-design`: Create a new design from a detailed query
- `create-design-from-candidate`: Add a generated candidate to the user's account
- `export-design`: Export a design as PNG, JPG, or PDF
- `get-design-pages`: Get the pages/elements of a design
- `search-brand-templates`: Search for brand templates (not used — we generate original designs)
- `list-brand-kits`: List available brand kits (optional — brand asset locations are in app-context)
