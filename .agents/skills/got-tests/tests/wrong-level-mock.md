# Test: wrong test level

Run the full skill process against the input below. This case checks step 6:
recommending the right test level instead of listing unit scenarios.

## Input

PR title: "Filter archived orders from order history"
PR description: "Order history should exclude archived orders."

Diff (a data-access function):

```diff
 def get_order_history(user_id):
-    return db.query(Order).filter(Order.user_id == user_id).all()
+    return (
+        db.query(Order)
+        .filter(Order.user_id == user_id)
+        .filter(Order.archived_at.is_(None))
+        .order_by(Order.created_at.desc())
+        .all()
+    )
```

The only test mocks the database layer and asserts the mock was called once.

## Expected behavior

- The mock test is named as protecting nothing: it cannot detect a wrong or
  missing filter, a wrong ordering, or a broken join.
- Recommendation is a boundary test against a real or in-memory database with
  a few seeded rows (archived, not archived, ordering), given in one line.
- No list of mock-heavy unit scenarios for the query.
- Verdict: `Gaps` — the changed behavior is unprotected at the level that can
  catch its bugs.
