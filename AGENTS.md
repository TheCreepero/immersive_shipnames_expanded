# Immersive Ship Names Expanded (ISNE) - Agent Rules

Shared rules for every mod in this tree (file encodings, build commands, engine knowledge, git) are in the Modding Manager's `../../AGENTS.md`; `CLAUDE.md` and `GEMINI.md` import this file. The long form of this mod's architecture, standards, docs sync and build switches is `docs/isne-agent-guide.md`, read by section when the table below says so.

## What this mod is
- Ship name lists, one file per nation at the vanilla path `common/units/names_ships/<TAG>_ship_names.txt`, so the mod file shadows the vanilla file whole [LOAD-010]; Workshop id 3807415216.
- Every nation has hull groups `<TAG>_<HULL>_HISTORICAL` and thematic pools `<TAG>_<THEME>`, optional role pools on real precedent, and vanilla's regime-variant hull sets kept as vanilla built them (guide section 2).
- `tools/`, `tests/BuildEngine.Tests.ps1`, `tests/Run-Tests.ps1`, `tests/Knowledge.Tests.ps1` and `.github/workflows/ci.yml` are copies the Manager syncs; a hook in `.claude/hooks/` refuses edits to them. The skill mirrors under `.agents/skills/` are kept by hand, line for line (guide section 9).

## Mod invariants
- A shadowed file must keep every tag that vanilla script assigns by `name_group` [NAM-017]; `-InspectVanilla` lists them and `-Audit` fails a missing one.
- `ship_types` only from `data/ship_types_canon.json` [NAM-010]; thematic and role pools carry none; `CL`, `CA`, `BB`, `BC` and `CV` rosters share no name.
- Prefixes end with a space [NAM-011]; display names at most 30 to 32 characters [NAM-013]; `fallback_name` is the native naval term in the indefinite nominative; no empty `unique` or `ordered` block (a rule of this mod [NAM-006]); `link_numbering_with` never points to its own group [NAM-007].
- Ideology pools gate only with `can_use = { has_government = ... }` (a variant set may also test `tag`) [NAM-009] [NAM-024], at most one or two per ideology per nation.
- No fabricated names: every person is traceable to a source. Never author for Jackhall's nations (`HOL`, `CHI`, `SPR`, `POL`, `SOV`, `GRE`, `GER`).
- `-ValidateOnly`, `-Test` and `-Audit <TAG>` clean, and the docs sync of guide section 4 (Workshop text, README table, wiki, `docs/ROADMAP.md`) done, before a namelist task is complete.
- Before completion a fresh code reviewer is dispatched from `.claude/agents/isne-code-reviewer.md` with the country, TAG and plan path (Claude Code: `CLAUDE.md`; Antigravity: guide section 5).

## Commands beyond build.ps1
- The mod's own switches: `-VerifyShipTypes`, `-SyncShipTypeCanon`, `-Audit`, `-EditNames`, `-DiffNames`, `-AuditPlan`, `-SyncWiki`, `-InspectVanilla`; guide section 5 has the table.
- Run `build.ps1`, don't read it: its switches are in guide section 5 and `Get-Help .\build.ps1 -Parameter <name>`; open its source only to change it.

## Read when
| Task | Read |
|---|---|
| Authoring a nation | skill `hoi4-isne-ship-namelist-authoring`, then guide sections 2 and 3; the plan goes to `docs/plans/YYYY-MM-DD-<nation>-namelist.md` and to `docs/plans/archive/` once the task is complete |
| Bringing an existing namelist up to standard | skill `hoi4-isne-namelist-audit`, starting from `-Audit <TAG>` |
| Choosing the next nation, or after a game patch | `docs/ROADMAP.md`; update it in the same task as any change it covers |
| Workshop text, README and wiki | `WORKSHOP_DESCRIPTION_GUIDELINES.md` (rules at the top), guide section 4 |
| Releasing to the Workshop | the user-level skill `hoi4-mod-release` (`Publish-Mod.ps1 "Immersive Ship Names Expanded"`); the mod has no release skill of its own |
| Editing skills or agent briefs | guide section 9 (mirrors) |

## Compacting
Keep: the active nation and TAG, the plan file path, the first unfinished runbook step, group tags edited and their remaining TODOs, pending docs-sync steps, whether the reviewer has run and its open findings, and the latest `-ValidateOnly`, `-Test` and `-Audit <TAG>` result. Drop raw audit, test and research output once its findings are in the plan file.

## Engine Knowledge
- Engine facts live in the Modding Manager's register, reached through the user-level `hoi4-modding-knowledge` skill: search it before a new kind of file and before asking for a game launch, cite ids here, never write a fact into this repository.
- Topics this mod leans on: `namelists`, `loading-and-overrides`, `encoding-and-syntax`.
- `tests/Knowledge.Tests.ps1` runs the register's audit for this repository; it is a copy the Manager keeps current.

