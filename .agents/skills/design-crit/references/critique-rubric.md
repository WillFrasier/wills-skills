# Critique rubric

Work bottom-up: a failure in an earlier layer outranks polish in a later one.

## 1. Goal fit
- 5-second test: what is this, who is it for, what do I do next?
- Is the primary action the most prominent interactive element? What competes with it?
- Does the page hierarchy match the stated priority order?
- Is there proof, context, or friction-reduction right where the decision happens?
- Does the screen serve the underlying need, not just the stated feature?
- Copy: does the headline say what the screen does for this user right now (not a marketing slogan on an app screen)? Are labels in the user's words? Is the voice consistent?
- Content and data: is it realistic, and does it add up (counts, totals, dates agree across the screen)? Inconsistent numbers erode trust.

## 2. Usability
- Nielsen heuristics: visibility of status, match to real world, user control, consistency, error prevention, recognition over recall, flexibility, minimalism, error recovery, help.
- Information architecture and navigation labels; scannability; progressive disclosure.
- Forms: label placement, field count, validation messaging, default values.
- Visible evidence of states (empty, loading, error, disabled). Note missing states as "not shown", not as failures.
- Platform conventions: on iOS, Apple Human Interface Guidelines (tab bars, sheets, swipe actions, back gestures); on Android, Material Design (navigation bar, FAB, bottom sheets). Flag custom patterns that fight the platform without a reason.

## 3. Accessibility (WCAG 2.2 AA unless told otherwise)
- Text contrast (appears below 4.5:1 for body, 3:1 for large text or UI components?).
- Body text size and line length; small gray-on-gray captions.
- Target size (about 24 CSS px minimum, 44 preferred on touch). Calibrate scale first (see SKILL.md); otherwise judge relative to body text.
- Reliance on color alone, icon-only buttons without labels, placeholder-as-label.
- Visible focus cannot be judged from a static shot; flag as not judged.

## 4. Visual craft (use `craft.md` for values and diagnostics)
- Hierarchy: size, weight, color, and space doing distinct jobs.
- Type scale: count of sizes and weights; consistency; pairing.
- Spacing rhythm: consistent scale vs arbitrary gaps; grouping by proximity.
- Alignment and grid; optical alignment of icons and text.
- Color roles: neutral, brand, semantic; accent used sparingly.
- Component consistency: buttons, inputs, cards, radii, shadows, iconography.
- Imagery quality and relevance; placeholder or stock tells.
- Composition: one clear focal point, reading path, column spans, split proportions.
- Busy vs calm: flag treatments that do not map to a distinct meaning (see `craft.md`). Variety without meaning, not volume, causes busyness.

## 5. Style fidelity
- Compare against the style target from the brief (inferred from the mock, a preset, or the brand adjectives).
- Name where it delivers the style and where it drifts. Mixed signals (for example neubrutalist borders with soft glass shadows) are findings.
- If a style conflicts with the audience or goal, say so plainly.

## 6. Trend context
- What reads current vs dated, and does it matter for this audience?
- Is any trendy treatment clarifying or purely decorative?
- Suggest at most 1-2 trend-aligned moves, each tied to the need.
