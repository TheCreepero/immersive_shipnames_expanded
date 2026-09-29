# Immersive Ship Names Expanded (ISNE) Development Rules

> Mirrors `CLAUDE.md` (Claude Code); see §9 before editing either file.

## 1. Files & Tags
- Namelists live at `common/units/names_ships/<TAG>_ship_names.txt`, the vanilla path and filename, so the mod file cleanly shadows the base-game file (§6).
- Group tags: hull groups `<TAG>_<HULL>_HISTORICAL` (`DD`, `SS`, `CL`, `CA`, `BB`, `BC`, `CV`; e.g. `FIN_DD_HISTORICAL`); thematic pools `<TAG>_<THEME>` (e.g. `FIN_BIRDS`, `FIN_FISH`, `FIN_RULERS`, `FIN_CITIES`, `FIN_PROVINCES`, `FIN_MYTHOLOGY`).
- UTF-8 without BOM; strictly balanced `{}`.
- Large naval powers may organize categories logically (historical classes, mythical themes, geographic conventions).

## 2. Namelist Architecture
Every nation has two categories, plus optional role pools.

**A. Ship-type groups**: `ship_types` bound to one hull (DD/escorts, SS, CL, CA, BB/BC, CV; tokens in §7). Follow the navy's historical doctrine, naming traditions and plausible expansion conventions for that class (model: `FIN_ship_names.txt`). Override or augment vanilla `_HISTORICAL` tags where applicable.

**B. Thematic pools**: universal. Omit `ship_types` so players can assign any hull or squadron to the theme in the Ship Designer. Standard topics:
- Fauna & nature: birds / birds of prey, aquatic life / fish, wildlife / predators.
- Geography: major & coastal cities, provinces / regions, rivers & lakes, mountains / landmarks.
- History & heritage: legendary rulers & monarchs, national heroes, mythological figures / deities, historic battles.
- Martial virtues & metaphor: virtues, meteorological / celestial phenomena.
- Political / ideological: never mix opposing ideologies in one pool (socialist/syndicalist with fascist/synarchist/reactionary; royalist slogans with radical republicanism). Author one pool per branch (e.g. `<TAG>_REPUBLICAN_IDEALS`, `<TAG>_SOCIALISM`, `<TAG>_NATIONALISM` / `<TAG>_FASCISM`, `<TAG>_MONARCHISM`) so players and alternate-history AI regimes get cohesive political flavor.

**C. Role-specific pools (optional, precedent-driven)**: roles with no vanilla `ship_types` token that the Ship Designer can still build: minelayers, minesweepers, escort carriers, escort destroyers, corvettes / frigates / sloops / avisos, patrol vessels, scout cruisers, flotilla leaders, torpedo boats, coastal defense ships, monitors, gunboats, light carriers, seaplane tenders, submarine sub-types, auxiliary cruisers, training ships, icebreakers, and any other role research surfaces (catalogue: authoring skill §2C). Never required, but consider every one for every nation.
- Create `<TAG>_<ROLE>` (no `ship_types`; national prefix and native fallback like any thematic pool) only on real precedent: a distinct class or designation with its own naming convention, a documented naming formula that differs from the parent hull's, or enough verifiable names to reach the floor without padding. Otherwise record `considered, skipped: <reason>` in the plan file.
- Below the floor (table below; `build.ps1 -Audit` WARNs), fold the names into the parent hull group or a thematic pool. Every name individually verifiable (§3); never pad with generic thematic names.
- No name shared with `CL`/`CA`/`BB`/`BC`/`CV` (FAIL). Overlap with `DD`/`SS` is a WARN, since an escort pool legitimately borders its parent hull. Role pools do not count toward the "6+ thematic pools" standard.

**Depth** (unique names). Small combat vessels are mass-produced in wartime, so lists must be deep enough not to fall back to numbered names:

| Group | Target | Minor-navy minimum |
|---|---|---|
| DD (destroyers & escorts) | 100–140+ | 80+ |
| SS | 60–80+ | 50+ |
| CL | 50–70+ | 40–45+ |
| CA (heavy cruisers & coastal defense) | 35–45+ | |
| BB / BC | 30–45+ | |
| CV | 30–40+ | |
| Thematic pool | 35–60+ where scope permits | |
| Role pool (only where precedent exists) | 20+ | 10 |

**Display names** (`name = "..."`): the Ship Designer dropdown is narrow and truncates or wraps badly. Ideal ≤ 25 characters, hard max 30–32. Omit national prefixes and adjectives (`"Cities"` not `"Finnish Cities"`, `"Monarchs"` not `"Habsburg & Babenberg Monarchs"`, `"Birds"` not `"Birds of Prey & Sky Avians"`). The name must describe the final entry list, not the initial concept: a pool that also holds owls, songbirds or waterfowl is `"Birds"`, not `"Birds of Prey"`.

