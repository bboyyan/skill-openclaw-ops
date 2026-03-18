#!/usr/bin/env bash
set -euo pipefail

WORKSPACE="${1:-}"
if [ -z "$WORKSPACE" ]; then
  echo "Usage: $0 <workspace-path>" >&2
  exit 1
fi

missing=0
for f in AGENTS.md SOUL.md USER.md; do
  if [ -f "$WORKSPACE/$f" ]; then
    echo "OK   $WORKSPACE/$f"
  else
    echo "MISS $WORKSPACE/$f"
    missing=1
  fi
done

exit $missing
