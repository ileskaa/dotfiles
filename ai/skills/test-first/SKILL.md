---
name: test-first
description: Write or update tests that define expected behavior before implementation. Do not implement the feature in production code.
---

# Test First Skill

## Objective

Define the requested behavior in tests before it is implemented.

Your job is to write, update, or propose tests that make the expected behavior explicit, while leaving production behavior unchanged. The goal is to create a precise, executable specification that exposes ambiguity early and gives a clean handoff for implementation.

## Core Rule

Work only on tests and directly related test artifacts.

Do **not** implement the feature in production code.

## Rule Precedence

When guidance conflicts, follow this order:

1. **Do not implement or change production behavior**
2. **Prefer tests of observable behavior over internals**
3. **Follow existing project conventions where they do not conflict with 1 or 2**
4. **Choose the smallest useful set of tests that clearly specifies the behavior**

## Allowed Changes

You may modify:

- test files
- test fixtures
- mocks, stubs, fakes, and test helpers
- test setup files
- test-specific configuration
- snapshot files, when the snapshot change is intentional and explained

You may add:

- pending or TODO tests for under-specified behavior
- minimal test builders or factories that improve clarity
- brief comments inside tests to document assumptions

## Limited Exceptions

Production code should remain untouched.

A minimal non-functional production change is allowed only when it is strictly required to write or run the tests, such as:

- exporting an already-existing symbol for test access
- fixing a broken test fixture or import path
- adding a missing test script or test configuration entry

If you make such a change:

- keep it as small as possible
- do not alter runtime behavior
- explain exactly why it was necessary

## Disallowed Changes

Do not:

- add feature logic to production code
- make tests pass by implementing the behavior
- weaken assertions just to get green tests
- hide missing behavior behind overly permissive mocks
- rewrite tests to match broken behavior unless the task is explicitly characterization testing
- overfit tests to private implementation details when observable behavior can be tested instead
- do unrelated test cleanup, refactoring, or coverage expansion

## Preferred Testing Strategy

Default to testing externally visible behavior.

Prefer this order:

1. high-signal integration or behavior tests
2. focused unit tests for isolated rules or branches
3. implementation-detail tests only when no better option exists

Write the lightest useful set of tests that clearly defines the contract.

## How to Approach the Task

When given a feature request or bug report:

1. Identify the contract
   - What should happen?
   - What should not happen?
   - What outputs, side effects, errors, or state changes matter?

2. Inspect nearby tests
   - Reuse existing patterns, helpers, naming, and structure
   - Extend current suites when appropriate

3. Write or update tests
   - Cover the primary scenario
   - Add edge cases only when they materially clarify the contract
   - Add regression coverage for bug fixes

4. Verify the tests when possible
   - Run the relevant tests if execution is available
   - Confirm failures are caused by missing behavior, not broken setup
   - If you cannot run tests, say so clearly

5. Stop after the behavior is specified
   - Do not continue into implementation work

## Test Design Guidelines

### Prefer behavior over internals

Good tests describe:

- what the user or caller observes
- what contract is guaranteed
- what outcome matters

Avoid coupling tests to:

- private helpers
- internal variable names
- incidental call order, unless call order is itself part of the contract

### Be explicit

Test names should clearly describe the expected behavior.

Prefer:

- `returns an error when the payload is missing an id`
- `does not send a notification for archived items`

Avoid:

- `works correctly`
- `handles edge case`
- `case 2`

### One reason to fail

Each test should have a single clear purpose.

### Keep fixtures minimal

Only include the data necessary to understand the behavior being specified.

### Use table-driven tests when they clarify a shared rule

Prefer parametrization when it makes the rule easier to read, not merely shorter.

### Add edge cases selectively

Include edge cases when they define the contract. Do not enumerate every permutation.

## Task Modes

### Bug Fix Mode

For bug fixes:

- first write a regression test that reproduces the bug
- confirm the test fails for the right reason when possible
- do not fix the bug in production code
- optionally note the likely implementation area at a high level

### New Feature Mode

For new features:

- write tests from the public interface or observable behavior
- cover the key acceptance path
- include validation or error handling only when it is part of the requirement
- use pending tests when requirements are incomplete

### Characterization Mode

When behavior is unclear but existing behavior must be preserved:

- write characterization tests for current observable behavior
- label them clearly as characterization tests
- do not imply that current behavior is necessarily correct

## Handling Ambiguity

Do not invent certainty.

When requirements are ambiguous:

- make the safest reasonable assumption
- document that assumption in your response and, if helpful, in the test name or comments
- prefer pending or TODO tests when multiple interpretations are plausible
- call out the exact product or engineering decision that remains open

## Failure Expectations

It is acceptable, and often desirable, for new tests to fail at first.

If tests fail:

- ensure they fail because the behavior is missing or incorrect
- explain the failure briefly and concretely

If tests pass already:

- say so clearly
- explain what existing behavior already satisfies the requirement

If you cannot produce a meaningful test yet:

- explain why
- leave a targeted pending or TODO test when appropriate

## What Success Looks Like

A successful result usually includes:

- new or updated tests that clearly specify the requested behavior
- failures that are meaningful, or a clear statement that the behavior already passes
- no production-code implementation of the feature
- a concise explanation of what is now specified and what remains unclear

## Final Response Format

Your final response should include:

- what tests were added or changed
- whether they pass, fail, or are pending
- the key behavior now specified
- any assumptions, ambiguities, or blockers
- whether any minimal non-functional production change was required

## Quality Checklist

Before finishing, confirm that:

- production behavior was not changed
- the tests specify observable behavior where possible
- the tests match local project conventions
- any failures are meaningful
- mocks do not trivialize the behavior under test
- the scope stayed focused on specification, not implementation

## Reporting Examples

- Added regression tests for invalid-token and expired-token flows. They currently fail because expired tokens are still accepted.
- Added behavior tests for sorting and empty-state rendering. Production code was not changed.
- Added a pending test for retry behavior because the requirement does not specify retry count or backoff policy.
- Existing behavior already satisfies this requirement, so the new tests pass without production changes.

## Decision Heuristic

Choose the lightest test that gives confidence and will survive refactoring.

Ask:

- Does this specify externally visible behavior?
- Will this still be valid after refactoring?
- Will it help someone implement the feature correctly?
- Am I drifting into implementation work?

If you are drifting, stop. Return to the contract.
