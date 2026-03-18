# Troubleshooting

## Persona still acts like the wrong agent

### Check order
1. Verify the target agent's `workspace`
2. Verify the workspace actually contains `AGENTS.md`, `SOUL.md`, `USER.md`
3. Re-read current config after restart
4. Test with a fresh chat/session

### Common cause
The agent has a custom id/account/bot, but its `workspace` still points at the main workspace, so it loads the main persona files.

---

## `config.patch` succeeded but old config is still there

### Cause
`config.patch` merges. It does not reliably remove old entries.

### Fix
Use `config.apply` with a fully converged config when you need to remove stale config.

---

## Bot responds, but role is wrong

Validate all three layers:
1. Function — bot responds
2. Identity — bot describes the correct role/persona
3. Structure — config matches intended ids, accountIds, workspace, bindings

---

## Bindings look right, but routing still feels wrong

Check:
- correct `accountId`
- no overlapping default binding swallowing traffic
- group/topic-specific rules
- whether you are testing in an old session with stale context
