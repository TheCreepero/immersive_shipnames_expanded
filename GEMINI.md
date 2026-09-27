# Immersive Ship Names Expanded (ISNE) Development Rules

## 1. File Structure & Naming Conventions
- All ship namelist files must reside in `common/units/names_ships/<TAG>_ship_names.txt` to cleanly shadow/replace base-game files.
- Namelist group tags must follow the pattern:
  - **Ship-Type Specific**: `<TAG>_<HULL/CLASS>_HISTORICAL` (e.g., `FIN_DD_HISTORICAL`, `FIN_SS_HISTORICAL`, `FIN_CL_HISTORICAL`, `FIN_CA_HISTORICAL`, `FIN_BB_HISTORICAL`, `FIN_CV_HISTORICAL`).
  - **Thematic / Topic**: `<TAG>_<THEME>` (e.g., `FIN_BIRDS`, `FIN_FISH`, `FIN_RULERS`, `FIN_CITIES`, `FIN_PROVINCES`, `FIN_MYTHOLOGY`).
- All files must be saved using UTF-8 encoding (without BOM) and maintain strictly balanced curly brackets `{}`.
- Large naval powers may organize categories logically (e.g. historical classes, mythical themes, geographic naming conventions).

## 2. Namelist Categorization & Architecture (Two-Category Standard)
Every country's ship namelists should be structured into two broad categories:

1. **Ship-Type Specific Category**:
   - Tied to concrete `ship_types = { ... }` tokens matching specific hulls (DD/Escorts, SS, CL, CA, BB/BC, CV).
   - Follows historical doctrine, navy naming traditions, and plausible naval expansion conventions for that specific ship class (as showcased in `ISNE_FIN_ship_names.txt`).
   - Overrides or augments vanilla `_HISTORICAL` tags where applicable.

