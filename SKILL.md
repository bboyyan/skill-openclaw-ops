---
name: openclaw-ops
description: Guardrails and operational playbooks for having OpenClaw safely manage OpenClaw itself. Use when working on OpenClaw config, config.patch vs config.apply, agents, workspaces, agentDir, SOUL/AGENTS/USER loading, bindings, Telegram/Discord accounts, routing, sessions, cron, gateway, plugins, docs lookup, config hygiene, persona debugging, or when diagnosing why an OpenClaw change behaved differently than expected.
---

# OpenClaw Ops

**Stop guessing. Start operating.**

This is an **OpenClaw operator skill**: a guardrail layer for safe self-administration.
It is for situations where OpenClaw is changing, diagnosing, or maintaining **OpenClaw itself**.
It should be treated as a **read-first skill** for OpenClaw self-changes, not as optional background reading.

## Operator rules
- Read this skill first when working on OpenClaw itself.
- Do not modify OpenClaw config from memory alone.
- Use bundled/local docs first, then official docs if needed.
- Inspect current state before changing anything.
- Prefer the smallest safe change.
- Prefer documented config fields over guessed launch arguments.
- Validate behavior after every change before declaring success.

## Mandatory flow
When the task is about **OpenClaw itself**, do this order:
1. Determine install mode (`global CLI install` / `source checkout` / wrapper-managed runtime)
2. Read bundled/local docs for the current OpenClaw workspace (for example `<workspace>/docs`)
3. If local docs are insufficient, consult `https://docs.openclaw.ai`
4. Inspect current config/state/logs/process
5. Change the smallest thing possible
6. Validate with a real test

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
OpenClaw has its own rules for workspace loading, bindings, accounts, restart behavior, and gateway exposure.

### 5. Source checkout vs global CLI install
Do not assume `openclaw` is globally available in `PATH`.
A source checkout can be healthy even when `openclaw` is not resolvable from a cron/agent/launchd shell.
Before reporting "CLI missing" as a problem, determine which install mode is in use:
- global CLI install
- source checkout
- wrapper-managed runtime

If the machine is clearly running a source checkout, treat "CLI not found" as an environment/path fact first, not an automatic failure.

### 6. Gateway bind: use config, not guessed launch args
When restricting or exposing the Gateway, prefer the documented config fields:
- `gateway.bind`
- `gateway.customBindHost` (only when needed)

Do **not** invent or cargo-cult launch arguments such as `gateway --host ...` unless current docs explicitly show that exact runtime supports them.
For OpenClaw self-changes, inspect docs/schema first, then change config, then restart and verify.

### 7. Browser tabs: lock to `targetId`
For OpenClaw browser work, do not assume `targetUrl` is stable enough for repeated screenshot/snapshot/console calls.
Preferred pattern:
1. `open` the page
2. capture the returned `targetId`
3. use that same `targetId` for follow-up `screenshot`, `snapshot`, `console`, and `act` calls

Why:
- URL-based follow-up calls can drift to the wrong tab
- symptoms include blank screenshots, empty snapshots, or console output from `about:blank`
- if the page title is correct in one tab but the screenshot is blank, suspect wrong-target attachment before blaming the site itself

### 8. Validation is not optional
After changing config, launchd/systemd units, bindings, or gateway exposure, do a real verification pass.
At minimum verify:
- the config on disk matches intent
- the process restarted cleanly
- the listener/bind behavior matches intent
- the actual user-facing path still works

Never report success from reasoning alone.

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
