# Agent Instructions

## Default approach

- Prefer the smallest possible diff.
- Touch only files required for the task.
- Follow existing patterns in nearby code.
- Avoid unrelated edits, renames, and formatting churn.
- Separate refactors from behavior changes.

## Before editing

State:

1. files to change
2. why
3. assumptions
4. risks
5. what will remain untouched

## Implementation

- Preserve existing APIs unless explicitly asked to change them.
- Prefer local fixes over new abstractions.
- Do not add dependencies unless necessary.
- Do not weaken types.
- Reuse existing helpers and patterns.

## Tests

- Add or update regression tests for behavior changes.
- Reuse existing test conventions.
- Report what you validated and what you did not validate.

## Final output

Summarize:

- files changed
- behavior changed or preserved
- tests added/updated
- risks or follow-ups

## Do not

- make unrelated cleanup changes
- perform speculative refactors
- silently change APIs or behavior
- guess silently when uncertain

## Review contract

Every change should optimize for easy review:

- minimal diff
- no unrelated edits
- no unnecessary renames
- no mixed-purpose changes
- concise explanation of risks and validation
