# App context (defaults, edit me)

> This is the only user-specific file in this skill. It ships with working
> defaults, so you can use it as is. Edit, delete, or add rules in either section
> to set how much autonomy the agent gets. Keep the two section headings so the
> skill's instructions still resolve. A user's explicit request in the
> conversation overrides a rule here (for example, "merge it when it's green").

## Stop conditions

Stop before acting, and ask, when any of these apply. Everything not listed
here is the agent's to do.

### Can't continue

- A human-only input is required after you've tried to get it yourself:
  credentials or API keys you can't find in the env, config, or secret store;
  2FA or SSO login; payment details; CAPTCHA; access to a system you have no
  tool for.
- The same blocker survives three genuinely different attempts to get past it,
  after reading the relevant docs and source.
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
  Read-only queries against production are fine.
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

## Commit and PR behaviour

- Never commit to the default branch (`main`, `master`, or whatever the repo
  uses). Work on a feature branch.
- If you are already on a non-default branch that holds the user's work for this
  task, stay on it. Otherwise branch off the up-to-date default branch, named by
  the repo's convention, or `<type>/<short-slug>` (type `feat`, `fix`, `chore`,
  or `docs`) if there is none.
- Leave uncommitted changes you didn't make, and that the task doesn't mention,
  untouched in the working tree. Keep them out of your commits and mention them
  in the report.
- Commit in small, logical commits using the repo's message style (check
  recent history); conventional commits if there is no clear style.
- Before pushing, run the repo's tests, lint, and typecheck when they exist
  and report the results.
- Push and open a PR when the task changed files and the repo has a remote.
  Use the repo's PR template if there is one. The description says what changed,
  why, how it was verified, and the decisions made. Open it ready for review;
  use a draft only if verification could not complete.
- With no remote, commit on the feature branch locally and say so.
- Leave merging to the user, and let hooks run (no `--no-verify`). Keep `.env`
  files out of commits.
- For non-code tasks (research, answering a question, analysis), commit only if
  the task produced files meant to live in the repo.
