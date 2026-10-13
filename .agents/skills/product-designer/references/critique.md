# Critique mode

Opinionated critique of a UI from screenshots or mocks. If a page brief exists in `./design/pages/`, use it as the confirmed brief: skip intake and brief playback, and go straight to Phase 3. Run intake only for what the brief leaves empty, and offer the Interview mode if more than a couple of brief fields are missing.

## Scale and measurement

Screenshot pixels are not CSS pixels (retina 2x, downscaled exports, zoom). Before any absolute size claim, calibrate from an anchor the design does not control: browser chrome, OS window controls, the iOS status bar (about 47-54pt), or the screenshot width against common viewports (1440, 1280, 390, 393). Failing that, ask the viewport width. Never calibrate from the design's own text: that makes small text undetectable. If the only anchor is text, judge type only relative to other type (caption vs body ratio), and prescribe in relative terms (type ratio, spacing-scale steps, multiples of body size), marking any absolute value "est.". For contrast, say "appears" with an estimate; never state exact ratios.

## Phase 1: First read and intake

**Open with a first read** in 2-3 lines: what you think this is, the need you suspect underneath it, and your gut reaction. Then ask only what you still need.

**Fast path.** If the user's message already gives the purpose, audience, and intended feel, skip straight to Phase 2 with a hypothesized brief. Infer anything else from the artifact, especially stage ("mock" or "preview" labels, wireframe styling, real vs placeholder data), and mark it as an assumption. If they say "just crit it", skip intake entirely and critique with assumptions marked in a one-line brief at the top.

**Otherwise interview**, at most 3 questions per round, at most 2 rounds. Multiple choice where possible, always with "Other / not sure". Prefer a choice tool (ask_user_input_v0, AskUserQuestion, or equivalent) when available. Never ask what the artifact already answers.

**Option count.** Choice tools usually cap options (often at 4) and add "Other" automatically. With a tool, show the best-fit options up to its cap, best first, recommendation marked. In plain text, offer up to 6. Never pad with weak options.

**When the user is unsure,** make the call: recommend one direction, explain in 1-2 lines why it serves the audience and need, and proceed with it as the working assumption. The brief playback is where they can overrule it.

Cover only what is missing, in roughly this order:
1. Need and primary action: the job underneath the page (as the job sentence) and the ONE action that serves it.
2. Audience: who, how expert, what device and context, what state of mind.
3. Stage: exploration, wireframe, high-fidelity, or live? This sets the polish budget (see Output).
4. Style: at high-fidelity or live, infer the style from the mock and confirm it in one line. Ask for direction (best-fit presets from `references/style-presets.md`, 3 adjectives, 1-3 admired products) only at exploration stage or when the user is unsure or wants a change.
5. Constraints: design system or component library, accessibility target (default WCAG 2.2 AA), platform (web, iOS, Android), brand rules, anything fixed.
6. Focus: what worries them, or what decision they are making.

## Phase 2: Brief playback

Restate the brief in 7 lines max: need (job sentence), primary action, audience, stage, style target, constraints, focus. Mark any assumption you made for them. Ask for confirmation or edits. Do not critique until confirmed (except the "just crit it" path).

## Phase 3: Critique

Evaluate lower layers first. A beautiful page that fails at its job is still failing. Use `references/critique-rubric.md` for the checks in each layer and `references/craft.md` for visual craft.

1. Need fit (including copy and content)
2. Usability
3. Accessibility
4. Visual craft
5. Style fidelity
6. Trend context (read `references/design-trends.md`; if its review date is older than 6 months, say so and offer to refresh it via web search)

**Severity:**
- Critical: defeats the need or blocks the primary action.
- High: measurably degrades the need, or fails the accessibility target.
- Medium: adds friction, inconsistency, or noise.
- Polish: craft refinement only.

Rules:
- Every finding: what you see, where, why it matters (tied to the need or a principle), severity, and a concrete move (values where scale allows, relative terms otherwise).
- If a choice looks deliberate but conflicts with the brief, do not call it wrong outright: critique it conditionally ("if this is meant to X, it costs Y") and add the question to Open questions.
- Challenge the brief if the need, primary action, and audience contradict each other.
- Recommend a trend only if it serves the need. Trendy is not a virtue.

## Output format (Phase 3)

Budget: at most 10 detailed findings. Omit any layer with nothing worth saying. Polish findings: none at exploration or wireframe; at most 2 at high-fidelity; allowed at live.

1. Verdict: 2-3 sentences on how well this serves the need, with your point of view.
2. The direction: the one idea that should organize the redesign (e.g. "status first, capture second, everything else quiet").
3. Top 3: the highest-leverage findings ranked by impact on the need. Reference findings by ID (e.g. "N1, U2, V3") with one line on why each ranks there; do not restate them.
4. Recomposition, only when the verdict or a Critical/High finding is structural (hierarchy, layout, information architecture): the proposed layout plus type scale (ratios and steps), spacing scale, and grid. When the host can render HTML, offer a grayscale HTML wireframe; otherwise use a short ASCII wireframe or ordered block list. If the structure is sound, skip this and say so in one line.
5. Findings, grouped by layer, each with an ID (N = need fit, U = usability, A = accessibility, V = visual craft, S = style, T = trend; numbered within layer), severity-tagged.
6. Protect: what is working and must survive the redesign.
7. Not judged: what screenshots cannot show.
8. Open questions for the designer.

Then offer one of: a redlined walkthrough of a section, the HTML wireframe, alternative directions, or a re-review after changes.

## Variants and re-review

- **Multiple screens of one flow:** ask which is the entry point; critique cross-screen consistency as its own Visual craft finding.
- **Variants** (several versions of the same screen) and **re-review** (a revised version of a screen already critiqued): follow `references/modes.md`.

