# Test: discount threshold boundary

Run the full skill process against the input below. This case checks hunk-level
fault hypotheses, boundary-gap detection, expectation sourcing, and noise
filtering (the no-pad standard).

## Input

PR title: "Add 10% discount for orders of 100 or more"
PR description: "Orders totaling 100 or more get a 10% discount at checkout."

Diff (a pricing function, shown in Python-style pseudocode; the case is
language-neutral):

```diff
 def order_total(items):
     total = sum(item.price for item in items)
+    if total > 100:
+        total = total * 0.9
     return total
```

Existing tests cover: an order well under 100 (asserts no discount) and an
order well over 100 (asserts the discount). No test uses a total at or near
100. The repo has a working test runner.

## Expected behavior

- Verdict: `Gaps`, marked as analysis only (nothing was executed).
- Top gap (Must add): a parametrized unit test with totals of exactly 100 and
  99.99 — 100 gets the discount, 99.99 does not.
- Catches: the threshold written as `>` instead of `>=` in the discount hunk.
  No existing test sits at the boundary, so this bug passes all current tests.
- Expectation from: the PR description ("100 or more"), not inferred.
- Level: parametrized unit test.
- Protection map marks the discount branch Executed but unprotected: the
  over-100 test executes it but cannot detect a boundary error.
- No noise: no timezone, unicode, or NaN scenarios — the hunk touches none of
  that. No gaps beyond the boundary one; no padding.
