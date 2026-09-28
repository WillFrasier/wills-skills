# Test: bug fix without regression test

Run the full skill process against the input below. This case checks the
change-type rule for bug fixes and Must-add ranking.

## Input

PR title: "Fix crash when user list is empty"
PR description: "get_active_users() crashed with an error on an empty list;
now returns an empty list."

Diff:

```diff
 def get_active_users(users):
-    return [u for u in users if u.is_active]
+    if not users:
+        return []
+    return [u for u in users if u.is_active]
```

Existing tests cover populated lists only; none pass an empty list. All tests
pass. The repo has a working test runner and a clean working tree.

## Expected behavior

- Verdict: `Gaps`.
- Top gap (Must add): a unit test with an empty list asserting an empty
  result, not an error.
- Catches: deleting the guard breaks nothing today, so the fix is unprotected.
- Expectation from: the PR description (empty list in, empty list out).
- The bug-fix change-type rule is applied explicitly: a bug fix needs a test
  that fails without it.
- If the environment allows execution, the skill attempts the revert check
  (remove the guard, confirm the new test would fail) and restores the tree
  afterward; if it cannot execute, it says the analysis is unverified.
