# Skill Validation 2, copy-writer on an error message

Status: PASS. Also confirms the no-em-dash hard rule holds.

---

## 1. The deliberately bad phrase

Source: `apps/web/app/(app)/admin/household/page.tsx` (line 54).

> That isn't a valid household UUID.

Why it's bad (hits 4 anti-patterns):
- **Jargon**, "UUID" is an internal term the user never sees anywhere else.
- **Blames the user**, "That isn't valid" reads as an accusation.
- **No next step**, the user is stranded; nothing tells them what to do.
- **Off-voice**, clinical and cold, not the calm, direct house voice.

---

## 2. Context gathered (skill step 0 + 1)

| Dimension | Finding |
|---|---|
| What | Inline error message on an admin household page |
| Role | Explain a failed lookup and get the user unstuck |
| Audience | An admin who pasted or followed a bad household link |
| Goal | Recover the task, not just report failure |
| Voice | Calm, direct, sentence case, no emoji, no em dash |

---

## 3. Brief (skill step 2)

> Plain, unblaming error. Say what went wrong in the user's terms, then give the
> next step. No jargon, no blame, no em dash.

---

## 4. Draft (skill step 3)

> We couldn't find that household. Check the link, or choose one from the list.

---

## 5. Pressure-test (skill step 4 + 5 + 6)

| Check | Result |
|---|---|
| Hard constraints | No em dash. No imported tone. |
| Anti-patterns | No jargon, no blame, no "invalid" |
| Empathy | "We couldn't find" owns the failure, doesn't accuse |
| Anticipation | Gives the next step before the user has to ask |
| Transparency | Plain language, says exactly what happened |
| Accessibility | No jargon, no idioms, translates cleanly |
| Three-question test | Clear? Yes. Kind? Yes. Necessary? Yes. |

---

## 6. Discriminating evaluation

**Better? Yes.**

- Old: reports a fact in internal language and stops. New: explains in the user's
  terms and offers a way forward.
- Old blames ("That isn't valid"); new takes the failure on the system ("We couldn't
  find").
- Old leaks an implementation detail ("UUID"); new says "household," the word the
  product actually uses.

**Caveat:** "choose one from the list" assumes a list is on screen. If the page has
no list, the line must change to match the real recovery path. The skill's context
step should catch this; here it is flagged, not hidden.

**Hard-rule check:** output contains no em dash. Rule holds.

---

*Second validation run. Confirms the skill works on error copy, not just onboarding.*
