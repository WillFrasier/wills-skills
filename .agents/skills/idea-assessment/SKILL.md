---
name: idea-assessment
description: Rigorously stress-test a new business or product idea for a solo founder - competitor and graveyard research, core-need diagnosis, time-and-capital-to-MVP, distribution reality check, and a verdict with kill criteria. Use this whenever the user floats a product or business idea, asks "is this a good idea", "would this work", "should I build this", "what do you think of this startup idea", describes a problem they want to build a tool for, asks about market size or competitors for something they might build, or wants to know how long or how much it would take to ship something. Use it even when the idea arrives casually mid-conversation, and even if the user does not use the words "assess" or "evaluate".
---

# Idea Assessment

Assess a new business idea the way a good technical co-founder would: skeptical about the claim, optimistic about the person. The goal is not to prove the idea wrong. The goal is to find the true version worth building, or to establish quickly and cheaply that there isn't one.

Assume the user is a solo founder who can build. That inverts the usual analysis: building is rarely the bottleneck, so weight distribution, buyer access, and capital intensity far more heavily than technical difficulty. Most ideas from strong builders die of no distribution, not bad code.

## Hard rules

These exist because the default failure mode of this analysis is a pleasant, balanced, useless summary.

- Never conclude with "promising, with the right execution" or equivalent. Pick one of the four verdicts in `references/verdict-rubric.md`.
- Always state the single strongest reason to kill the idea, in one sentence, before the verdict.
- Never assert a market fact without having searched for it. Mark anything unverified as an assumption.
- Never invent competitors, funding numbers, or pricing. If a search fails, say the search failed.
- Do not pad. A PASS verdict can be four paragraphs. Length does not signal rigor.
- Skepticism targets the idea, never the founder. Every PASS must name what would have to change to make it a BUILD.

## Phase 1 - Sharpen before researching

Do not research a fuzzy idea. Compress what the user said into one sentence:

> For **[specific who]**, who **[specific recurring pain]**, build **[what]**, instead of **[what they do today]**, viable now because **[what changed]**.

Fill every slot. If a slot is empty, vague ("small businesses", "people who are busy"), or you had to invent it, ask.

**Asking well:**
- Use `ask_user_input_v0` with tappable options. One round of up to 3 questions. A second round only if the first answers opened a genuine fork.
- Never ask what you can research. "Who are the competitors" is your job, not theirs.
- Never ask what they already answered.
- Prefer forced choices over open prompts: "Who feels this pain most acutely: [A] / [B] / [C] / Not sure yet". "Not sure yet" is a legitimate option and itself a signal.
- The highest-value questions are usually: who exactly is the buyer, how do they solve this today, and how do you personally reach ten of them this month.

Then show the compressed sentence back and proceed. If the user says "just go", proceed on stated assumptions and label them.

## Phase 2 - Research

Read `references/research-playbook.md` for search patterns and sources. Run 8-20 searches. Cover, in rough priority order:

1. **The graveyard.** Companies that tried this and died. This is the most informative and most skipped step. If several died the same way, that way is the real risk.
2. **Direct competitors.** Names, pricing, funding, team size, last shipped update.
3. **The good-enough substitute.** A spreadsheet, a Notion template, an agency, a WhatsApp group, ChatGPT with a decent prompt, or doing nothing. Usually the real competitor.
4. **The incumbent shadow.** Whether a platform the buyer already pays for ships 80% of this, or could in one sprint and give it away.
5. **Buyer voice.** Reddit, HN, niche forums, G2 or Capterra reviews of adjacent tools. Look for the words they use for the pain and whether they are currently paying anyone to solve it.
6. **Why now.** A concrete recent change - cost curve, regulation, API access, platform shift, behaviour change. "AI is better now" alone is not a why-now, because it is equally available to everyone.

Report what you actually found, including nothing. An empty market is ambiguous: it means either no one wants this, or you are early. Say which you think it is and why.

## Phase 3 - Diagnose the need

