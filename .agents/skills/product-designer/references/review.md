# Review mode

A small, fast check that a UI change still serves the user. Think of it as the user's representative on the PR. It is not a full critique.

## Run it isolated

When the host supports subagents, run Review in a fresh subagent that receives only: the diff or screenshots, the page brief(s), and the wisdom files. Fresh context avoids anchoring on the reasoning that produced the change.

## Inputs

- The change: a diff, PR, branch, or before/after screenshots.
- The brief for every page the change touches (`./design/pages/`). Map changed files to pages by route or component. If a touched page has no brief, infer job, real question, and desired exit state from the archetype (see `page-interview.md`), mark them `Hypothesis`, and offer Interview mode at the end.

## Checks, in order

1. **Job still served.** After the change, can the user still answer the page's real question and reach its primary action in the glance budget the brief sets?
2. **Exit state.** Does the change move the user toward or away from the brief's desired exit state? Name the element.
3. **Anti-goals.** Does anything trip one?
4. **Wisdom.** Run detection signals for matching tags (SKILL.md, Wisdom checks).
5. **States.** Did the change add a UI state (empty, loading, error, overflow, first-time) without designing it? Flag as "not shown", not as a failure, if you only have screenshots.
6. **Roles.** In multi-user products, read the changed elements as each role in the brief.

Ignore pure visual polish unless it breaks hierarchy (W1, W5). That belongs in Critique mode.

## Output

```
Verdict: PASS | PASS WITH NOTES | FAIL
Page(s): <name> (brief: approved | draft | inferred)

1. [blocker|major|minor] <element>: what goes wrong, for whom, in which moment. <brief field or W-id>. Fix: <specific move>.
...(max 5, ranked)

Not judged: <what the inputs can't show>
```

- **FAIL** only for a blocker: the change defeats the page's job, primary action, or an approved anti-goal or wisdom entry.
- No praise, no polish notes, no restating the diff.
- If there's nothing worth flagging, say "PASS" and stop.
- If the change reveals that the brief itself is wrong or outdated, say so in one line and propose the amendment (see `learning.md`).
