# Planning Rubric

Use this rubric when creating or reviewing an implementation plan.

## 1. Goal clarity

A good plan states the actual goal in concrete terms.

Look for:

- what is changing
- what must remain true
- what success looks like

Weak signs:

- vague goals like "improve architecture"
- no clear success condition
- scope mixed with unrelated cleanup

## 2. Assumptions

A good plan separates facts from assumptions.

Look for:

- explicit assumptions
- acknowledgment of uncertainty
- notes on what should be verified first

Weak signs:

- unstated assumptions
- pretending uncertain details are settled
- hard commitments built on guesswork

## 3. Sequencing

A good plan puts work in a sensible order.

Look for:

- prerequisites before dependent steps
- foundation work before rollout
- cleanup after validation

Weak signs:

- flat task list with no order
- risky changes too early
- rollout before validation

## 4. Incremental delivery

A good plan prefers small, reversible steps.

Look for:

- phased rollout
- low-blast-radius first step
- one representative slice before broad adoption
- feature flags or temporary fallback paths when needed

Weak signs:

- big-bang rewrite
- all-or-nothing migration
- no safe checkpoint

## 5. Risk awareness

A good plan names likely failure modes.

Look for:

- technical risks
- rollout risks
- dependency risks
- coordination risks

Weak signs:

- no risks called out
- "should be straightforward" with no caveats
- no mitigation ideas

## 6. Unknowns

A good plan identifies what still needs discovery.

Look for:

- unresolved questions
- why each unknown matters
- how to answer it

Weak signs:

- hidden uncertainty
- no distinction between known and unknown
- plan depends on unresolved details without saying so

## 7. Validation

A good plan explains how each phase will be checked.

Look for:

- tests
- instrumentation
- manual verification steps
- rollout metrics
- acceptance criteria

Weak signs:

- "implement" with no validation
- testing treated as one vague final step
- no production verification for risky changes

## 8. Scope discipline

A good plan keeps focus.

Look for:

- must-do work separated from nice-to-have work
- explicit out-of-scope items when useful
- minimal design needed to achieve the goal

Weak signs:

- opportunistic cleanup creep
- unrelated architectural ambitions
- plan gets larger every phase

## 9. Actionability

A good plan should be executable by a real engineer.

Look for:

- concrete tasks
- clear phase objectives
- understandable language
- enough detail to begin work

Weak signs:

- abstract advice only
- tasks too vague to start
- tasks so tiny they become noise

## Heuristic for a strong plan

A strong plan usually answers:

- What are we doing?
- Why this order?
- What could go wrong?
- How will we know it worked?
