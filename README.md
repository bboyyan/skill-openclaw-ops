# OpenClaw Ops

**Guardrails and operational playbooks for having OpenClaw safely manage OpenClaw itself.**

OpenClaw is flexible, which is great — until an agent starts guessing about config, persona loading, routing, bindings, or restart behavior.

This skill exists to stop that.

## What this skill is for

Use this skill when an agent is working on **OpenClaw itself**, including:

- `openclaw.json` changes
- `config.patch` vs `config.apply`
- agents, workspaces, and `agentDir`
- `SOUL.md` / `AGENTS.md` / `USER.md` loading behavior
- bindings, Telegram/Discord accounts, routing
- sessions, cron, gateway, plugins
- persona debugging
- config hygiene and convergence

## What problem it solves

Without guardrails, agents tend to:
- guess framework behavior from memory
- apply habits from Claude Code / Codex / Cursor that do not map cleanly to OpenClaw
- stop at “patch succeeded” without validating behavior
- miss stale config, broken bindings, or wrong workspaces

This skill adds:
- **docs-first workflow**
- **validation-first workflow**
- **patch vs apply decisioning**
- **persona/workspace debugging guidance**
- **operational checklists and scripts**

## Positioning

This is **not** a generic orchestration skill.
It is an **OpenClaw operator skill** for safe self-administration.

Think of it as:
- OpenClaw maintenance handbook
- no-footguns operating guide
- guardrail layer for OpenClaw changing OpenClaw

## Included resources

### References
- `references/troubleshooting.md`
- `references/patch-vs-apply.md`

### Scripts
- `scripts/check-openclaw-targets.sh`
- `scripts/validate-persona-workspace.sh`

## Why this exists

Most agent skills in this space focus on orchestration, automation, or task decomposition.
This one exists for a different reason:

**OpenClaw is powerful enough that agents can easily misconfigure it when they start guessing.**

Typical failure modes include:
- editing config without checking docs
- treating `config.patch` like full convergence
- blaming prompts when the real issue is `workspace`
- validating that a bot responds, but not validating identity or structure
- leaving stale bindings, ids, or accounts behind

This skill exists to reduce those mistakes.

## What makes it different

This is not a generic multi-agent framework skill.
It is an **OpenClaw operator skill** focused on:
- docs-first decision making
- config hygiene
- persona and workspace debugging
- routing and binding correctness
- validation-first operational discipline
- safer self-administration for OpenClaw environments

If other skills help agents do more, this one helps them **break less**.

## Tagline

**Stop guessing. Start operating.**
