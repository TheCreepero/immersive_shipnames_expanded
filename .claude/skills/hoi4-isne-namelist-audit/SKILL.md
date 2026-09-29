---
name: hoi4-isne-namelist-audit
description: >-
  Use when auditing, upgrading, or bringing an existing ISNE ship namelist
  (common/units/names_ships/<TAG>_ship_names.txt) up to current project standards, especially lists
  authored before the current workflow. Not for adding a new nation (use hoi4-isne-ship-namelist-authoring).
---

# ISNE Namelist Audit (Delta Upgrade)

> **Mirror**: `.agents/skills/hoi4-isne-namelist-audit/SKILL.md` (Antigravity). Apply rule changes to both (`CLAUDE.md` §9).

Entries that meet the standard stay untouched; only reported gaps are fixed. Rules: `CLAUDE.md` §2–7. The script does the mechanical checking; keep your context for judgment.

## Token Discipline
- Start from `powershell -File .\build.ps1 -Audit <TAG>` (~40 lines: group table, findings, summary).
- Read groups with `-Audit <TAG> -Group <A>,<B> -NamesOnly` (one line per group; `<TAG>_` prefix optional). Drop `-NamesOnly` only when you need block syntax (ship_types, prefix, fallback). Never open the namelist file, not even to edit it: step 6 uses `-EditNames`.
- Read only the groups a finding names and the content-risk pools of step 2(b′). Pure noun pools (cities, provinces, rivers, landmarks, fauna, fish, weather, virtues) get a `-NamesOnly` skim for the display-name check, not entry-by-entry reading; the reviewer's whole-file homonym scan covers them.
- Locate doc lines with Grep (TAG row, `[b]<Country>[/b]` block, one group's wiki row via its tag) and edit only those lines; never print a whole wiki page. `DocsWikiSamples` lists every stale sample in full.
- Run `-InspectVanilla <TAG>` only for a `VanillaPrefix` or fallback finding.
- Subagents get context, not file access: paste the `-NamesOnly` lines of every group they must judge into their prompt (the researcher has no shell and must not open the namelist), and scope lookups to named suspects and gaps.

## Workflow
1. **Audit**: `powershell -File .\build.ps1 -Audit <TAG>`.
2. **Triage** each FAIL/WARN:
   - **(a) Mechanical**: `PrefixSpace`, `PrefixInconsistent`, `DisplayName`, `Docs*`, tag/token fixes. No research, no question.
   - **(b) Judgment**: from the group table, check each fallback for a native indefinite nominative term (`CLAUDE.md` §7) and each thematic `Name` for accuracy and redundant national adjectives. Read with `-Group` any pool whose name signals political content (ideology mixing, §2) or a narrow theme ("Birds of Prey").
   - **(b′) Content-risk pools**: pools of named persons or beings (rulers, heroes, admirals/commanders, mythology) and hull groups built on persons, legendary kings or mythic beings (typically CA/BB/BC/CV). Always send them to the researcher, even when `-Audit` is clean: legacy lists hide fabrications here (invented titles like "King <town>" or "Prince <god>", unattested coinages, the wrong person under a heroic label). Skim with `-NamesOnly` and name the suspects: only suspects get a per-entry lookup; the rest of the pool gets a read-through verdict, and well-documented figures need a "well documented" flag, not a fetch.
   - **(c) Content gaps**: `Depth`, `MissingHull`, `CrossClass`, `CrossClassVariant`, `BBBCMirror`; need new or reassigned names.
   - **(d) Role-pool candidates** (authoring skill §2C): never a question; they ride the step-4 dispatch and are added only on a CREATE recommendation. Pre-filter first: drop any role whose historical series already fills a hull group you skimmed (e.g. torpedo-boat star names already in DD, monitors already in CA) and record it in the plan as `considered, skipped: covered by <hull>` without research.
3. **Checkpoint**: show a gap list (≤ 15 lines, grouped a/b/c, counts vs targets), then ask at most 2 AskUserQuestion questions, taking the first two that apply:
   1. `VanillaPrefix` fired: restore the vanilla prefix or keep as-is (first Grep `wiki/<Country>.md` for "prefix"; put any documented reason in the question).
   2. Any `Depth` finding: top up to target, or accept the floor / current count.
   3. `ThemeCount` fired or a pool is thin: which thematic pools to add or deepen.

   Findings with a prescribed fix (`CrossClass`, `CrossClassVariant`, `BBBCMirror`, `MissingHull`, `BBCarriesBC`, bucket a) are never questions; BC doctrine follows §2, adapted by the researcher. If none of the three applies, show the gap list and continue.
4. **Research (one dispatch)**: `isne-historical-researcher` via the Agent tool with `model: "sonnet"`. Prompt:
   - country, TAG; state this is an audit of an existing file, not a full dossier (the brief's audit mode);
   - the `-NamesOnly` lines of every bucket (c) group, every (b′) pool and all of CL/CA/BB/BC/CV (for collision checks), with "do not open the namelist file";
   - each bucket (c) item: group tag, current count → target, theme/doctrine, collision names to replace;
   - the (b′) pools with your suspects, asking for keep/drop/respell with a source for each suspect and a read-through verdict for the rest;
   - the role-pool precedent table (researcher directive 5) for the roles that survived the step 2(d) pre-filter, unless the file already has the pool;
   - output contract: candidate names per group (+20% spare for collisions) and the verdicts, each source inline beside the entry it supports; do not restate the collisions, counts or names given in the prompt; one line per skipped role; no bibliography, no prose history.
5. **Audit plan**: `docs/superpowers/plans/YYYY-MM-DD-<nation>-audit.md` with the report summary, user decisions, per-group changes (added / removed / moved), a justification for each kept WARN, each role pool created or skipped with its reason, and a **Persons verified** list: every added, respelled or suspect-but-kept person with the researcher's inline source or "well documented" flag (the reviewer accepts this list instead of re-verifying).
6. **Edit in place**, one `-EditNames` call per group: `powershell -File .\build.ps1 -EditNames <TAG> -Group <GROUP> [-Remove "A; B"] [-Rename "Old=New; Old2=New2"] [-Add "C; D" [-After "Anchor"]]`. It refuses misses and duplicates and prints the updated names line, so nothing needs re-reading. Use Edit only for block syntax (display name, ship_types, fallback, prefix, comments) and for new groups.
   - Keep existing group tags (saved designs reference them).
   - Cross-class collision or variant: keep the name in the best-fitting class and replace it in the other; disambiguate homonyms per §2 (*"... City"*, *"Mount ..."*, native realm titles).
   - New BC group: `<TAG>_BC_HISTORICAL`, `ship_types = { ship_hull_heavy battle_cruiser }`, BC doctrine per §2; remove `battle_cruiser` from BB.
   - New role pool: append this block (tag suffix from `Get-RolePoolSuffixes` in `build.ps1`; add a suffix there for a new role family):
     ```
     ### ROLE POOL: <ROLE> ###
     <TAG>_<ROLE> = {
     	name = "<Role>"
     	for_countries = { <TAG> }
     	type = ship
     	prefix = "<national prefix> "
     	fallback_name = "<native role term> %d"
     	unique = {
     		# <class / series>
     		"<Name>" "<Name>"
     	}
     }
     ```
   - One national prefix, with trailing space, in every group.
   - Drop unverifiable persons (`CLAUDE.md` §3) and record the scope in the wiki.
7. **Verify**: re-run `-Audit <TAG>` until FAIL=0 and every remaining WARN is justified in the plan; then `-ValidateOnly` and `-Test`.
8. **Docs delta** (`CLAUDE.md` §4): README row; workshop cross-reference row and `[b]<Country>[/b]` block ("Expanded… / Added…"); `wiki/<Country>.md` group tables and counts; `wiki/Home.md` group count. Do not push yet.
9. **Review**: `isne-code-reviewer` via the Agent tool with `model: "sonnet"`, passing country, TAG, the audit plan path, and: "This is an audit of an existing namelist. Review `git diff` for this TAG in full, and run the named-individual and English-homonym checks across the whole file. Mechanical invariants (braces, encoding, in-group duplicates, cross-class set intersection and spelling variants, ship_types canon, display-name length, docs sync) are already verified by `-Audit`, `-ValidateOnly` and `-Test`: <paste the three summary lines>. Do not re-run them. Persons in the plan's Persons verified list are sourced; fact-check only named persons not on it. Spend the review on content: named individuals, English homonyms, native forms and diacritics of new entries, display-name accuracy, and whether the plan's change table matches the diff." Fix every Critical and Important finding, then repeat step 7.
10. **Push & confirm**: push the wiki once, after the review fixes: `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Audit <TAG> ship namelists"`. Confirm with `git status` that the namelist, plan and docs changed as intended.

## Finding → Action
| Check | Action |
|---|---|
| `Depth` | Top up from researcher candidates (hull FAIL = below minor-navy floor; thematic is WARN only: deepen or justify scope) |
| `MissingHull` | Add the group; for BC, split from BB by doctrine |
| `BBCarriesBC` | Remove `battle_cruiser` from BB ship_types |
| `CrossClass` / `BBBCMirror` | Keep in best-fit class; replace or disambiguate in the other |
| `CrossClassVariant` | Same fix as `CrossClass` (one name, two spellings); if the two really are different names, justify the WARN in the plan. Exonyms (*Scania* / *Skåne*) are not detected: check them by eye |
| `DuplicateInGroup` | Remove the repeat (check article/spelling variants too) |
| `RoleOverlap` | Keep the name where the documented series supports it (hull group or role pool); replace it in the other (FAIL vs CL/CA/BB/BC/CV, WARN vs DD/SS) |
| `ThemeRestricted` / `ThemeCount` | Drop `ship_types` from thematic pools / add pools agreed at the checkpoint |
| `UnknownToken` / `WrongClassToken` / `MissingRequired` | Set `ship_types` to the class set in `data/ship_types_canon.json` (§7); `-Audit` runs this check, so the reviewer need not re-run `-VerifyShipTypes` |
| `PrefixSpace` / `PrefixInconsistent` | Add the trailing space / apply the national prefix to every group |
| `VanillaPrefix` | Restore vanilla parity unless the wiki documents a reason (§3) |
| `Fallback*` | Verify the native term; fix definite suffixes, `Lys` calques, English hull words |
| `DisplayName` | Shorten; drop national adjectives; match the final content |
| `Docs*` | Edit the named doc line; `DocsWikiStale` = remove or rename the stale tag in the wiki |
| `DocsWikiSamples` | Replace the listed names (the finding lists all of them) in that group's wiki sample cell |
| `PlanFile` (INFO) | Satisfied by step 5 |

## Common Mistakes
- Regenerating the whole file or wiki page instead of editing flagged groups and lines.
- Opening the namelist or a whole wiki page to edit it (use `-EditNames` and Grep).
- Researching groups that already meet their target, or roles a hull group already covers.
- Asking the researcher to source well-documented figures, or to re-check collisions the audit already listed.
- Leaving person sources out of the plan, so the reviewer re-verifies them.
- Renaming existing group tags.
- Padding depth with plausible-sounding persons.
- Treating a clean `-Audit` as done: (b), (b′) and step 9 still apply.
- Printing raw group blocks (`-Group` without `-NamesOnly`) when only names are needed.
- Pushing the wiki before the review (a fix round then needs a second push).
