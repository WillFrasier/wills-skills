# Calibration examples

Use these to judge which gaps to keep. Examples are deliberately language neutral.

## Good gap vs noise

**Change:** a discount function now applies a 10% discount when the order total is at least 100.

**Good gap (keep)**
- Test: an order of exactly 100 gets the discount; an order of 99.99 does not.
- Catches: the threshold comparison written as "greater than" instead of "at least", in the discount hunk. No existing test uses a value at the boundary, so this bug would pass all tests.
- Expectation from: PR description ("100 or more").
- Level: parametrized unit test.

**Noise (drop)**
- Test: discount applied to an order total of NaN, an emoji product name, and an order placed during a daylight saving change.
- Why it is noise: none of these are inputs this function can receive or reads. There is no plausible bug in the hunk that these would catch.

## Bug fix without a regression test

**Change:** fixes a crash when a user list is empty. The diff adds a guard. Existing tests still all pass.

**Gap (Must add):** a test with an empty list. Without it, deleting the guard breaks nothing, so the fix is unprotected. Verify by removing the guard and confirming the new test fails.

## Executed but unprotected

**Change:** a function now trims and lowercases an email before saving. An existing test calls the function and only asserts that it did not throw.

**Gap (Should add):** assert the saved value for an input with spaces and mixed case. The line executes today, but changing the lowercasing to uppercasing would not fail any test.

## Test diff concern

**Change:** a refactor PR. One assertion changed from "equals 5" to "is greater than 0", and one test gained a skip marker.

**Report:** both edits weaken protection in a PR that should not change behavior. Ask the author why, and do not accept without an answer.

## Wrong level

**Change:** a data access function now adds a filter and a join to a query. The unit test mocks the database and asserts the mock was called.

**Report:** the mock test cannot detect a wrong filter or join, so it protects nothing. Recommend a test against a real or in-memory database with a few seeded rows, and one line saying so. Do not list unit scenarios for it.

## Adequate, stop

**Change:** a small function gains an early return for an empty input, with a test for empty and a test for non-empty, and the test fails when the early return is removed.

**Verdict:** Adequate. No gaps. Do not add corner cases to fill the page.

## Suspected bug, not a test gap

**Change:** a pagination helper computes the page count with integer division, so 21 items at 10 per page gives 2 pages.

**Report under "Possible bugs spotted":** the last partial page is dropped. Do not write a test that asserts 2 pages. Raise it with the author first.
