# Skill Validation, copy-writer on family onboarding copy

Status: PASS, significantly better, with one caveat noted.

---

## 1. The deliberately bad phrase

Source: `apps/web/components/welcome/family-step.tsx` (line 421-424, original).

> Build your house, the people, the pets, the place. Everything here is
> optional; a name is enough, and you can edit it all later.

Why it's bad (hits 5 anti-patterns):
- Undercutting disclaimer ("Everything here is optional")
- Symmetry for its own sake ("the people, the pets, the place")
- Feature-first framing ("Build your house")
- No benefit / no reason
- No emotional recognition

---

## 2. Context gathered (skill step 0 + 1)

Read `references/app-context.md` + the page file.

| Dimension | Finding |
|---|---|
| What | Subhead under H1 "Getting to know your family" |
| Role | Welcome / invitation; must encourage completion without nagging |
| Audience | The default parent (exhausted, skeptical) + the reluctant partner (defensive) |
| Goal | Collect family info without suppressing action |
| Voice | Calm, direct, gently knowing; sentence case; em dashes; no emoji / no exclamation |

---

## 3. Brief (skill step 2)

> Warm welcome for a tired couple. Lead with their household, not the product.
> Give a reason to fill in (more you share, more you get out of it), keep the
> reassurance (you can change it), drop the "optional" disclaimer, match the calm
> editorial voice.

---

## 4. Draft (skill step 3)

> Who's in your house? Add the people you live with, the pets underfoot,
> and anyone who lives elsewhere. The more you share, the more your family
> gets out of it, and you can change any of it later.

---

## 5. Pressure-test (skill step 4 + 5)

Checked against `references/craft.md`, `references/ux-patterns.md`, `references/app-context.md`.

| Check | Result |
|---|---|
| Anti-patterns avoided? | No "optional," no symmetry, no feature-first |
| Empathy? | Opens with a question; acknowledges household, not app |
| Anticipation? | "You can change any of it later" answers unspoken fear |
| Transparency? | No hidden cost / no surprise |
| Brand voice? | Sentence case, em dash, serif body, calm, matches CONTENT FUNDAMENTALS |
| Consistency? | Matches `welcome-content.ts` intro |
| Accessibility? | Plain language, no jargon |

---

## 6. Discriminating evaluation

Is it a lot better? Yes, unambiguously.

- The old line suppresses action ("optional"). The new line motivates it (benefit + reassurance).
- The old line is abstract and rhythmic; the new line is concrete ("pets underfoot," "anyone who lives elsewhere") and maps to the actual UI buttons ("Add pet," "Add someone who lives elsewhere").
- The old line sounds like a form; the new line sounds like the manifesto hero.

One caveat: "The more you share, the more your family gets out of it" is slightly abstract. It works as a benefit, not a feature, but in a very tight mobile view it could be tightened. The current version is correct for the 600px serif body, it breathes.

Not magic: this is a 3-sentence rewrite, not a redesign. The real test is whether users complete step 1 more often, that requires the product. But the copy no longer works against the goal.

---

## 7. How to run this again

To validate the skill on any new surface:

1. Write the deliberately bad phrase (hit 3+ anti-patterns).
2. Load `references/app-context.md` + the page file.
3. Write the brief (1-2 lines).
4. Draft using the three pillars + craft rules.
5. Check against anti-patterns + accessibility + consistency.
6. Ask: is it clear, kind, and necessary right now? (three-question test)
7. Compare, not "is it nicer?" but "does it do the job better, with less friction?"
