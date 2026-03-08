#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-/home/node/.openclaw/workspace}"

echo "TOKEN_BURN_AUDIT"
echo "root=$ROOT"

echo "[1] Large memory files (>200KB):"
find "$ROOT" -maxdepth 3 -type f \( -name 'MEMORY.md' -o -path '*/memory/*.md' \) -size +200k -print || true

echo "[2] Potential broad-load docs count:"
find "$ROOT" -maxdepth 3 -type f -name '*.md' | wc -l

echo "[3] Project isolation markers in AGENTS.md:"
grep -n "Project isolation\|Low-token\|Token Efficiency" "$ROOT/AGENTS.md" || true

echo "[4] Active cron count:"
# informational only, no dependency on cron CLI
if command -v openclaw >/dev/null 2>&1; then
  echo "openclaw installed"
else
  echo "openclaw CLI not found"
fi

echo "[5] Suggested actions:"
echo "- keep project scope strict"
echo "- use one-pass execution loops"
echo "- avoid full-history loads"
echo "- retrieve <=3 memory snippets per turn"
