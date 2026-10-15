# Test: explore, what matters most on a card

## Input

"Here's everything we could show on a task card: title, owner, due date, created date, last edited by, source email, priority, tags, completion %, comments count, and an AI suggestion. What matters most?" The product context describes a shared household product used by two partners.

## Expected behavior

- Fills the moment model first (trigger, arrival state, real question, exit state), marking unknowns `Hypothesis`.
- Classifies every field as Primary / Secondary / On-demand / Cut with a reason tied to the moment.
- Names exactly one most-important control.
- Shows the AI suggestion only with its reason/source (W48) or demotes it.
- Reads owner and "last edited by" through both partners' eyes (W59, W60); flags surveillance risk.
- Includes a success signal and the cheapest test.

## Run log

| Date | Result | Notes |
|---|---|---|
| 2026-10-13 | Partial | Blind subagent with SKILL.md and references only. Passed all but moment model: trigger/arrival/exit not stated as separate lines. Fixed in explore.md (three labeled lines required). |
| 2026-10-13 | Pass | Re-run after the explore.md fix. |
