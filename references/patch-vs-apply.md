# Patch vs Apply

## Use `config.patch` when
- adding one agent
- changing one model
- updating one binding
- making a targeted, additive edit

## Use `config.apply` when
- removing stale entries
- renaming ids/accountIds and cleaning old state
- converging the full config to a known-good target
- you need a clean final structure, not a merged one

## Rule of thumb
- Add/change small thing -> `patch`
- Clean up / converge / delete leftovers -> `apply`
