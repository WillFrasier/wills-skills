# Test: suspected bug is not a test gap

Run the full skill process against the input below. This case checks the
Possible-bugs-spotted discipline: never lock a suspected bug into a test.

## Input

PR title: "Add pagination to user list"
PR description: "Splits the user list into pages of 10."

Diff (a pagination helper):

```diff
+def page_count(total_items, per_page=10):
+    return total_items // per_page
```

No test covers the helper.

## Expected behavior

- **Possible bugs spotted** reports: integer division drops the last partial
  page — 21 items at 10 per page yields 2 pages, not 3.
- No gap asserts 2 pages. No test encodes the suspected bug as correct.
- The intended page count for a partial last page is flagged as inferred,
  confirm with the author (in **Questions for the author**).
- No Must/Should gap asserts a page count; the count depends on the
  unconfirmed expectation.
