---
name: planner
description: Create concrete implementation plans for features, refactors, migrations, and rollouts. Use when the user asks how to build something, what order to do work in, how to break work into tasks, how to migrate safely, or how to roll out changes incrementally.
---

# Planner

Use this skill to turn a requested change into an actionable implementation plan.

## What to do

1. Clarify the actual implementation goal.
2. Identify assumptions, dependencies, and unknowns.
3. Break the work into phases in a sensible order.
4. Prefer incremental, low-blast-radius approaches.
5. Call out technical and rollout risks.
6. Include validation steps for each phase.
7. Include rollback or fallback guidance when relevant.

## Output expectations

Prefer this structure:

- Goal
- Assumptions
- Recommended approach
- Phased plan
- Risks
- Unknowns
- Validation

## Rules

- Prefer phased plans over flat task lists.
- Be concrete and execution-oriented.
- Distinguish known facts from assumptions.
- Avoid recommending large rewrites unless clearly justified.
- Bias toward reversible and incremental steps.
