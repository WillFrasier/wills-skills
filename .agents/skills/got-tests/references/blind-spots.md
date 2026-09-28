# Blind spots: prompts, not a checklist

Use this after you have formed fault hypotheses from the diff. Scan only the sections that match data types and behaviors present in the changed code. Skipping most of this file on most PRs is correct.

For any item you raise, you must still name the changed hunk, the plausible bug, and the expectation source.

## Contents
- Data shape
- Text
- Numbers and money
- Time
- State and repetition
- Failure of dependencies
- Concurrency and ordering
- Contracts with callers
- Identity and permissions
- Silent failure
- Patterns common in AI-assisted code

## Data shape
Apply when the code loops, groups, sorts, merges, or transforms collections or records.
- Empty, single element, duplicates, already sorted, reverse sorted
- Very large input, if the algorithm is not linear
- Missing optional fields, unexpected extra fields, partially populated records
- Mixed types in one collection
- Input mutated by the function when the caller reuses it

## Text
Apply when the code parses, formats, compares, or stores strings.
- Empty, whitespace only, leading or trailing spaces
- Case differences in comparisons
- Non-ASCII, combining characters, emoji, right-to-left text (matters for length, truncation, slicing, sorting)
- Very long strings, embedded newlines, delimiters inside values
- Input that looks like syntax for the next layer (quotes, markup, path separators)

## Numbers and money
Apply when the code does arithmetic, thresholds, or rounding.
- Zero, negative, exactly at a threshold, one either side
- Floating point rounding, especially with currency or percentages
- Integer vs decimal division, overflow at limits
- Rounding order (round each item vs round the total)

## Time
Apply only when the diff touches dates, durations, schedules, expiry, or "now".
- Time zones and daylight saving transitions, month ends, leap days
- Midnight boundaries, inclusive vs exclusive ranges
- Clock injected vs read directly (tests using real time are flaky)
- Dates in the past or far future, expired vs just-expiring

## State and repetition
Apply when the code holds state, caches, or has side effects.
- Called twice with the same input (idempotency), duplicates on retry
- Called in a different order than expected
- Stale or cached values after an update
- Shared or global state leaking between calls or tests
- First call vs subsequent calls

## Failure of dependencies
Apply when the code calls something that can fail (network, disk, another module, database).
- Throws, times out, returns empty, returns malformed data
- Partial success in a batch: what is done, what is rolled back, what is reported
- Cleanup and resource release after failure
- Retry behavior producing duplicate side effects

## Concurrency and ordering
Apply only when the code is async, parallel, or event driven.
- Overlapping calls, double submit, out-of-order responses
- Check-then-act races
- Cancellation midway

## Contracts with callers
Apply to any change of signature, return shape, defaults, or errors.
- New nulls, new exceptions, changed ordering, changed defaults, renamed fields
- Compatibility with data already stored or in flight
- Callers that relied on the old behavior, including ones in other files

## Identity and permissions
Apply when the code touches user data or access decisions.
- Different roles, no identity, acting on another user's data
- Boundary between "not found" and "not allowed"

## Silent failure
Apply always, briefly. These cause the worst production bugs.
- Errors caught and ignored, default values substituted for real failures
- A fallback path that hides a broken primary path
- A wrong result returned with no error

## Patterns common in AI-assisted code
Read the diff for these:
- Plausible, well-worded logic that is subtly wrong: inverted condition, off-by-one, wrong operator, wrong variable in a duplicated block
- Library options or APIs used in a way that compiles but does nothing or behaves differently than assumed
- Over-defensive branches that are unreachable or untested
- Broad catch blocks hiding real errors
- Near-duplicate logic that diverges slightly between copies
- Careful happy path, inconsistent edge handling
- Tests generated from the implementation, encoding its bugs
