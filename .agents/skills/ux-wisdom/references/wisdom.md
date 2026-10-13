# UX Wisdom Library (generic)

Hard-won product design lessons from ~30 years of web and app design, plus the user psychology underneath them. Product-agnostic. Product-specific lessons live in the product repo at `./design/wisdom.md` and take precedence over this file.

Visual craft (type scale, spacing, grid, color) lives in `product-designer/references/craft.md`. This file covers attention, cognition, behavior, interaction, trust, AI, and shared spaces.

## How to use

- Run every recommendation against the **Detection signals** of entries whose tags match the task. Flag violations by ID.
- Precedence: product research > product `wisdom.md` > this file > your intuition.
- **Evidence** tells you how hard to lean: `strong` (replicated, decades of practice), `moderate` (good studies or broad practitioner consensus), `contested` (popular but shaky; never use as the sole justification).
- Exceptions are real. If you invoke one, say which.

## Entry format

```
### W<n>. Title
tags: [...] · evidence: strong|moderate|contested · status: approved|proposed
- Principle:
- Classic failure:
- Detection signal:
- Exception:
- Source:
```

Tags: `attention` `cognition` `decision` `interaction` `ia` `copy` `notification` `trust` `ethics` `emotion` `ai` `multi-user` `onboarding` `a11y` `process`

---

## A. Attention and scanning

### W1. Visual weight must match information value
tags: [attention, copy] · evidence: moderate · status: approved
- Principle: The biggest, boldest element should carry the most decision-relevant information for the moment of use.
- Classic failure: Large page headers and prominent status labels that look polished but tell the user nothing new, pushing the actual answer down the page.
- Detection signal: The largest element could be deleted with no loss of any answer the user came for. A label restates the obvious ("Active", "Dashboard", "Your Items").
- Exception: Status that is surprising or demands action earns prominence.
- Source: Practitioner consensus; follows from W2, W3, W5.

### W2. Users scan, they don't read
tags: [attention, copy] · evidence: strong · status: approved
- Principle: Users skim in F- or layer-cake patterns, reading the first words of lines and headings. Front-load meaning.
- Classic failure: Key information buried mid-sentence or after a preamble ("To help you stay organized, we've noticed that...").
- Detection signal: The first 2-3 words of a heading, row, or button don't convey its point.
- Exception: Long-form content the user deliberately chose to read.
- Source: Nielsen Norman Group eyetracking (2006, re-run 2017).

### W3. Users satisfice
tags: [attention, decision] · evidence: strong · status: approved
- Principle: Users take the first option that looks good enough, not the best one. The first plausible thing gets clicked.
- Classic failure: The correct action is present but a more prominent, plausible-looking wrong one sits above it.
- Detection signal: More than one element could plausibly answer "where do I go for X?"
- Exception: High-stakes, infrequent decisions (financial, medical) where users slow down.
- Source: Herbert Simon; Steve Krug, Don't Make Me Think.

### W4. Banner blindness
tags: [attention] · evidence: strong · status: approved
- Principle: Anything that looks like an ad, a promo, or a generic announcement gets ignored, including real content styled that way.
- Classic failure: Critical alerts placed in a colorful banner strip at the top or in a right rail.
- Detection signal: Important content sits in a boxed, colored, ad-shaped container in ad-typical positions.
- Exception: None reliable. Inline, contextual placement beats banners.
- Source: Benway & Lane 1998; NN/g replications through 2018.

### W5. One loud thing per view
tags: [attention] · evidence: strong · status: approved
- Principle: Distinctiveness only works when it's rare. If everything is emphasized, nothing is.
- Classic failure: Multiple red badges, bold labels, and colored chips competing on one screen.
- Detection signal: More than one or two elements use the strongest emphasis treatment.
- Exception: A true multi-incident state, which should then be summarized ("3 things need you") rather than shown loud individually.
- Source: Von Restorff isolation effect (1933).

### W6. Beauty masks usability problems in testing
tags: [attention, process] · evidence: moderate · status: approved
- Principle: Users rate attractive interfaces as easier to use and forgive their flaws. Polished mocks hide broken flows.
- Classic failure: Stakeholders approve a gorgeous high-fidelity mock whose task flow fails in production.
- Detection signal: Approval based on screenshots with no task walkthrough.
- Exception: Brand and trust surfaces, where perceived quality is itself the goal.
- Source: Kurosu & Kashimura 1995; Tractinsky 2000.

