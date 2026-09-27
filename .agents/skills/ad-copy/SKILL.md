---
name: ad-copy
description: Write high-converting Reddit ad copy with 3-round iteration. Reads research-brief.json (from ad-research), outputs README.md. Use when you have an ad concept and need audience-specific copy that sounds authentic to the target community and leads with real product proof.
---

# ad-copy — Reddit Ad Copy Writer

Write high-converting Reddit ad copy. Iterates through 3 rounds of self-critique to ensure the copy resonates with the target audience, sounds authentic to the community, and leads with real product proof.

**Input**: Ad folder path + freeform brief (e.g., "[Feature], [specific proof point]")  
**Output**: `<ads-dir>/ad-NN-feature-name/README.md`

> **`references/app-context.md` is the only app-specific file in this skill.** It
> defines `<ads-dir>`, the audience, brand voice, copy rules, guardrails, product
> catalog, context sources, and destination domain. Load it first. If it is unfilled
> or describes a different product than the one you're writing for, say so and ask
> for the right context rather than writing against the wrong brand.

---

## Step 0: Load context (required before writing)

Read ALL of these before drafting:

1. **`references/app-context.md`** — audience, brand voice, copy rules, guardrails, product catalog, destination domain
2. **The context sources listed in app-context § Context sources** — audience profile, ad strategy, product catalog code, marketing components, blog posts. Read the ones relevant to the ad's angle.
3. **`<ads-dir>/ad-NN-feature-name/research-brief.json`** (if exists) — community insights + real product proof

These give you:
- Every product feature with its real description (not just the abbreviated feature menu)
- Pricing tiers and what each includes
- Real user testimonials you can adapt as proof points
- The product's positioning language
- Authentic community vocabulary that the audience uses (from blogs)

The product catalog in app-context § Product catalog is the authoritative source —
do not rely on any abbreviated feature menu.

If `research-brief.json` doesn't exist, ask the user if they want to run `/ad-research` first, or proceed with the app-context audience only.

---

### Step 0b: Blog selection

Blogs are often the best source of authentic language the audience actually uses.
App-context § Blog selection maps ad angles to recommended posts. Skim the blog
index at the path listed in app-context § Context sources, then read 2-3 posts in full.

**What to extract from blogs:**
- [ ] Phrases the audience uses to describe their own problems (use these in headlines)
- [ ] Craft/domain concepts the ad should reference
- [ ] The emotional tone — venting, celebrating, worrying (match this energy)
- [ ] Real examples or anecdotes that could become "the proof" in an ad

---

## UTM Convention (required for all ads)

Every ad MUST include a UTM-tagged destination URL so clicks can be tracked in Metricool, GA4, or any analytics platform. The URL must be ready to paste directly into Reddit Ads or Metricool.

### Parameter rules

| Parameter | Value | Notes |
|-----------|-------|-------|
| `utm_source` | `reddit` | Fixed — always Reddit for this workflow |
| `utm_medium` | `cpc` | Paid social; use `social` only for organic posts |
| `utm_campaign` | `ad-NN-[slug]` | Matches the ad folder name, e.g. `ad-01-example-feature` |
| `utm_content` | `[variant]` | Optional — used when A/B testing headlines or visuals within one ad |

### URL format

```
https://[domain]?utm_source=reddit&utm_medium=cpc&utm_campaign=ad-NN-feature-name&utm_content=[optional-variant]
```

`[domain]` comes from app-context § Destination.

- **No trailing slash** before the `?` — keeps the URL clean.
- **All lowercase, hyphens not underscores** in campaign names — matches Metricool's recommended naming convention.
- **`utm_content`** is omitted entirely (not set to empty) when there is no variant.

### Examples

```text
# Bare URL (no variant)
https://[domain]?utm_source=reddit&utm_medium=cpc&utm_campaign=ad-01-example-campaign

# With variant (A/B test)
https://[domain]?utm_source=reddit&utm_medium=cpc&utm_campaign=ad-01-example-campaign&utm_content=headline-v2
```

### Metricool compatibility

Metricool's UTM builder maps directly to these four parameters (source, medium, campaign, content). The generated URL can be pasted as-is into:
- Reddit Ads campaign setup (destination URL field)
- Metricool's post planner UTM fields
- Any GA4 acquisition report

---

## Step 1: Parse the brief

Extract from the user's input:
- **Ad folder**: `<ads-dir>/ad-NN-feature-name/`
- **Feature/product**: (the feature this ad promotes)
- **Angle**: (what aspect to emphasize)
- **Must-include proof**: (a specific finding from the research brief, if any)

If the ad folder doesn't exist, ask the user to create it or provide the ad number.

---

## Step 2: Round 1 — Draft from brief + audience profile

Draft the ad copy following the copy rules checklist in app-context § Copy rules,
writing for the audience in app-context § Audience.

**Required ad sections** (matching existing README format):

```markdown
# Ad NN — [Feature Name]

**Hero feature:** [product name]  
**Format:** [e.g., Real report screenshot + genuine user reaction]  
**Status:** Draft

## Audience

[Who this ad targets — from app-context or research brief]

## The proof

[The real finding or capability — specific identifier, specific problem found]

## The real reaction

[If available from research brief or existing ads]

## Ad copy

### Reddit headline

> [Headline — leads with the finding, max 100 chars]

### Primary text

> [Body text — specific, editorial, user-in-control positioning]

### Trust close

> [One flat line about trust]

### CTA

> [Action-oriented]

### Destination URL (UTM-tagged)

> [Full URL with utm_source, utm_medium, utm_campaign — copy-paste ready for Reddit Ads / Metricool]

## Visual direction

[How the ad should look — from the ad strategy source or research brief]

## Canva brief

[Design specs for /ad-design skill]
```