2. **Thematic / Topic Namelist Category (Universal Selection)**:
   - Universal thematic pools that can be selected for **any** ship type in the Ship Designer.
   - Omit the `ship_types` restriction (or define universal coverage) so players have total freedom to designate any ship hull or squadron to the theme.
   - Standard topic pools include:
     - **Fauna & Nature**: Birds / Birds of Prey, Aquatic Life / Fish, Wildlife / Predators.
     - **Geography**: Major & Coastal Cities, Provinces / Regions, Rivers & Lakes, Mountains / Landmarks.
     - **History & Heritage**: Legendary Rulers & Monarchs, National Heroes, Mythological Figures / Deities, Historic Battles.
     - **Martial Virtues & Metaphor**: Virtues, Meteorological / Celestial phenomena.
   - **Tiered Namelist Depth Standards**:
     - Due to Hearts of Iron IV's gameplay dynamics, small combat vessels are produced in large volumes. Namelists must provide sufficient depth so active wartime fleets do not exhaust names into generic numbered templates:
       - **Destroyers & Escorts (`DD`)**: 100–140+ unique names (minimum 80+ for minor navies).
       - **Submarines (`SS`)**: 60–80+ unique names (minimum 50+ for minor navies).
       - **Light Cruisers (`CL`)**: 50–70+ unique names (minimum 40–45+ for minor navies).
       - **Heavy Cruisers & Coastal Defense (`CA`)**: 35–45+ unique names.
       - **Capital Ships (`BB` / `BC`)**: 30–45+ unique names.
       - **Aircraft Carriers (`CV`)**: 30–40+ unique names.
       - **Universal Thematic Pools**: 35–60+ unique names per pool where thematic scope permits.
     - **Ideological & Political Cohesion**: When authoring political, ideological, or revolutionary concept pools, **never mix opposing or antithetical ideologies into the same namelist** (e.g., socialist/syndicalist concepts mixed with fascist/synarchist/reactionary concepts, or royalist slogans mixed with radical republicanism). Instead, author separate dedicated pools per ideological branch (e.g., `<TAG>_REPUBLICAN_IDEALS`, `<TAG>_SOCIALISM`, `<TAG>_NATIONALISM` / `<TAG>_FASCISM`, `<TAG>_MONARCHISM`) so players and alternate-history AI regimes commission vessels with cohesive political flavor.
   - **UI Display Name Constraints (Max ~25-30 Characters)**:
     - The in-game Ship Designer dropdown UI has limited width and truncates or wraps long namelist names poorly.
     - Keep all display names (`name = "..."`) concise (strictly **<= 30-32 characters**, ideally **<= 25 characters**).
     - **Omit redundant national prefixes/adjectives** in display names (e.g. use `name = "Cities"` instead of `name = "Finnish Cities"`, `name = "Monarchs"` instead of `name = "Habsburg & Babenberg Monarchs"`, `name = "Birds"` instead of `name = "Birds of Prey & Sky Avians"`). The country context is already clear in-game.
   - **Cross-Class Decoupling & Homonym Disambiguation**:
     - Ship-type specific groups for major combatants (`CL`, `CA`, `BB`, `BC`, `CV`) must maintain mutually exclusive naming rosters with zero duplicate entries across classes.
     - When geographic entities share identical names across administrative levels (e.g. a chartered city in `CL` sharing a name with a province in `CA`), apply formal native administrative designations to cities (e.g. *"Cebu City"*, *"Cavite City"*, *"Ciudad de Puebla"*) or substitute with prominent secondary maritime ports.
     - Historical compacts or realms in `BB`/`BC` must use native realm titles (e.g., Tausūg *"Lupah Sug"* vs. province *"Sulu"*), and mountains in `CV` must be disambiguated with *"Mount ..."* or distinct summits.
   - **Capital Ship Doctrine Specialization (`BB` vs. `BC`)**:
     - Never mirror rosters between Battleships and Battlecruisers.
     - **Battleships (`BB`)**: Foundational republics, constitutional compacts, macro-regions/island groups, supreme founding fathers, presidents, and national sovereignty symbols.
     - **Battlecruisers (`BC`)**: Pre-colonial thalassocracies/sea kingdoms, historic war vessels/flagships (e.g., *Karakoa*, *Balangay*, *Viking longships*), coastal fortresses/citadels, and decisive naval encounters/straits.

## 3. Historical & Linguistic Standards
- **Linguistic Precision**: Always verify proper grammar, cases, and diacritics in the target language (e.g., `Väinämöinen`, `Hämeenmaa`, `L'Audacieux`, `Gromoboi`).
- **Historical Plausibility over Rigid Accuracy**: The goal of ISNE is historical plausibility, not rigid historical accuracy. Anchor unit designations in authentic naval doctrine, class naming traditions, peacetime naval expansion programs, and cultural heritage, extrapolating plausibly to support large wartime fleets and alternate-history naval doctrines.
- **Authenticity over Artificial Padding (No Fabricated Names)**: When compiling lists of historical persons (such as naval admirals, commodores, or specific commanders), **strictly avoid fabricating fictional or synthetic filler names** to meet tiered depth quotas. If a secondary or regional navy historically produced fewer verifiable commanders (e.g., 20–30 verified officers), it is strictly preferred to maintain a shorter, 100% authentic roster than to dilute the mod with fabricated entries. Explicitly document this historical scope in the nation's wiki documentation.
- **Prefixes & Invariants**:
  - When `prefix = "..."` is used, it **must always include a trailing space** (e.g., `prefix = "NRB "`, `prefix = "HMS "`, `prefix = "ORP "`) to prevent the engine from concatenating the prefix directly into the ship name (e.g., `NRBMinas Gerais`).
  - **Thematic Consistency**: If a prefix is established for a nation, apply it consistently across both ship-type specific and universal thematic namelists unless deliberately designated prefix-free.
  - **Vanilla Prefix Audit**: Always inspect the vanilla file (`build.ps1 -InspectVanilla <TAG>`) to determine whether vanilla established a national prefix (including semi-fictional designations like `NRB `). Maintain parity with vanilla prefix conventions unless correcting a demonstrable engine bug.

