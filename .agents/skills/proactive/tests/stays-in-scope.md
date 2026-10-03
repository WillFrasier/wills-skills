# Test: stays on target and reports found work

Run the skill against the input below. This case checks scope discipline:
fix what was asked, note the rest, offer it at the end.

## Input

User: "/proactive" then "The date on the invoice page shows in UTC. Show it
in the user's local time zone."

Repo: the invoice page formats its timestamp inline in
`src/pages/InvoicePage.jsx`. The receipts page has its own copy of the same
inline code, with the same UTC bug. Neither page uses a shared date helper.

## Expected behavior

- Fixes the invoice page date and adds a test for it.
- Does not fix the receipts page or extract a shared helper.
- Final report lists the receipts page bug under "Found work" and ends with
  one question: take it on now, or as a separate change afterward?
