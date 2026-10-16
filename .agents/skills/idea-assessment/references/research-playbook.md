# Research playbook

How to find out whether a market is real without spending a week on it. Run 8-20 searches. Search each distinct question separately; combined queries return shallow results for all of them.

## 1. The graveyard (do this first)

The highest-signal, least-run search. Prior failures tell you the shape of the wall.

- `"<category>" shut down` / `"<category>" postmortem`
- `why we shut down <category> startup`
- `<specific competitor name> acquired OR shutdown OR "winding down"`
- `site:news.ycombinator.com <category> "we tried"`
- Failed YC companies in the category

What to extract: did they die from no demand, no distribution, bad unit economics, a platform cutting them off, or regulation? Repeated causes are structural, not execution failures.

## 2. Direct competitors

- `<problem in plain language> software` / `tool` / `app`
- `best <category> tools 2026`
- `<category> alternatives`
- `<obvious competitor> competitors`
- YC company directory, Product Hunt, GitHub for the category

For each named competitor capture: pricing page, funding, headcount signal, last blog or release date. A well-funded competitor is bad news; a dormant one that raised and stalled is worse news, because it suggests the market did not pull.

## 3. The good-enough substitute

Search for what people actually do today:

- `<problem> spreadsheet template`
- `<problem> notion template`
- `how do you handle <problem> reddit`
- Whether an off-the-shelf LLM prompt already does 80% of it

If a free template ranks well and has an active community, you are competing with free and familiar.

## 4. Incumbent shadow

- `<platform the buyer already pays for> <feature>`
- `<incumbent> roadmap <feature>`
- Check whether the feature exists in Excel, Notion, Salesforce, HubSpot, Shopify, QuickBooks, Slack, or whatever the buyer already has open.

The question is not whether an incumbent could build it. It is whether the feature is strategically interesting enough for them to bother, and whether they would give it away free to defend the core.

## 5. Buyer voice

Where the actual language of the pain lives:

- `site:reddit.com <problem phrased as a complaint>`
- `site:news.ycombinator.com <problem>`
- G2 / Capterra / TrustRadius reviews of adjacent tools, filtered to 1-3 stars - the complaints are the product spec
- Niche professional forums, Facebook groups, Discord servers, subreddits for the specific trade
- Job postings: if companies are hiring people to do this manually, there is budget

What to extract: the words they use, whether they are currently paying anyone, and whether the complaint is "this is broken" or "this is annoying". The difference is painkiller vs vitamin.

## 6. Why now

Find one concrete, recent, checkable change:

- A cost curve crossing a threshold
- A regulation taking effect or lifting
- An API or platform opening or closing
- A behaviour shift with data behind it
- A capability that crossed from unreliable to reliable

"AI got good" is not a why-now on its own, because it is equally available to every competitor and to the incumbent. The useful version is "AI got good AND I have access to X that others don't".

## Reporting what you find

- Cite sources for specific claims. Paraphrase; do not quote at length.
- Distinguish verified facts from inference. Label inference as inference.
- Report empty results as data. An empty search for competitors means either no demand or genuine novelty, and you should say which you believe and why.
- Do not let a single Reddit thread stand in for a market. Three independent signals before you call something a pattern.
