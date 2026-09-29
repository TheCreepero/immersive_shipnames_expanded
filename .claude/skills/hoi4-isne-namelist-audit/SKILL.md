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
- Read groups with `-Audit <TAG> -Group <A>,<B> -NamesOnly` (one line per group; `<TAG>_` prefix and `_HISTORICAL` suffix optional, e.g. `-Group CL,BB,HEROES`); add `-Sections` to show comment headers inline. Drop `-NamesOnly` only when you need block syntax (ship_types, prefix, fallback). Never open the namelist file, not even to edit it: step 6 uses `-EditNames`.
- Read only the groups a finding names and the content-risk pools of step 2(b′). Pure noun pools (cities, provinces, rivers, landmarks, fauna, fish, weather, virtues) get a `-NamesOnly` skim for the display-name check, not entry-by-entry reading; the reviewer's whole-file homonym scan covers them.
- Docs: `-SyncWiki <TAG>` rewrites wiki display names, sample cells and the Home count. Grep only for prose (README and workshop rows, the `[b]<Country>[/b]` block, wiki overview or scope notes) and edit only those lines; never print a whole wiki page.
- Plan: `-AuditPlan <TAG>` writes the skeleton and the change table; never read an older plan as a template or hand-edit the table.
- Run `-InspectVanilla <TAG>` only for a `VanillaPrefix` or fallback finding.
- Subagents get context, not file access: paste the `-NamesOnly` lines of every group they must judge into their prompt (the audit researcher has web tools only).
- The researcher verifies; you decide. Identify what you can yourself, draft candidates yourself, and send only what needs a source.

## Workflow
1. **Audit**: `powershell -File .\build.ps1 -Audit <TAG>`, then `-AuditPlan <TAG>` to create the plan skeleton (initial report, TODO sections, generated change table).
2. **Triage** each FAIL/WARN:
   - **(a) Mechanical**: `PrefixSpace`, `PrefixInconsistent`, `DisplayName`, `Docs*`, tag/token fixes. No research, no question.
   - **(b) Judgment**: from the group table, check each fallback for a native indefinite nominative term (`CLAUDE.md` §7) and each thematic `Name` for accuracy and redundant national adjectives. Read with `-Group` any pool whose name signals political content (ideology mixing, §2; verify gating via `can_use = { has_government = ... }` rather than focuses, and verify at most 1–2 pools per ideology) or a narrow theme ("Birds of Prey").
   - **(b′) Content-risk pools**: pools of named persons or beings (rulers, heroes, admirals/commanders, mythology) and hull groups built on persons, legendary kings or mythic beings (typically CA/BB/BC/CV, plus DD/SS wherever the navy names escorts or submarines after officers, as most Latin American navies do). The verdict covers legacy entries, not only the ones you change: every person the file keeps goes into Persons verified (step 5), and the reviewer fact-checks anyone missing from it. Always review them, even when `-Audit` is clean: legacy lists hide fabrications here (invented titles like "King <town>" or "Prince <god>", unattested coinages, the wrong person under a heroic label). Skim with `-NamesOnly` and give your own read-through verdict, flagging well-documented figures "well documented". Suspects for the researcher are only the entries you cannot place or whose attribution you doubt: at most ~15 per dispatch, persons in hull groups first; a larger backlog goes in a second budgeted dispatch, never one oversized prompt.
   - **(c) Content gaps**: `Depth`, `MissingHull`, `CrossClass`, `CrossClassVariant`, `BBBCMirror`; need new or reassigned names. `CrossClassPerson` (INFO) lists possible same-person pairs (*Presidente Pinto* / *Aníbal Pinto*): fix the real duplicates like `CrossClass`, and leave namesakes and places named after people as they are.
   - **(d) Role-pool candidates** (authoring skill §2C): never a question; they ride the step-4 dispatch and are added only on a CREATE recommendation. Pre-filter first: drop any role whose historical series already fills a hull group you skimmed (e.g. torpedo-boat star names already in DD, monitors already in CA) and record it in the plan as `considered, skipped: covered by <hull>` without research.
3. **Checkpoint**: show a gap list (≤ 15 lines, grouped a/b/c, counts vs targets), then ask at most 2 AskUserQuestion questions, taking the first two that apply:
   1. `VanillaPrefix` fired: restore the vanilla prefix or keep as-is (first Grep `wiki/<Country>.md` for "prefix"; put any documented reason in the question).
   2. Any `Depth` finding: top up to target, or accept the floor / current count.
   3. `ThemeCount` fired or a pool is thin: which thematic pools to add or deepen.

   Findings with a prescribed fix (`CrossClass`, `CrossClassVariant`, `BBBCMirror`, `MissingHull`, `BBCarriesBC`, bucket a) are never questions; BC doctrine follows §2; you draft, the researcher verifies. If none of the three applies, show the gap list and continue.
