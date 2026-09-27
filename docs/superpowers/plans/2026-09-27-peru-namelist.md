# Peru (TAG: PRU) Ship Namelist Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Overhaul and expand the naval ship namelists for Peru (`TAG: PRU`) in *Immersive Ship Names Expanded*, eliminating critical vanilla bugs (severe character encoding mojibake, duplicated entries, 100% clone rosters between CL/CA and BB/BC, and severe depth deficits) while establishing a complete two-category architecture with 7 ship-type specific pools and 14 universal thematic and ideological pools.

**Architecture:** Implement clean VFS file replacement at `common/units/names_ships/PRU_ship_names.txt` overriding all vanilla groups (`PRU_<HULL>_HISTORICAL`), establishing authentic Peruvian naval naming doctrine (*Marina de Guerra del Perú*), and introducing rich universal topic pools and ideologically segregated pools for the Ship Designer. Synchronize documentation across `README.md`, `WORKSHOP_DESCRIPTION_GUIDELINES.md`, and the GitHub wiki (`wiki/Peru.md`, `wiki/Home.md`, `wiki/_Sidebar.md`).

**Tech Stack:** Hearts of Iron IV Clausewitz script syntax (namelist blocks, token types, UTF-8 without BOM), PowerShell (ISNE test suite & validation runner `build.ps1`, Pester 6.2.0), Markdown, Steam BBCode.