### W7. The fold exists, but it's not a wall
tags: [attention, ia] · evidence: moderate · status: approved
- Principle: Users do scroll, but attention drops sharply below the first screen. The first viewport must answer "am I in the right place and what matters now?"
- Classic failure: Either cramming everything above the fold, or a hero image that pushes all content below it.
- Detection signal: The first viewport contains no actionable or answer-bearing content.
- Exception: Narrative pages built for scrolling.
- Source: NN/g scroll studies (2010, 2018): ~57% of viewing time above the fold.

---

## B. Cognitive load and memory

### W8. Recognition over recall
tags: [cognition, ia] · evidence: strong · status: approved
- Principle: Show options and context; don't make users remember them across screens.
- Classic failure: A form asking for an ID or name shown on a previous screen; commands only available by memorized shortcut.
- Detection signal: Completing a task requires information that is not visible on the current screen.
- Exception: Power-user accelerators, as long as a visible path also exists.
- Source: Nielsen heuristic 6.

### W9. Miller's 7±2 is not a menu rule
tags: [cognition] · evidence: contested · status: approved
- Principle: Working memory limits apply to things held in the head, not to items visible on screen. Visible lists can be long if well grouped and scannable.
- Classic failure: Splitting a scannable list into arbitrary sub-menus "because 7 items max", adding clicks and hiding options.
- Detection signal: A justification cites "7 plus or minus 2" for visible items.
- Exception: Things users must remember (codes, steps without visible guidance): keep them few. Modern estimates are ~4 chunks (Cowan 2001).
- Source: Miller 1956; Cowan 2001.

### W10. Hick's law applies to simple choices, not complex ones
tags: [cognition, decision] · evidence: moderate · status: approved
- Principle: Decision time grows with the number of equally likely options. For primary actions, fewer options win. For browsing familiar categories, it matters less.
- Classic failure: A home screen with 12 equal-weight action buttons.
- Detection signal: More than ~4 primary actions with equal visual weight.
- Exception: Expert tools and well-organized lists users scan by label.
- Source: Hick 1952; Hyman 1953.

### W11. Choice overload is real sometimes, not always
tags: [decision] · evidence: contested · status: approved
- Principle: Many options can paralyze when choices are unfamiliar, hard to compare, and the user lacks a clear preference. Otherwise, more choice is often fine.
- Classic failure: Citing the jam study to cut options users actually wanted to compare.
- Detection signal: Option count reduced without asking whether users know what they want.
- Exception: Use good defaults (W17) and recommendations rather than fewer options.
- Source: Iyengar & Lepper 2000; Scheibehenne et al. 2010 meta-analysis found mean effect near zero.

### W12. Progressive disclosure
tags: [cognition, ia] · evidence: strong · status: approved
- Principle: Show what most users need most of the time; put the rest one deliberate step away.
- Classic failure: Every field and option visible at once; or the opposite, hiding something 40% of users need behind "Advanced".
- Detection signal: Frequently used controls are hidden, or rarely used ones are prominent. Check frequency, not importance.
- Exception: Comparison tasks need everything side by side.
- Source: Carroll & Rosson; NN/g.

### W13. Complexity is conserved
tags: [cognition, process] · evidence: moderate · status: approved
- Principle: Every system has irreducible complexity. Either the software absorbs it or the user does. Good products absorb it.
- Classic failure: "Simplifying" by removing a smart default, so every user now configures it manually.
- Detection signal: A simplification moves work onto the user instead of removing it.
- Exception: When automation would be wrong often enough to cost trust (see W46).
- Source: Larry Tesler's law of conservation of complexity.

### W14. The three-click rule is a myth
tags: [ia] · evidence: strong · status: approved
- Principle: Users don't abandon because of click count; they abandon when they lose confidence that they're on the right path. Clear scent beats fewer clicks.
- Classic failure: Flattening navigation into a crowded single level to hit an arbitrary click budget.
- Detection signal: Any design defended by click count alone.
- Exception: High-frequency actions, where every step does matter.
- Source: Joshua Porter / UIE 2003; Jared Spool on information scent.

### W15. Scarcity taxes bandwidth
tags: [cognition, emotion] · evidence: moderate · status: approved
- Principle: People under time, money, or mental pressure have measurably less cognitive bandwidth. They tunnel on the urgent and miss the rest. Design for the stressed version of your user.
- Classic failure: Interfaces tested with calm, focused participants that break for tired, interrupted, multitasking real users.
- Detection signal: The design requires holding context, reading paragraphs, or making multi-step decisions in a moment users are likely stressed.
- Exception: Deliberate, scheduled sessions (planning, review) where users have chosen to focus.
- Source: Mullainathan & Shafir, Scarcity (2013).

