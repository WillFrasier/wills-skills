# Craft toolkit

The senior designer's working knowledge. Use it to diagnose visual problems precisely and to prescribe moves with real values. These are defaults with reasons, not laws: break one when the need calls for it, and say why.

Pixel values below are CSS px. Only apply them to a screenshot after calibrating its scale (see SKILL.md); otherwise use the relative form (ratios, scale steps, multiples of body size).

## Typography
- **Scale by ratio, not by feel.** Derive sizes from a modular ratio:
  - 1.125-1.2 (major second / minor third): dense product UI, dashboards.
  - 1.25-1.333 (major third / perfect fourth): general apps, marketing sections.
  - 1.5-1.618: editorial display, landing heroes.
- **Two scales when display and UI coexist.** An app with editorial headlines needs a tight UI scale (1.125-1.2) for body, labels, and controls and a looser display scale (1.333+) for headlines, both anchored on the same body size. One loose ratio across everything makes UI sizes jump; one tight ratio makes headlines timid.
- **Few sizes, few weights.** 4-6 sizes and 2-3 weights per screen. Every extra size is another level of hierarchy the eye must decode.
- **Families:** one family is enough for most UIs; two (display + text) is the ceiling for calm. A third (e.g. monospace) needs a single, clear job such as numbers or code.
- **Body:** 16px on web (14-15px acceptable in dense pro tools), line-height 1.4-1.6. Display: line-height 1.05-1.25, tighten tracking slightly as size grows.
- **Measure:** 45-75 characters per line for reading text.
- **Small caps / uppercase labels:** add 4-10% tracking; never use them below about 11px or for anything longer than two words.
- **Hierarchy channels:** size, weight, color, and space. Use the fewest needed; two channels for one level reads as shouting.

## Space
- **One spacing scale** on a 4 or 8px base (4, 8, 12, 16, 24, 32, 48, 64, 96). Arbitrary gaps are a craft smell.
- **Internal < external.** Space inside a group must be smaller than space between groups, or grouping breaks (Gestalt proximity).
- **Space before boxes.** Group with whitespace first, alignment second, a divider third, a container last. Every border and card adds an edge the eye has to process.
- **Rhythm:** repeat the same vertical intervals between same-level sections. Consistent rhythm reads as calm; varied rhythm reads as busy even when sparse.
- **Density is a choice.** Dense is fine when rows are uniform and edges are few. Busy comes from variety (many treatments), not from quantity.

## Composition
- **One focal point per view.** Decide what the eye hits first, second, third; then verify size, contrast, isolation, and position agree.
- **Visual weight** comes from size, contrast, saturation, density, and isolation. An isolated small element can outweigh a large one in a crowd.
- **Reading paths:** F-pattern for scannable text and lists, Z-pattern for sparse marketing layouts. Put the primary element on the path's first stop.
- **Grid:** 12 columns on desktop (4 on mobile), consistent gutters. Name layouts as column spans (e.g. 8 + 4). Fewer distinct alignment edges = calmer page.
- **Proportion for splits:** main/rail around 62/38 (golden) or 2:1; avoid near-equal splits that make two areas compete.
- **Gestalt:** proximity, similarity, common region, continuity, closure. Use them to explain why something reads as grouped or not.
- **Figure-ground:** surfaces need a clear stacking order; one background tone, one surface tone, one raised tone at most.

## Color
- **60-30-10:** dominant neutral, secondary neutral or brand, accent at around 10% or less.
- **Accent means action or attention.** If it decorates, it stops signalling.
- **Semantic colors** (warning, error, success) are reserved for state. Never reuse them as brand color.
- **Neutral ramp:** define 8-10 steps; text uses the darkest 2-3, borders the middle, surfaces the lightest.

## Components and proportion
- **Button height** about 2.5-3x its font size; touch targets 44px.
- **Icons** match the cap height or line-height of adjacent text; optically center, do not just box-center.
- **Nested radii:** outer radius = inner radius + padding. One radius family per product.
- **Shadows:** one elevation system (2-3 levels). Mixing shadow styles signals mixed origins.

## Calm vs busy (diagnostic)
List the distinct treatments of each kind (container styles, label styles, type sizes, border styles, accent uses) and what each one means. A treatment earns its place only if it maps to a distinct role or state the user needs to tell apart. Two styles for the same kind of thing (for example two card styles for tasks) is a finding; three styles that each map to a different role is not. Unearned variety reads busy regardless of content volume, so cutting treatments usually buys more calm than cutting content.

## Mobile translation
- Stack by priority, not by desktop column order.
- Primary actions in the thumb zone (bottom third).
- Multi-column groups become tabs, segmented controls, or a single merged list; never 6 stacked sections with equal weight.
