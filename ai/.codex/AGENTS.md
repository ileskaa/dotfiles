## DRY

Treat duplication as a design smell.

- Do not copy business logic across modules.
- Prefer shared utilities, schemas, types, and constants over repeated definitions.
- Keep one source of truth for rules, transformations, and configuration.
- Before adding code, check whether the same idea already exists elsewhere.
- Accept small local duplication only when abstraction would make the code harder to understand or maintain.

## Workflow

Before editing: Read the full file(s) you'll edit and relevant tests/call sites.

Before reporting done: if available, run typecheck, lint, relevant tests.
Fix what you broke.

## Tests

- Add/update regression tests for behavior changes.
- Prefer the narrowest test that gives confidence.
- If the project uses a Git hook manager such as Husky or Lefthook, make sure the new/updated tests are triggered by either a pre-commit or pre-push hook (but not both)

## Final output

Summarize:

- behavior changed
- risks or follow-ups

### Response style

- Be concise by default.
- Give the answer first.
- Prefer 3-7 short bullets over long prose.
- Do not restate the prompt or explain obvious reasoning.
- Mention tradeoffs only when they materially affect implementation.
- Target under 150 words unless the task genuinely requires more.
- Use the minimum structure needed; avoid unnecessary sections/headings.
- Write like a teammate leaving a precise PR comment, not a consultant.
