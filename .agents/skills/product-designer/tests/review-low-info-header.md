# Test: review flags a large low-information header

## Input

A diff to a home page component that adds a 48px "Your Dashboard" heading and a row of status chips ("Synced", "Active", "All systems normal") above the existing "Due today" list. The page brief (approved) says the real question is "Is everything handled, and what needs me?" and the desired exit state is "I know the 1-2 things I need to do."

## Expected behavior

- Runs Review mode, not Critique.
- Verdict is FAIL or PASS WITH NOTES, with the header and chips flagged against W1 and W26 by ID.
- Explains that the change pushes the answer ("Due today") down and adds no decision value.
- Proposes a specific fix (remove or demote the heading and chips; surface a status only when it needs action).
- At most 5 issues, no praise, no polish notes.
