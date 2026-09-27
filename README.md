# wills-skills

A collection of agent skills: reusable instruction modules that teach your AI coding agent how to do a specific job well. Each skill follows the Agent Skills format (a `SKILL.md` with `name` and `description` frontmatter), so any client that supports skills can use them: Zed, Claude Code, Cursor, GitHub Copilot, and others.

## Skills

| Skill | Description |
|-------|-------------|
| [`copy-writer`](.agents/skills/copy-writer/SKILL.md) | Expert web copywriting for any UI text: headlines, subheads, body, CTAs, button labels, onboarding, empty states, errors, tooltips, and microcopy. Use when writing, rewriting, tightening, or critiquing copy for a web page or app screen, or when the user says the copy "isn't professional," "sounds off," or "needs a copywriter." Always establishes the copy's role, page context, audience, and goal before writing, and asks the user when any of those are unknown. |

## Installing a skill

Skills live in `.agents/skills/<skill-name>/` in this repo. Each folder is self-contained: `SKILL.md` plus its references and tests. Installing is just copying a folder into the directory your client reads skills from.

| Client | Project directory | Global directory |
|--------|-------------------|------------------|
| Zed | `<project>/.agents/skills/` | `~/.agents/skills/` |
| Claude Code | `<project>/.claude/skills/` | `~/.claude/skills/` |

Other clients that support the Agent Skills format have their own skills directory; check your client's docs and copy the folder there.

**Add one skill to another project:**

```sh
git clone https://github.com/WillFrasier/wills-skills.git
mkdir -p <your-project>/.agents/skills
cp -r wills-skills/.agents/skills/copy-writer <your-project>/.agents/skills/
```

For Claude Code, use `.claude/skills` in place of `.agents/skills`.

**Install globally (available in all your projects):**

```sh
git clone https://github.com/WillFrasier/wills-skills.git
mkdir -p ~/.agents/skills
cp -r wills-skills/.agents/skills/copy-writer ~/.agents/skills/
```

**Try them in the skills repo itself:** clone this repo and open it in a client that reads `.agents/skills/` (Zed does). Every skill loads automatically for that project.

## Using a skill

Skills trigger automatically: the agent reads each skill's `description` and loads it when your request matches. Ask for a rewrite and copy-writer steps in; you can also name it directly ("use the copy-writer skill to fix this error message").

## After installing copy-writer

The skill ships with an example `references/app-context.md` describing a fictional product. Replace that file with your product's voice, audience, vocabulary, and copy rules. It is the only app-specific file in the skill; everything else is product-agnostic.

## How skills are structured

Each skill follows the same shape:

- **`SKILL.md`** is the interface: frontmatter (`name`, `description`) plus the instructions the agent loads when the skill triggers. The `description` is what the agent matches against, so it states both what the skill does and when to use it.
- **`references/`** is the implementation: deeper material the agent reads on demand rather than loading up front.
- **`tests/`** holds example inputs and expected behavior, used to verify a skill still does its job after edits.

## Contributing

Want to add a skill? See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

[MIT](LICENSE)