**Round 1 output**: Show the full draft to the user, then proceed to Round 2 automatically.

---

## Step 3: Round 2 — Reddit authenticity check

Query Reddit via Composio to check if the copy sounds authentic to the community.

### 3a. Search for similar language on Reddit

Use `REDDIT_SEARCH_ACROSS_SUBREDDITS` to find posts with language similar to your ad copy:

**Search queries**:
- Key phrases from your headline
- Key phrases from your body text
- The specific problem your ad addresses

**Check**:
- Does the language match how the audience actually talks on Reddit?
- Are you using "marketing speak" or "community speak"?
- Would this post get upvoted or downvoted in the target community?

### 3b. Self-critique against authenticity

Compare your draft to real Reddit posts:

**Authenticity checklist**:
- [ ] Uses words the audience uses (from research brief or Reddit search)
- [ ] Avoids corporate/startup language ("leverage", "unlock", "revolutionary")
- [ ] Sounds like a user talking, not a brand talking
- [ ] Specific over vague (concrete identifiers, not "your story")
- [ ] Obeys every item in app-context § Guardrails (e.g. punctuation bans)
- [ ] Confident, not apologetic, about being an AI tool (if the product is one)

**If inauthentic**: Rewrite the sections that don't match. Show the user what changed and why.

**Round 2 output**: Show the revised draft with changes highlighted, then proceed to Round 3.

---

## Step 4: Round 3 — Specificity + polish

Add real product proof and apply the Seven Sweeps.

### 4a. Add real proof from the research brief

If `research-brief.json` has real findings, ensure the ad copy includes:
- At least one specific identifier (chapter number, location, metric — whatever "specific" means for this product)
- At least one specific problem found
- The explanation of why it's a problem

If no real findings are available, ask the user to run `/ad-research` or provide a specific example. Do not invent proof.

### 4b. Apply the Seven Sweeps

Run through each sweep:

1. **Clarity** — Can they understand it on first read?
2. **Voice & tone** — Consistent with the brand voice in app-context? No corporate/AI slop?
3. **So what** — Does every claim answer "why should I care?"
4. **Prove it** — Claims supported by real findings? No fake social proof?
5. **Specificity** — Concrete identifiers, product names, outcomes?
6. **Emotion** — Does it feel their problem and desired relief?
7. **Zero risk** — Objections near CTA? Clear next step?

Then check every item in app-context § Guardrails — those are the brand-specific
add-ons to this list.

### 4c. Final polish

- Check headline length (Reddit headline should be < 100 chars)
- Check body text length (Reddit body should be scannable, short paragraphs)
- Ensure CTA is action-oriented
- Add 2-3 alternative headlines at the bottom of the README

**Round 3 output**: Show the final draft with all changes, then write to `README.md`.

---

## Step 5: Write README.md

Write the final ad copy to `<ads-dir>/ad-NN-feature-name/README.md`.

**Extended format** (adds Research insights + Iteration notes to the Round 1 format):

```markdown
# Ad NN — [Feature Name]

**Hero feature:** [product name]  
**Format:** [format]  
**Status:** Ready

## Research insights

[Key findings from research-brief.json — pain points, language patterns, real findings]

## Audience

[Who this ad targets]

## The proof

[Real finding or capability]

## The real reaction

[User reaction if available]

## Ad copy

### Reddit headline

> [headline]

### Primary text

> [body]

### Trust close

> [trust line]

### CTA

> [CTA]

### Destination URL (UTM-tagged)

> [Full URL with utm_source, utm_medium, utm_campaign — copy-paste ready for Reddit Ads / Metricool]

## Alternative headlines

- [alt 1]
- [alt 2]
- [alt 3]

## Visual direction

[Visual concept for /ad-design]

### Recommended composition

[Specific composition instructions]

## Canva brief

[Design specs]

## Why this ad works

[Bullet points explaining the copy choices]

## Iteration notes

**Round 1**: [What was drafted, initial approach]
**Round 2**: [Authenticity changes, what was fixed]
**Round 3**: [Specificity + polish changes, real findings added]
```

---

## Step 6: Output summary

Present the completed ad to the user:

```markdown
## Ad Copy Complete

**Ad**: ad-NN-feature-name
**Status**: Ready for design

### Headline:
> [headline]

### Key proof:
- [real finding 1]
- [real finding 2]

### Destination URL (copy-paste ready):
> [Full UTM-tagged URL]

### Iteration summary:
- Round 1: [approach]
- Round 2: [authenticity fixes]
- Round 3: [specificity + polish]

Saved to: `<ads-dir>/ad-NN-feature-name/README.md`

Next step: Run `/ad-design` with the same ad folder to create the Canva design.
```

---

## Error handling

- **research-brief.json not found**: Ask if user wants to run `/ad-research` first, or proceed with the app-context audience only
- **No real findings available**: Use the proof examples from the ad strategy source (app-context § Context sources), or ask the user to provide a specific example
- **Reddit search fails**: Proceed without Round 2 authenticity check, note in Iteration notes
- **Ad folder doesn't exist**: Ask user to create it first

---

## Related skills

- **ad-research**: Previous step — provides research-brief.json
- **ad-design**: Next step — creates Canva design from this README
- **copy-writer**: Deeper reference for brand voice, copy craft, and review checklists
