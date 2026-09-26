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
   - **UI Display Name Constraints (Max ~25-30 Characters)**:
     - The in-game Ship Designer dropdown UI has limited width and truncates or wraps long namelist names poorly.
     - Keep all display names (`name = "..."`) concise (strictly **<= 30-32 characters**, ideally **<= 25 characters**).
     - **Omit redundant national prefixes/adjectives** in display names (e.g. use `name = "Cities"` instead of `name = "Finnish Cities"`, `name = "Monarchs"` instead of `name = "Habsburg & Babenberg Monarchs"`, `name = "Birds"` instead of `name = "Birds of Prey & Sky Avians"`). The country context is already clear in-game.

## 3. Historical & Linguistic Standards
- **Linguistic Precision**: Always verify proper grammar, cases, and diacritics in the target language (e.g., `Väinämöinen`, `Hämeenmaa`, `L'Audacieux`, `Gromoboi`).
- **Historical Plausibility over Rigid Accuracy**: The goal of ISNE is historical plausibility, not rigid historical accuracy. Anchor unit designations in authentic naval doctrine, class naming traditions, peacetime naval expansion programs, and cultural heritage, extrapolating plausibly to support large wartime fleets and alternate-history naval doctrines.
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

## 8. Repository Layout & Workspace Root Invariants
- **Root-Level Customizations**: The workspace root is `c:\dev\immersive-shipnames-expanded\`. All agent customizations (`.agents/skills/`, `GEMINI.md`) must reside at the workspace root to ensure discovery by IDE tools and slash commands.
- **Nested Project Directory & Git Repository**: Mod content, git history (`.git/`), build tools, and tests reside within `immersive_shipnames_expanded\`.
- **Mandatory Dual-Path Synchronization**: Both `GEMINI.md` and `.agents/` exist in duplicate (at the workspace root and inside `immersive_shipnames_expanded/`). Whenever authoring or modifying rules, skills, or workspace configurations, you MUST update or copy the changes to BOTH locations so they remain 100% identical.
- **Git Verification Invariant**: After modifying rules, skills, or mod files, always run `git status` (and `git diff` when appropriate) inside `immersive_shipnames_expanded/` to verify that changes appear in the user's Git working tree before reporting task completion.

