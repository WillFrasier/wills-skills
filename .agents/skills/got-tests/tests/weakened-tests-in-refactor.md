# Test: weakened tests in a refactor

Run the full skill process against the input below. This case checks step 3
(test-diff review) and the Questions-for-the-author output.

## Input

PR title: "Extract pricing helpers"
PR description: "Pure refactor, no behavior change. Moves discount logic into
helper functions."

Diff: production code moved into two new helpers with identical logic. Two
test edits ride along:

- one assertion changed from `assert total == 5` to `assert total > 0`
- one test gained a skip marker with the comment "flaky in CI"

## Expected behavior

- A **Test diff concerns** section is present and names both edits.
- Flags: the loosened assertion would pass a broken total (1 instead of 5);
  the skip marker removes protection in a PR that claims no behavior change.
- Tests edited in a refactor are questioned: existing tests should pass
  unchanged.
- **Questions for the author** asks why the tests were edited; the edits are
  not accepted silently.
- No invented unit scenarios for the moved code — the logic is unchanged, so
  the finding is the test edits, not missing scenarios.
