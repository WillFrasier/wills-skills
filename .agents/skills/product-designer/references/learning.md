# Learning

How the skill gets smarter about a product over time, and how lessons reach other skills (e.g. `copy-writer`).

## What gets captured

Propose a lesson when one of these happens:

- The user corrects your output in a way that reflects a rule, not a one-off preference.
- A Review finding is accepted and fixed.
- A shipped design is reverted or changed after real-user feedback.
- Research contradicts a page brief.

Don't capture one-off taste, or anything already covered by an existing entry. Strengthen that entry's failure or detection signal instead.

## Where it goes

- **Lessons** go to the product's `./design/wisdom.md`, in the `ux-wisdom` entry format, with `status: proposed` and tags. Tags matter: `copy-writer` reads entries tagged `copy`, so a layout lesson that's also a copy lesson should carry both.
- **Facts about a page's users** go to that page's brief as a changelog entry and field update.
- **Never** write to the skills directory or to `ux-wisdom`.

Show the proposed entry or diff to the user. It becomes `status: approved` only when they approve it. If the host can't write files, output the entry for the user to paste.

## Promotion to generic wisdom

When a lesson shows up in a second product, propose promoting it to `ux-wisdom/references/wisdom.md` via a PR to the skills repo, rewritten without product specifics. This is always a manual step: auto-promotion turns product quirks into universal rules.
