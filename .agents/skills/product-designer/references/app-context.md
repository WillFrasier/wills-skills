# App Context

This is the only app-specific file in this skill. It points to where the product's design context lives, so one global install works across products.

## Design folder

`./design/` in the current repository.

Change this path if your product keeps design context elsewhere (e.g. `docs/design/`). Expected contents:

- `context.md`: product, audience, thesis, vocabulary, research links (template: `templates/context.md`)
- `pages/<page>.md`: one brief per page (template: `templates/page-brief.md`)
- `wisdom.md`: product-specific lessons, same entry format as `ux-wisdom`

## Fallback

If the design folder doesn't exist, work from what the repo, the screenshots, and the user tell you, mark assumptions, and offer to create the folder (see SKILL.md, Step 0).