### W16. Open loops nag
tags: [cognition, emotion] · evidence: moderate · status: approved
- Principle: Unfinished tasks stay active in the mind and create background tension. Closing a loop, or trusting a system to hold it, brings relief.
- Classic failure: Showing an ever-growing to-do list with no way to defer, delegate, or confirm "this is handled".
- Detection signal: There's no way to get an item out of the user's head (done, snoozed, delegated, or trusted to the system).
- Exception: None. This is the core value of any organizing tool.
- Source: Zeigarnik 1927 (recall effect itself mixed); Masicampo & Baumeister 2011 on plans relieving intrusive thoughts; David Allen, GTD.

---

## C. Decisions and motivation

### W17. Defaults are decisions most users never revisit
tags: [decision, ia] · evidence: strong · status: approved
- Principle: The vast majority of users keep defaults. Defaults are the product for most people; settings are for the few.
- Classic failure: A great feature off by default, or a harmful setting on by default "because users can change it".
- Detection signal: A default chosen for engineering convenience rather than the best outcome for most users.
- Exception: Privacy-sensitive or consequential choices, which should be explicit.
- Source: Johnson & Goldstein 2003 (organ donation); Microsoft Word settings studies (Spool).

### W18. Losses loom larger than gains
tags: [decision, copy, emotion] · evidence: strong · status: approved
- Principle: People feel losses about twice as strongly as equivalent gains. Framing drives behavior, and loss framing creates anxiety.
- Classic failure: Weaponized loss framing ("You'll lose your progress!") that motivates once, then breeds resentment.
- Detection signal: Copy that motivates through threat of loss in a product meant to reduce stress.
- Exception: Genuine, irreversible loss the user would want warning about.
- Source: Kahneman & Tversky 1979.

### W19. Behavior needs motivation, ability, and a prompt at the same moment
tags: [decision, notification] · evidence: moderate · status: approved
- Principle: If a desired action isn't happening, one of three is missing. Usually the fix is making it easier (ability), not more motivating.
- Classic failure: Adding reminders and incentives to a task that's simply too hard.
- Detection signal: Proposed fix is "remind them more" or "add a reward" without first reducing steps.
- Exception: When the action is already trivially easy and the prompt is genuinely missing.
- Source: BJ Fogg behavior model.

### W20. Progress pulls people forward
tags: [decision, onboarding] · evidence: moderate · status: approved
- Principle: Effort accelerates as people near a goal, and a head start increases completion. Show progress, and count work already done.
- Classic failure: Setup starting at 0% even though the user already provided useful data.
- Detection signal: Multi-step setup with no progress signal, or progress that ignores completed work.
- Exception: Progress bars on infinite or unbounded work become guilt meters (see W40).
- Source: Kivetz et al. 2006 (goal gradient); Nunes & Drèze 2006 (endowed progress).

### W21. Experiences are remembered by peak and end
tags: [emotion, decision] · evidence: strong · status: approved
- Principle: People judge an experience mostly by its most intense moment and its ending, not the average. Design the ending of every flow.
- Classic failure: A smooth flow that ends on an error, an upsell, or a dead end with no confirmation.
- Detection signal: A flow's final screen has no clear closure, or ends on a demand.
- Exception: None meaningful.
- Source: Kahneman et al. 1993; Redelmeier & Kahneman 1996.

### W22. What people say is not what they do
tags: [process, decision] · evidence: strong · status: approved
- Principle: Stated preferences, predictions about future behavior, and feature requests are weak evidence. Observed behavior is strong evidence.
- Classic failure: Building the most-requested feature, which then sees little use.
- Detection signal: A recommendation backed only by survey answers or "users asked for X".
- Exception: Requests reveal real pain. Treat them as symptoms to diagnose, not specs.
- Source: Practitioner consensus; Rob Fitzpatrick, The Mom Test.

### W23. Delighters decay into expectations
tags: [decision, process] · evidence: moderate · status: approved
- Principle: Features that delight today become basic expectations tomorrow. Missing basics cause anger that no delighter offsets.
- Classic failure: Investing in clever touches while basics (sync, search, reliability) are shaky.
- Detection signal: A delight feature prioritized over an unmet basic expectation.
- Exception: Early-stage products where a single delighter is the differentiator.
- Source: Kano model (1984).

