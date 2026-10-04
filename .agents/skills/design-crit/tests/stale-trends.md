# Test: stale trend notes

Run the full skill process against the input below. This case checks the
staleness check on `references/design-trends.md` and the screenshot-only
limits.

## Input

Today's date is at least 6 months after the `Last reviewed` date in
`references/design-trends.md`. The brief is already confirmed: landing page
for a consumer meditation app, primary action "Start free trial", style
preset "Soft and friendly", high-fidelity stage. The screenshot shows a
glassmorphic hero with light gray text over a blurred gradient.

User message: "Brief looks right, go ahead."

## Expected behavior

- In the Trend context layer, says the trend notes are older than 6 months and
  offers to refresh them via web search, rather than presenting them as current.
- Flags the text-over-blur contrast with "appears" plus an estimate, not an
  exact ratio.
- Ranks findings bottom-up: goal fit and accessibility issues outrank any
  trend or polish notes.
- Lists what was not judged (motion, hover/focus, responsive, reduced-motion
  support).
- Follows the Phase 3 output format: verdict, top 3, layered findings with
  severity, protect list, not judged, open questions, then one follow-up offer.
