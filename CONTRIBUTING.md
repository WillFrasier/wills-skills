# Authoring skills

This repo exists to author and share agent skills. Skills live in `.agents/skills/<skill-name>/`, one self-contained folder per skill.

## Adding a skill

1. Create `.agents/skills/<skill-name>/` (kebab-case).
2. Write `SKILL.md`: frontmatter (`name`, `description`) followed by the instructions.
3. Add `references/` files for depth the agent reads on demand.
4. Add `tests/` with at least one concrete example input and its expected behavior.
5. Add the skill to the catalog table in the root `README.md` (copy the description from the frontmatter).
6. Test it: open this repo in Zed and run the skill against a case from `tests/`.

## Conventions

1. **Folder name must equal the frontmatter `name`.** Kebab-case, e.g. `copy-writer`.
2. **The `description` is the trigger surface.** It is the only thing an agent matches against when deciding to load the skill. State what the skill does plus explicit "use when…" conditions, including the phrases a user would actually say. It is the highest-leverage line in the file: spend real effort on it.
3. **`SKILL.md` vs `references/`.** The main file holds what the agent needs every run: role, process, hard constraints, checklists. `references/` holds depth consulted selectively: examples, patterns, edge cases. Keep `SKILL.md` lean; link out rather than inline.
4. **App-specific context lives in exactly one swappable file** (see `copy-writer`'s `references/app-context.md`). Everything else in the skill must be product-agnostic, so the skill can be reused on another product by swapping that one file.
5. **No per-skill README.** The root `README.md` is the single catalog; a skill's frontmatter description is its documentation.
6. **Tests travel with the skill.** `tests/` holds concrete inputs (briefs, prompts, files) and the expected behavior, so edits can be checked against known cases. Keeping tests inside the folder is what makes the folder the whole unit of distribution.

## Frontmatter shape

```yaml
---
name: skill-name
description: What the skill does. Use when <trigger conditions>, or when the user says "<phrases>".
---
```
