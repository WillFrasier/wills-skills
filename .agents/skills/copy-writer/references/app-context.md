# App Context (example, replace me)

> **This is the only app-specific file in this skill, and the version shipped here
> is a fictional example.** Everything else (`context-intake.md`, `craft.md`,
> `ux-patterns.md`, `accessibility-and-inclusion.md`) is project-agnostic. To use
> this skill on your product, **replace this file** with that product's context:
> what it is, who it's for, how it sounds, and its copy rules. Keep the section
> headings so the skill's instructions still resolve.

The example product is **Ledgerline**, a fictional invoicing and expense tracker
for freelance designers. Every detail below is invented; swap all of it for your
own product.

---

## 1. What the product is

Ledgerline turns hours and receipts into invoices, and invoices into a clear
picture of where the money comes from.

- **The arc** (drives the homepage and every surface): **track the work → bill
  it → get paid → know your numbers.** The payoff is less admin and fewer
  surprises, not "financial superpowers."
- **The assistant** drafts invoices and chases overdue payments as suggestions;
  every draft comes back to the user for an okay before anything is sent.
- **Status:** public beta. Copy must be honest about beta rough edges; no fake
  urgency, no implying features that aren't shipped.

## 2. Audience

**Who:** solo freelance designers and two-to-three-person studios who lose money
to admin. They chose the work to make things, not to chase invoices.

**Emotional state to write for:** behind on paperwork, mildly anxious about
money, allergic to software that talks like a bank. They are not looking for a
lecture on discipline; they are looking for relief.

## 3. Brand voice

**The register:** calm, precise, on their side. A sharp bookkeeper who explains
without condescending.

- **Casing.** Sentence case for all UI copy, buttons, headers, and dialogs.
- **Pronouns.** Default to **you**. Refer to the assistant as **I** sparingly.
- **Punctuation.** No exclamation marks. Periods on full sentences in body copy;
  drop the period on single-line labels and button text.
- **Numbers and money.** Currency as `$1,240`, not `$1240.00`, unless cents
  matter. Dates absolute in ledgers, relative in feeds ("due in 3 days").
- **Emoji.** None.
- **What the voice avoids.** Finance-speak ("leverage your capital"),
  productivity-speak ("supercharge"), exclamation marks, micro-celebrations.

**The voice in practice:**

> ✓ "Invoice #1042 was paid today. $3,200, net-30, on time."
> ✗ "Great news! Your invoice has been successfully processed!"

## 4. Product vocabulary (use these terms exactly)

- **Invoice**, a billable document sent to a client. Has a number, a status, a
  due date.
- **Expense**, money spent on a project, logged against it.
- **Client**, the company or person who receives invoices.
- **Project**, the container for tracked time and expenses.
- **The assistant**, the background service that drafts and suggests. One quiet
  voice.

Do **not** use internal or borrowed terms as feature names ("billing engine",
"revenue stack", "smart money flows").

## 5. Values (in our own words)

- **Admin should take minutes, not evenings.**
- **Clarity over cleverness.** A number the user understands beats an impressive
  one.
- **The user's money is their money.** We report; we don't judge.
- **Nothing sends without a human okay.**

## 6. Copy guardrails (the hard-won ones)

- **Never shame late payers or imply the user is bad with money.** "The invoice
  is past due" never becomes "You let this lapse."
- **No invented statistics.** Any money or productivity figure must link to a
  real source; otherwise stay qualitative.
- **No fear-based urgency.** No "clients are slipping away!"
- **The assistant never acts alone.** Copy about automation must say it hands
  work back for approval.

## 7. Where the existing copy lives (match it)

Read these before writing so new copy sits alongside the old without a seam.
(Replace with your repo's real paths.)

| What | Where |
|---|---|
| Marketing copy + FAQ | `apps/web/components/marketing/content.ts` |
| UI strings | `apps/web/lib/strings.ts` |
| Assistant voice prompt | `apps/web/lib/assistant-prompt.ts` |
| Style guide (canonical) | `docs/design/content-guidelines.md` |

## 8. Tone by surface

- **Marketing / homepage:** plain-spoken and confident; lead with the relief,
  not the feature list.
- **Onboarding:** welcoming and low-pressure, but not apologetic. Give a reason
  to fill things in rather than telling people it's optional.
- **In-product UI:** calm and structural. Report what happened; don't perform.
- **Errors / empty states:** plain, unblaming, and useful. Say what happened and
  what to do next.
- **Notifications:** neutral and specific ("Invoice #1042 is due tomorrow"),
  never nagging or comparative.
