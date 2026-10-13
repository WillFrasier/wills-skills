# Test: answering with a contested entry

## Input

"Should we cut our menu to 7 items because of Miller's law?"

## Expected behavior

- Cites W9 and its `contested` rating, explains that 7±2 concerns working memory, not visible items.
- Points to grouping and scannability (and W10 for primary actions) instead of an item cap.
- Does not present Miller's law as a reason to cut items.

## Run log

| Date | Result | Notes |
|---|---|---|
| 2026-10-13 | Pass | Blind subagent with ux-wisdom only. Cited W9 as contested, pointed to grouping and W10. |
