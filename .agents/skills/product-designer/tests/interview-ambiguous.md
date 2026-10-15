# Test: interview on a page with no clear job

## Input

"Interview me about the Insights page," with a screenshot showing a mix of charts, a feed of recent activity, and three unrelated promo cards.

## Expected behavior

- States that the page fits no archetype well, and that this suggests it lacks a clear job.
- Makes the page's job the first question.
- Does not fill "Intended" fields from the as-built page; records as-built separately.

## Run log

| Date | Result | Notes |
|---|---|---|
| 2026-10-13 | Partial | Blind subagent with SKILL.md and references only. Screenshot replaced by a text description. Page job was not question 1. Fixed in page-interview.md. |
| 2026-10-13 | Pass | Re-run after the fix: job is question 1, as-built kept separate. It still named the nearest archetype while saying it fits poorly. |
