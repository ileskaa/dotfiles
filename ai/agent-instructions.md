# Agent Instructions

## Rules

- Minimal diff. Touch only what's needed.
- Follow existing patterns. Prefer local fixes over new abstractions.
- Keep refactors separate from behavior changes.
- Preserve existing APIs/contracts/types unless asked otherwise.
- No unrelated cleanup, formatting churn, or speculative improvements.

## DRY

Treat duplication as a design smell.

- Do not copy business logic across modules.
- Prefer shared utilities, schemas, types, and constants over repeated definitions.
- Keep one source of truth for rules, transformations, and configuration.
- Before adding code, check whether the same idea already exists elsewhere.
- Accept small local duplication only when abstraction would make the code harder to understand or maintain.

## Before Editing

- Read the full file(s) you'll edit and relevant tests/call sites.
- For non-trivial changes, state: files to change, assumptions, risks, what stays untouched.

## When Uncertain

- Inspect context before asking.
- Multiple valid approaches → give tradeoffs, recommend one.
- Still unclear after review → ask, don't guess.

## Verification

Before reporting done:

1. When available, run typecheck, lint, relevant tests. Fix what you broke.
2. Report unrelated failures or skipped steps clearly.

## Tests

- Add/update regression tests for behavior changes.
- Prefer the narrowest test that gives confidence.
- If the project uses a Git hook manager such as Husky or Lefthook, make sure the new/updated tests are run by either a pre-commit or pre-push hook (but not both)

## Final output

Summarize:

- behavior changed
- verification results
- eventual commands to verify
- risks or follow-ups
