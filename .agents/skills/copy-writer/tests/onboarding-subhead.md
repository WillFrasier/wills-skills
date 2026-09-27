# Test: onboarding subhead

Run the full skill process against the input below. This case checks the
anti-pattern kills, the ask-vs-infer judgment, and the delivery format.

## Input

H1 on an onboarding step: "Getting to know you"

Bad subhead to rewrite (deliberately hits 5 anti-patterns):

> Build your profile. The people, the pets, the places. Everything here is
> optional; a name is enough, and you can edit it all later.

Context: step 1 of 4 in onboarding; the user just signed up; the goal is to get
the profile filled in without suppressing action.

## Expected behavior

- Asks about any load-bearing unknown (product, audience, voice) in one batch
  instead of guessing; states assumptions and proceeds on low-stakes gaps.
- States a one-to-two-line brief before drafting.
- The rewrite contains none of: an "optional" / "you can skip this" disclaimer,
  symmetry for its own sake, feature-first framing ("Build your..."), a restated
  heading.
- The rewrite leads with the user's world, gives a reason to fill things in, and
  keeps honest reassurance ("you can change it later").
- Obeys the loaded app context's copy rules (casing, punctuation, emoji).
- Passes the review checklist and the three-question test: clear, kind,
  necessary right now.
- Delivers in the standard format: brief, copy, why, alternatives when the vibe
  is a judgment call.
