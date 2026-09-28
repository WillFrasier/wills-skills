# bert — build, execute, review, test

bert is an agent skill that takes one task end-to-end: it understands the task, specs it if it's big enough, writes the code, reviews itself, runs your build and tests, and opens a pull request. You give it a task; you get back a PR.

## Using it

bert runs in any AI coding agent that supports agent skills. Address the task to bert:

- `bert: add rate limiting to the login endpoint`
- `bert, fix the flaky checkout test`
- or phrase it naturally and ask for the change end-to-end ("take this from idea to PR") — the agent will reach for bert.

To install, copy this skill directory into your agent's skills location — `.agents/skills/` for project scope, `~/.agents/skills/` for personal scope, or your agent's equivalent.

## What to expect

bert runs a fixed pipeline — understand → spec (if warranted) → branch and baseline → code → validate → review → ship → report — narrating each phase in one line and ending with a summary: context found, spec yes/no, review findings fixed, validation results, PR link, follow-ups.

What it will do to your repo:

- Create a feature branch named `<type>/<short-slug>` (e.g. `feat/rate-limit-login`)
- Make conventional commits, including a separate `chore: add bert config` commit the first time it runs in a repo without `.agents/bert.toml`
- Open one PR against your default branch and stop there — it never merges

One task = one branch = one PR, always — even for small changes. If you want something narrower (a question answered, a snippet, a direct commit to main), that's a different tool, not bert.

## Configuring your repo

bert resolves build/test/lint commands itself: `.agents/bert.toml` first, then `AGENTS.md` / `CLAUDE.md` / README, then auto-detection from manifests (`package.json` scripts, `Makefile`, `Cargo.toml`, `pyproject.toml`, `justfile`). To pin them explicitly, commit `.agents/bert.toml` at the repo root:

```toml
# Every value is optional; empty means bert resolves it itself.
[commands]
build = ""                 # e.g. "npm run build"
test  = ""                 # e.g. "npm test"
lint  = ""                 # e.g. "npm run lint"
typecheck = ""             # e.g. "npm run typecheck"

[git]
base = ""                  # e.g. "main"; empty = repo's default branch

[pr]
labels = []                # e.g. ["backend"]
reviewers = []             # e.g. ["a-handle"]
```

## When bert stops and asks

Only for: destructive or irreversible actions on real data, handling secret values, CI/infrastructure changes beyond the task's scope, mass rewrites, or genuinely unclear requirements. Everything else — implementation choices, failing tools, missing dependencies — it decides, documents the call in the PR, and keeps going.

## Hand-off

bert stops at an opened PR. To continue through CI verification and merge, use the `implement-pr` skill.
