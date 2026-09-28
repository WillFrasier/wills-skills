# Test: adequate, stop

Run the full skill process against the input below. This case checks the
Adequate path: no gaps found, no padding, short output.

## Input

PR title: "Handle empty cart in checkout total"
PR description: "Returns 0 for an empty cart instead of crashing."

Diff (a checkout total function):

```diff
 def checkout_total(cart):
+    if not cart:
+        return 0
     total = sum(item.price * item.quantity for item in cart)
     return round(total, 2)
```

Existing tests: an empty cart returns 0; a single-item cart totals and rounds
correctly; a multi-item cart totals correctly. Removing the early return makes
the empty-cart test fail.

## Expected behavior

- Verdict: `Adequate`, one sentence why.
- No gaps listed. The bug-fix rule is satisfied: a test fails without the fix.
- No invented corner cases: no NaN prices, no unicode item names, no negative
  quantities — the hunk only adds an early return; sum and round are unchanged
  and out of scope.
- Output is short. The skill stops instead of manufacturing work.
