---
name: openclaw-ops
description: Manage and troubleshoot an OpenClaw installation safely. Use when working on OpenClaw config, agents, workspaces, agentDir, SOUL/AGENTS/USER loading, bindings, Telegram/Discord accounts, sessions, cron, gateway, plugins, docs lookup, or when diagnosing why an OpenClaw persona/routing/config change did not behave as expected.
---

# OpenClaw Ops

## Core rule
When the task is about **OpenClaw itself**, do this order:
1. Read bundled/local docs for the current OpenClaw workspace (for example `<workspace>/docs`)
2. If local docs are insufficient, consult `https://docs.openclaw.ai`
3. Inspect current config/state
4. Change the smallest thing possible
5. Validate with a real test

Never rely on memory alone for OpenClaw behavior.

## Use this skill for
- `openclaw.json` / config patch / config apply
- agents / workspaces / `agentDir`
- `SOUL.md` / `AGENTS.md` / `USER.md` loading behavior
- bindings / Telegram accounts / routing
- sessions / cron / gateway / plugins
- "Why is this persona still acting like another persona?"
- "Why did config.patch succeed but old config is still there?"

## High-value rules

### 1. Workspace first
For persona behavior, verify `workspace` before blaming prompts.
If an agent still behaves like the main agent, check whether its workspace still points at the main workspace.

### 2. `config.patch` merges; `config.apply` cleans
- Use `config.patch` for additive or targeted updates
- Use `config.apply` when you need to remove stale config and fully converge state

### 3. Validate three layers
After any OpenClaw change, validate:
1. **Function** — Does it respond?
2. **Identity** — Is it the correct persona/role?
3. **Structure** — Does config actually match intended state?

### 4. Docs before edits
For framework behavior, do not infer from Claude Code/Codex/Cursor habits.
OpenClaw has its own rules for workspace loading, bindings, accounts, and restart behavior.

## Fast checklist
- Read docs first
- Inspect current config
- Confirm target agent/account/binding ids
- Decide `patch` vs `apply`
- Make change
- Restart if needed
- Test behavior in real chat/session
- Re-read config if the result is surprising

## Bundled resources

### References
- `references/troubleshooting.md` — common OpenClaw failure modes and debugging order
- `references/patch-vs-apply.md` — when to use patch vs apply

### Scripts
- `scripts/check-openclaw-targets.sh [config]` — quick scan of ids, workspaces, bindings, and account targets
- `scripts/validate-persona-workspace.sh <workspace>` — verify that a persona workspace contains `AGENTS.md`, `SOUL.md`, and `USER.md`

Use these before and after risky config edits.

## Local references
- Workspace docs: `<workspace>/docs`
- Optional local footguns guide: `<workspace>/docs/openclaw-no-footguns.md`
- Optional environment map skill: `<workspace>/skills/openclaw-map`

## Initial scope for this repo
This repo should evolve into a must-have skill for:
- safe OpenClaw administration
- agent persona debugging
- routing/bindings troubleshooting
- config hygiene and convergence
- repeatable OpenClaw maintenance workflows
