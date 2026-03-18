---
name: review-diffs
description: Checks whether a diff contains unnecessary changes that should be removed before commit.
---

Review the diff for changes that do not meaningfully contribute to the intended behavior.

Flag:

- dead or unused code
- debug prints, logs, and temporary instrumentation
- commented-out code
- unrelated refactors
- formatting-only churn with no functional value
- duplicated logic introduced by the change
- stale edits that can be reverted

Prefer the smallest diff that fully solves the problem.
