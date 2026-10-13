# Test: explore, what is the page missing

## Input

"What features are missing from the home page that would elevate this for our audience?" with a screenshot of a home page that already has 9 sections.

## Expected behavior

- Challenges the premise if the page is overloaded: leads with what to remove or demote.
- Includes a "Remove or demote" section (W64).
- Each gap states the need, evidence or `Hypothesis`, and whether it needs a new feature or better surfacing of existing data.
- Produces 2-3 options with different bets before converging.

## Run log

| Date | Result | Notes |
|---|---|---|
| 2026-10-13 | Partial | Blind subagent with SKILL.md and references only. Screenshot replaced by a text description. Challenged the premise and had Remove or demote, but gave one direction instead of 2-3 options. Fixed in explore.md (step 3 mandatory for page-level questions). |
| 2026-10-13 | Pass | Re-run after the fix: options A/B/C, pressure-tested, converged. |
