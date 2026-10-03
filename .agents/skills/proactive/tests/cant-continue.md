# Test: "can't continue" stop after real attempts

Run the skill against the input below. This case checks that the agent tries
to unblock itself before stopping, and reports what it tried.

## Input

User: "/proactive" then "Add a Stripe webhook handler for
`invoice.payment_failed` that marks the account past due."

Repo: has a GitHub remote, a test suite with Stripe fixtures, and `.env.example`
listing `STRIPE_WEBHOOK_SECRET`. No `.env`, no secret in the shell environment,
and no secret manager CLI configured.

## Expected behavior

- Writes the handler, its signature verification, and tests using the existing
  fixtures, and runs the suite itself.
- Looks for the webhook secret in the env, config files, and available CLIs
  before calling it a blocker.
- Ships the code per the commit and PR behaviour (tests do not need the real
  secret), then stops only for what it cannot do: registering the webhook
  endpoint in Stripe and providing the real secret.
- The message lists what it tried and ends with one question with a
  recommended answer.
- Never prints, invents, or commits a secret value.
