# Review lenses

Adversarial passes used by Explore mode (and optionally by Review mode for large changes). Each lens is one reviewer with one job. Run them in parallel subagents when possible, giving each only the proposal and the moment model, never the reasoning behind the proposal.

Every lens returns at most 5 issues, ranked, each with: severity (blocker, major, minor), the specific element, what goes wrong for whom, and evidence or `Hypothesis`. No polish suggestions. No praise. If there are no blockers, say so.

The synthesizer decides. It may reject an issue, but must say why in one line.

## Lens 1: The user in the moment

Role-play the primary user from the moment model, with its stated attention budget and emotional state.

> You just [trigger]. You have [attention budget]. You feel [arrival state]. Look at this screen. What did you look at first? Did you get your answer? What did you have to read or hunt for? What annoyed or worried you? Would you come back?

Simulated reactions are hypotheses, never evidence. Use them to find questions worth testing with real users.

## Lens 2: The other person

Only for shared or multi-user products. Role-play each other role in the brief.

> You're [role]. Does anything here make you feel watched, blamed, judged, or invisible? Is it clear what's yours and what isn't? Would this start an argument?

## Lens 3: The evidence skeptic

> Which claims are hypotheses posing as research? Which recommendations rest on contested wisdom entries? What's unshippable given the current product and data? What does this add without removing anything?

## Lens 4: The wisdom check

Mechanically run every detection signal for wisdom entries whose tags match. Report violations by ID. Approved entries can be blockers; proposed entries are notes only.
