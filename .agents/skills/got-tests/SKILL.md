---
name: got-tests
description: Review a pull request or branch diff and decide whether the changed code has enough unit tests to catch real bugs, then name the specific missing tests, each tied to a plausible bug it would catch. Language and framework agnostic. Use whenever the user asks if a PR has enough tests, wants a test gap or test quality review, asks "what could break", "are we missing tests", "is this safe to merge", or points at a diff, branch, or PR and cares about test protection, even if they never say "unit tests". Also use when reviewing a PR that changes behavior but touches few or no tests.
---

# got-tests: PR unit test adequacy

Decide whether the changed code is protected by tests, and name the few missing tests that would catch real bugs. Scope is unit tests. Integration, e2e, and load concerns get a short mention only when unit tests are the wrong tool.

## The standard

Coverage is not the goal. The question is: **if someone broke this change in a plausible way, would a test fail?**

Every recommendation must be traceable to a specific plausible bug in a specific changed hunk. A scenario that cannot name the wrong implementation it would catch is noise. Drop it. Reviewers stop reading long lists, so a short list of sharp gaps is worth more than an exhaustive one, and "Adequate" is a valid and common result.

## Ground rules

- Review only what changed. Unchanged callers and dependencies are context. They become in scope only when the change can break them.
- Detect conventions from the repo (test locations, naming, helpers, runner). Do not assume a language or framework.
- Never invent expected behavior. Every scenario states where the expectation comes from (see step 4). If it is a guess, say "inferred, confirm".
- Be blunt. No praise padding. If the change is trivial or well protected, say so and stop.
- Write test code only if asked. When asked, match the repo's style.

## Workflow

### 1. Gate: does this need review at all?

Get the diff the user pointed at, or against the base branch (`git diff HEAD` for uncommitted changes), plus the PR title, description, and commit messages. Sort changes into production logic, test files, and non-testable (docs, config, generated files, pure renames, log lines, constants that no behavior depends on).

If no production logic changed, or only trivial changes, say so in one line and stop. Do not demand tests for pass-through glue.

### 2. Build context

Answer briefly, and let the answers set how hard you scrutinize:

- Intent: bug fix, feature, refactor, migration, performance? What must change and what must stay identical?
- Callers: read the direct callers. What do they assume that this change might break (return shape, nullability, ordering, thrown errors, defaults)?
- Blast radius: money, data loss, security, silent corruption, or cosmetic? Scale scrutiny accordingly.
- History: if version control is available, check churn and past fixes on the touched files (log, blame). Files with repeated bug fixes deserve more suspicion than stable ones.
- Change-type rules:
  - Bug fix: there must be a test that fails without the fix. If not, that is the top gap.
  - Refactor: existing tests should pass unchanged. If tests were edited to pass, ask why.
  - New feature: each new branch and public behavior needs a test.
  - Deletion: check nothing still relies on the removed behavior, and that a test proves it is gone.

### 3. Review the test diff itself

Tests changed in this PR can quietly reduce protection. Check for:

- Deleted or weakened assertions, loosened matchers, widened tolerances
- New skips, disabled tests, expected-failure markers
- Snapshot or golden files updated to match new output without review
- Test edits in a refactor PR (behavior may have changed)
- Tests that restate the implementation (same formula, same constants) so they encode its bugs
- Mock-heavy tests that only verify the mocks
- Assertions that only check "no error" or "not null"
- Tests likely generated to hit lines rather than to catch failures

Also judge quality: brittleness (coupled to internals or private helpers, breaks on harmless refactors), flakiness risk (real time, randomness, ordering, shared state, network), and maintenance cost. A brittle test has negative value.

### 4. Form fault hypotheses per changed hunk

This is the core. For each changed hunk:

1. State the behavior in one line (inputs, outputs, side effects, errors).
2. State the expectation and its **source**: PR description, ticket, prior behavior, existing tests, docs, or inferred. If inferred and consequential, list it as a question for the author.
3. List 1 to 3 plausible wrong versions. Think of what a tired human or an AI tool would actually get wrong: inverted or off-by-one condition, wrong operator, wrong variable in copied code, missed branch, error swallowed, wrong default, mutated input, wrong order of operations, dropped edge in a loop, misused library option that silently does nothing, fallback that hides a real failure.
4. Ask: would any existing test fail against each wrong version? Classify the behavior:
   - **Protected**: a test would fail.
   - **Executed but unprotected**: code runs in a test but no assertion would notice.
   - **Untested**: no test reaches it.

