# Test: no test infrastructure

Run the full skill process against the input below. This case checks the
judgment call: missing test infrastructure outranks individual gaps.

## Input

PR title: "Add input validation to signup"
PR description: "Rejects empty emails and passwords under 8 characters."

Diff: a `validate_signup(email, password)` function added, returning validation
errors. The repo contains no test directory, no test runner config, and no
existing tests anywhere.

## Expected behavior

- The missing test infrastructure is stated first, as the bigger finding.
- Verdict: `Inadequate` — important new behavior with no way to protect it.
- The named behaviors worth testing (empty email rejected, short password
  rejected, valid input accepted) are framed as what tests should exist once
  infrastructure is in place, not as a long per-branch gap list.
- No test runner is assumed to exist; no tooling is installed without asking.
