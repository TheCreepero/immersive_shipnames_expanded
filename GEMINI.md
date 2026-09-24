# Immersive Shipnames Expanded (ISNE) Development Rules

## 1. File Structure & Naming Conventions
- All ship namelist files must reside in `common/units/names_ships/ISNE_<TAG>_ship_names.txt`.
- Namelist group tags must follow the pattern `<TAG>_<CATEGORY>_<THEME/TYPE>` (e.g., `FIN_DD_HISTORICAL`, `FIN_SS_HISTORICAL`, `FIN_CL_HISTORICAL`, `FIN_BB_HISTORICAL`, `FIN_CV_HISTORICAL`).
- All files must be saved using UTF-8 encoding (without BOM) and maintain strictly balanced curly brackets `{}`.
- Large naval powers may organize categories logically (e.g. historical classes, mythical themes, geographic naming conventions).

## 2. Historical & Linguistic Standards
- **Linguistic Precision**: Always verify proper grammar, cases, and diacritics in the target language (e.g., `Väinämöinen`, `Hämeenmaa`, `L'Audacieux`, `Gromoboi`).
- **Historical Plausibility over Rigid Accuracy**: The goal of ISNE is historical plausibility, not rigid historical accuracy. Anchor unit designations in authentic naval doctrine, class naming traditions, peacetime naval expansion programs, and cultural heritage, extrapolating plausibly to support large wartime fleets and alternate-history naval doctrines.
- **Prefixes**: Respect national naval prefixes where appropriate via `prefix = "..."` (e.g., `HMS `, `USS `, `ORP `, `HSwMS `) or leave blank if handled by engine/country setup.

## 3. Mandatory Workshop & Documentation Synchronization
Whenever a new country ship namelist is added, expanded, or modified:
1. **Update `WORKSHOP_DESCRIPTION_GUIDELINES.md`**:
   - Add/update the file and summary in the **Repository Cross-Reference** table.
   - Add/update the nation under `[h1]Included nations:[/h1]` using standard BBCode (`[b]Nation[/b]` with bulleted categories and italicized unit examples `[i]...[/i]`).
   - Remove completed nations from `[h1]Planned:[/h1]`.
2. **Update `README.md`**:
   - Add any newly introduced country tags and source files to the **Included Nations Summary** table.
3. **Update Wiki Documentation (`wiki/`)**:
   - Add or update the nation documentation page in `wiki/<Nation>.md`, ensuring full ship namelist tables and historical context are detailed.
   - Update `wiki/Home.md` and `wiki/_Sidebar.md` when introducing a new nation.
   - Synchronize updates to the live GitHub wiki using `powershell -File .\wiki\push-wiki.ps1`.
4. **Steam Description Standards**:
   - **No Emojis**: Strictly avoid emojis anywhere in the description.
   - **Character Limit**: Steam Workshop descriptions have a max character limit (~17,000 characters). Keep bullet points concise and do NOT include author update quote blocks (`[quote=author]...[/quote]`) to avoid hitting this limit.
   - **Writing Style**: Keep the tone concise, direct, and informative, matching the author's original style.
   - **Steam BBCode**: Strictly follow Steam's formatting rules (`[h1]`, `[b]`, `[i]`, `[url]`, or standard `- ` bullets).
5. **In-Chat Description Generation**:
   - Whenever the user requests an updated description in chat, output the complete, ready-to-copy Steam BBCode description block directly in the chat alongside a concise summary of additions and changes.

## 4. Build & Validation Protocol
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

## 5. Vanilla Tag Overrides & Additive Loading
- **Additive Loading**: Hearts of Iron IV loads all files in `common/units/names_ships/` additively. Because ISNE uses the `ISNE_<TAG>` filename prefix, vanilla files (e.g. `FIN_ship_names.txt`) remain active in the background.
- **Tag Overriding**: Defining a group with an existing vanilla tag (e.g., `FIN_DD_HISTORICAL`) overrides that specific group in game. Defining a new tag adds a new group selectable in the ship designer.
- **Pruning & Scripted Fallbacks**: Omitting vanilla tags is completely safe—the engine automatically falls back to the vanilla definition. Do not copy identical empty vanilla stubs into ISNE unless actively authoring custom names for them.

## 6. Engine Ship Namelist Invariants
- **Ship Subunit Tokens**: In `ship_types = { ... }`, only use recognized line naval tokens:
  `battle_cruiser`, `battleship`, `capital_ship`, `carrier`, `destroyer`, `heavy_cruiser`, `light_cruiser`, `screen_ship`, `ship_hull_carrier`, `ship_hull_cruiser`, `ship_hull_cruiser_submarine`, `ship_hull_heavy`, `ship_hull_light`, `ship_hull_midget_submarine`, `ship_hull_submarine`, `submarine`.
- **Unique & Ordered Blocks**:
  - `unique = { ... }` contains strings of individual ship names.
  - Integer keys in `ordered = { ... }` must be strictly unique. Duplicate keys silently overwrite earlier entries. Never leave empty `unique = { }` or `ordered = { }` blocks.
- **Fallback Formatting**: Every `fallback_name` must include an ordinal format string (`%d` for Arabic, `%s` for Roman numerals) to prevent overflow ships from generating identical unnumbered names.
- **Link Numbering**: `link_numbering_with` must only be used to link to *different* external groups. Never define self-referential links (`link_numbering_with = { SELF }`).
- **Global Group Tag Uniqueness**: Root-level group tags (e.g., `FIN_DD_HISTORICAL`) must be strictly unique across the entire repository. Never define the same group tag multiple times within a file or across separate files.
