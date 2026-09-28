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

## Process

1. **Load context** — Read app-context and research-brief.json
2. **Draft (Round 1)** — Create initial ad copy from brief + audience profile
3. **Authenticity check (Round 2)** — Verify copy sounds authentic to Reddit community
4. **Polish (Round 3)** — Add real proof, apply Seven Sweeps, finalize
5. **Write README.md** — Output final copy with iteration notes

See `references/steps.md` for detailed implementation steps.

---

## UTM Convention

Every ad MUST include a UTM-tagged destination URL. See `references/steps.md` for full UTM convention (parameters, format, examples, Metricool compatibility).

---

## Error handling

- **research-brief.json not found**: Ask if user wants to run `/ad-research` first
- **No real findings available**: Use proof examples from ad strategy source
- **Reddit search fails**: Proceed without Round 2, note in iteration notes
- **Ad folder doesn't exist**: Ask user to create it first

---

## Related skills

- **ad-research**: Previous step — provides research-brief.json
- **ad-design**: Next step — creates Canva design from this README
- **copy-writer**: Deeper reference for brand voice, copy craft, and review checklists