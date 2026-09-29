---
name: hoi4-isne-namelist-audit
description: >-
  Use when auditing, upgrading, or bringing an existing ISNE ship namelist
  (common/units/names_ships/<TAG>_ship_names.txt) up to current project standards, especially lists
  authored before the current workflow. Not for adding a new nation (use hoi4-isne-ship-namelist-authoring).
---

# ISNE Namelist Audit (Delta Upgrade)

> **Mirror notice**: This skill mirrors `.agents/skills/hoi4-isne-namelist-audit/SKILL.md` (Google Antigravity). Any change to project rules here must be applied there too (see `CLAUDE.md` §9).

An audit is a **delta upgrade**: entries that already meet the standard stay untouched; only reported gaps are fixed. The rules themselves live in `CLAUDE.md` §2–7 — this skill is the cheap route to applying them to an existing file. The script does the mechanical checking; your context is reserved for judgment.

## Token Discipline
- Start from the audit report: `powershell -File .\build.ps1 -Audit <TAG>` (~40 lines: group table + findings + summary).
- Read groups compactly with `powershell -File .\build.ps1 -Audit <TAG> -Group <A>,<B> -NamesOnly` (one line per group; the `<TAG>_` prefix is optional). Drop `-NamesOnly` only when you need a group's block syntax (ship_types, prefix, fallback).
- Read only the groups a finding names and the content-risk pools of step 2(b′). Pure noun pools (cities, provinces, rivers, landmarks, fauna, fish, weather, virtues) get a `-NamesOnly` skim for the display-name check and no entry-by-entry reading; the reviewer's whole-file homonym scan covers them.
- Locate doc lines with Grep (the TAG row, the `[b]<Country>[/b]` block, a group tag in the wiki page) and edit those lines.
- Run `-InspectVanilla <TAG>` only for a `VanillaPrefix` or fallback finding.
- Hand name verification and candidate research to Sonnet subagents; they read the file themselves.

## Workflow

1. **Audit.** Run `powershell -File .\build.ps1 -Audit <TAG>`.
2. **Triage** every FAIL/WARN into one bucket:
   - **(a) Mechanical** — `PrefixSpace`, `PrefixInconsistent`, `DisplayName`, `Docs*`, tag/token fixes. No research, no question.
   - **(b) Judgment** — from the group table, check each fallback for native indefinite nominative terms (`CLAUDE.md` §7) and each thematic `Name` for accuracy against content and for redundant national adjectives. Read with `-Group` any pool whose name signals political content (ideology mixing, `CLAUDE.md` §2) or a narrow theme ("Birds of Prey").
   - **(b′) Content-risk pools** — pools of named persons or beings: rulers, heroes, admirals/commanders, mythology, and any hull group built on persons, legendary kings, or mythic beings (typically CA/BB/BC/CV). They always go to the researcher for a per-entry verdict, even when `-Audit` is clean: legacy lists hide fabrications here (invented titles such as "King <town>" or "Prince <god>", unattested coinages, the wrong person under a heroic label). Skim them with `-NamesOnly` only to name concrete suspects in the research prompt.
   - **(c) Content gaps** — `Depth`, `MissingHull`, `CrossClass`, `BBBCMirror`: need new or reassigned names.
   - **(d) Role-pool candidates** — optional, precedent-driven pools for roles with no vanilla `ship_types` token (authoring skill §2C: minelayers, escort carriers, scout cruisers, and the rest of that catalogue). Never a question: they ride the step-4 research dispatch and are added only when the researcher recommends CREATE.
3. **Checkpoint.** Show the user a gap list (≤15 lines, grouped a/b/c, with counts vs targets), then ask at most 2 AskUserQuestion scope questions. Ask only about decisions the rules leave open, picking the first two that apply in this order:
   1. `VanillaPrefix` fired: restore the vanilla prefix or stay as-is (first Grep `wiki/<Country>.md` for "prefix"; a documented reason goes in the question).
   2. Any `Depth` finding: top up to target, or accept the floor / current count.
   3. `ThemeCount` fired or a pool is thin: which thematic pools to add or deepen.
   Findings with a prescribed fix (`CrossClass`, `BBBCMirror`, `MissingHull`, `BBCarriesBC`, bucket a) are never questions; BC doctrine follows `CLAUDE.md` §2 and the researcher adapts it to the nation's history.
   If none of the three applies, show the gap list and continue to step 4 without asking.
4. **Research (one dispatch).** Dispatch `isne-historical-researcher` via the Agent tool with `model: "sonnet"`. Prompt contents:
   - Country, TAG, and file path, stating that this is an audit of an existing file (not a full dossier).
   - Each bucket (c) item: group tag, current count → target, theme/doctrine, and the collision names to replace.
   - The content-risk pools from step 2(b′) with the suspects you spotted, asking for a keep/drop/respell verdict and source for every entry that is not a clearly documented figure.
   - Unless the file already has the pool, ask for the role-pool precedent table (researcher directive 5; authoring skill §2C).
   - Output: candidate names per group (+20% spare for collisions) and the verification verdicts. No prose history.