**Cross-class decoupling**: `CL`, `CA`, `BB`, `BC`, `CV` rosters are mutually exclusive (zero shared names). For homonyms across administrative levels:
- City (CL) vs province (CA): give the city its native administrative designation (*"Cebu City"*, *"Cavite City"*, *"Ciudad de Puebla"*) or substitute a prominent secondary port.
- Historic compacts or realms in BB/BC: use the native realm title (Tausūg *"Lupah Sug"* vs province *"Sulu"*).
- Mountains in CV: *"Mount ..."* or a distinct summit.

**BB vs BC doctrine** (never mirror rosters):
- BB: foundational republics, constitutional compacts, macro-regions / island groups, supreme founding fathers, presidents, national sovereignty symbols.
- BC: pre-colonial thalassocracies / sea kingdoms, historic war vessels / flagships (*Karakoa*, *Balangay*, Viking longships), coastal fortresses / citadels, decisive naval encounters / straits.

## 3. Historical & Linguistic Standards
- **Linguistic precision**: correct grammar, cases and diacritics in the target language (`Väinämöinen`, `Hämeenmaa`, `L'Audacieux`, `Gromoboi`).
- **Plausibility over rigid accuracy**: anchor names in authentic doctrine, class traditions, peacetime expansion programs and cultural heritage; extrapolate plausibly for large wartime fleets and alternate-history doctrines.
- **No fabricated names**: never invent filler persons (admirals, commodores, commanders) to meet depth quotas. If a small navy has only 20–30 verifiable officers, keep that shorter, fully authentic roster and document the scope in the nation's wiki page.
- **Per-individual verification**: every named person (admiral, commander, monarch, hero) must be traceable to a source, even inside a list of verified vocabulary or places. "Sounds plausible for the role/era" is not enough: if the researcher's dossier or the reviewer cannot corroborate a person, drop the entry or flag it for author confirmation.
- **English homonym check**: a single-word transliteration that doubles as a common, unrelated English word ("Ship", "Bum", "Dad", "Mad") can read as a UI placeholder, typo or joke. Prefer a compound or qualified form ("Shipmahi", not bare "Ship") over dropping the authentic entry.
- **Prefixes**: `prefix = "..."` always ends with a space (`"NRB "`, `"HMS "`, `"ORP "`); otherwise the engine concatenates (`NRBMinas Gerais`). A national prefix applies to both hull groups and thematic pools unless the nation is deliberately prefix-free. Check vanilla with `build.ps1 -InspectVanilla <TAG>` and keep vanilla's prefix (including semi-fictional ones like `NRB `) unless correcting a demonstrable engine bug.

## 4. Documentation Sync (every add, expansion or modification)
1. `WORKSHOP_DESCRIPTION_GUIDELINES.md`:
   - Update the nation's row in the **Repository Cross-Reference** table.
   - Update its entry under `[h1]Included nations:[/h1]` in the 2-bullet BBCode format: "Expanded" (not "Added") ship-type lists, then "Added" universal thematic pools. Never list individual ship names. Vanilla bug and typo fixes are covered globally in the Info section.
   - Keep the header intro pitch in sync with all implemented nations.
   - No `[h1]Planned:[/h1]` section.
   - Preserve author content: header pitch, companion mod link, Info block, Jackhall tribute.
2. `README.md`: add new tags and source files to the **Included Nations Summary** table.
3. `wiki/`: add or update `wiki/<Nation>.md` (full namelist tables and historical context); update `wiki/Home.md` and `wiki/_Sidebar.md` for a new nation; push with `powershell -File .\wiki\push-wiki.ps1`.
4. Steam description: no emojis; stay under ~17,000 characters (concise bullets, no ship names, no `[quote=author]` blocks); concise, direct tone, consistent past tense, varied verbs (not repeated "fixed"), no tautologies ("expanded ... expansion fleets"); Steam BBCode only (`[h1]`, `[b]`, `[i]`, `[url]`, `- ` bullets).
5. Jackhall scope: never author or propose namelists for nations covered by Jackhall's series: Netherlands (`HOL`), China (`CHI`), Spain (`SPR`), Poland (`POL`), Soviet Union (`SOV`), Greece (`GRE`), Germany (`GER`).
6. When the user asks for an updated description in chat, output the complete ready-to-copy BBCode block plus a concise summary of the changes.

## 5. Build & Validation
All commands take the form `powershell -File .\build.ps1 <switch>`.

| Switch | Purpose |
|---|---|
| `-ValidateOnly` | Syntax and bracket validation. Required before completing any namelist task. |
| `-Test` | Pester suite (engine invariants, docs sync). Required. |
| `-VerifyShipTypes <TAG\|ALL>` | `ship_types` vs `data/ship_types_canon.json`: one `ship_types OK` line or one line per deviation; exit 1 on FAIL. |
| `-SyncShipTypeCanon [-Write]` | After a HoI4 patch: diff vanilla against the canon. `-Write` refreshes tokens/meta; class rules are curated by hand. |
| `-Audit <TAG>` | Standards report: depth, cross-class collisions (`CrossClass`), prefixes, display names, docs sync. |
| `-InspectVanilla <TAG> [-Group <GROUP>]` | Vanilla groups, counts, prefix. |
| `-Package` | Clean staging and zip; `.git`, `.github`, `tests`, scripts and docs must be excluded. |
| `-DevLink` | Zero-copy live link for the Paradox launcher. |

