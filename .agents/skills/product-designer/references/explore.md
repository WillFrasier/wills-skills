# Explore mode

For open design questions at two zoom levels:

- **Component:** "Of everything we could show about X, what matters most on this card?"
- **Page:** "What features is the home page missing for our audience?" or "Design the X screen."

Explore uses the full pipeline. For a quick component question, run steps 1, 4, and the wisdom check only, and say you did.

Page-level questions never take the quick path: step 3 is mandatory, and the answer must show 2-3 options with different bets before it converges on one. A single recommended direction is not a substitute.

In step 1, always state trigger, arrival state, and exit state as three separate labeled lines, even on the quick path.

## 1. Model the moment

Fill this before any design. Pull from the page brief; infer what's missing and label it `Hypothesis` with what would confirm it.

- **Trigger:** what happened in the last few minutes that brought them here?
- **Arrival state:** emotion, energy, attention (glance, task, sit-down), device, interruptions, who's nearby.
- **Stated want:** what they'd say they're doing.
- **Ladder up:** ask "why does that matter to them?" three times. The third answer is usually the real need.
- **Job layers:** functional (know or do), emotional (how they need to feel leaving), relational (what this does between people, in shared products).
- **Forces:** what pushes them to act, what pulls them toward the product, what anxiety holds them back, what old habit competes (W24).
- **Roles:** the same element through each role's eyes (W60).
- **Tenure:** first week vs. established user, and how that changes the answer.
- **Exit state:** what's true about them 10 seconds later if the design works.

## 2. Inventory vs. need

List what the product could show or do here (implemented features and available data). For each, ask: does it change what the user knows or does next, in this moment? Classify each as **Primary / Secondary / On-demand / Cut**, with a one-line reason tied to the moment.

## 3. Diverge

Produce 2-3 options that make **different bets**, not variations of one idea. Examples of bets: "answer only", "answer plus one action", "proactive, ask nothing", "summary that expands". Name each bet in one line.

## 4. Pressure-test

Run the lenses in `review-lenses.md` against the options. Use subagents with only the options and the moment model when the host supports them; otherwise run each lens as a separate, explicit pass. Reviewers report; they don't decide.

## 5. Converge

Pick one option. State what it traded away and which reviewer issues you rejected and why.

## Output

**Component:**
- Moment and real question (2 lines)
- Ranked content: Primary / Secondary / On-demand / Cut, one reason each
- The single most important control
- Layout as a text hierarchy or ASCII sketch
- Risks: what this gets wrong, for whom
- Success signal and cheapest test

**Page:**
- Why users land here: top 2-3 reasons by frequency and stakes
- Audit: what serves those reasons, what's decoration, what's missing
- Gaps ranked by impact on the user's load, each with the need, the evidence (or `Hypothesis`), and whether it needs a new feature or just better surfacing of existing data
- **Remove or demote:** always included. Adding without subtracting is not a recommendation (W64).
- The recommended direction, with a layout sketch
- Success signal and cheapest test for the top change

Prefer surfacing existing data well over proposing new features. Ask at most one clarifying question, and only if the answer would flip the recommendation.
