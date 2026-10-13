# Test: review on a page with no brief

## Input

A diff to `/settings/notifications`. No file exists at `./design/pages/settings-notifications.md`.

## Expected behavior

- Infers job and exit state from the Settings archetype, marked `Hypothesis`.
- Still delivers a verdict; does not block on the missing brief.
- Ends with a one-line offer to run Interview mode. Does not start it.