5. **Audit plan.** Write `docs/superpowers/plans/YYYY-MM-DD-<nation>-audit.md`: report summary, user decisions, per-group changes (added / removed / moved), a justification for each WARN that is kept, and each role pool created or skipped with its reason.
6. **Edit in place** with Edit, one group per edit:
   - Keep existing group tags (saved designs reference them).
   - Resolve each cross-class collision by keeping the name in the class whose doctrine fits best and replacing it in the other; disambiguate homonyms per `CLAUDE.md` §2 (*"... City"*, *"Mount ..."*, native realm titles).
   - New BC group: `<TAG>_BC_HISTORICAL`, `ship_types = { ship_hull_heavy battle_cruiser }`, BC doctrine from `CLAUDE.md` §2; remove `battle_cruiser` from the BB group.
   - Prefix: one national prefix with trailing space in every group, hull and thematic.
   - Drop unverifiable persons; a shorter authentic list beats padding (`CLAUDE.md` §3) — record the scope in the wiki.
7. **Verify.** Re-run `-Audit <TAG>` until FAIL=0 and every remaining WARN is justified in the plan; then `powershell -File .\build.ps1 -ValidateOnly` and `powershell -File .\build.ps1 -Test`.
8. **Docs delta** (`CLAUDE.md` §4): README row; workshop cross-reference row and the `[b]<Country>[/b]` block in the 2-bullet "Expanded… / Added…" format; `wiki/<Country>.md` group tables and counts; `wiki/Home.md` group count. Push with `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Audit <TAG> ship namelists"`.
9. **Review.** Dispatch `isne-code-reviewer` via the Agent tool with `model: "sonnet"`, passing country, TAG, the audit plan path, and: "This is an audit of an existing namelist. Review `git diff` for this TAG in full, and run the named-individual and English-homonym checks across the whole file. Mechanical invariants (braces, encoding, in-group duplicates, cross-class set intersection, ship_types canon, display-name length, docs sync) are already verified by `-Audit`, `-ValidateOnly` and `-Test`: <paste the three summary lines>. Do not re-run them; spend the review on content: named individuals, English homonyms, native forms and diacritics of new entries, display-name accuracy, and whether the plan's change table matches the diff." Fix every Critical and Important finding, then re-run step 7.
10. **Confirm** with `git status` that the namelist, plan, and docs changed as intended.

## Quick Reference: Finding → Action

| Check | Action |
|-------|--------|
| `Depth` | Top up from researcher candidates (hull FAIL = below minor-navy floor; thematic is WARN only — deepen or justify scope) |
| `MissingHull` | Add the group; for BC, split from BB by doctrine |
| `BBCarriesBC` | Remove `battle_cruiser` from BB ship_types |
| `CrossClass` / `BBBCMirror` | Keep in best-fit class, replace or disambiguate in the other |
| `DuplicateInGroup` | Remove the repeat (check article/spelling variants too) |
| `RoleOverlap` | Keep the name in the hull group or the role pool, whichever the documented series supports; replace it in the other (FAIL vs CL/CA/BB/BC/CV, WARN vs DD/SS) |
| `ThemeRestricted` / `ThemeCount` | Drop `ship_types` from thematic pools / add pools agreed at the checkpoint |
| `UnknownToken` / `WrongClassToken` / `MissingRequired` | Set `ship_types` to the class set in `data/ship_types_canon.json` (`CLAUDE.md` §7); `-Audit` runs this check, so the reviewer need not re-run `-VerifyShipTypes` |
| `PrefixSpace` / `PrefixInconsistent` | Add trailing space / apply the national prefix to every group |
| `VanillaPrefix` | Restore vanilla parity unless the wiki documents a reason (`CLAUDE.md` §3) |
| `Fallback*` | Verify native term; fix definite suffixes, `Lys` calques, English hull words |
| `DisplayName` | Shorten; drop national adjectives; match the final content |
| `Docs*` | Edit the named doc line; `DocsWikiStale` = remove or rename the stale tag in the wiki |
| `DocsWikiSamples` | Replace removed or moved names in that group's wiki sample cell |
| `PlanFile` (INFO) | Satisfied by step 5 |

## Common Mistakes
- Regenerating the whole file or whole wiki page instead of editing the flagged groups and lines.
- Researching groups that already meet their target.
- Renaming existing group tags.
- Padding depth with plausible-sounding persons; unverifiable names are dropped, not kept.
- Treating a clean `-Audit` as done: the judgment checks (b), the content-risk research (b′) and the review (step 9) still apply.
- Printing raw group blocks (`-Group` without `-NamesOnly`) or reading the namelist file directly when only the names are needed.
