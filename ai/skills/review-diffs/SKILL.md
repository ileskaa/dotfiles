---
name: review-diffs
description: Evaluates pending code changes for correctness, clarity, and risk.
---

Review the diff for changes that do not meaningfully contribute to the intended behavior.
Assess the quality of the diff and report if some refactoring would be appropriate.

Flag:

- dead or unused code
- debug prints, logs, and temporary instrumentation
- commented-out code
- unrelated refactors
- formatting-only churn with no functional value
- duplicated logic introduced by the change
- stale edits that can be reverted

Suggest:

- refactors if appropriate

As a rule of thumb, prefer small diffs over large ones.
