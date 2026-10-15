# Page Interview mode

Builds or completes the brief for one page through a short interview. Infer first, ask last. The user should feel you already understand the page and only need them for what the page can't tell you.

## Triggers

- The user asks to interview, build a brief, or "understand the users of" a specific page.
- Review or Explore mode hits a page with no brief, or a brief missing decision-relevant fields. Offer the interview in one line; never start it unasked.

## Step 1: Look

Gather everything available before thinking about questions:

- The page itself: screenshot, route, component code, copy, data shown, actions available, empty and error states if visible.
- Where it sits: nav position, what links here, what it links to, how often it's likely visited.
- Product context: `./design/context.md` (audience, thesis, vocabulary, research links, product-specific archetypes), other briefs in `./design/pages/`, product `wisdom.md`.
- Research: anything linked from context.md that mentions this page or its job.

Never ask about anything in context.md (audience, demographics, product thesis). It's already known.

## Step 2: Classify the archetype

Match the page to one or more archetypes below. The archetype gives you the baseline needs almost every user of that kind of page has. These are high-confidence inferences; don't ask about them.

| Archetype | Baseline job | Needs you can assume | Common traps |
|---|---|---|---|
| Home / overview | "Is everything OK, and what needs me?" | Exceptions first, what's next, 3-4 primary actions, fast glance | Vanity stats, decorative headers, equal-weight everything (W1, W40) |
| Calendar / schedule | "What's happening when, and does it work?" | Today and next few days at a glance, conflicts visible, who is where, add or move fast, recurring events handled | Month view as default on mobile, hiding conflicts, no owner on events |
| List / inbox / queue | "What needs handling, in what order?" | Sort by urgency, bulk actions, clear done state, count that can reach zero | Infinite unread counts, no triage, everything looks equally urgent (W44) |
| Detail / record | "Tell me everything about this one thing, and let me act on it" | Key facts on top, history below, primary action visible, edit in place | Metadata soup, actions buried in overflow menus |
| Create / form | "Get this in fast and correctly" | Minimal fields, smart defaults, keep input on error, clear success | Asking for inferable data, placeholder-only labels (W31) |
| Search / browse | "Find the thing I'm thinking of" | Forgiving matching, recent items, filters that reflect user language | Empty results with no recovery, system-noun filters |
| Settings / preferences | "Change one thing and leave" | Findable by plain-language label, immediate effect, safe defaults | Burying valuable features here (W39) |
| Review / check-in / planning | "Step back and decide" | Summary of what changed, decisions queued, focused sit-down flow | Treating it like a glance screen, or overloading it with raw data |
| Onboarding / setup | "Is this worth it, and how fast can I get there?" | Value before effort, progress, skippable steps | Long questionnaire before value (W25, W42) |
| Notification / alert surface | "Do I need to do something now?" | Actionable only, reason shown, one-tap resolve or snooze | Non-actionable pings, no provenance (W43, W48) |

Merge in any product-specific archetypes from `context.md`. If the page fits no archetype well, say so. That's often a sign the page lacks a clear job, and that becomes the first question.

## Step 3: Pre-populate the brief

Fill every field of `templates/page-brief.md` before asking anything. Tag each field:

- `confidence: high | medium | low`
- `source: archetype | page | context | research | wisdom`

Rules:
- Archetype baseline needs are `high`.
- Things stated in research or context.md are `high`.
- Anything inferred only from how the page is currently built is at most `medium`, and goes under **As-built**, not **Intended**. The current design is evidence of what was built, not of what users need.
- Emotional state and desired exit state are almost never `high` from the page alone. Infer them from archetype + audience + likely trigger, mark `medium` or `low`.

## Step 4: Choose 3-7 questions

Score each `medium` and `low` field: **uncertainty x impact**, where impact means "would a different answer change what goes on this page, or how prominent it is?" Ask the top scorers.

- **Genuine unknowns first.** Low confidence, high impact.
- **Fill up to 3 with confirmations.** If fewer than 3 real unknowns remain, confirm the highest-impact `medium` inferences ("I'm assuming X. Right?"). Confirming an inference is the cheapest way to prevent a wrong brief. Never confirm `high` fields.
- **Stop at 7.** If more than 7 fields are uncertain, ask the 7 with the highest impact and mark the rest `Hypothesis` in the brief.
- **One round.** Add a second round of at most 2 questions only if an answer contradicts another answer or the archetype.

### Priority of question topics

Ask in this order, skipping any already answered with high confidence:

1. **Trigger:** what just happened that made them open this page?
2. **Real question:** what are they trying to find out or decide?
3. **Desired exit state:** how should they feel, and what should be true, when they leave?
4. **Arrival state:** stressed, rushed, calm, curious? Glance or sit-down?
5. **Primary action:** the one thing they most need to be able to do.
6. **Who:** which member or role, and does it differ by role? (Ask only for multi-user products.)
7. **Anti-goal:** what must this page never make them feel or do?
8. **Success signal:** how would we know the page is working?

### Question format

- Use the user's language, not UX jargon. "When someone opens this page, what usually just happened?" not "What is the arrival trigger?"
- Multiple choice with options **derived from your inference**, best guess first and marked recommended, plus "Other / not sure". Use a choice tool (ask_user_input_v0, AskUserQuestion) when available.
- One line of why it matters only if it isn't obvious.
- Never ask what the page, context.md, or research already answers.

## Step 5: Present and confirm

Output in this order:

1. **What I can tell from the page** (3-5 lines): archetype, baseline job, the key inferences. This shows your work and lets the user correct you without a question.
2. **Questions** (3-7), via the choice tool. If the page fits no archetype well, say so in item 1 without assigning the nearest archetype, and make question 1 the page's job ("what is this page for?"), ahead of trigger, feeling, or any other question.
3. After answers: the **brief** in full, with sources, as `status: draft`. Ask for approval.
4. On approval, write `./design/pages/<page>.md` with `status: approved` and a changelog entry.

If the user answers "not sure" to a high-impact question, record it under **Open hypotheses** with how to validate it (interview, analytics event, usability test). Don't guess it into the brief.

## Brief template

Use `templates/page-brief.md`. Tag every field with confidence and source.
