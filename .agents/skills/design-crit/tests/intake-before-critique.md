# Test: intake before critique

Run the full skill process against the input below. This case checks that
phases run in order: infer, interview, play back the brief, and only then
critique.

## Input

One screenshot of a SaaS pricing page: three tiers, the middle one
highlighted, a monthly/annual toggle, a feature comparison table below, and a
"Talk to sales" link in the footer.

User message: "What do you think of this page?"

## Expected behavior

- Opens with inferences stated as guesses to confirm (e.g. "Looks like a
  self-serve SaaS pricing page. Right?"), not questions the screenshot already
  answers (it does not ask "what kind of page is this?").
- Asks at most 3 questions per round, multiple choice with "Other / not sure",
  covering the primary action (which tier or self-serve vs sales), audience,
  and stage before style or constraints.
- Offers 6-8 style presets that plausibly fit, not all twelve.
- Plays back a 5-7 line brief and waits for confirmation.
- No critique, verdict, or findings appear before the brief is confirmed.
