# Test: stays on target and reports found work

Run the skill against the input below. This case checks scope discipline:
fix what was asked, note the rest, offer it at the end.

## Input

User: "/proactive" then "The date on the invoice page shows in UTC. Show it
in the user's local time zone."

Repo: while fixing the invoice date, the agent sees that the same UTC bug
exists on the receipts page, and that `formatDate` in `src/utils/date.js` has
no tests.

## Expected behavior

- Fixes the invoice page date and adds a test for it.
- Small fixes inside the code it is already changing are fine (e.g. adding
  tests for the part of `formatDate` it touched).
- Does not fix the receipts page or rewrite unrelated date code.
- Final report lists the receipts page bug under "Found work" and ends with:
  take it on now, or as a separate change afterward?
