# Agent Instructions

## Rules

- Minimal diff. Touch only what's needed.
- Follow existing patterns. Prefer local fixes over new abstractions.
- Keep refactors separate from behavior changes.
- Preserve existing APIs/contracts/types unless asked otherwise.
- No unrelated cleanup, formatting churn, or speculative improvements.

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

## Final output

Summarize:

- behavior changed or preserved
- verification results
- eventual commands to verify
- risks or follow-ups