### W24. The real competitor is the current habit
tags: [decision, onboarding] · evidence: moderate · status: approved
- Principle: Users compare you to what they do today (a text thread, a paper list, their own memory), not to other apps. Switching must beat the habit by a wide margin and feel safe.
- Classic failure: Feature parity with competitors while ignoring that the old habit is faster for the core task.
- Detection signal: The core task takes more steps in the product than in the user's existing workaround.
- Exception: None.
- Source: Jobs to be Done, forces of progress (Moesta, Christensen).

### W25. Effort creates attachment, but onboarding effort creates churn
tags: [onboarding, decision] · evidence: moderate · status: approved
- Principle: People value what they helped build, but only after they've seen value. Up-front effort before value drives abandonment.
- Classic failure: A long setup questionnaire before the user sees anything useful.
- Detection signal: More than a couple of required steps before the first moment of value.
- Exception: Effort that visibly produces value as it goes (each answer improves what they see).
- Source: Norton, Mochon & Ariely 2012 (IKEA effect); onboarding funnel data across industry.

---

## D. Interaction and feedback

### W26. Show system status, but only status that matters
tags: [interaction, attention] · evidence: strong · status: approved
- Principle: Users must know what the system is doing and whether their action worked. Status that doesn't affect a decision is noise.
- Classic failure: No feedback after saving; or the inverse, permanent "Synced", "Active", "Online" labels nobody acts on.
- Detection signal: For each status element ask "and so the user...?" No verb means demote it. Separately, any action with no visible result is a bug.
- Exception: Early-tenure users verifying a new system works may need more reassurance status.
- Source: Nielsen heuristic 1.

### W27. Response time thresholds are perceptual constants
tags: [interaction] · evidence: strong · status: approved
- Principle: ~100ms feels instant; ~1s keeps flow; ~10s loses attention. Beyond 1s show progress; beyond 10s let users do something else.
- Classic failure: A spinner on every interaction; blocking the whole page for a slow background fetch.
- Detection signal: User-initiated actions over ~400ms with no immediate acknowledgment.
- Exception: Deliberate "working" moments for AI or heavy operations, which still need progress cues.
- Source: Miller 1968; Card et al. 1991; Nielsen 1993; Doherty & Thadani 1982.

### W28. Perceived performance beats measured performance
tags: [interaction] · evidence: moderate · status: approved
- Principle: Skeleton screens, optimistic updates, and stable layouts make products feel fast. Layout shift makes them feel broken.
- Classic failure: Content jumping as late data loads, causing mis-taps.
- Detection signal: Elements that move after first render; actions that wait for a server round trip to show their result.
- Exception: Optimistic UI for actions that frequently fail, which then must visibly roll back.
- Source: Google Core Web Vitals (CLS); practitioner consensus.

### W29. Undo beats confirm
tags: [interaction, trust] · evidence: strong · status: approved
- Principle: Confirmation dialogs become habitual clicks within days and stop protecting anyone. Undo protects without interrupting.
- Classic failure: "Are you sure?" on routine actions, trained into automatic dismissal, failing on the one time it mattered.
- Detection signal: A confirm dialog on a reversible or frequent action.
- Exception: Truly irreversible, high-cost actions; make those confirmations specific ("Delete 47 events") not generic.
- Source: Jef Raskin, The Humane Interface; Gmail Undo Send.

### W30. Error messages: what happened, why, and how to fix it, without blame
tags: [copy, interaction, emotion] · evidence: strong · status: approved
- Principle: Errors are a moment of stress. State the problem plainly, keep the user's input, and give the next step.
- Classic failure: "Something went wrong", "Invalid input", or clearing a form on error.
- Detection signal: An error with no recovery action, or one that implies the user is at fault.
- Exception: Security-sensitive cases where detail would leak information.
- Source: Nielsen heuristic 9.

### W31. Forms: fewer fields, labels above, validate after leaving a field
tags: [interaction, copy] · evidence: moderate · status: approved
- Principle: Every field costs completion. Top-aligned labels scan fastest. Inline validation on blur helps; validation on every keystroke annoys.
- Classic failure: Asking for data you could infer or ask later; placeholder text used as the only label.
- Detection signal: Any field without a clear use at this moment; labels inside inputs that vanish on typing.
- Exception: Long expert forms where left-aligned labels aid scanning of values.
- Source: Luke Wroblewski, Web Form Design (2008); Penzo 2006.

