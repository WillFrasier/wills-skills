# Accessibility, Inclusion, and Localization

Good copy is readable by everyone and survives translation. These are not optional
polish, they are part of whether the copy works.

## Plain language

- **Write to a general reading level.** Aim for roughly 8th-grade readability for
  UI and help copy. Short sentences, common words.
- **One idea per sentence.** If a sentence has two "and"s, split it.
- **Prefer the concrete to the abstract.** "We'll email you a link" beats "You will
  be provided with access credentials."
- **Expand jargon and acronyms on first use**, or avoid them. Don't assume the
  reader knows your internal vocabulary.
- **Front-load the important word.** People scan the first few words of a line.

## Inclusive language

- **Don't assume gender, family shape, or ability.** Not every household has a mom
  and a dad, a married couple, or two parents. Prefer "partner," "household
  member," "caregiver," "parent or guardian."
- **Avoid ableist idioms.** "Crazy," "lame," "blind spot," "tone-deaf," "falls on
  deaf ears." Choose plain alternatives.
- **Avoid violent metaphors for ordinary actions.** "Kill the process," "hit the
  button," "nuke the cache."
- **Person-first, and ask before labeling.** "A person with a disability," not "a
  disabled person," unless the community's own preference says otherwise.
- **Don't imply blame or moral failure** for ordinary human states, being tired,
  forgetting, missing a day. Especially in products about household labor.
- **Watch the default.** "He" as a generic pronoun, "guys" for a mixed group, and
  "normal" as a synonym for "typical" all exclude readers.

## Screen readers and non-visual access

- **Link text must stand alone.** "View the invoice," not "click here" or "read
  more." Screen-reader users often navigate link-to-link.
- **Alt text describes meaning, not appearance.** "A wall calendar covered in
 color
-coded
 family
 events
,
"
 not
 
"image1
.png
."
- **Don't put meaning only in an icon or color.** Pair it with text.
- **Label controls with words, not symbols.** A button that shows "→" still needs
  an accessible name like "Next."
- **Write error and status messages so they make sense read aloud**, out of visual
  context.

## Localization and i18n

- **Assume every string will be translated.** Avoid idioms, puns, and
  culture-specific references, they rarely survive.
- **Don't build sentences from concatenated fragments.** Word order differs across
  languages; use full strings with placeholders.
- **Leave room for expansion.** Translated text often runs 30–40% longer than
  English. Flag tight layouts.
- **Keep placeholders named and ordered** (`{name}`, `{count}`), and never assume
  plural rules, some languages have more than two plural forms.
- **Avoid text baked into images.** It can't be translated or read by assistive
  tech.
- **Dates, numbers, and currency are locale-specific.** Don't hardcode formats.

## Numbers, dates, and units

- **Spell out small numbers in prose** where it reads better; use numerals for
  data, measurements, and anything the user compares.
- **Be unambiguous with dates.** "March 3" beats "3/3" (which means different days
  in different locales).
- **Give units.** "2 GB," "10 minutes," "$1,240."
- **Relative time for decisions, absolute for records.** "Due in 3 days" when
  deciding; a timestamp in an audit log.

## The accessibility check

Before delivering, ask:

- Could a tired reader understand this on one pass?
- Does it assume a family shape, gender, or ability it shouldn't?
- Would it still make sense translated, or read aloud by a screen reader?
- Does any link, button, or icon make sense without its visual context?
- Are numbers, dates, and units unambiguous?