## 4. Mandatory Workshop & Documentation Synchronization
Whenever a new country ship namelist is added, expanded, or modified:
1. **Update `WORKSHOP_DESCRIPTION_GUIDELINES.md`**:
   - Add/update the file and summary in the **Repository Cross-Reference** table.
   - Add/update the nation under `[h1]Included nations:[/h1]` using standard BBCode:
     - Use **"Expanded"** (not "Added") for ship-type specific lists that overhaul or augment vanilla classes.
     - Follow the standard 3-bullet format (Expanded ship-type lists, Added universal thematic pools, Vanilla fixes and historical traditions restored).
     - Strictly avoid listing individual ship names.
   - Keep the header intro pitch synchronized with all currently implemented nations.
   - Do **NOT** include a `[h1]Planned:[/h1]` section in the workshop description.
   - **Preserve Author Content**: Keep the header pitch, companion mod link, Info block, and Jackhall tribute section intact without overwriting or regenerating them.
2. **Update `README.md`**:
   - Add any newly introduced country tags and source files to the **Included Nations Summary** table.
3. **Update Wiki Documentation (`wiki/`)**:
   - Add or update the nation documentation page in `wiki/<Nation>.md`, ensuring full ship namelist tables and historical context are detailed.
   - Update `wiki/Home.md` and `wiki/_Sidebar.md` when introducing a new nation.
   - Synchronize updates to the live GitHub wiki using `powershell -File .\wiki\push-wiki.ps1`.
4. **Steam Description Standards**:
   - **No Emojis**: Strictly avoid emojis anywhere in the description.
   - **Character Limit**: Steam Workshop descriptions have a max character limit (~17,000 characters). Keep bullet points concise, do NOT list individual ship names (summarize added lists and fixes instead), and do NOT include author update quote blocks (`[quote=author]...[/quote]`) to avoid hitting this limit.
   - **Writing Quality & Style**: Keep the tone concise, direct, and informative. Ensure consistent past tense across bullets, vary descriptive verbs (avoid repeating "fixed" multiple times), and eliminate tautological phrasing (e.g. avoid "expanded ... expansion fleets").
   - **Steam BBCode**: Strictly follow Steam's formatting rules (`[h1]`, `[b]`, `[i]`, `[url]`, or standard `- ` bullets).
   - **Jackhall Series Scope**: Avoid authoring or proposing namelists for countries already covered by Jackhall's ship namelist mod series (Netherlands, China, Spain, Poland, Soviet Union, Greece, Germany).
5. **In-Chat Description Generation**:
   - Whenever the user requests an updated description in chat, output the complete, ready-to-copy Steam BBCode description block directly in the chat alongside a concise summary of additions and changes.

## 5. Build & Validation Protocol
- Always run syntax and bracket validation before completing any ship namelist task:
  ```powershell
  powershell -File .\build.ps1 -ValidateOnly
  ```
- Run the full Pester unit test suite to verify engine invariants and documentation synchronization:
  ```powershell
  powershell -File .\build.ps1 -Test
  ```
- Use `build.ps1 -Package` to test clean staging and zip distribution (ensuring `.git`, `.github`, `tests`, scripts, and documentation are strictly excluded from mod releases).
- Use `build.ps1 -DevLink` when zero-copy live editing in the Paradox launcher is required.
- **Automated Set-Intersection Verification**: Run programmatic cross-class collision checks across `CL`, `CA`, `BB`, `BC`, and `CV` to mathematically guarantee zero overlapping names before finalizing any ship namelist file.
- **Independent Code Review Gate**: Dispatch a fresh Code Reviewer subagent (`Role: "Code Reviewer"`, `Model: "pro"`) using `invoke_subagent` to verify all engine invariants, foreign vessel purges, and cross-class decoupling prior to task completion.

