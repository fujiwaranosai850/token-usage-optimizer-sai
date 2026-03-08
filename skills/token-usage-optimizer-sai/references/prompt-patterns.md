# Prompt Patterns (Low Token)

## Builder mode
"<project> scope only. Implement <goal>. Run test->fix->retest up to N cycles. Report final result and blockers only."

## Diagnostics mode
"Check <system>. Return only root cause, evidence, and one recommended fix."

## Review mode
"Review changes for <criteria>. Return only findings ranked high/medium/low."

## Memory-aware mode
"Use targeted recall only. No full history/file loads unless confidence is low."
