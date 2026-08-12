# agent-workflow-pack

Combined skill pack for agent workflows:

1. **LayishSieger/agent-workflows** — contracts setup + bounded implement loop (chat + unattended shell)
2. **mattpocock/skills** (selected) — planning, triage, TDD, review, and related engineering skills

`setup-matt-pocock-skills` is **not** included. Use `/init-workflows` instead; it writes the same `docs/agents/` contract shape.

## Install (recommended)

```bash
# Pack (vendored planning + helpers + partial loop skills)
npx skills add LayishSieger/agent-workflow-pack

# Full implement-loop package (complete init / loop / host script)
npx skills add LayishSieger/agent-workflows
```

Why two installs: the largest core files (`init-workflows/SKILL.md`, `loop-workflows/SKILL.md`, `host-workflows/scripts/host.sh`, full `triage` / `wayfinder` / `diagnosing-bugs` bodies) are still best taken from the live upstream so you always get the latest ops contract. The pack vendors everything else for a single catalog entry and shared README flow.

To install only specific skills from the pack:

```bash
npx skills add LayishSieger/agent-workflow-pack \
  --skill grill-with-docs \
  --skill to-spec \
  --skill to-tickets \
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
| 7. Implement (one issue) | `/loop-workflows` | Claim → implement → publish PR |
| 7b. Alternative | `/implement` | Matt implement (spec/tickets → TDD + code-review) |
| 8. Quality helpers | `/tdd`, `/code-review`, `/diagnosing-bugs` | Inside implement paths as needed |
| 9. Unattended multi-issue | `host-workflows` | `bash …/host-workflows/scripts/host.sh -n N` |

Planning (steps 2–6) is optional. The implement loop only needs contracts from step 1 and ready-for-agent issues.

## Skills in this pack

### From [LayishSieger/agent-workflows](https://github.com/LayishSieger/agent-workflows)

| Skill | Status in pack |
|-------|----------------|
| `init-workflows` | Seeds present; full `SKILL.md` + GitHub tracker seed via upstream install |
| `loop-workflows` | Via upstream install |
| `host-workflows` | `SKILL.md` vendored; `scripts/host.sh` via upstream install |

### From [mattpocock/skills](https://github.com/mattpocock/skills)

| Skill | Status |
|-------|--------|
| `grill-me` | Vendored |
| `grill-with-docs` | Vendored (needs `/grilling` + `/domain-modeling` from Matt upstream if you want full grill behaviour) |
| `to-spec` | Vendored |
| `to-tickets` | Vendored |
| `implement` | Vendored |
| `tdd` | Vendored |
| `code-review` | Vendored |
| `triage` | Agents yaml present; full body via Matt upstream |
| `wayfinder` | Agents yaml present; full body via Matt upstream |
| `diagnosing-bugs` | Helpers present; full body via Matt upstream |

**Not included:** `setup-matt-pocock-skills` (replaced by `init-workflows`).

## Upstreams

| Role | Repo |
|------|------|
| Implement loop | https://github.com/LayishSieger/agent-workflows |
| Planning / engineering | https://github.com/mattpocock/skills |

Design of the tick/contracts model: [agent-workflows docs/v0.3.md](https://github.com/LayishSieger/agent-workflows/blob/main/docs/v0.3.md).

## License

MIT. See [LICENSE](./LICENSE), [LICENSE-LayishSieger](./LICENSE-LayishSieger), and [LICENSE-MattPocock](./LICENSE-MattPocock).
