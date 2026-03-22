# Migration Plan Example

## Goal

Migrate payment state ownership so that only the billing module can write payment status, without a big-bang rewrite.

## Assumptions

- Payment-related data is currently written from multiple modules.
- Billing is the correct long-term owner of payment state.
- The team wants behavior preserved during the migration.

## Recommended approach

Use a phased ownership migration: identify all current write paths, introduce a billing-owned write interface, route existing writers through that interface, verify behavior with dual-path observability, then remove direct writes.

## Phased plan

### Phase 1: Inventory current write paths

Objective: Understand who writes payment state today.

Tasks:

- Identify all modules, jobs, handlers, and endpoints that write payment-related fields.
- List the exact tables, documents, or entities affected.
- Classify each write path by business reason and frequency.
- Mark which write paths are canonical versus incidental.

Validation:

- A complete map exists of payment-state writers and affected fields.
- The team agrees on the target billing-owned boundary.

### Phase 2: Define the new billing-owned interface

Objective: Create one explicit path for payment-state changes.

Tasks:

- Define a billing application service or module interface for payment state transitions.
- Encode core payment invariants in the billing module.
- Document the allowed transition types and inputs.
- Add tests for transition rules.

Validation:

- New payment transitions can be executed through the billing-owned path.
- Core invariants are tested in one place.

### Phase 3: Route existing callers through the new interface

Objective: Preserve behavior while centralizing ownership.

Tasks:

- Update current write paths to call the billing-owned interface instead of writing directly.
- Keep external behavior unchanged.
- Add logging or instrumentation to compare old and new paths where helpful.
- Migrate lower-risk callers first.

Validation:

- Existing flows still work.
- Payment writes are increasingly routed through billing.
- No direct-write regressions are observed in migrated paths.

### Phase 4: Verify and harden

Objective: Confirm the new ownership model is safe before removing legacy paths.

Tasks:

- Review edge cases such as retries, duplicate events, and failure recovery.
- Confirm transaction boundaries are still correct.
- Check that downstream readers still behave correctly.
- Monitor for unexpected transition patterns.

Validation:

- Core payment flows pass integration tests.
- Instrumentation shows migrated paths behaving as expected.
- No module outside billing needs direct write access for remaining valid cases.

### Phase 5: Remove direct writes

Objective: Enforce the new ownership boundary.

Tasks:

- Remove remaining direct-write paths.
- Add architecture tests or lint rules to block future bypasses.
- Tighten module boundaries around payment-state persistence.
- Update docs to reflect billing ownership.

Validation:

- Billing is the only write owner for payment state.
- Direct-write paths no longer exist.
- Guardrails prevent reintroduction.

## Risks

- Hidden write paths may be missed during migration.
- Some flows may rely on side effects of direct writes.
- Existing readers may assume timing or shape that changes once billing owns transitions.

## Unknowns

- Whether all payment updates are truly safe to centralize immediately.
- Whether some legacy jobs need temporary adaptation layers.
- Whether there are undocumented manual or support workflows that still write payment state.