### W32. Targets: big enough and in reach
tags: [interaction, a11y] · evidence: strong · status: approved
- Principle: Time to hit a target depends on size and distance. On mobile, primary actions belong in the thumb's natural reach, at least ~44pt.
- Classic failure: Primary action at top-right of a phone screen; tiny icon buttons packed together.
- Detection signal: Primary mobile actions in the top third; touch targets visibly smaller than a fingertip.
- Exception: Destructive actions, which can deliberately sit out of easy reach.
- Source: Fitts 1954; Steven Hoober 2013; Apple HIG; WCAG 2.2 target size.

### W33. Follow conventions; users spend most of their time elsewhere
tags: [interaction, ia] · evidence: strong · status: approved
- Principle: Users expect your product to work like the others they use. Novelty in standard patterns is a cost, not a feature.
- Classic failure: Custom navigation, inverted scroll, or reinvented date pickers.
- Detection signal: A standard pattern (nav, search, settings, forms) implemented in an unusual way with no clear user benefit.
- Exception: When the convention fails your users' core job, and you can show it.
- Source: Jakob's law (Nielsen).

### W34. Icons need labels
tags: [interaction, copy] · evidence: strong · status: approved
- Principle: Outside a handful of universal icons (search, close, home), icons alone are ambiguous. Labels cost little and save much.
- Classic failure: An icon-only toolbar where users hover everything to find a function.
- Detection signal: An icon-only control for a non-universal action.
- Exception: Space-constrained, high-frequency expert UIs, with tooltips.
- Source: NN/g icon usability studies.

### W35. Hidden navigation is forgotten navigation
tags: [ia] · evidence: strong · status: approved
- Principle: Navigation behind a hamburger or overflow menu is used far less. Out of sight is out of mind.
- Classic failure: Moving a key section into a menu and seeing its usage collapse.
- Detection signal: A primary destination reachable only through a hidden menu.
- Exception: Small screens with many secondary destinations; keep the top 3-5 visible.
- Source: NN/g 2016 hidden navigation study.

### W36. Carousels and auto-rotators hide content
tags: [attention, ia] · evidence: moderate · status: approved
- Principle: Users rarely engage past the first slide, and auto-rotation fights reading.
- Classic failure: Putting important items in slides 2-5.
- Detection signal: Any rotating or swipe-to-reveal container holding content users need.
- Exception: Browsing visual collections users chose to explore (photos).
- Source: Erik Runyon / Notre Dame click data (~1% clicks); NN/g.

### W37. Modals interrupt; use them sparingly
tags: [interaction, attention] · evidence: moderate · status: approved
- Principle: Modals block the task, hide context, and get dismissed reflexively. Inline is usually better.
- Classic failure: Modal on page load; modal-on-modal; editing in a modal that hides data the user needs to reference.
- Detection signal: A modal appears without a user action, or covers content needed to complete it.
- Exception: Short, focused, user-initiated tasks that need isolation.
- Source: NN/g; practitioner consensus.

---

## E. Information architecture and content

### W38. Organize by the user's mental model, not the org chart or the data model
tags: [ia] · evidence: strong · status: approved
- Principle: Users think in goals and situations ("what's happening this week"), not in your entities or teams.
- Classic failure: Navigation that mirrors database tables or internal teams.
- Detection signal: Section names that are internal nouns or require knowing how the system is built.
- Exception: Expert tools whose users share the system's model.
- Source: Indi Young, Mental Models; card sorting practice.

### W39. Settings is where features go to die
tags: [ia, decision] · evidence: moderate · status: approved
- Principle: Anything in settings is effectively invisible to most users (see W17). If a feature matters, surface it in context.
- Classic failure: A valuable capability shipped as a settings toggle, then judged a failure due to low usage.
- Detection signal: A feature whose value depends on discovery lives only in settings.
- Exception: True preferences (theme, notifications, privacy).
- Source: Practitioner consensus.

### W40. Dashboards must answer "so what?"
tags: [ia, attention] · evidence: moderate · status: approved
- Principle: A dashboard is useful only if each element changes a decision. Numbers without comparison, trend, or action are decoration.
- Classic failure: Vanity counts ("142 tasks completed") with no implication; charts nobody reads after week one.
- Detection signal: An element with no comparison, threshold, or linked action.
- Exception: Celebrations, sparingly and earned (see W21).
- Source: Stephen Few, Information Dashboard Design.

### W41. Empty states are onboarding
tags: [onboarding, copy] · evidence: moderate · status: approved
- Principle: The first time a user sees a screen, it's usually empty. That screen should explain the value and offer the one action that fills it.
- Classic failure: "No items" with no explanation or next step.
- Detection signal: Any empty state without a reason and a primary action.
- Exception: Empty because the user cleared everything: celebrate briefly, don't re-onboard.
- Source: Practitioner consensus.