- Cross-class set intersection over `CL`/`CA`/`BB`/`BC`/`CV` must be zero before a namelist is final (`-Audit` reports `CrossClass`).
- To bring an existing namelist up to standard, use the `hoi4-isne-namelist-audit` skill (delta upgrade starting from `-Audit <TAG>`), not the full authoring runbook.
- **Review gate**: before completion, dispatch a fresh Code Reviewer subagent via `invoke_subagent` (`Role: "Code Reviewer"`, `Model: "pro"`, brief: `.claude/agents/isne-code-reviewer.md`) with the country name, TAG and plan file path. It verifies engine invariants, foreign-vessel purges and cross-class decoupling.

## 6. VFS Shadowing
- A mod file with the exact vanilla relative path and filename replaces the vanilla file, which is then read exclusively.
- With distinct filenames (e.g. `ISNE_<TAG>` beside vanilla `<TAG>`), Clausewitz does not overwrite groups but accumulates properties: prefixes concatenate (`NRB NRB `, `BACH BACH `) and mod entries are appended after vanilla's erroneous names.
- One file can therefore fully override the `<TAG>_<HULL>_HISTORICAL` groups and add new `<TAG>_<THEME>` pools.

## 7. Engine Invariants
- `ship_types` must match `data/ship_types_canon.json`: only the 14 tokens live in vanilla `names_ships` are valid (`capital_ship` and `screen_ship` are script categories, never valid). Class sets:
  - `DD` `destroyer ship_hull_light`; `CL` `light_cruiser ship_hull_cruiser`; `CA` `heavy_cruiser ship_hull_cruiser`; `CV` `carrier ship_hull_carrier`; `BC` `battle_cruiser ship_hull_heavy`.
  - `BB` `battleship ship_hull_heavy` (+ `battle_cruiser` only when the file has no BC group).
  - `SS` `submarine ship_hull_submarine` (optionally `ship_hull_midget_submarine`, `ship_hull_cruiser_submarine`).
  - Thematic and role pools: no `ship_types`.
- `unique = { ... }` holds name strings. Integer keys in `ordered = { ... }` must be unique (duplicates silently overwrite earlier entries). Never leave an empty `unique` or `ordered` block.
- `fallback_name`: authentic native naval term, not a literal translation (Swedish BC `"Slagkryssare %d"`, not `"Stridsskepp %d"`), in the indefinite nominative singular (`"Slagkrydser %d"`, `"Jager %d"`; never definite `-en` forms like `"Slagkrydseren %d"` or `"Cruiseren %d"`). Watch homonym calques: "Light Cruiser" as illumination (Scandinavian `"Lys"`) instead of displacement (`"Let"`, `"Lett"`, `"Lätt"`, `"Leicht"`).
- Display names: ≤ 30–32 characters (§2).
- `link_numbering_with` links only to other groups, never to its own group.
- Root-level group tags are unique across the whole repository: never defined twice within a file or across files.

## 8. Workspace
- `C:\dev\immersive-shipnames-expanded\` is the Git root and holds everything directly: mod content (`common/`, `descriptor.mod`, `thumbnail.png`), `build.ps1`, `tests/`, docs (`README.md`, `WORKSHOP_DESCRIPTION_GUIDELINES.md`, `wiki/`) and agent configs (`GEMINI.md`, `.agents/` for Google Antigravity; `CLAUDE.md`, `.claude/` for Claude Code). The legacy nested two-level layout is gone; never duplicate files across paths.
- After modifying rules, skills or mod files, run `git status` (and `git diff` when useful) from the root to confirm the changes before reporting completion.
- Per-nation plans: `docs/superpowers/plans/YYYY-MM-DD-<nation>-namelist.md`.

## 9. Agent Config Mirrors
Google Antigravity and Claude Code use mirrored configs:
- `GEMINI.md` ⇄ `CLAUDE.md`
- `.agents/skills/<skill>/SKILL.md` ⇄ `.claude/skills/<skill>/SKILL.md`, for `hoi4-isne-ship-namelist-authoring` and `hoi4-isne-namelist-audit`.
- The subagent briefs exist once, in `.claude/agents/isne-historical-researcher.md` and `.claude/agents/isne-code-reviewer.md`. Claude dispatches them as named agents; Antigravity passes their path to `invoke_subagent`.

When a rule, standard or runbook step changes in one file, change its mirror in the same task. Translate only tool-specific wording (Antigravity: `invoke_subagent` with `Role`/`Model`; Claude: Agent tool with named agents); the project rules stay identical. Confirm with `git status` that both sides changed before reporting completion.
