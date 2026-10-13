---
name: ux-wisdom
description: Shared library of hard-won UX and product design lessons with user psychology (attention, cognitive load, decisions, interaction, notifications, AI trust, shared spaces, accessibility), each with a detection signal and evidence rating. Loaded by product-designer and copy-writer. Use directly when the user asks what research or best practice says about a UX question, e.g. "is the three-click rule real", "how many notifications is too many", "how should AI suggestions show their reasoning".
---

# UX Wisdom

A library, not a workflow. Other skills read `references/wisdom.md` and run its detection signals against their work.

## When loaded directly

Answer the user's question from the relevant entries, citing them by ID, and give the evidence rating. Say plainly when an entry is `contested` and what that means for relying on it. If the library doesn't cover the question, say so and answer from general knowledge, marked as such.

## Rules for every consumer

- Product-specific lessons in the product's `./design/wisdom.md` override entries here.
- Only `status: approved` entries can block a design or a merge. `proposed` entries are notes.
- An entry's exception is real. If you invoke one, name it.
- Never cite a `contested` entry as the sole justification for a recommendation.
- Never edit this file from a product session. New lessons go to the product's `wisdom.md` and are promoted here manually (see `product-designer/references/learning.md`).