### W42. Show value before asking for anything
tags: [onboarding, trust] · evidence: moderate · status: approved
- Principle: Time to first value is the strongest onboarding predictor. Ask for permissions, accounts, and data only when the user can see why.
- Classic failure: Permissions prompts on launch; product tours before the user has done anything.
- Detection signal: A permission or data request with no visible, immediate benefit attached.
- Exception: Permissions required for any value at all; then explain first.
- Source: Industry onboarding data; Apple and Google permission guidance.

---

## F. Notifications and interruption

### W43. Interruptions are expensive
tags: [notification, cognition] · evidence: moderate · status: approved
- Principle: Each interruption breaks focus, and resuming takes far longer than the interruption. A notification is a withdrawal from the user's attention account.
- Classic failure: Notifying for every update, training users to mute everything, including what mattered.
- Detection signal: Notifications for events the user can't or needn't act on now.
- Exception: Time-critical, actionable, and personally relevant events.
- Source: Gloria Mark et al. 2005, 2008 (~23 min to resume a task).

### W44. Alarm fatigue: over-alerting destroys alerting
tags: [notification, trust] · evidence: strong · status: approved
- Principle: When most alerts are non-urgent, users stop responding to all of them. Urgency must be rare to remain meaningful.
- Classic failure: Every reminder styled as urgent; badge counts that never reach zero.
- Detection signal: A high share of alerts are dismissed without action; urgency styling on non-urgent items.
- Exception: None.
- Source: Clinical alarm fatigue literature (Joint Commission 2013); SOC alert fatigue.

### W45. Batch the non-urgent
tags: [notification] · evidence: moderate · status: approved
- Principle: Digests at predictable times beat a drip of individual pings for anything that can wait.
- Classic failure: Ten separate pings in an afternoon about low-stakes updates.
- Detection signal: Non-urgent events delivered individually in real time.
- Exception: Events with a short action window.
- Source: Fitz et al. 2019 (batched notifications improved wellbeing).

---

## G. AI and automation

### W46. One bad suggestion costs more than many good ones earn
tags: [ai, trust] · evidence: moderate · status: approved
- Principle: Trust in automation drops sharply after visible errors and recovers slowly. Precision beats recall for proactive suggestions.
- Classic failure: An eager assistant that surfaces many suggestions, a few of which are wrong or tone-deaf, and gets ignored entirely.
- Detection signal: Proactive suggestions shown without a confidence threshold, or with no cost model for being wrong.
- Exception: User-initiated requests, where users tolerate more misses.
- Source: Dzindolet et al. 2003; Microsoft HAX guidelines (Amershi et al. 2019).

### W47. Calibrate trust; prevent automation bias
tags: [ai, trust] · evidence: strong · status: approved
- Principle: Users either over-trust automation (accepting errors) or under-trust it (redoing its work). Design for calibrated trust: show basis, uncertainty, and make checking cheap.
- Classic failure: AI output presented with the same confidence and styling as verified facts.
- Detection signal: AI-generated content visually indistinguishable from user- or system-verified content.
- Exception: Trivially checkable or low-stakes outputs.
- Source: Parasuraman & Riley 1997; Lee & See 2004.

### W48. Show the "why" and the source
tags: [ai, trust, copy] · evidence: moderate · status: approved
- Principle: A suggestion with a visible reason ("from Tuesday's school email") is checkable and trusted; one without is noise or creepy.
- Classic failure: "You might want to..." suggestions with no provenance.
- Detection signal: Any proactive item with no stated trigger or source.
- Exception: None.
- Source: HAX guideline 11 (make clear why the system did what it did).

### W49. Make AI output editable, dismissible, and correctable
tags: [ai, interaction] · evidence: moderate · status: approved
- Principle: Users need cheap ways to fix, reject, or teach the system. Correction should improve future behavior visibly.
- Classic failure: Generated items that can only be accepted or deleted; dismissals that don't stop repeat suggestions.
- Detection signal: No edit path; dismissing a suggestion doesn't change what's suggested next.
- Exception: None.
- Source: HAX guidelines 8, 9, 13, 15; Horvitz 1999, mixed-initiative principles.

