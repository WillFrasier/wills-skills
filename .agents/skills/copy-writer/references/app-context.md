# App Context, Visible (Family OS)

> **This is the only app-specific file in this skill.** Everything else
> (`context-intake.md`, `craft.md`, `ux-patterns.md`, `accessibility-and-inclusion.md`)
> is project-agnostic. To reuse this skill on another product, **replace this file**
> with that product's context, brand voice, audience, vocabulary, guardrails, and
> leave the rest untouched. Keep the section headings so the skill's instructions
> still resolve.

The product is **Visible** (the codebase and older copy still say "Family OS").
Tagline: *the household, run fairly*. A proactive household assistant for couples,
inspired by Eve Rodsky's *Fair Play* and the care-justice movement.

---

## 1. What the product is

A fair-division operating system for the home. It makes the invisible work of a
household **visible**, divides it **fairly**, and uses an assistant to do the
**legwork** in between, so the running of a home feels less like a second job and
more like a partnership.

- **The arc** (drives the homepage and every surface): **make it visible → divide it
  fairly → it does the legwork → you reclaim the time.** Fairness is the mechanism;
  reclaimed time and individual fulfillment are the point.
- **The assistant** works in the background and *reports up*; it does not replace
  judgment. Every draft, booking, or proposed action comes back to a person for an
  okay.
- **Status:** private early access. Opening to first households in fall 2026,
  onboarding case by case. Copy must be honest about this, no fake urgency, no
  implying instant access.

## 2. Audience

**Who:** committed couples and co-parents running a household together who feel the
imbalance and invisibility of domestic labor. Two people, not a team.

Two people are usually in the room, and they are not in the same place:

- **The default parent / mental-load carrier**, the one who notices, remembers, and
  plans. Exhausted, often resentful, has usually tried systems before (spreadsheets,
  chore charts, Fair Play cards) that collapsed. Skeptical of anything that adds
  admin.
- **The partner who wants to help but can't see the work**, often defensive, often
  believes they already carry their weight. Will not engage with anything that reads
  as an accusation.

**Segments** (from the beta plan): the "4% builders" already making their own
systems; Fair Play–literate households who bought the book and stalled; mainstream
logistics-drowning parents; working moms (breadwinner + burnout overlap).

**Emotional state to write for:** tired, time-poor, wary of being sold to, and
guarding against judgment. The reader is not looking for a lecture about fairness, 
they are looking for relief.

## 3. Brand voice

**The register:** calm, direct, gently knowing. The assistant has read the email; it
isn't going to make a show of being clever about it. Imagine a quietly competent
partner who has already pulled the file before the meeting.

**The house style guide** (canonical: `docs/design/design-system/README.md` →
CONTENT FUNDAMENTALS):

- **Casing.** Sentence case for all UI copy, buttons, headers, table columns,
  dialogs. Title case is reserved for proper nouns, section names (Today, Tasks,
  Ledger), and display-type splash moments.
- **Pronouns.** Default to **you**. Refer to the assistant as **I** sparingly, only
  when it would otherwise sound robotic. Most copy is structural and pronoun-free.
- **Punctuation.** No em dashes, ever (hard rule). Use a comma, a period, or a colon
  for an aside. Periods on full sentences in body copy; **drop the period on
  single-line labels, captions, and button text.**
- **Numbers and time.** Relative when the user is deciding ("due in 3 days");
  absolute in the ledger/audit log. Currency `$1,240`, not `$1240.00` unless cents
  matter.
- **Emoji.** None. The brand uses drawn icons and small SVG glyphs. Unicode arrows
  (→) are fine inline.
- **What the voice avoids.** Productivity-speak ("supercharge", "streamline",
  "AI-powered"), exclamation marks, micro-celebrations ("🎉 Done!"), "let's",
  "we're on it", second-person plural. The assistant is one quiet voice, not a
  chirpy team.

**The voice in practice** (from the design system):

> ✓ "Drafted a reply. Review and send."
> ✗ "I have drafted a reply for you. Please review and click to send it."

**Empathy, in this voice.** Empathy here is a steady presence, not cheerleading, it
sounds like "Drafted a reply. Review and send." or "That wasn't saved, here's how to
fix it." See `craft.md` → Empathy for the general principle.

**Marketing voice** is the same person, with more room: book-landing energy,
editorial serif, oversized statement type, restraint. Examples in the wild:

