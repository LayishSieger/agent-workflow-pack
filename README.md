# agent-workflow-pack

Combined skill pack for agent workflows:

1. **LayishSieger/agent-workflows** — contracts setup + bounded implement loop
2. **mattpocock/skills** (selected) — planning, triage, TDD, review, grilling, domain modeling

`setup-matt-pocock-skills` is **not** included. Use `/init-workflows` instead.

## Install

```bash
npx skills add LayishSieger/agent-workflow-pack
npx skills add LayishSieger/agent-workflows   # until the 4 remaining core files are vendored below
```

### Still taken from upstream (4 files)

| Path | Why |
|------|-----|
| `skills/init-workflows/SKILL.md` | Large prompt skill |
| `skills/loop-workflows/SKILL.md` | Large prompt skill |
| `skills/host-workflows/scripts/host.sh` | Shell host binary |
| `skills/wayfinder/SKILL.md` | Large planning skill |

Finish with one local sync + push:

```bash
git clone https://github.com/LayishSieger/agent-workflow-pack.git && cd agent-workflow-pack
bash scripts/sync-from-upstreams.sh
git add skills && git commit -m "Vendor remaining core skills" && git push
```

## Recommended flow

| Step | Skill |
|------|--------|
| 1. Setup | `/init-workflows` |
| 2. Align | `/grill-with-docs` or `/grill-me` (uses `/grilling` + `/domain-modeling`) |
| 3. Spec | `/to-spec` |
| 4. Tickets | `/to-tickets` |
| 5. Triage | `/triage` |
| 6. Large map | `/wayfinder` |
| 7. Implement | `/loop-workflows` (or Matt `/implement`) |
| 8. Quality | `/tdd`, `/code-review`, `/diagnosing-bugs` |
| 9. AFK multi | `host-workflows` → `host.sh -n N` |

## Skills in this pack

**From LayishSieger/agent-workflows:** `init-workflows` (seeds + GitHub tracker ops), `loop-workflows` (via upstream until synced), `host-workflows`

**From mattpocock/skills:** `grill-me`, `grill-with-docs`, `grilling`, `domain-modeling`, `to-spec`, `to-tickets`, `triage`, `wayfinder` (body via upstream until synced), `implement`, `tdd`, `code-review`, `diagnosing-bugs`

**Not included:** `setup-matt-pocock-skills`

## Refresh

```bash
bash scripts/sync-from-upstreams.sh
```

## License

MIT — see [LICENSE](./LICENSE), [LICENSE-LayishSieger](./LICENSE-LayishSieger), [LICENSE-MattPocock](./LICENSE-MattPocock).
