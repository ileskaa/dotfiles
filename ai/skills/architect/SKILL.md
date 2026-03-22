---
name: architect
description: Evaluate the architectural quality of a software project when the user asks for architecture review, modularity assessment, coupling analysis, boundary evaluation, architectural drift, or concrete refactoring priorities. Do not use for style-only review, bug fixing, or performance profiling unless those are explicitly part of an architecture assessment.
---

# Architect

Use this skill to assess the architectural quality of a software project.

## What to do

1. Inspect the repository structure, key modules, dependencies, build/test setup, and architecture-related docs.
2. If a project context file is available, use it to calibrate the assessment.
3. Identify:
   - architectural style in practice
   - strong boundaries and weak boundaries
   - coupling and cohesion issues
   - ownership and data-flow risks
   - architectural drift between docs and code
4. Produce:
   - a short architecture summary
   - the top risks
   - the strongest positive signals
   - concrete next refactors in priority order
5. Keep the assessment evidence-based. Do not make claims without pointing to code structure, dependency relationships, tests, config, or docs.

## Project context

If present, read `schemas/project-context.schema.json` to understand the expected shape of the project context input.
Look for a matching context file such as:

- `project-context.json`
- `.agents/project-context.json`
- `docs/project-context.json`

If no context file exists, continue with a best-effort assessment and state that context was inferred.

## Output expectations

Prefer this structure:

- Current architecture
- What is working well
- Main risks
- Recommended next steps
- Evidence