- **Painkiller or vitamin.** What breaks if this never exists? If the honest answer is "nothing, it's just nicer", say so.
- **Frequency and cost.** How often does the pain occur, and what does each occurrence cost in money or hours? Pain that is severe but annual is hard to sell.
- **Pain holder vs budget holder.** If the person who suffers is not the person who pays, the sales cycle just got long. This kills more B2B ideas than competition does.
- **Current workaround.** People are already solving this somehow. Describe how, and why they would switch. Switching cost is a real number.
- **Evidence of willingness to pay.** Existing spend on adjacent tools, paid alternatives, agencies charging for it. Speculation about willingness to pay is not evidence.

## Phase 4 - Time and capital to a shippable v1

Name the thinnest version that tests the riskiest assumption, not the smallest version of the full product. Then bucket it:

- **Weekend** - one builder, existing APIs, no data moat needed
- **Weeks** - one builder, 2-8 weeks, under $5k out of pocket
- **Quarters** - 3-9 months solo, or needs a second person
- **Capital-intensive** - needs funding, a team, or years before first revenue

Explicitly check the traps that make a cheap-looking idea expensive:

- Two-sided marketplace (you have to solve cold-start twice)
- Regulated data: health, financial, minors, EU personal data
- Content or data licensing you cannot get as an unknown solo founder
- Integrations gated on partner approval or marketplace review
- Hardware, logistics, or anything with inventory
- Per-user inference or API cost measured against the price the buyer will actually pay
- Accuracy thresholds where 90% is worthless and 99.9% is a research project
- Data you do not have, cannot buy, and cannot bootstrap

Give a rough monthly run cost at 100 users and at 1,000 users when the idea is AI-heavy. Margin death is quiet and common.

## Phase 5 - Distribution reality check

For a solo founder this usually decides the outcome, so do not treat it as an afterthought.

- Where do the first 20 paying users come from, by name or by specific channel? "Content marketing", "SEO", "go viral", and "post on Product Hunt" are not answers.
- Does the user already have access to this audience? Existing audience is worth more than a head start on the code.
- Is the buyer reachable by one person without a sales team or an ad budget?
- Is the category's acquisition cost already bid up by funded competitors?
- Can the first version be sold manually, one customer at a time, before it is automated?

## Phase 6 - Gates, then verdict

Run the six gates and the scoring in `references/verdict-rubric.md`. Gates are binary and a failed gate caps the verdict regardless of how good the rest looks. Then produce the output below.

## Output format

Use this structure exactly. Keep it tight; prose over bullets where reasoning matters.

```
## The idea, sharpened
[the one-sentence compression]

## What I found
[3-6 short paragraphs of research findings: graveyard, competitors, substitute,
incumbent risk, buyer voice, why-now. Cite sources. Name what you could not verify.]

## The need
[Painkiller or vitamin. Frequency, cost, who pays vs who hurts, current workaround,
evidence of willingness to pay.]

## Build reality
Thinnest v1 that tests the riskiest assumption: [one or two sentences]
Bucket: [weekend / weeks / quarters / capital-intensive]
Estimate: [time and out-of-pocket cost]
Traps: [any that apply, or "none material"]

## Distribution
[Where the first 20 users come from, honestly. Flag it if there is no answer.]

## Gates
[Each of the six gates: PASS or FAIL with one line of reasoning.]

## Scores
[The scoring table from the rubric.]

## Strongest reason to kill it
[One sentence. The best argument against, stated as an opponent would state it.]

## Verdict: [BUILD NOW / TEST FIRST / RESHAPE / PASS]
[2-4 sentences. If RESHAPE, describe the version that clears the gates.
If PASS, name what would have to change. If TEST FIRST, name the test.]

## Cheapest thing that changes your mind
[One concrete experiment, under a week and under $500 where possible, with the
number or answer that would flip the verdict. Include a kill date.]
```

## Calibration

Most ideas should not get BUILD NOW. If everything you assess comes back as build it, the assessment is broken. But a steady diet of PASS is also a failure mode: the useful work is often in RESHAPE, finding the narrower wedge where a solo founder actually wins - a specific vertical, an underserved segment, a workflow the incumbents consider too small.

When the honest read is "this is a feature, not a company", say exactly that. When it is "this is real but you are two years early", say that, because it changes the decision from no to not yet.
