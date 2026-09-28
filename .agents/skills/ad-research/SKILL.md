---
name: ad-research
description: Research target communities (e.g. Reddit) and the product's own data sources for ad inputs. Outputs research-brief.json for the ad-copy skill. Use when you need audience intelligence, pain points, community language, or real product proof for ads.
---

# ad-research — Community + Product Data Ad Research

Research target online communities and the product's own data sources to build an audience intelligence brief for ad creation.

**Input**: Freeform brief like "[Feature] targeting [community]"  
**Output**: `<ads-dir>/ad-NN-feature-name/research-brief.json`

> **`references/app-context.md` is the only app-specific file in this skill.** It
> defines `<ads-dir>`, the default communities, the product context sources, the
> feature → data mappings, and the data source queries. Load it first. If it is
> unfilled or describes a different product than the one you're researching for,
> say so and ask for the right context rather than researching against the wrong
> product.

---

## Process

1. **Parse the brief** — Extract product/feature, target community, and optional angle
2. **Load product context** — Read app-context § Product context sources
3. **Research communities** — Search web sources for relevant discussions
4. **Query product data** — Find real product findings matching the brief
5. **Build research brief** — Create `research-brief.json` with findings
6. **Output summary** — Present results to user

See `references/steps.md` for detailed implementation steps.

---

## Error handling

- **No web results**: Widen search query, try different keywords, or fall back to audience profile in app-context
- **No product data findings**: Query broader feature mapping or ask for example
- **Ad folder doesn't exist**: Ask user to create it first

---

## Related skills

- **ad-copy**: Next step — writes ad copy using this research brief
- **ad-design**: Final step — creates Canva design from the copy
- **copy-writer**: Reference for brand voice and copy rules