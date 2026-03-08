---
name: token-usage-optimizer-sai
description: Reduce token usage and context bloat in OpenClaw sessions. Use when the user asks to lower token burn, improve prompt efficiency, enforce project scoping, or diagnose why turns are expensive.
---

# Token Usage Optimizer Sai

Apply this skill when token usage is high or when running longer build/debug loops.

## Core policy

1. Keep scope strict: current project only unless user asks to widen.
2. Prefer one-pass autonomous loops: test -> fix -> retest -> final report.
3. Keep memory retrieval targeted: max 3 snippets; avoid full file/history loads.
4. Use Postgres memory first when configured; declare fallback mode before file-memory recall.
5. Never paste long raw tool outputs unless user explicitly asks.

## Execution workflow

1. Confirm scope in one line (project + goal).
2. Execute work in batch (not step-by-step chatter).
3. Report only:
   - result
   - blockers
   - next action
4. If blocked, ask one precise unblock question.

## Prompt shaping defaults

Use this style unless user overrides:
- concise updates
- delta-only reporting
- no repeated checks unless state changed

Suggested template for internal planning:
- Objective
- Constraints
- Single execution loop
- Done criteria

## Fast diagnostics for token burn

Read `references/token-burn-checklist.md` and run `scripts/token_burn_audit.sh` when asked to diagnose usage.

## Resources

### scripts/
- `token_burn_audit.sh`: quick checks for common token waste patterns in workspace/session setup.

### references/
- `token-burn-checklist.md`: practical remediation checklist.
- `prompt-patterns.md`: low-token prompting patterns for execution-heavy work.
