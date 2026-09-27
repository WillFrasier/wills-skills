# App Context (template — fill me in)

> **This is the only app-specific file in this skill.** Fill in every section below
> for your product before using the skill. Everything else in the skill is
> product-agnostic. Keep the section headings so the skill's instructions still
> resolve.

## 1. What the product is

One short paragraph: what the product does, who it's for, and what counts as a
"finding" it produces — the concrete, quotable output that ads can lead with as
proof.

## 2. Communities (defaults)

- Default communities/subreddits to research when the brief doesn't specify.
- A line on who the audience is and where they gather online.

## 3. Product context sources

Repo paths the skill should read to map feature names to data and understand what
it's researching:

| What | Where |
|---|---|
| [e.g. full feature/report catalog] | `[path]` |
| [e.g. audience profile] | `[path]` |
| [e.g. marketing components, positioning] | `[path]` |

## 4. Feature mappings

Map the feature names users actually say to the data values used in queries:

| Feature (as the user says it) | Data value(s) |
|---|---|
| [feature name] | `[value]` |

## 5. Data sources

Where real product proof lives. For each source, include:

- Table names and the columns worth selecting
- A ready-to-run query template (e.g. "completed results matching a feature")
- Any state/quality filters that separate real data from test data
- A second query template if user reactions/testimonials are stored separately

## 6. Where ads live

The ads directory (referenced as `<ads-dir>` by the skill) and the per-ad folder
naming convention, e.g. `ad-NN-feature-name`.
