# App Context (defaults, edit me)

> **This is the only user-specific file in this skill.** It ships with sensible
> defaults. Edit, delete, or append to either section to match how much autonomy
> you want to give the agent. Keep the two section headings so the skill's
> instructions still resolve.

---

## Stop conditions

Stop before acting, and ask, when any of these apply. Everything not listed
here is the agent's to do.

### Can't continue

- A human-only input is required after you've tried to get it yourself:
  credentials or API keys you can't find in the env, config, or secret store;
  2FA or SSO login; payment details; CAPTCHA; access to a system you have no
  tool for.
- The same blocker survives three genuinely different attempts to get past it.
- Something outside your reach is broken (service down, permission denied on a
  resource the user owns) and you have nothing left to work on in the task.

### Destructive or irreversible

- Deleting files, branches, data, or resources you did not create in this
  conversation.
- `rm -rf` outside build output, `git reset --hard`, `git clean -fd`,
  `git checkout -- .`, or anything else that discards uncommitted work.
- Dropping or truncating tables, destructive migrations, or bulk updates and
  deletes on any database that isn't a local or throwaway one.
- Force-pushing, or rewriting history that has been pushed or shared.
- Overwriting a file whose current contents you have not read.

### Risk of harm

- Deploying to production, or writing to production data, queues, or caches.
- Changing secrets, credentials, API keys, or existing permissions, IAM, or
  access control; exposing data that was previously protected.
- Committing or printing secret values, or sending them anywhere.
- Changing CI/CD pipelines, infrastructure, or shared environments beyond what
  the task needs.
- Disabling, skipping, or weakening tests, lint, type checks, or security checks
  to get a green result.
- Breaking a public API, schema, or contract that other code or teams consume.
- Major-version upgrades of dependencies, or adding a dependency with a paid or
  restrictive license.
- Running untrusted code or install scripts from an unknown source.

### Money and other people

- Spending money: purchases, paid plan upgrades, provisioning billable cloud
  resources, paid API calls beyond normal development use.
- Speaking for the user: sending email, chat messages, or social posts;
  commenting on issues or PRs other people own; inviting or removing people.
- Publishing: package releases, public posts, making a private resource public.
- Touching another person's branch, PR, or work in progress.

### Judgment

- The decision is genuinely controversial: product direction, conflicting
  requirements, or a trade-off the user would plausibly decide differently.
  An obvious, conventional choice, or one that is cheap to change later, is not
  a stop; make it and log it.

---

## Commit and PR behaviour

- **Never commit to the default branch** (`main`, `master`, or whatever the repo
  uses). Work on a feature branch.
- **Branch** off the up-to-date default branch, named by the repo's convention;
  if there is none, `<type>/<short-slug>` with type `feat`, `fix`, `chore`, or
  `docs`.
- **Bring along unrelated local changes?** No. If the working tree has changes
  that aren't part of the task, leave them out of your commits and mention them.
- **Commit** in small, logical commits using the repo's message style (check
  recent history); conventional commits if there is no clear style.
- **Before pushing**, run the repo's tests, lint, and typecheck when they exist
  and report the results.
- **Push and open a PR** when the task changed files and the repo has a remote.
  Use the repo's PR template if there is one. The description says what changed,
  why, how it was verified, and the decisions made. Open it ready for review;
  use a draft only if verification could not complete.
- **No remote?** Commit on the feature branch locally and say so.
- **Never** merge the PR, force-push, skip hooks (`--no-verify`), or commit
  secrets, `.env` files, or credentials.
- **Non-code tasks** (research, answering a question, analysis): no commits
  unless the task produced files meant to live in the repo.
