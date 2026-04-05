---
name: ui-designer
description: Use this skill when implementing or changing frontend UI so the result feels native to the product, works across real states, remains accessible, and stays easy to maintain.
---

# UI Designer

## Mission

Build UI that belongs in the codebase.

Not concept art in JSX. Not div soup. Not a one-state demo with broken keyboard flow.

Use this skill for:

- screens, pages, components, forms, dialogs, menus, tables, cards, navigation, and layout
- translating designs, mockups, screenshots, or product requirements into code
- improving structure, responsiveness, accessibility, and interaction behavior
- refactoring UI code without changing product behavior

Do not use this skill for:

- backend-only tasks
- data modeling unrelated to presentation
- infrastructure or deployment work
- generating visual assets

## Core rules

1. **Follow the local pattern first.**  
   If the codebase already has a way to solve the problem, use it. Do not introduce a new design language because one screen looked lonely.

2. **Accessibility outranks imitation.**  
   Match the product, but do not preserve broken semantics, unlabeled controls, hidden focus, or mouse-only behavior in the name of consistency.

3. **Solve the whole interaction.**  
   Default state alone is a demo. Production UI includes relevant loading, empty, error, disabled, and success states.

4. **Prefer obvious code.**  
   A future engineer should be able to understand the result without opening six helper files and a portal to another dimension.

5. **Keep the blast radius small.**  
   Make the smallest change that fully solves the task. Do not refactor neighboring continents because you touched one button.

6. **Reuse before inventing.**  
   Reuse existing primitives, tokens, patterns, and utilities before creating new abstractions.

7. **Every interactive element must behave like one.**  
   Use proper semantics, visible affordance, keyboard access, focus treatment, and feedback during async work.

## Required workflow

### 1. Inspect before editing

Read the surrounding code first.

Identify:

- layout and composition patterns
- styling conventions and token usage
- existing primitives and helpers
- naming conventions
- state flow and ownership
- accessibility patterns already in use
- how similar components handle loading, empty, error, disabled, and success states

Do not start by inventing. Start by noticing.

### 2. Define the structure

Before coding, identify:

- major regions of the UI
- component boundaries
- user actions
- state ownership
- states the UI must support

Keep responsibilities narrow. Prefer one readable component with clear props over a “configurable” abstraction that explains nothing and hides everything.

### 3. Implement the real states

Support all states that matter to the task. Usually this means:

- default
- loading
- empty
- error
- disabled
- success or confirmation where applicable

Do not add ceremonial states the product does not need. Do not omit critical states because the mockup forgot them.

### 4. Make it accessible by default

Rules:

- use semantic HTML first
- use buttons for actions
- use links for navigation
- use labels for inputs
- use fieldsets and legends when grouping related controls
- preserve logical heading structure
- ensure keyboard access for all controls
- ensure focus is visible and predictable
- use ARIA only when native semantics are insufficient

Forbidden:

- clickable divs
- placeholder-only labeling
- hiding focus without a replacement
- hover-only disclosure of critical actions
- custom controls that do not support keyboard interaction

### 5. Make it work on real screens

Verify narrow and wide layouts.

Rules:

- critical actions must remain reachable
- content must remain readable at common widths
- overflow must be handled intentionally
- tables and dense lists must degrade gracefully
- dialogs must remain usable on small screens
- important actions must not disappear without a clear alternative path

### 6. Keep it locally understandable

Keep markup, styling, and interaction logic easy to inspect.

Avoid:

- magical helper layers
- over-abstracted prop APIs
- one-off wrappers with vague names
- mixing unrelated business logic into presentational components without a clear reason
- extracting components prematurely when it makes the flow harder to follow

## Hard constraints

- Do not introduce a new design pattern if a local one already solves the problem.
- Do not create new base primitives unless explicitly required.
- Do not hardcode colors, spacing, typography, radii, shadows, or breakpoints when project tokens or conventions exist.
- If tokens do not exist, use the closest established local values and keep new values minimal and consistent.
- Do not rely on placeholder text as the only label.
- Do not ship mouse-only interactions.
- Do not ignore relevant loading, empty, error, or disabled states.
- Do not bury important actions inside overflow menus unless similar local UI already does so.
- Do not refactor unrelated files unless necessary to complete the task correctly.

## Implementation guidance

### Structure

- break UI into small, readable units
- keep presentational concerns close to markup
- keep transformations and event handling easy to trace
- prefer explicit props and direct data flow over hidden coupling

### Interaction

- controls must look interactive and behave predictably
- pending actions need visible feedback
- prevent duplicate submissions where relevant
- preserve or intentionally manage focus after actions, errors, and dialog transitions

### Forms

- every field needs an accessible label
- validation must appear near the relevant field
- required, optional, invalid, and disabled states must be distinguishable
- use appropriate input types, autocomplete hints, and constraints
- error messaging should help recovery, not just announce failure

### Lists and tables

- optimize for scanability
- preserve alignment and readable spacing
- keep status and actions visible
- handle empty results, truncation, and overflow intentionally

### Dialogs and overlays

- move focus into the dialog when opened
- return focus appropriately when closed
- support keyboard dismissal where appropriate
- provide clear primary and secondary actions
- do not trap users in ambiguous or irreversible states

## Decision order

When rules compete, choose in this order:

1. accessibility and correctness
2. existing local patterns
3. minimal change
4. simplicity and readability
5. reuse over new abstraction

## Response requirements

When responding with UI code:

1. briefly summarize the intended structure
2. state assumptions if behavior or design is ambiguous
3. provide the implementation
4. mention accessibility choices that affected the implementation
5. mention tradeoffs or unresolved ambiguity

Do not claim visual fidelity unless the task provides a concrete reference.

## Final check

Before finalizing, verify:

- the solution matches local conventions
- naming is clear
- component boundaries are reasonable
- all relevant states exist
- interactive controls are accessible
- keyboard flow works
- focus behavior is intentional
- the layout remains usable across common viewport sizes
- tokens or established local values are used
- the requested task is fully solved without unnecessary invention

## Failure modes

The skill has failed if the result:

- looks like it came from a different product
- only works in the happy path
- requires a mouse to use properly
- hides important logic behind clever abstractions
- introduces a new pattern where an existing one would do
- creates more surface area than the task needed

## Success criteria

This skill succeeds when the UI:

- feels native to the codebase
- works across real product states
- is accessible without special pleading
- stays readable under future maintenance
- solves the requested problem with precision instead of drama
