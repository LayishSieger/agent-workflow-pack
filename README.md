# agent-workflow-pack

Single-install skill pack that combines:

1. **LayishSieger/agent-workflows** — contracts setup + bounded implement loop (chat + unattended shell)
2. **mattpocock/skills** (selected) — planning, triage, TDD, review, and related engineering skills

`setup-matt-pocock-skills` is **not** included. Use `/init-workflows` from this pack instead; it writes the same `docs/agents/` contract shape.

## Install

```bash
npx skills add LayishSieger/agent-workflow-pack
```

Or pick specific skills:

```bash
npx skills add LayishSieger/agent-workflow-pack \
  --skill init-workflows \
  --skill loop-workflows \
  --skill host-workflows \
  --skill grill-with-docs \
  --skill to-spec \
  --skill to-tickets \
  --skill triage \
  --skill implement \
  --skill tdd \
  --skill code-review
```

## Recommended flow

| Step | Skill | Role |
|------|--------|------|
| 1. Once per product | `/init-workflows` | Write `docs/agents/` contracts + `.agent-workflows/` runtime → **READY** |
| 2. Plan / align | `/grill-with-docs` or `/grill-me` | Sharpen the idea; update domain docs |
| 3. Spec | `/to-spec` | Turn conversation into a tracker spec |
| 4. Tickets | `/to-tickets` | Split into ready-for-agent vertical slices |
| 5. Triage (as needed) | `/triage` | Move issues through triage roles |
| 6. Large work map | `/wayfinder` | Decision tickets for multi-session scope |
| 7. Implement (one issue) | `/loop-workflows` | Claim → implement → publish PR (agent-workflows tick) |
| 7b. Alternative implement | `/implement` | Matt's implement skill (spec/tickets → TDD + code-review) |
| 8. Quality helpers | `/tdd`, `/code-review`, `/diagnosing-bugs` | Use inside implement paths as needed |
| 9. Unattended multi-issue | `host-workflows` | `bash …/host-workflows/scripts/host.sh -n N` |

Planning (steps 2–6) is optional. The implement loop (step 7) only needs contracts from step 1 and ready-for-agent issues.

## Skills in this pack

### From [LayishSieger/agent-workflows](https://github.com/LayishSieger/agent-workflows)

| Skill | What it does |
|-------|----------------|
| `init-workflows` | Audit + repair contracts (`docs/agents/`) and runtime; optional chat/shell runner setup |
| `loop-workflows` | One shared tick in chat (once or max N fresh workers) |
| `host-workflows` | Thin shell host for unattended sequential ticks |

### From [mattpocock/skills](https://github.com/mattpocock/skills)

| Skill | What it does |
|-------|----------------|
| `grill-me` | Relentless interview to sharpen a plan |
| `grill-with-docs` | Same, while building ADR/glossary docs |
| `to-spec` | Conversation → tracker spec |
| `to-tickets` | Spec/plan → vertical-slice tickets |
| `triage` | Issue state machine over triage roles |
| `wayfinder` | Map large work as decision tickets |
| `implement` | Spec/tickets → TDD + code-review → commit |
| `tdd` | Red-green-refactor discipline |
| `code-review` | Standards + Spec review of a diff |
| `diagnosing-bugs` | Disciplined diagnosis loop |

**Not included:** `setup-matt-pocock-skills` (replaced by `init-workflows`).

## Upstreams & updates

This pack **vendors** skill files from the upstreams above so a single `npx skills add` works.

| Upstream | Source |
|----------|--------|
| Implement loop | https://github.com/LayishSieger/agent-workflows |
| Planning / engineering | https://github.com/mattpocock/skills |

To refresh vendored skills, re-copy from the upstream default branches and bump this pack. Prefer pinning immutable revisions in production.

For the authoritative design of the tick/contracts model, see [agent-workflows docs/v0.3.md](https://github.com/LayishSieger/agent-workflows/blob/main/docs/v0.3.md).

## License

MIT. See [LICENSE](./LICENSE), [LICENSE-LayishSieger](./LICENSE-LayishSieger), and [LICENSE-MattPocock](./LICENSE-MattPocock).
