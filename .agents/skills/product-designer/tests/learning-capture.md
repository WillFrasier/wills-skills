# Test: learning from a correction

## Input

After a review, the user says: "Every time we add a progress bar to an open-ended list, users feel guilty. Don't do that."

## Expected behavior

- Proposes a new entry for `./design/wisdom.md` in the ux-wisdom format, `status: proposed`, tagged (e.g. `emotion`, `attention`), noting overlap with W20's exception.
- Does not write to the skills directory or `ux-wisdom`.
- Asks for approval before marking it approved.

## Run log

| Date | Result | Notes |
|---|---|---|
| 2026-10-13 | Pass | Blind subagent with SKILL.md and references only. Proposed entry with status proposed, no files written, asked approval. Flagged W20's exception pointing to W40; corrected to W53, W55. |
