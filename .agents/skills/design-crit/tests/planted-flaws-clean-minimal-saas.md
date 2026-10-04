# Test: planted flaws, "Clean minimal SaaS"

Run the full skill process against the input below. This case checks that the
critique finds known, deliberately planted flaws in a generic landing page that
claims the "Clean minimal SaaS" preset, ranks them by impact on the need, and
stays honest about what a screenshot can show.

Fixtures (fictional product, do not fix them):
- `fixtures/generic-saas-landing.png`: full-page screenshot, 1440px viewport at
  1x scale, no browser chrome.
- `fixtures/generic-saas-landing.html`: the source. Flaws are tagged F1-F10 in
  its CSS comments. Regenerate the PNG from it with Playwright at a 1440x900
  viewport, `deviceScaleFactor: 1`, `fullPage: true`.

Give the agent only the PNG and the input below, never the HTML or this file.

## Input

Attach `fixtures/generic-saas-landing.png`. User message:

> Landing page for Synergia, our team workflow tool. It's live and conversion is
> bad. Brief is already settled, just crit it:
> - Need: when a team lead lands here from an ad, they want to understand what
>   this does and try it fast, so they can decide in one sitting.
> - Primary action: Start free trial.
> - Audience: ops and team leads, desktop, comparing several tools.
> - Stage: live. Style target: Clean minimal SaaS. Accessibility: WCAG 2.2 AA.
> - Viewport: 1440px wide at 1x.

## Planted flaws (must find)

Each must appear as a finding (wording free) at or above the listed severity.

| ID | Flaw | Layer | Min severity |
|---|---|---|---|
| F1 | Headline and subhead are generic buzzwords ("Supercharge your workflow with next-generation synergy"); nothing says what the product does or for whom | Need fit (copy) | Critical |
| F2 | Three equal-weight, differently colored CTAs (Start free trial, Book a demo, Watch video) plus a "Join waitlist" field that contradicts "Start free trial" (is it available or not?) | Need fit | Critical |
| F3 | Light gray hero subhead and feature body text on white; centered subhead with a very long line length | Accessibility | High |
| F4 | Email field uses placeholder as its only label, low contrast | Accessibility / usability | Medium |
| F5 | Four tiny unlabeled icon-only buttons in the nav (well under 24px) | Accessibility | High |
| F6 | Contradictory social proof: "Trusted by 10,000+ teams" vs "2,000+ teams onboarded" / "Join 2,000+ teams"; placeholder logos ("LOGO", "Company", "Brand"); anonymous "Jane D., Company Inc." testimonial | Need fit (content) | High |
| F7 | Inconsistent corner radii (pill, 8px, square) across buttons and cards | Visual craft | Medium |
| F8 | Gradient blobs and a generic flat-illustration person: the "dated or risky" list | Trend / style | Medium |
| F9 | Three type families (serif display, sans body, italic monospace quote and eyebrow) plus gradient-filled headline text | Visual craft / style | Medium |
| F10 | Many accent colors (purple, orange, green, pink, blue) and one neubrutalist card (hard black border, offset shadow) beside soft-shadow cards: the opposite of "one accent" minimalism | Style fidelity | Medium |

## Expected behavior

- Takes the "just crit it" path: no intake questions, one-line brief at the
  top, then the Phase 3 output format.
- Finds at least 8 of F1-F10, including all of F1, F2, F3, F6 and F10.
  Several flaws may be bundled into one finding; that counts as found if the
  flaw is named specifically.
- Top 3 come from need fit (F1, F2, F6) or accessibility (F3, F5), not from
  craft or trend.
- Verdict names the core problem: a generic page that doesn't say what the
  product is and splits attention across competing actions.
- Uses the 1440px / 1x calibration from the brief, but still says "appears"
  for contrast and gives no exact contrast ratios.
- Recomposition is included (the problems are structural) and proposes one
  primary CTA and one accent color.
- Not judged lists motion, hover/focus and responsive behavior; makes no
  claims about them.
- Stays within budget: at most 10 detailed findings; Polish findings allowed
  (stage is live) but none outrank a planted flaw.

## Must not

- Praise the gradient, blobs, or illustration as modern or on-trend.
- Treat the neubrutalist card as a deliberate style choice without flagging
  the conflict with the brief.
- State exact contrast ratios or claim to have measured anything.
- Ask intake questions.

## Run log

| Date | Result | Notes |
|---|---|---|
| 2026-10-04 | Pass (9/10, F4 partial) | Blind subagent with only SKILL.md, references and the PNG. F4: flagged placeholder contrast and input border, not placeholder-as-label. Found an unplanted real flaw: white text on orange/green/blue buttons appears below 4.5:1. F10 bundled with F8 as one Medium style finding, so its expected severity was corrected from High to Medium to match the skill's severity definitions (style drift adds noise; it does not block the need). |
