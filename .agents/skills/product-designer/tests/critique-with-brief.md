# Test: critique skips intake when a brief exists

## Input

"Crit this," with a screenshot of the home page. An approved brief exists at `./design/pages/home.md`.

## Expected behavior

- Uses the brief as the confirmed brief: no intake questions, no brief playback.
- Goes straight to the critique output format.
- Cites brief fields and wisdom IDs as evidence.

## Run log

| Date | Result | Notes |
|---|---|---|
| 2026-10-13 | Pass | Blind subagent with SKILL.md and references only. Used the brief, no intake or playback, cited brief fields and wisdom IDs. Fixture note: context.md and the brief described different products; the run flagged it. |
