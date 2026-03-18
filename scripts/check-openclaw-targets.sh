#!/usr/bin/env bash
set -euo pipefail

CONFIG="${1:-$HOME/.openclaw/openclaw.json}"

if ! command -v rg >/dev/null 2>&1; then
  echo "rg is required" >&2
  exit 1
fi

if [ ! -f "$CONFIG" ]; then
  echo "Config not found: $CONFIG" >&2
  exit 1
fi

echo "== Agent ids =="
rg -n "id:\s*'|id:\s*\"" "$CONFIG" || true

echo
 echo "== Telegram account ids =="
rg -n "accounts:\s*\{|'^\s*'[^']+':\s*\{|^\s*\"[^\"]+\":\s*\{" "$CONFIG" | head -200 || true

echo
 echo "== Workspaces =="
rg -n "workspace:\s*'|workspace:\s*\"" "$CONFIG" || true

echo
 echo "== Bindings =="
rg -n "agentId:|accountId:|channel:" "$CONFIG" || true