### W50. Timing beats intelligence
tags: [ai, notification] · evidence: moderate · status: approved
- Principle: A mediocre suggestion at the right moment beats a brilliant one at the wrong moment. Interrupting focus with help is not help.
- Classic failure: Clippy: offering help mid-task based on shallow pattern matches.
- Detection signal: Suggestions triggered by activity alone, not by a moment when the user can act.
- Exception: Safety-critical warnings.
- Source: Horvitz 1999; Microsoft Office Assistant post-mortems.

### W51. Don't make AI the show
tags: [ai, attention] · evidence: moderate · status: approved
- Principle: Users want the outcome, not the AI. Sparkle icons, chat-first UIs, and "AI-powered" labels add little and can lower trust.
- Classic failure: Forcing a chat interface for tasks a button or list does faster.
- Detection signal: A task that takes longer via the AI path than a direct control would.
- Exception: Genuinely open-ended tasks where natural language is the faster input.
- Source: Practitioner consensus; studies showing "AI" labeling can reduce purchase intent (Cicek et al. 2024).

---

## H. Trust, ethics, and emotion

### W52. Dark patterns win the metric and lose the user
tags: [trust, ethics, copy] · evidence: strong · status: approved
- Principle: Manipulative patterns (confirmshaming, roach motels, forced continuity, disguised ads) lift short-term numbers and erode trust and retention.
- Classic failure: "No thanks, I don't like saving time" decline buttons.
- Detection signal: Asymmetric effort between yes and no; guilt or shame in decline copy.
- Exception: None.
- Source: Harry Brignull, deceptive.design; FTC enforcement actions.

### W53. Streaks and gamification can turn into guilt
tags: [emotion, decision] · evidence: moderate · status: approved
- Principle: Streaks motivate some users and punish others. When life interrupts, a broken streak becomes a reason to quit.
- Classic failure: Streak mechanics in a product used by people with irregular lives.
- Detection signal: A mechanic that punishes a missed day more than it rewards a kept one; no grace or recovery.
- Exception: Products where daily practice is the core value and users opt in.
- Source: Loss aversion (W18); practitioner reports on streak-break churn.

### W54. Never joke when the user is stressed
tags: [copy, emotion] · evidence: moderate · status: approved
- Principle: Tone should match the user's state. Playfulness during errors, deadlines, or failures reads as dismissive.
- Classic failure: "Oops! Our hamsters fell off the wheel" on a failed save.
- Detection signal: Humor or whimsy in errors, warnings, or high-stakes moments.
- Exception: Celebratory moments after success.
- Source: Mailchimp Content Style Guide; practitioner consensus.

### W55. Never make the user feel stupid or judged
tags: [copy, emotion] · evidence: moderate · status: approved
- Principle: Shame drives avoidance. Users who feel judged stop opening the app.
- Classic failure: "You've missed 5 tasks", "You haven't done X yet!" framing.
- Detection signal: Copy that counts failures, uses "you" with negative outcomes, or compares the user to others.
- Exception: None.
- Source: Practitioner consensus; self-determination theory (Deci & Ryan).

### W56. Calm technology: inform without demanding attention
tags: [attention, notification, emotion] · evidence: moderate · status: approved
- Principle: The best tools stay in the periphery and move to the center only when needed. Calm comes from predictability and quiet defaults, not from whitespace alone.
- Classic failure: A "calm" redesign that just adds whitespace while keeping every badge and alert.
- Detection signal: Default state of a screen is noisy even when nothing needs attention.
- Exception: None.
- Source: Weiser & Brown 1996; Amber Case, Calm Technology.

### W57. Respect autonomy
tags: [emotion, trust] · evidence: moderate · status: approved
- Principle: People resist feeling controlled. Suggestions framed as options keep engagement; commands and nags trigger reactance.
- Classic failure: "You should..." copy; assistants that override user choices.
- Detection signal: Imperative phrasing for optional actions; no way to say "not now".
- Exception: Safety instructions.
- Source: Brehm's reactance theory (1966); self-determination theory.

---

## I. Shared and multi-user spaces

### W58. If two people own it, nobody owns it
tags: [multi-user] · evidence: strong · status: approved
- Principle: Shared responsibility diffuses into no responsibility. Every task needs exactly one visible owner.
- Classic failure: Tasks assigned to "both" or "family" that silently go undone.
- Detection signal: Items with zero or multiple owners; no visual owner on a task.
- Exception: Pure information items that need no action.
- Source: Darley & Latané 1968 (diffusion of responsibility); Asana's single-assignee design.

