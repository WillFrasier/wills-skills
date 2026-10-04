# wills-skills

A collection of agent skills.

## Skills

| Skill | Description |
|-------|-------------|
| [`copy-writer`](.agents/skills/copy-writer/SKILL.md) | Expert web copywriting for any UI text: headlines, subheads, body, CTAs, button labels, onboarding, empty states, errors, tooltips, and microcopy. Use when writing, rewriting, tightening, or critiquing copy for a web page or app screen, or when the user says the copy "isn't professional," "sounds off," or "needs a copywriter." Always establishes the copy's role, page context, audience, and goal before writing, and asks the user when any of those are unknown. |
| [`ad-research`](.agents/skills/ad-research/SKILL.md) | Research target communities (e.g. Reddit) and the product's own data sources for ad inputs. Outputs research-brief.json for the ad-copy skill. Use when you need audience intelligence, pain points, community language, or real product proof for ads. |
| [`ad-copy`](.agents/skills/ad-copy/SKILL.md) | Write high-converting Reddit ad copy with 3-round iteration. Reads research-brief.json (from ad-research), outputs README.md. Use when you have an ad concept and need audience-specific copy that sounds authentic to the target community and leads with real product proof. |
| [`ad-design`](.agents/skills/ad-design/SKILL.md) | Create unique Canva designs for Reddit ads. Reads the ad's README.md (from the ad-copy skill), generates original visual concepts via Canva MCP. Use when you have ad copy and need a 1080x1080 Reddit ad image. |
| [`ad-render`](.agents/skills/ad-render/SKILL.md) | Turn approved ad copy plus supplied images into a finished ad image at exact platform dimensions. Generates the design via Canva, exports to PNG, and refuses to ship anything that fails a visual QA gate. Use whenever the user asks to render, produce, redo, resize, or fix an ad visual, ad creative, ad image, or a set of size variants, or points at an ad folder containing ad.json. Also use when an existing ad visual is described as generic, off-brand, cropped, illegible, or "not production ready". This skill does visual production only; it does not write, rewrite, or strategise copy. |
| [`senior-pr-reviewer`](.agents/skills/senior-pr-reviewer/SKILL.md) | Senior engineer PR reviewer. Be direct and blunt — flag problems only, no praise. Use proactively after writing or modifying code, before opening a PR, or when the user asks to review a branch, diff, or PR ("review this PR", "code review", "review my changes", "review the diff"). Covers logic correctness, security, structure, code smells, NIH/reinventing the wheel, stack-specific patterns, type safety, and test coverage. |
| [`bert`](.agents/skills/bert/SKILL.md) | bert takes one task end-to-end — understand, spec, code, review, test, then ship a feature branch and open a PR. Use when the user says "bert", gives bert a task, or asks for a change to be implemented and delivered start-to-finish as a pull request. |
| [`got-tests`](.agents/skills/got-tests/SKILL.md) | Review a pull request or branch diff and decide whether the changed code has enough unit tests to catch real bugs, then name the specific missing tests, each tied to a plausible bug it would catch. Language and framework agnostic. Use whenever the user asks if a PR has enough tests, wants a test gap or test quality review, asks "what could break", "are we missing tests", "is this safe to merge", or points at a diff, branch, or PR and cares about test protection, even if they never say "unit tests". Also use when reviewing a PR that changes behavior but touches few or no tests. |
| [`proactive`](.agents/skills/proactive/SKILL.md) | Proactive mode, where the agent owns the task like a senior engineer, does everything it can itself, and stops only on the user's configured stop conditions. Use only when the user types /proactive or asks to turn on proactive mode, or when another skill tells you to load it. Never load it on your own initiative. |
| [`design-crit`](.agents/skills/design-crit/SKILL.md) | Senior-designer critique of a web page or app UI from screenshots. Diagnoses the underlying user need, gives a first read immediately, runs a short intake (goal, audience, stage, style, constraints), plays back a brief, then gives an opinionated critique against that brief, UX heuristics, accessibility, copy, visual craft (space, composition, typography, proportion), and current design trends, with a concrete recomposition. Also compares design variants and re-reviews revisions. Use whenever the user shares a UI screenshot or mockup and asks for design feedback, a design review, a crit, "what do you think of this page", "does this look good", "which version is better", UX or UI critique, landing page review, or wants help choosing or checking a visual style, even if they never say "critique". |

## Installing a skill

Skills live in `.agents/skills/<skill-name>/` in this repo. Each folder is self-contained: `SKILL.md` plus its references and tests. Installing is just copying a folder into your client's skills directory (Zed: `.agents/skills/`, Claude Code: `.claude/skills/`, other clients: see their docs).

**Add one skill to another project:**

```sh
git clone --depth 1 https://github.com/WillFrasier/wills-skills.git
mkdir -p <your-project>/.agents/skills
cp -r wills-skills/.agents/skills/copy-writer <your-project>/.agents/skills/
```

For Claude Code, use `.claude/skills` in place of `.agents/skills`.

**Install globally (available in all your projects):**

```sh
git clone --depth 1 https://github.com/WillFrasier/wills-skills.git
mkdir -p ~/.agents/skills
cp -r wills-skills/.agents/skills/copy-writer ~/.agents/skills/
```

**Install or update every skill globally from a clone:**

```sh
scripts/install.sh --dry-run   # preview
scripts/install.sh             # all skills
scripts/install.sh bert got-tests   # just these
```

This copies each skill into `~/.agents/skills/` and links it into `~/.claude/skills/`. Rerun it after pulling to get the latest. It keeps your config safe:

- If you edited `references/app-context.md`, it's never overwritten. You get a `diff` command for comparing it with the repo version.
- Any other file you edited is backed up to `~/.agents/skills-backups/<timestamp>/` before it's updated.
- Files you added yourself are never touched.
- Skills installed via `npx skills`, and existing entries in `~/.claude/skills/` that aren't this script's links, are skipped.

**Try them in the skills repo itself:** clone this repo and open it as a project in your client. Clients that read `.agents/skills/` pick the skills up automatically.

## After installing a skill

Skills that need product-specific context ship exactly one swappable file, `references/app-context.md`, as a fill-in template. Replace it with your product's context: voice, audience, paths, data sources, brand tokens. It is the only app-specific file in each skill; everything else is product-agnostic. Some skills (e.g. `proactive`) ship working defaults in that file instead of an example, so edit it to taste rather than replace it.

## Using a skill

Ask for the job and the matching skill loads; you can also name it directly ("use the copy-writer skill to fix this error message").

## How skills are structured

Each skill follows the same shape:

- **`SKILL.md`** is the interface: frontmatter (`name`, `description`) plus the instructions the agent loads when the skill triggers.
- **`references/`** is the implementation: deeper material the agent reads on demand rather than loading up front.
- **`tests/`** holds example inputs and expected behavior, used to verify a skill still does its job after edits.

## Contributing

Want to add a skill? See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

[MIT](LICENSE)
