# Test: error message

Run the full skill process against the input below. This case checks jargon
removal, unblaming framing, and next-step anticipation.

## Input

Inline error on an admin page, shown after the user pastes a malformed link:

> That isn't a valid workspace UUID.

Context: the user followed or pasted a bad link; the recovery path is to check
the link or choose a workspace from the list on screen.

## Expected behavior

- No internal jargon: "UUID" and similar implementation terms do not appear;
  the copy uses the word the product's UI actually uses.
- No blame: the copy owns the failure ("We couldn't find...") rather than
  accusing the user ("That isn't valid").
- Gives the next step unprompted, matching the real recovery path.
- Matches the loaded app context's voice and copy rules.
- Passes the three-question test: clear, kind, necessary right now.
