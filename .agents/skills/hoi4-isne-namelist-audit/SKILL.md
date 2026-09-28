---
name: hoi4-isne-namelist-audit
description: >-
  Use when auditing, upgrading, or bringing an existing ISNE ship namelist
  (common/units/names_ships/<TAG>_ship_names.txt) up to current project standards, especially lists
  authored before the current workflow. Not for adding a new nation (use hoi4-isne-ship-namelist-authoring).
---

# ISNE Namelist Audit (Delta Upgrade)

> **Mirror notice**: This skill mirrors `.claude/skills/hoi4-isne-namelist-audit/SKILL.md` (Claude Code). Any change to project rules here must be applied there too (see `GEMINI.md` §9).

An audit is a **delta upgrade**: entries that already meet the standard stay untouched; only reported gaps are fixed. The rules themselves live in `GEMINI.md` §2–7 — this skill is the cheap route to applying them to an existing file. The script does the mechanical checking; your context is reserved for judgment.

## Token Discipline
- Start from the audit report: `powershell -File .\build.ps1 -Audit <TAG>` (~40 lines: group table + findings + summary).
- Read groups one at a time with `powershell -File .\build.ps1 -Audit <TAG> -Group <GROUP_TAG>`, and only the groups a finding or judgment check names.
- Locate doc lines with Grep (the TAG row, the `[b]<Country>[/b]` block, a group tag in the wiki page) and edit those lines.
- Run `-InspectVanilla <TAG>` only for a `VanillaPrefix` or fallback finding.
- Hand name verification and candidate research to lighter-tier subagents (`Model: "flash"`); they read the file themselves.

## Workflow

1. **Audit.** Run `powershell -File .\build.ps1 -Audit <TAG>`.
2. **Triage** every FAIL/WARN into one bucket:
   - **(a) Mechanical** — `PrefixSpace`, `PrefixInconsistent`, `DisplayName`, `Docs*`, tag/token fixes. No research, no question.
   - **(b) Judgment** — from the group table, check each fallback for native indefinite nominative terms (`GEMINI.md` §7) and each thematic `Name` for accuracy against content and for redundant national adjectives. Read with `-Group` any pool whose name signals political content (ideology mixing, `GEMINI.md` §2) or a narrow theme ("Birds of Prey").
   - **(c) Content gaps** — `Depth`, `MissingHull`, `CrossClass`, `BBBCMirror`: need new or reassigned names.
3. **Checkpoint.** Show the user a gap list (≤15 lines, grouped a/b/c, with counts vs targets), then ask at most 2 AskUserQuestion scope questions. Ask only about decisions the rules leave open, picking the first two that apply in this order:
   1. `VanillaPrefix` fired: restore the vanilla prefix or stay as-is (first Grep `wiki/<Country>.md` for "prefix"; a documented reason goes in the question).
   2. Any `Depth` finding: top up to target, or accept the floor / current count.
   3. `ThemeCount` fired or a pool is thin: which thematic pools to add or deepen.
   Findings with a prescribed fix (`CrossClass`, `BBBCMirror`, `MissingHull`, `BBCarriesBC`, bucket a) are never questions; BC doctrine follows `GEMINI.md` §2 and the researcher adapts it to the nation's history.
4. **Research (one dispatch).** Invoke a subagent via `invoke_subagent` (`Role: "Historical Researcher"`, `Model: "flash"`) with the Historical Researcher brief from `.agents/skills/hoi4-isne-ship-namelist-authoring/SKILL.md` (Section 3, Step 1), scoped by these prompt contents:
   - Country, TAG, and file path, stating that this is an audit of an existing file (not a full dossier).
   - Each bucket (c) item: group tag, current count → target, theme/doctrine, and the collision names to replace.
   - The person-name groups to fact-check (admirals, rulers, heroes, CA/BB individuals), asking for a keep/drop/respell verdict per unverifiable entry.
   - Output: candidate names per group (+20% spare for collisions) and the verification verdicts. No prose history.
5. **Audit plan.** Write `docs/superpowers/plans/YYYY-MM-DD-<nation>-audit.md`: report summary, user decisions, per-group changes (added / removed / moved), and a justification for each WARN that is kept.
6. **Edit in place** with Edit, one group per edit:
   - Keep existing group tags (saved designs reference them).
   - Resolve each cross-class collision by keeping the name in the class whose doctrine fits best and replacing it in the other; disambiguate homonyms per `GEMINI.md` §2 (*"... City"*, *"Mount ..."*, native realm titles).
   - New BC group: `<TAG>_BC_HISTORICAL`, `ship_types = { ship_hull_heavy battle_cruiser }`, BC doctrine from `GEMINI.md` §2; remove `battle_cruiser` from the BB group.
   - Prefix: one national prefix with trailing space in every group, hull and thematic.
   - Drop unverifiable persons; a shorter authentic list beats padding (`GEMINI.md` §3) — record the scope in the wiki.
7. **Verify.** Re-run `-Audit <TAG>` until FAIL=0 and every remaining WARN is justified in the plan; then `powershell -File .\build.ps1 -ValidateOnly` and `powershell -File .\build.ps1 -Test`.
8. **Docs delta** (`GEMINI.md` §4): README row; workshop cross-reference row and the `[b]<Country>[/b]` block in the 2-bullet "Expanded… / Added…" format; `wiki/<Country>.md` group tables and counts; `wiki/Home.md` group count. Push with `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Audit <TAG> ship namelists"`.
9. **Review.** Invoke a fresh subagent via `invoke_subagent` (`Role: "Code Reviewer"`, `Model: "flash"`) with the Code Reviewer brief from `.agents/skills/hoi4-isne-ship-namelist-authoring/SKILL.md` (Section 5), passing country, TAG, the audit plan path, and: "This is an audit of an existing namelist. Review `git diff` for this TAG in full, and run the named-individual and English-homonym checks across the whole file." Fix every Critical and Important finding, then re-run step 7.
10. **Confirm** with `git status` that the namelist, plan, and docs changed as intended.

## Quick Reference: Finding → Action

| Check | Action |
|-------|--------|
| `Depth` | Top up from researcher candidates (hull FAIL = below minor-navy floor; thematic is WARN only — deepen or justify scope) |
| `MissingHull` | Add the group; for BC, split from BB by doctrine |
| `BBCarriesBC` | Remove `battle_cruiser` from BB ship_types |
| `CrossClass` / `BBBCMirror` | Keep in best-fit class, replace or disambiguate in the other |
| `DuplicateInGroup` | Remove the repeat (check article/spelling variants too) |
| `ThemeRestricted` / `ThemeCount` | Drop `ship_types` from thematic pools / add pools agreed at the checkpoint |
| `PrefixSpace` / `PrefixInconsistent` | Add trailing space / apply the national prefix to every group |
| `VanillaPrefix` | Restore vanilla parity unless the wiki documents a reason (`GEMINI.md` §3) |
| `Fallback*` | Verify native term; fix definite suffixes, `Lys` calques, English hull words |
| `DisplayName` | Shorten; drop national adjectives; match the final content |
| `Docs*` | Edit the named doc line; `DocsWikiStale` = remove or rename the stale tag in the wiki |
| `PlanFile` (INFO) | Satisfied by step 5 |

## Common Mistakes
- Regenerating the whole file or whole wiki page instead of editing the flagged groups and lines.
- Researching groups that already meet their target.
- Renaming existing group tags.
- Padding depth with plausible-sounding persons; unverifiable names are dropped, not kept.
- Treating a clean `-Audit` as done: the judgment checks (b) and the review (step 9) still apply.
