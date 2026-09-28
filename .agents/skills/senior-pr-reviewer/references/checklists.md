# Review checklists

Deep look-for lists for each priority category in `SKILL.md`, each with a
worked example of what a finding looks like. `SKILL.md` holds the process; this
file holds the detail. Read it when a diff is large or a category needs depth.

Severity in the examples is illustrative — calibrate against the actual diff.

## Logic correctness

Look for:

- **Race conditions** — shared state mutated from concurrent paths;
  check-then-act gaps (exists-then-create, get-then-set) without a lock or
  transaction; async work in a loop that assumes ordering.
- **Error handling** — unawaited promises; `catch` blocks that swallow or only
  log while the caller proceeds as if successful; partial failures leaving
  state half-written with no rollback.
- **Async/concurrency** — `forEach` with async callbacks; missing `await`;
  `Promise.all` where one rejection should not cancel the rest (or where it
  should and doesn't); stale closures capturing old state; missing cleanup on
  abort/unmount.
- **Edge cases on realistic inputs** — empty and single-element collections,
  duplicates, null reaching a dereference, boundary values, timezone and locale
  assumptions, unbounded input size (O(n²) on user-controlled data).
- **Conditionals** — inverted or overlapping conditions, truthiness traps
  (`0`, `""`, empty array), assignment inside a condition, `==` coercion.
- **Lifecycle/dependencies** — stale dependency arrays, effects double-running
  under strict mode, cache invalidation missed after a write.

Example:

> **Location**: `services/orders.ts:41` `createOrder`
> **Problem**: `sendConfirmationEmail(userId, order)` is called without `await`
> and without a `catch` — a rejection escapes as an unhandled rejection.
> **Why it matters**: order creation succeeds but the process crashes
> intermittently in production.
> **Fix**: await it inside the same transaction boundary, or attach a `.catch`
> that logs and hands off to the existing retry queue.

## Security

Look for:

- **Injection** — string-built SQL, commands, or HTML; user input reaching a
  shell, query, or template without parameterization or escaping.
- **Authn/authz** — endpoints or mutations missing an ownership or role check;
  object access by raw ID with no scope check (IDOR).
- **Secrets** — credentials, tokens, or connection strings in code, logs, or
  error messages.
- **Data exposure** — PII or internal identifiers leaking into logs, client
  payloads, or error responses.
- **Unsafe input handling** — deserialization of untrusted data, unvalidated
  redirects, path traversal via user-supplied file names.

Example:

> **Location**: `routes/documents.ts:18` `GET /documents/:id`
> **Problem**: fetches by `id` with no check that the document belongs to the
> requesting user.
> **Why it matters**: any authenticated user can read any document by guessing
> IDs.
> **Fix**: scope the query to the caller (`where: { id, ownerId: req.user.id }`)
> and 404 on miss.

## Structural soundness

Look for:

- **Boundary violations** — a module reaching into another's internals; UI
  components importing the DB layer; business rules living in route handlers.
- **Coupling** — a change that forces edits in N other files; hidden temporal
  coupling (call order assumed, never enforced).
- **Cohesion** — a module that is a grab-bag (`utils`, `helpers`) accreting
  unrelated responsibilities.
- **Colocation** — a feature's logic, types, and tests scattered when they
  change together.
- **Scale test** — would adding the next similar feature double the number of
  touched files?

Example:

> **Location**: `components/InvoiceCard.tsx:30`
> **Problem**: computes tax from raw line items and calls the pricing API
> directly from a presentational component.
> **Why it matters**: pricing rules now have two homes; the next change will
> update one and not the other.
> **Fix**: move the computation into `services/pricing.ts` and pass the result
> as props.

## Code smells

Look for:

- **Complexity** — deep nesting (3+ levels), long conditionals, functions doing
  many things; extract steps or invert with guard clauses.
- **Magic values** — unexplained numbers and strings (`if (retries > 3)`,
  `status === "A"`); name them or read from config.
- **Misleading names** — `getData` that mutates, `isX` that returns a
  non-boolean, a flag that means three different things.
- **Side effects in unexpected places** — a getter that writes, a formatter
  that hits the network, an import that mutates module state.
- **Duplication** — copy-pasted blocks that should be one function;
  near-identical branches.
- **Dead code** — commented-out blocks, unreachable branches, exports nothing
  imports.

Example:

> **Location**: `lib/sync.ts:88` `syncUsers`
> **Problem**: 120-line function mixing fetch, dedupe, retry, and DB writes,
> with `3`, `50`, and `"stale"` inline.
> **Why it matters**: every behavior change requires re-reading all 120 lines,
> and the constants are untestable.
> **Fix**: split into fetch/dedupe/persist steps and name the constants
> (`MAX_RETRIES`, `BATCH_SIZE`, `STALE_THRESHOLD`).

## NIH / reinventing the wheel

Look for hand-rolled versions of solved problems: date/time and timezone
handling, form state, validation, data fetching and caching, state machines,
retry/backoff, debounce/throttle, ID generation, deep equality, queueing.

The test: is this custom code carrying real, product-specific logic — or
reimplementing what a maintained package already handles? Name the specific
package that should replace it. Custom code is the right call when the
candidate dependency is unmaintained, heavyweight for the need, or the
requirement is genuinely bespoke — say so when it is, so the author knows the
category was considered.

Example:

> **Location**: `hooks/useDebounce.ts:1`
> **Problem**: 30-line hand-rolled debounce with a subtle bug (leading and
> trailing edges both fire) duplicating a solved problem.
> **Why it matters**: this bug class is exactly what maintained libraries have
> already fixed; it will be found in production.
> **Fix**: use a maintained `debounce` (e.g. `es-toolkit` or `lodash`), or the
> platform's `useDeferredValue` if the use case is rendering.

## Stack-specific

Infer the stack first, then check its well-known pitfalls. Non-exhaustive
prompts:

- **React/Next** — server/client boundary violations, `"use client"` sprawl,
  effects doing data fetching the framework should own, stale `useEffect`
  deps, missing list keys, hydration mismatches.
- **Node/API** — unhandled rejections on fire-and-forget work, missing request
  validation at the boundary, blocking the event loop with sync work, missing
  rate limits on expensive routes.
- **ORM/DB** — N+1 queries in loops, multi-step writes without a transaction,
  queries inside loops, missing indexes for new query shapes.
- **Python** — mutable default arguments, bare `except`, sync IO in async
  paths.
- **Go** — unchecked errors, goroutine leaks, missing context propagation.
- **Infra/caching** — cache keys missing a dimension, stale cache after
  writes, secrets in build args.

Only flag what matters for this repo — a console script has no N+1 problem.

Example:

> **Location**: `api/orders/list.ts:22`
> **Problem**: loops over orders and awaits a `db.orderItems.findMany` per
> order.
> **Why it matters**: N+1 — page latency grows linearly with order count and
> will time out on real data volumes.
> **Fix**: one `findMany` with `where: { orderId: { in: ids } }`, grouped in
> memory.

## Type safety

Skip this category entirely for untyped codebases.

Look for:

- **`any` escapes** — `any` parameters and returns, `as any`, casts that
  silence the compiler instead of fixing the type.
- **Types that lie** — a type claiming non-null where null arrives, a
  `Promise<T>` that resolves `T | null`, optional fields marked required.
- **Missing discriminated unions** — a status or shape field compared by string
  across files, where a tagged union would make invalid states unrepresentable.
- **Non-null assertions** — `!` and `as` used to bypass checks the code should
  handle.
- **Weakened inference** — explicit `any[]` or widened types where the compiler
  could infer precisely.

Example:

> **Location**: `lib/payment.ts:15` `refund`
> **Problem**: `charge: any` — the compiler cannot catch a renamed field, so
> `charge.amout` compiles.
> **Why it matters**: the typo ships as a runtime `undefined` refund amount.
> **Fix**: type the parameter as `Charge` from the payment provider's types.

## Tests

Look for:

- **Missing coverage** — new behavior, especially branches (error paths, edge
  cases), with no test in a codebase that tests.
- **Happy-path-only tests** — a test asserting the success case of logic with
  known-tricky branches (empty input, failure, concurrency).
- **Tests that assert implementation** — mocking so deep the test passes while
  behavior breaks.
- **Weakened assertions** — `expect(result).toBeDefined()` where a value
  comparison is possible.

Example:

> **Location**: `services/checkout.test.ts`
> **Problem**: tests only the single-item happy path; the discount-stacking
> branch added in this diff is untested.
> **Why it matters**: the branch is exactly where the off-by-one lives.
> **Fix**: add cases for zero items, stacked discounts, and the cap boundary.