Then step back to the PR as a whole: what are the top two or three realistic ways this breaks production or breaks a caller? Tie each to a test, or note that a higher-level test is the right tool.

### 5. Execute if you can

Reasoning about tests is weaker than running them. When the environment allows, do each of these that is possible; skip any that are not:

- Run the existing tests for the touched areas. Record failures and flakiness.
- Run diff-scoped coverage, or a mutation tool restricted to changed lines, if the repo has one. Do not install heavy tooling without asking.
- Do a manual revert check: break the change (flip a condition, drop a branch, revert the hunk) and see which tests fail. Only do this when the working tree is clean or the hunk is committed — never risk clobbering uncommitted user changes; on a dirty tree, skip it and say the analysis is unverified. Restore the code afterward and confirm the tree is as you found it.
- If you propose tests and were asked to write them, confirm each passes on the real change and fails on a deliberately broken version.

If you cannot execute anything, say the findings are unverified analysis. Do not present guesses as measured results.

### 6. Choose the right test level

Not everything belongs in a unit test. Say so when true:

- Queries, ORM calls, wiring, retries, and UI glue are usually poorly served by unit tests with heavy mocks. Recommend a test at the boundary, and give it one line.
- If logic is buried in something hard to test, recommend extracting the pure logic so it can be unit tested. Hard-to-test code is a design signal, and often the best fix is a small refactor, not a clever test.
- Many similar cases are cheaper as one parametrized or table-driven test. Where input space is large and the rule is an invariant (round trips, ordering preserved, idempotence, result never negative), suggest a property-based test instead of enumerating cases.

### 7. Consult the blind-spot list, narrowly

Only after steps 4 to 6, read `references/blind-spots.md`. Use it as a prompt for the specific data types and behaviors in this diff, not as a checklist to walk. If a category does not apply to the changed code (no dates in the diff, no text handling), skip it. Every item that survives must still meet the standard in step 8.

### 8. Filter, prioritize, cap

Each gap must carry all four of: the **hunk**, the **plausible bug** it catches, the **expectation source**, and the **right level**. Drop any that cannot.

Rank by likelihood times impact:
- **Must add**: important behavior unprotected, or a bug fix with no regression test
- **Should add**: a realistic failure that could plausibly ship
- **Nice to have**: low impact or unlikely (keep to at most one or two, or omit)

Cap the list at about 5 to 7. Merge scenarios that one test would catch. If nothing meets the bar, output `Adequate` and stop. Do not pad.

For calibration on what to keep versus drop, read `references/examples.md`.

## Output format

Keep it tight.

**Verdict**: `Adequate`, `Gaps`, or `Inadequate`, plus one sentence why. State whether this is verified by execution or analysis only.

**Context**: 2 to 3 lines. What the change does, the main risk, and any history signal.

**Test diff concerns**: only if any. Name the test and the problem.

**Protection map**: compact list of changed behaviors with status (Protected / Executed but unprotected / Untested). Cap or group it like the gaps list; on big PRs map only high-risk behaviors and say what you did not map.

**Gaps**: grouped Must / Should / Nice. Each one:
- Test: the scenario in plain terms (situation, expected outcome)
- Catches: the plausible bug, with the hunk
- Expectation from: source, or "inferred, confirm with author"
- Level: unit, parametrized, property-based, or boundary test

**Questions for the author**: unclear expected behavior. Ambiguous requirements are a gap too. Omit if none.

**Possible bugs spotted**: separate from test gaps. Never lock a suspected bug into a test. Omit if none.

**Other levels**: one line each for risks that only integration or higher tests can catch. Omit if none.

**Next**: one line on the likely follow-up, such as drafting the tests in the repo's style.

## Judgment calls

- No test infrastructure in the repo: say that first. It is a bigger finding than any missing test.
- A big PR: prioritize by blast radius and history, say what you did not review, and do not spread thin over everything.
- Low-risk code in a high-risk PR still deserves less attention than high-risk code. Spend effort where a bug would hurt.
- If you find yourself listing timezone or unicode cases for code that does not touch time or text, stop and delete them.