## 6. VFS Shadowing & Clean File Replacement
- **VFS File Replacement**: Hearts of Iron IV's Virtual File System (VFS) cleanly shadows/replaces a base-game file when a mod file shares the exact relative path and filename (`common/units/names_ships/<TAG>_ship_names.txt`).
- **Preventing Additive Merging Bugs**: When distinct filenames coexist (e.g. `ISNE_<TAG>` alongside vanilla `<TAG>`), Clausewitz does not overwrite groups—it accumulates properties. This causes `prefix` strings to concatenate (`NRB NRB `, `BACH BACH `) and appends mod entries after vanilla's erroneous ship names. Matching the vanilla filename guarantees that the mod file is read exclusively.
- **Historical Overhauls & New Thematic Pools**: Mod files provide clean, comprehensive overrides for standard `<TAG>_<HULL>_HISTORICAL` groups while seamlessly introducing new universal thematic groups (`<TAG>_<THEME>`) in the same file.

## 7. Engine Ship Namelist Invariants
- **Ship Subunit Tokens**: In `ship_types = { ... }`, only use recognized line naval tokens:
  `battle_cruiser`, `battleship`, `capital_ship`, `carrier`, `destroyer`, `heavy_cruiser`, `light_cruiser`, `screen_ship`, `ship_hull_carrier`, `ship_hull_cruiser`, `ship_hull_cruiser_submarine`, `ship_hull_heavy`, `ship_hull_light`, `ship_hull_midget_submarine`, `ship_hull_submarine`, `submarine`.
- **Unique & Ordered Blocks**:
  - `unique = { ... }` contains strings of individual ship names.
  - Integer keys in `ordered = { ... }` must be strictly unique. Duplicate keys silently overwrite earlier entries. Never leave empty `unique = { }` or `ordered = { }` blocks.
- **Authentic Fallback Terminology & Grammar**: Verify that `fallback_name` strings reflect authentic native naval terminology rather than literal translations (e.g. Swedish Battlecruiser = `"Slagkryssare %d"`, not `"Stridsskepp %d"`).
  - **Indefinite Nominative Standard**: Fallback names must always use the **indefinite nominative singular form** (e.g., `"Slagkrydser %d"`, `"Jager %d"`), never the definite article suffix (e.g., avoid `"-en"` forms like `"Slagkrydseren %d"` or `"Cruiseren %d"`).
  - **Homonym Calque Traps**: Watch for literal translations of English homonyms, especially "Light Cruiser" translated as illumination/sunlight (e.g. Scandinavian `"Lys"`) rather than naval displacement (`"Let"`, `"Lett"`, `"Lätt"`, `"Leicht"`).
- **Display Name Length**: Group `name = "..."` values must not exceed 30–32 characters to prevent visual truncation in the Ship Designer dropdown UI.
- **Link Numbering**: `link_numbering_with` must only be used to link to *different* external groups. Never define self-referential links (`link_numbering_with = { SELF }`).
- **Global Group Tag Uniqueness**: Root-level group tags (e.g., `FIN_DD_HISTORICAL`) must be strictly unique across the entire repository. Never define the same group tag multiple times within a file or across separate files.

## 8. Single-Root Workspace Layout
- **Unified Workspace & Git Root**: The workspace root (`C:\dev\immersive-shipnames-expanded\`) is the Git repository root (`.git/`). All mod content (`common/`, `descriptor.mod`, `thumbnail.png`), build automation (`build.ps1`), test suites (`tests/`), documentation (`README.md`, `WORKSHOP_DESCRIPTION_GUIDELINES.md`, `wiki/`), and agent configurations (`GEMINI.md`, `.agents/`) reside directly in this single unified root.
- **No Dual-Path Synchronization**: The legacy two-level nested directory structure has been eliminated. Maintain all files directly at the repository root without duplication.
- **Git Verification Invariant**: After modifying rules, skills, or mod files, always run `git status` (and `git diff` when appropriate) from the workspace root to verify that changes appear in the Git working tree before reporting task completion.

