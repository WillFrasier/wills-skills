# wills-skills

A collection of agent skills.

## Skills

| Skill | Description |
|-------|-------------|
| [`copy-writer`](.agents/skills/copy-writer/SKILL.md) | Expert web copywriting for any UI text: headlines, subheads, body, CTAs, button labels, onboarding, empty states, errors, tooltips, and microcopy. Use when writing, rewriting, tightening, or critiquing copy for a web page or app screen, or when the user says the copy "isn't professional," "sounds off," or "needs a copywriter." Always establishes the copy's role, page context, audience, and goal before writing, and asks the user when any of those are unknown. |

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

**Try them in the skills repo itself:** clone this repo and open it as a project in your client. Clients that read `.agents/skills/` pick the skills up automatically.

## After installing copy-writer

The skill ships with an example `references/app-context.md` describing a fictional product. Replace that file with your product's voice, audience, vocabulary, and copy rules. It is the only app-specific file in the skill; everything else is product-agnostic.

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