**Spec:** [SKILL.md](file:///c:/dev/immersive-shipnames-expanded/.agents/skills/hoi4-isne-ship-namelist-authoring/SKILL.md) and Historical Naval Research Dossier for Peru (TAG: PRU) provided by Historical Researcher subagent.

## Global Constraints

- File location must be `common/units/names_ships/PRU_ship_names.txt` to cleanly shadow and replace the vanilla file via HoI4 Virtual File System.
- File encoding must be UTF-8 without BOM, with strictly balanced curly braces `{}` and balanced double quotes.
- Ship type tokens in `ship_types = { ... }` must only use recognized engine tokens (`ship_hull_light`, `destroyer`, `ship_hull_submarine`, `submarine`, `ship_hull_cruiser`, `light_cruiser`, `heavy_cruiser`, `ship_hull_heavy`, `battleship`, `battle_cruiser`, `ship_hull_carrier`, `carrier`).
- Prefix string must be `prefix = "BAP "` with a mandatory trailing whitespace, applied consistently across ship-type specific and universal thematic pools.
- Fallback templates must follow standard syntax (`fallback_name = "..." %d`) in Spanish indefinite nominative singular (e.g. `"Destructor %d"`, `"Submarino %d"`, `"Crucero Ligero %d"`).
- Display names (`name = "..."`) must be <= 25–30 characters (strict maximum 32) and omit redundant national adjectives.
- Universal thematic pools must omit `ship_types` for universal availability across all hulls.
- No fabricated names: all historical commanders, naval officers of the *Huáscar* and *Unión*, and military heroes must be 100% verified historical individuals.
- Ideological separation: distinct dedicated pools for Republican, Socialist/APRA, and Nationalist/UR ideals without mixing opposing doctrines.
- Zero-copy single-root workspace layout: all files maintained directly at repository root.

## Review Focus

1. **Character encoding & diacritic restoration**: Purge all vanilla mojibake and missing accents (`Capitn Quinones` -> `Capitán Quiñones`, `Garca y Garca` -> `García y García`, `Glvez` -> `Gálvez`, `Rodrguez` -> `Rodríguez`, `Mariscal Cceres` -> `Mariscal Cáceres`, `Repblica del Per` -> `República del Perú`, `Ferre` -> `Ferré`).
2. **Purge of intra-list duplicate**: Eliminate the duplicate `"Angamos"` entry in `PRU_SS_HISTORICAL` (which appeared twice on the same line in vanilla).
3. **Decoupling of clone classes**: Break the 100% clone duplication between Light Cruisers and Heavy Cruisers (re-anchoring CA in ironclads, monitors, and epic national heroes), and between Battleships and Battlecruisers (re-anchoring BC in decisive historic battles).
4. **Cross-hull collision resolution**: Decouple Bolognesi, Quiñones, and Aguirre so they do not simultaneously collide across DD, CL, and CA.
5. **Prefix trailing whitespace**: Verify that every `prefix = "BAP "` declaration in `PRU_ship_names.txt` has a trailing space so ship names do not concatenate into `BAPAlmirante Grau`.
6. **Documentation and test synchronization**: Verify that adding `PRU_ship_names.txt` immediately passes `tests/Shipnames.Tests.ps1`, `tests/Documentation.Tests.ps1`, and `tests/BuildScript.Tests.ps1`.

---

## Tasks

### Task 1: Author Peruvian Ship Namelists (`common/units/names_ships/PRU_ship_names.txt`)

**Files:**
- Create: `common/units/names_ships/PRU_ship_names.txt`

**Interfaces:**
- Consumes: Historical Naval Research Dossier for PRU.
- Produces: 7 Ship-Type Specific namelists and 14 Universal Thematic & Ideological namelists for country tag `PRU`.

- [ ] **Step 1: Draft header and ship-type specific groups in `common/units/names_ships/PRU_ship_names.txt`**
  - Group `PRU_DD_HISTORICAL`: Destroyers & Escorts (135 names). Naval commanders (*Guise*, *Villar*, *Rodríguez*, *Carvajal*, *Fanning*), *Huáscar* and *Unión* officers, historic gunboats/torpedo craft (*Alianza*, *República*), Amazonian river gunboats (*Loreto*, *Iquitos*, *Ucayali*, *Marañón*), and fast naval descriptors.
  - Group `PRU_SS_HISTORICAL`: Submarines (75 names). Historic naval battles (*Dos de Mayo*, *Abtao*, *Angamos*, *Iquique*, *Pacocha*, *Islay*, *Casma*), submarine pioneers (*Federico Blume*, *Ferré*, *Palacios*), and marine predators (*Lobo*, *Tiburón*, *Atún*, *Merlín*, *Cachalote*). Purges vanilla duplicate `Angamos`.
  - Group `PRU_CL_HISTORICAL`: Light Cruisers (65 names). Historical scout cruisers (*Almirante Grau*, *Coronel Bolognesi*, *Capitán Quiñones*, *Aguirre*), major commercial ports, and departmental capitals (*Callao*, *Paita*, *Chimbote*, *Salaverry*, *Pisco*, *Mollendo*, *Arequipa*, *Trujillo*, *Cusco*).
  - Group `PRU_CA_HISTORICAL`: Heavy Cruisers (45 names). Historic ironclads and monitors (*Huáscar*, *Independencia*, *Manco Cápac*, *Atahualpa*), epic military champions (*Alfonso Ugarte*, *Leoncio Prado*, *Juan Fanning*, *Guillermo More*), and Inca warrior leaders (*Cahuide*, *Pachacútec*). Decoupled from CL.
  - Group `PRU_BB_HISTORICAL`: Battleships (43 names). Sovereign departments (*Lima*, *Cusco*, *Arequipa*, *Áncash*), founding fathers (*San Martín*, *Bolívar*), and Grand Marshals (*Castilla*, *Cáceres*, *La Mar*, *Gamarra*, *Sucre*, *Miller*).
  - Group `PRU_BC_HISTORICAL`: Battlecruisers (38 names). Decisive historical battles and victories (*Dos de Mayo*, *Abtao*, *Angamos*, *Ayacucho*, *Junín*, *Tarapacá*, *Pacocha*, *Miraflores*, *Huamachuco*). Decoupled from BB.
  - Group `PRU_CV_HISTORICAL`: Aircraft Carriers (40 names). Towering Andean cordilleras and volcanic massifs (*Los Andes*, *Cordillera Blanca*, *Huascarán*, *Yerupajá*, *Alpamayo*, *El Misti*), Inca sky/solar deities (*Inti*, *Illapa*, *Viracocha*), raptors (*Cóndor*, *Halcón*), and aviation pioneers (*Capitán Quiñones*, *Jorge Chávez*).

- [ ] **Step 2: Add universal thematic pools to `common/units/names_ships/PRU_ship_names.txt`**
  - `PRU_CITIES`: Major Cities & Coastal Ports (50 names, `name = "Cities & Ports"`).
  - `PRU_DEPARTMENTS`: Departments & Historical Regions (27 names, `name = "Departments"`).
  - `PRU_RIVERS`: Rivers & Waterways (45 names, `name = "Rivers & Waterways"`).
  - `PRU_MOUNTAINS`: Mountains & Andean Peaks (38 names, `name = "Mountains & Peaks"`).
  - `PRU_INCA`: Inca Emperors & Dynasty (32 names, `name = "Inca Dynasty"`).
  - `PRU_MYTHOLOGY`: Pre-Columbian Deities & Mythology (32 names, `name = "Mythology & Deities"`).
  - `PRU_BATTLES`: Historic Battles & Victories (45 names, `name = "Historic Battles"`).
  - `PRU_HEROES`: National & Military Heroes (52 names, `name = "National Heroes"`).
  - `PRU_BIRDS`: Birds of Prey & Avian Fauna (36 names, `name = "Birds of Prey"`).
  - `PRU_FISH`: Marine Life & Aquatic Fauna (38 names, `name = "Marine Fauna"`).
  - `PRU_VIRTUES`: Martial Virtues & Descriptors (32 names, `name = "Martial Virtues"`).

- [ ] **Step 3: Add dedicated ideological pools to `common/units/names_ships/PRU_ship_names.txt`**
  - `PRU_REPUBLICAN_IDEALS`: Republican & Constitutional Ideals (25 names, `name = "Republican Ideals"`).
  - `PRU_SOCIALISM`: Socialist, Indigenist & APRA Ideals (25 names, `name = "Socialist & APRA Ideals"`).
  - `PRU_NATIONALISM`: Traditionalist, Synarchist & UR Ideals (25 names, `name = "Nationalist Ideals"`).

- [ ] **Step 4: Run syntax and engine validation**
  - Run: `powershell -File .\build.ps1 -ValidateOnly`
  - Expected: PASS with 0 syntax errors, 0 unbalanced braces, valid prefix spacing.

---

### Task 2: Synchronize Repository Documentation (`README.md` & `WORKSHOP_DESCRIPTION_GUIDELINES.md`)

**Files:**
- Modify: `README.md`
- Modify: `WORKSHOP_DESCRIPTION_GUIDELINES.md`

**Interfaces:**
- Consumes: Implemented `PRU` tag and group summary.
- Produces: Updated cross-reference table and workshop description bullets complying with Steam length guidelines.

- [ ] **Step 1: Update `README.md` Included Nations table**
  - Add Peru (`PRU`) entry to the Included Nations Summary table with link to `wiki/Peru.md`.

- [ ] **Step 2: Update `WORKSHOP_DESCRIPTION_GUIDELINES.md` Cross-Reference table**
  - Add `PRU_ship_names.txt` row with summary of expanded hulls, fixed diacritics/duplicates, and 14 universal thematic pools.

- [ ] **Step 3: Update `WORKSHOP_DESCRIPTION_GUIDELINES.md` Included nations section**
  - Add `[b]Peru[/b]` entry under `[h1]Included nations:[/h1]` using standard 3-bullet BBCode format without individual ship names.

- [ ] **Step 4: Verify documentation test passes**
  - Run: `powershell -Command "Invoke-Pester -Path tests/Documentation.Tests.ps1 -Output Detailed"`
  - Note: Will fail wiki checks until Task 3 is completed. Verify README and Workshop Guide assertions pass.

---

### Task 3: Author Wiki Documentation (`wiki/Peru.md`, `wiki/Home.md`, `wiki/_Sidebar.md`)

**Files:**
- Create: `wiki/Peru.md`
- Modify: `wiki/Home.md`
- Modify: `wiki/_Sidebar.md`

**Interfaces:**
- Consumes: Complete namelist rosters and historical dossier for PRU.
- Produces: Detailed wiki documentation page and indexed sidebar links.

- [ ] **Step 1: Create `wiki/Peru.md`**
  - Document Peruvian naval doctrine: *Marina de Guerra del Perú* history, Ramón Castilla's steam revolution, Chincha Islands War, War of the Pacific (*Huáscar* and Miguel Grau), 1906 Vickers cruisers, pioneer submarine force, 1941 conflict with Ecuador, and vanilla fixes.
  - Include summary tables for all 21 ship namelist groups (Group Tag, UI Name, Target Ship Types, Entry Count, Sample Names, Description).

- [ ] **Step 2: Update `wiki/Home.md`**
  - Add Peru (`PRU`) row to the Nations Overview table.

- [ ] **Step 3: Update `wiki/_Sidebar.md`**
  - Add `[[Peru|Peru]]` to the sidebar list in alphabetical order.

---

### Task 4: Execute Full Validation, Pester Tests & Packaging Verification

**Files:**
- Test: `tests/Shipnames.Tests.ps1`
- Test: `tests/Documentation.Tests.ps1`
- Test: `tests/BuildScript.Tests.ps1`

- [ ] **Step 1: Run full Pester test suite**
  - Run: `powershell -File .\build.ps1 -Test`
  - Expected: PASS on all tests across all 3 test files (0 failures).

- [ ] **Step 2: Run release packaging verification**
  - Run: `powershell -File .\build.ps1 -Package`
  - Expected: Clean distribution ZIP built in `release/` excluding dev artifacts, tests, and documentation.

- [ ] **Step 3: Check Git status**
  - Run: `git status`
  - Expected: Clean working directory tracking all created and modified files.
