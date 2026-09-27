---
name: ad-research
description: Research target communities (e.g. Reddit) and the product's own data sources for ad inputs. Outputs research-brief.json for the ad-copy skill. Use when you need audience intelligence, pain points, community language, or real product proof for ads.
---

# ad-research — Community + Product Data Ad Research

Research the target online communities (Reddit by default) and the product's data sources to build an audience intelligence brief for ad creation.

**Input**: Freeform brief like "[Feature] ad targeting r/[community]"  
**Output**: `<ads-dir>/ad-NN-feature-name/research-brief.json`

> **`references/app-context.md` is the only app-specific file in this skill.** It
> defines `<ads-dir>`, the default communities, the product context sources, the
> feature → data mappings, and the data source queries. Load it first. If it is
> unfilled or describes a different product than the one you're researching for,
> say so and ask for the right context rather than researching against the wrong
> product.

---

## Step 0: Parse the brief

Extract from the user's freeform input:
- **Product/feature** (the feature or report this ad promotes)
- **Target community** (defaults in app-context § Communities)
- **Angle** (optional: what aspect to emphasize)

If the brief is too vague, ask:
1. Which product feature is this ad for?
2. Which community should we research?
3. Any specific angle or proof point you want to lead with?

---

## Step 0b: Load product context

Read the product context sources listed in app-context § Product context sources.
Use them to map the user's feature name to the correct data identifier
(app-context § Feature mappings) and to understand what you're researching.

If the exact data value for a feature is unknown, query with a `LIKE` pattern on a
distinctive keyword from the mapping, then verify the results against the catalog.

---

## Step 1: Research communities via Reddit (Composio)

Use Composio Reddit tools to research the target communities.

### 1a. Search for relevant posts

Use `REDDIT_SEARCH_ACROSS_SUBREDDITS` to find posts about:
- The specific problem your feature solves, in the audience's own words
- Competitor mentions (search the competitor names in your space)
- General struggles around the job your product does (what it costs, common failures, workarounds)

**Search queries to run** (run multiple in parallel via `COMPOSIO_MULTI_EXECUTE_TOOL`):
```
1. "[problem] site:reddit.com/r/[community]"
2. "[job] cost" site:reddit.com/r/[community]
3. "[product category] tool" site:reddit.com/r/[community]
4. "[competitor name] review" site:reddit.com/r/[community]
```

**Parameters**:
- `search_query`: The query string
- `result_type`: `["link"]`
- `sort`: `"relevance"` or `"top"`
- `time_filter`: `"year"` (recent posts, not ancient)
- `limit`: 10 (top 10 results per query)

### 1b. Fetch post details and top comments

For the top 5 most relevant posts from 1a, use `REDDIT_RETRIEVE_POST_COMMENTS` to get:
- Post selftext (the actual problem statement)
- Top 10 comments (community response)

**Parameters**:
- `article`: Base-36 post ID (from the search results permalink)
- `sort`: `"top"`
- `limit`: 10

### 1c. Extract pain points and language patterns

From the community data, extract:

**Pain points** (what the audience complains about):
- Specific problems they mention
- Emotional language they use, verbatim
- What they've tried that didn't work

**Language patterns** (how the audience talks):
- Words they use for their problems
- Phrases that show skepticism about the product category
- The tone of the community (self-deprecating? angry? hopeful?)

**Competitor mentions**:
- Which tools they discuss
- Why they reject them
- What they wish existed

---

## Step 2: Query the product data for real proof

Find real product findings that match the ad brief, using the data
sources and queries in app-context § Data sources.

### 2a. Determine analysis types

Map the feature name to data values using app-context § Feature mappings.

### 2b. Run the query

Use Supabase MCP `execute_sql` or query tools with the query from app-context
§ Data sources.

### 2c. Extract quotable findings

From the results, extract:
- **Specific findings** with their concrete identifiers
- **The explanation** (why it's a problem)
- **The impact** (why it weakens the work)

Format as an array of findings:
```json
{
  "finding": "[the specific finding, quotable]",
  "explanation": "[why it's a problem]",
  "impact": "[why it matters to the audience]",
  "identifier": "[chapter, page, timestamp — whatever specificity means for this product]",
  "analysis_type": "[data value from app-context]"
}
```

Prioritize findings that are:
1. **Specific** (concrete identifiers, names)
2. **Concrete** (not vague "needs work")
3. **Quotable** (would make a good ad headline)

---

## Step 3: Query for real user reactions (optional)

If the brief mentions wanting real user reactions, run the reactions query from
app-context § Data sources. Extract genuine-sounding user reactions (not test messages).

---

## Step 4: Build the research brief

Create `research-brief.json` in the ad folder:

```json
{
  "ad_folder": "ad-NN-feature-name",
  "feature": "[feature name]",
  "target_subreddits": ["r/[community]"],
  "generated_at": "[ISO timestamp]",
  "reddit_insights": {
    "pain_points": [
      "[pain point in the audience's own words]"
    ],
    "language_patterns": [
      "[how the audience phrases it, vs. how marketing would]"
    ],
    "sample_posts": [
      {
        "title": "[post title]",
        "selftext": "[...]",
        "top_comment": "[...]",
        "score": 0
      }
    ]
  },
  "real_findings": [
    {
      "finding": "[specific finding with its identifier]",
      "explanation": "[why it's a problem]",
      "impact": "[why it matters to the audience]",
      "analysis_type": "[data value from app-context]"
    }
  ],
  "user_reactions": [
    "[genuine user reaction, verbatim]"
  ],
  "competitor_mentions": [
    "[tool and why the audience rejects it]"
  ]
}
```

(Bracketed values are placeholders — fill them from your actual research.)

**File location**: `<ads-dir>/ad-NN-feature-name/research-brief.json`

If the ad folder doesn't exist yet, ask the user to create it or provide the ad number/name.

---

## Step 5: Output summary

Present the research brief to the user:

```markdown
## Research Complete

**Target**: [communities]
**Feature**: [feature]

### Key pain points found:
- [pain point 1]
- [pain point 2]

### Real findings available:
- [finding 1]
- [finding 2]

### Language patterns to use:
- [pattern 1]
- [pattern 2]

Saved to: `<ads-dir>/ad-NN-feature-name/research-brief.json`

Next step: Run `/ad-copy` with the same ad folder to write the ad copy.
```

---

## Error handling

- **Composio Reddit not connected**: Tell user to connect via Composio (it's usually pre-connected)
- **No Reddit results**: Widen the search query, try different keywords, or fall back to the audience profile in app-context
- **No product data findings**: Query a broader feature mapping, or ask user to provide a specific example
- **Ad folder doesn't exist**: Ask user to create `<ads-dir>/ad-NN-feature-name/` first

---

## Related skills

- **ad-copy**: Next step — writes ad copy using this research brief
- **ad-design**: Final step — creates Canva design from the copy
- **copy-writer**: Reference for brand voice and copy rules
