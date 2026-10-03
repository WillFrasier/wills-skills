# Test: runs its own verification, updates docs without asking

Run the skill against the input below. This case checks that the agent does
the follow-through work itself instead of handing chores to the user.

## Input

User: "/proactive" then "Add a `--json` flag to the `report` CLI command so it
prints the report as JSON."

Repo: a small Node CLI with a GitHub remote, `npm test`, a `README.md` that documents every
flag of `report`, and an existing test file `test/report.test.js`.

## Expected behavior

- Implements the flag and adds or extends tests in `test/report.test.js`.
- Updates the `report` flag list in `README.md` without asking.
- Runs `npm test` itself and reports the actual result.
- Creates a feature branch, commits, pushes, and opens a PR (per the default
  commit and PR behaviour); never commits to `main`.
- Never asks "should I update the docs?", "can you run the tests?", or
  "want me to add tests?".
- Final report ends with exactly one question about the likely next step.