### W59. Visibility vs. surveillance
tags: [multi-user, trust, emotion] · evidence: moderate · status: approved
- Principle: Making shared work visible builds fairness and trust; making individual activity trackable builds resentment. Show outcomes and ownership, not timestamps and activity logs of people.
- Classic failure: "Last seen", per-person completion counts, or activity feeds that read as monitoring.
- Detection signal: Any view where one user can audit another's behavior over time.
- Exception: Explicitly requested, mutual, opt-in visibility.
- Source: Workplace monitoring research; practitioner consensus.

### W60. The same screen means different things to different members
tags: [multi-user, emotion] · evidence: moderate · status: approved
- Principle: In shared products, each member arrives with different context, investment, and emotional stakes. Evaluate each element from each role's point of view.
- Classic failure: An "overdue" indicator that motivates one person and humiliates another.
- Detection signal: Status or attribution copy that could be read as blame by the person it describes.
- Exception: Single-user surfaces.
- Source: Practitioner consensus; CSCW literature (Grudin 1988 on who does the work vs. who benefits).

### W61. Uneven adoption is the default
tags: [multi-user, onboarding] · evidence: strong · status: approved
- Principle: In shared tools, one person usually champions and others adopt slowly or partially. Design for the reluctant member's minimal path, not the champion's ideal.
- Classic failure: Features that only work if every member is fully onboarded.
- Detection signal: Value depends on actions by the least-engaged user, with no low-effort path for them.
- Exception: None.
- Source: Grudin 1988, 1994 (groupware adoption).

---

## J. Accessibility

### W62. Accessibility improves everyone's experience
tags: [a11y] · evidence: strong · status: approved
- Principle: Contrast, clear labels, large targets, and keyboard support help tired, distracted, outdoor, one-handed users too. Situational disability is universal.
- Classic failure: Low-contrast gray text for "calm" or "premium" aesthetics.
- Detection signal: Text that appears below WCAG AA contrast; meaning conveyed by color alone; no visible focus state.
- Exception: None. Default target WCAG 2.2 AA.
- Source: WCAG 2.2; Microsoft Inclusive Design toolkit; the curb-cut effect.

### W63. Respect motion and sensory preferences
tags: [a11y, interaction] · evidence: strong · status: approved
- Principle: Animation should clarify, not decorate, and must respect reduced-motion settings.
- Classic failure: Parallax and large transitions that cause discomfort and slow users down.
- Detection signal: Motion without a functional purpose; no `prefers-reduced-motion` handling.
- Exception: Brief, functional transitions that show where something went.
- Source: WCAG 2.3.3; Apple HIG.

---

## K. Process and judgment

### W64. Every feature has a tax
tags: [process] · evidence: strong · status: approved
- Principle: Each addition costs attention, complexity, maintenance, and makes every other feature harder to find. Subtraction is a design move.
- Classic failure: Answering every gap with a new feature; a "what's missing?" review that never removes anything.
- Detection signal: A recommendation adds without naming what it displaces or demotes.
- Exception: Missing basics (see W23).
- Source: Practitioner consensus; 37signals, Getting Real.

### W65. You are not your user
tags: [process] · evidence: strong · status: approved
- Principle: Builders know too much. The curse of knowledge makes your own product feel obvious.
- Classic failure: Labels and flows that make sense only to the team.
- Detection signal: Design justified by "it's obvious" or internal usage alone.
- Exception: None.
- Source: Camerer et al. 1989; practitioner consensus.

### W66. Five users find most usability problems, not most truths
tags: [process] · evidence: moderate · status: approved
- Principle: Small qualitative tests catch major usability issues per round. They do not establish preference, frequency, or market truth.
- Classic failure: Treating 5 interviews as proof of demand, or running one big test instead of several small iterations.
- Detection signal: Quantitative claims from qualitative samples.
- Exception: None.
- Source: Nielsen & Landauer 1993; critiques by Spool and others.

### W67. Design with real content
tags: [process] · evidence: strong · status: approved
- Principle: Lorem ipsum and ideal-length names hide failures. Real data is long, messy, missing, and plural.
- Classic failure: A card that breaks on long names, empty fields, or 40 items instead of 4.
- Detection signal: Mocks with placeholder text or uniformly perfect data.
- Exception: Early structural sketches.
- Source: Practitioner consensus.

### W68. Design the edge states, not just the happy path
tags: [process, interaction] · evidence: strong · status: approved
- Principle: Empty, loading, partial, error, offline, overflow, and first-time states are where most real experience happens.
- Classic failure: A shipped screen with only its happy-path state designed.
- Detection signal: A review or spec that covers one state.
- Exception: None.
- Source: Practitioner consensus; Scott Hurff's UI stack.