- "A home is the most important organization you will ever run."
- "Two people. A hundred quiet responsibilities."
- "Run it like you both matter."
- "Running a home is care work. Care work is real work."

## 4. Product vocabulary (use these terms exactly)

- **Card / domain**, a durable area of household responsibility (Meals, Bills &
  money, Kids & school, Health, Home & repairs, Calendar & social). Has an owner and
  a **minimum standard** (what "done well" means).
- **Task**, a concrete to-do. Owner, optional due date, priority, status.
- **Check-in**, a discussion topic for the shared agenda, not a chore.
- **Document**, a shared markdown note.
- **Memory**, a time-bound household event, not a stable contact attribute.
- **Member**, a household member.
- **The assistant**, the proactive background service. One quiet voice.
- **Reclaimed time / room to be a whole person**, the payoff (our term for Fair
  Play's "Unicorn Space").

Do **not** use Fair Play's trademarked terms ("Unicorn Space", "Minimum Standard of
Care", "the deck of 100 cards") as feature names. Credit the inspiration instead:
*"Inspired by Eve Rodsky's Fair Play and the care-justice movement."*

## 5. Values (in our own words)

- **Make the invisible visible.** If it's work, it gets a name and an owner.
- **Fair, not equal.** A just split reflects real life and can be renegotiated.
- **Your time has worth.** We measure success by time and attention handed back.
- **Room to be a whole person.** Fairness exists so each of you reclaims space.

## 6. Copy guardrails (the hard-won ones)

These come straight from the audience research. Violating them is the fastest way to
lose this reader.

- **Never weaponize the equity data.** Do not show a partner a "you do less than
  your partner" comparison, and do not frame the product as proof of unfairness.
  If load is shown, frame it neutrally ("Here's how our family's workload is
  distributed") and let the engaged partner see it privately.
- **Don't frame the product as fixing a partner.** It is a tool for the household,
  not a solution to "your partner's problem." "Here's our schedule," not "Here's
  proof you don't help enough."
- **Lead with logistics, not fairness.** The reluctant partner engages with pickup
  times, meal plans, and grocery lists, not a labor-imbalance dashboard. Utility
  first; the equity conversation comes later, if at all.
- **Grace over perfection.** No streak-shaming, no guilt-trip notifications, no
  "you haven't logged in for 14 days." The door is always open.
- **Be honest about early access.** No fake scarcity or urgency.
- **No invented statistics.** Any care-work or happiness figure must link to a real
  source (Fair Play Policy Institute, Gottman, Pew). Qualitative claims until
  sourced.
- **The assistant never acts alone.** Copy about automation must say it hands work
  back for approval.

## 7. Where the existing copy lives (match it)

Read these before writing so new copy sits alongside the old without a seam:

| What | Where |
|---|---|
| Marketing copy + FAQ + values + stats | `apps/web/components/marketing/marketing-content.ts` |
| Onboarding copy + step data | `apps/web/components/welcome/welcome-content.ts` |
| The AI project prompt (assistant voice) | `apps/web/lib/help/family-os-project-prompt.ts` |
| The house style guide (canonical) | `docs/design/design-system/README.md` → CONTENT FUNDAMENTALS |
| Positioning, arc, values, attribution | `docs/marketing/strategy/fair-play-alignment.md` |
| SEO positioning + voice anti-patterns | `docs/marketing/strategy/seo-strategy.md` |
| Audience voice (verbatim quotes) | `docs/marketing/research/socials/quote-bank-core-themes.md` |
| Audience themes + what software can/can't fix | `docs/marketing/research/socials/source-assessment-and-theme-analysis.md` |
| The buy-in problem + the seven patterns | `docs/marketing/research/socials/content/partner-buy-in-synthesis.md` |
| Audience segments | `docs/marketing/beta/beta-sequencing-plan.md` |

## 8. Tone by surface

- **Marketing / homepage:** editorial, manifesto-adjacent, warm but weighty. Serif
  lead text. The arc, the mission, the values.
- **Onboarding:** welcoming and low-pressure, but *not* apologetic. Give a reason to
  fill things in rather than telling people it's optional. (See `craft.md` →
  "Give a reason, not a disclaimer.")
- **In-product UI:** calm and structural. Report what happened; don't perform.
  Sentence case, no periods on labels.
- **Errors / empty states:** plain, unblaming, and useful. Say what happened and
  what to do next. Never blame the user.
- **Notifications:** neutral and depersonalized ("Pickup at 3pm tomorrow"), never
  comparative or judgmental.
