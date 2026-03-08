# Token Burn Checklist

## High-impact fixes

1. Stop repeated "check now" polling in chat; move checks into cron/background loops.
2. Keep project isolation strict.
3. Avoid loading full session history.
4. Retrieve memory in small snippets only.
5. Collapse multi-step implementation into one execution batch.

## Memory policy

- Postgres-first recall when SOT is postgres_primary.
- If unavailable: explicitly declare file-fallback mode.
- Max 3 recall snippets per turn.

## Reporting policy

- Return concise status and deltas.
- Avoid verbose narration of routine tool calls.
- Provide blocker + requested input only when needed.