4. **Research (one budgeted dispatch)**: `isne-audit-researcher` via the Agent tool; its frontmatter sets Sonnet, `effort: medium`, `maxTurns: 30` and web tools only. Prompt:
   - country, TAG, national prefix;
   - the `-NamesOnly` lines of every bucket (c) group, every (b′) pool and all of CL/CA/BB/BC/CV (for collision checks);
   - decisions already made (collision fixes, doctrine assignments), marked "decided, don't re-check";
   - your own draft candidates for each bucket (c) item (group tag, count → target, theme/doctrine, names to replace), written from your knowledge with +20% spare and a high/low confidence flag per name; ask for extra names only where you cannot draft enough;
   - the (b′) suspects (≤ ~15), each with what you already know about it;
   - the roles that survived the step 2(d) pre-filter, unless the file already has the pool.

   The brief carries the 25-web-call budget and the output contract; do not restate them. Keep judgment out of the prompt (motto variants, display names, pool names, BC doctrine fit): decide it yourself. If the result is partial or leaves entries unverified, ask the researcher again only for entries you intend to keep; treat the rest per `CLAUDE.md` §3 (drop, or flag for author confirmation).
5. **Audit plan**: fill the TODO sections of the `-AuditPlan` skeleton (`-Audit` reports unfilled ones as `PlanTodo`): user decisions, research, rationale (a respelling shows as removed + added in the table), a justification for each kept WARN, each role pool created or skipped with its reason, and **Persons verified**: every person the file keeps after the audit, legacy entries included (one line per group for well-documented names is enough), with the researcher's inline source or a "well documented" flag (the reviewer accepts this list instead of re-verifying). Persons left unverified are dropped or listed under **Author confirmation**. Never hand-edit the generated change table.
6. **Edit in place**, one `-EditNames` call per group: `powershell -File .\build.ps1 -EditNames <TAG> -Group <GROUP> [-Remove "A; B"] [-Rename "Old=New; Old2=New2"] [-Add "C; D" [-After "Anchor" | -Section "Header"]] [-RenameSection "Old=New"] [-Quiet]`. It refuses misses and duplicates, drops section headers an edit leaves empty, and prints the updated names line (`-Quiet`: summary only), so nothing needs re-reading. `-Section` adds under an existing comment header or creates it at the block end. Use Edit only for block syntax (display name, ship_types, fallback, prefix) and for new groups.
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
7. **Verify**: re-run `-Audit <TAG>` until FAIL=0 and every remaining WARN is justified in the plan; then `-ValidateOnly` and `-Test`. Refresh the plan's change table with `-AuditPlan <TAG>`.
8. **Docs delta** (`CLAUDE.md` §4): `-SyncWiki <TAG>` updates wiki display names, sample cells (short forms expanded to the full entry) and the Home count, and lists rows to add or remove by hand plus the prose lines that mention names removed or moved since HEAD. Then by hand: README row; workshop cross-reference row and `[b]<Country>[/b]` block ("Expanded… / Added…"); the prose lines and rows `-SyncWiki` listed (edit those lines only, without reading the whole page) and any new scope note. Do not push yet.
9. **Review**: `isne-code-reviewer` via the Agent tool with `model: "sonnet"`, passing country, TAG, the audit plan path, and: "This is an audit of an existing namelist. Follow your brief's reading economy (`-DiffNames <TAG>`, `-Audit <TAG> -NamesOnly`, `git diff` for docs; never open the namelist) and run the named-individual and English-homonym checks across the whole file. Mechanical invariants (braces, encoding, in-group duplicates, cross-class set intersection and spelling variants, ship_types canon, display-name length, docs sync) are already verified by `-Audit`, `-ValidateOnly` and `-Test`: <paste the three summary lines>. Do not re-run them. Persons in the plan's Persons verified list are sourced; fact-check only named persons not on it. Spend the review on content: named individuals, English homonyms, native forms and diacritics of new entries, display-name accuracy, and whether the plan's change table matches `-DiffNames <TAG>`." Fix every Critical and Important finding, then repeat step 7.
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
| `CrossClassPerson` (INFO) | One person under two forms: fix like `CrossClass`; namesakes and places named after people stay |
| `Docs*` | Edit the named doc line; `DocsWikiStale` = remove or rename the stale tag in the wiki |
| `DocsWikiSamples` / `DocsWikiHome` | Run `-SyncWiki <TAG>` |
| `PlanFile` (INFO) / `PlanTodo` | Create the plan with `-AuditPlan <TAG>` / fill its TODO sections |

## Common Mistakes
- Regenerating the whole file or wiki page instead of editing flagged groups and lines.
- Opening the namelist or a whole wiki page to edit it, or hand-editing section comments, wiki sample cells or the plan's change table (use `-EditNames -Section/-RenameSection`, `-SyncWiki`, `-AuditPlan`).
- Researching groups that already meet their target, or roles a hull group already covers.
- Sending the researcher entries you can identify, candidates you could draft yourself, well-documented figures, or collisions the audit already listed.
- One oversized research prompt instead of a second budgeted dispatch.
- Leaving person sources out of the plan, so the reviewer re-verifies them.
- Renaming existing group tags.
- Padding depth with plausible-sounding persons.
- Verifying only the persons you changed: unsourced legacy persons (often in DD) come back as reviewer findings and a second research round.
- Treating a clean `-Audit` as done: (b), (b′) and step 9 still apply.
- Printing raw group blocks (`-Group` without `-NamesOnly`) when only names are needed.
- Pushing the wiki before the review (a fix round then needs a second push).
