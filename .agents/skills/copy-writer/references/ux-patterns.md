# UX Microcopy Patterns

Product copy is not marketing copy. It is read in a moment of action, often under
mild stress, and it has to be *usable* before it is *nice*. These are the recurring
patterns and the formulas that work. Adapt the wording to the brand voice, the
structure is what carries.

## The governing rules for all UI copy

- **Say what happened, then what to do.** State first, action second.
- **Second person, active voice, present tense.** "We couldn't save your changes,"
  not "Changes could not be saved."
- **Don't blame the user.** Even when they caused it. "That email doesn't look
  right," not "You entered an invalid email."
- **Be specific.** Name the thing, the field, the limit, the next step. Vague copy
  creates support tickets.
- **Cut every word that isn't doing work.** UI copy is read at a glance.
- **Match the emotional temperature of the moment.** A destructive action needs
  gravity; a success needs none of the confetti.
- **Be transparent before the commitment.** State cost, timing, and consequences
  before the user commits, never at the last step.

## Anticipating the unasked

The best microcopy answers a question the user hasn't asked yet, at the moment they'd
think it. Place it just in time.

- **Progress in advance.** "Step 1 of 3." "About 2 minutes." "No credit card
  required." Answer cost, time, and commitment before the user has to wonder.
- **Preemptive reassurance.** Dissolve the unspoken worry next to the action that
  causes it: "You can change this later" beside a photo upload; "We won't post
  anything" beside a share button.
- **Answer the unasked.** "We'll only use this to contact you. No list, no sharing."
  "Your data stays yours, we never sell it."
- **Name the next step.** "We'll email you when there's room." People tolerate
  waiting they can predict; they resent waiting they can't.

## Buttons and CTAs

- **Verb + object.** "Save changes," "Send invite," "Delete card." Not "Submit,"
  "OK," "Continue" when something more specific is true.
- **The label is a promise.** It must describe exactly what happens on click. If the
  button says "Publish," it publishes, it doesn't save a draft.
- **First person for the user's action, second person for the system's.** "Start my
  trial" (user), "We'll email you" (system).
- **No "Click here," no "Learn more" as a primary CTA** unless the destination is
  genuinely generic.
- **Destructive buttons name the destruction.** "Delete household," not "Confirm."

## Form labels, placeholders, and helper text

- **Label:** the noun, sentence case, no colon, no period. "Email address."
- **Placeholder:** an example, never a substitute for the label. `you@example.com`,
  not "Enter your email."
- **Helper text:** the constraint or the reason, only when it isn't obvious. "We'll
  only use this to contact you about your account."
- **Error text:** what's wrong and how to fix it, next to the field, in the field's
  voice. "That password needs at least 8 characters."
- **Never rely on placeholder alone**, it disappears on focus and fails
  accessibility.
- **Ask for the minimum, and ask late.** Don't demand everything up front. Show value
  first, then ask for what you need. A form that asks for five fields before showing
  any result loses people.
- **Use progressive disclosure.** Show the essentials; tuck the rest behind a link, a
  disclosure, or a later step. Less on screen is almost always more.

## Empty states

An empty state is a first impression and a teaching moment. Three parts:

1. **What this is** (one line).
2. **Why it's empty** (if not obvious).
3. **The one action to take** (a single, clear CTA).

> "No cards yet. Cards are how you and your partner split the work of your home.
> Add your first one."

Avoid: "Nothing to see here!", "Oops, it's empty!", or a bare "No data."

## Loading and progress

- **Say what's happening, in the user's terms.** "Finding the form in your inbox…"
  beats a bare spinner.
- **For anything over a few seconds, set expectations.** "This can take a minute."
- **Never leave a dead end.** If it can fail, say what happens if it does.

## Success and confirmation

- **Confirm the specific thing.** "Invite sent to jess@example.com," not "Success!"
- **Don't over-celebrate.** Match the brand. A quiet "Saved" often beats a banner.
- **Give the next step if there is one.** "Saved. We'll email you when there's
  room."

## Errors (system and validation)

- **Plain language, no codes, no blame.** "We couldn't reach the server. Try again
  in a moment."
- **Say whether it's recoverable and how.** "Your changes weren't saved. Retry, or
  copy your text somewhere safe first."
- **Never expose stack traces, error codes, or internal names** to end users.
- **One error, one message.** Don't stack.

## Destructive actions and confirmations

- **Name the consequence and the object.** "Delete 'School forms'? This removes it
  for both of you and can't be undone."
- **Make the safe option the default** and the destructive one explicit.
- **Prefer undo over a confirmation dialog** when the action is reversible, it's
  less friction and more forgiving.
- **Don't use "Are you sure?"** It asks nothing. Say what will happen.

## Notifications and nudges

- **Neutral and factual.** State the event, not a judgment. "Pickup at 3pm
  tomorrow," not "Don't forget pickup again!"
- **Respect attention.** Every notification is an interruption; earn it.
- **No guilt, no streaks, no shaming.** Especially for habit or household products.
- **One action per notification** where possible.

## Tooltips and inline help

- **Answer the question the user is actually asking**, not the one you wish they
  were. Keep it to a sentence or two.
- **Don't repeat the label.** A tooltip that restates the field is noise.

## Onboarding and first-run

- **Lead with the user's situation, not the product's features.**
- **Give a reason to complete each step**, not a disclaimer that it's optional.
- **Show progress and make it resumable.** People get interrupted.
- **Say what it costs and how long it takes** before the user starts.
- **Keep the first win close.** Get the user to a moment of value fast.

## Consistency pass (do this across a flow, not just one string)

When you touch copy in a multi-step flow, read the whole flow and check:

- **Terminology**, the same concept uses the same word everywhere.
- **Voice**, the register doesn't lurch between steps.
- **Casing and punctuation**, labels, buttons, and headings follow one rule.
- **Pronouns**, "you" vs "we" vs the assistant's "I" are used consistently.
- **CTA verbs**, the same action uses the same verb across screens.
- **Reading order**, each step's copy doesn't repeat the previous step's.
