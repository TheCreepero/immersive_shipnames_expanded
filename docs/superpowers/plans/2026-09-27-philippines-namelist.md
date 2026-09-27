# Philippines (TAG: PHI) Ship Namelist Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Overhaul and expand the naval ship namelists for the Philippines (`TAG: PHI`) in *Immersive Ship Names Expanded*, eliminating critical vanilla bugs (such as foreign RNZN/RAN frigates in the submarine pool, the fictional "General Manchatas", and 100% duplicate cruiser/capital rosters) while introducing two-category architecture with 11 universal thematic and ideological pools.

**Architecture:** Implement clean VFS file replacement at `common/units/names_ships/PHI_ship_names.txt` overriding all vanilla groups (`PHI_<HULL>_HISTORICAL`), establishing authentic Filipino/Tagalog naval naming doctrine, and adding universal topic and politically segregated ideological pools for the Ship Designer. Synchronize documentation across `README.md`, `WORKSHOP_DESCRIPTION_GUIDELINES.md`, and the GitHub wiki (`wiki/Philippines.md`, `wiki/Home.md`, `wiki/_Sidebar.md`).

**Tech Stack:** Hearts of Iron IV Clausewitz script syntax (namelist blocks, token types, UTF-8 without BOM), PowerShell (ISNE test suite & validation runner `build.ps1`, Pester 6.2.0), Markdown, Steam BBCode.

**Spec:** [SKILL.md](file:///c:/dev/immersive-shipnames-expanded/.agents/skills/hoi4-isne-ship-namelist-authoring/SKILL.md) and Historical Naval Dossier for Philippines (TAG: PHI) provided by Historical Researcher subagent.

## Global Constraints

- File location must be `common/units/names_ships/PHI_ship_names.txt` to cleanly shadow and replace the vanilla file via HoI4 Virtual File System.
- File encoding must be UTF-8 without BOM, with strictly balanced curly braces `{}` and balanced double quotes.
- Ship type tokens in `ship_types = { ... }` must only use recognized engine tokens (`ship_hull_light`, `destroyer`, `ship_hull_submarine`, `submarine`, `ship_hull_cruiser`, `light_cruiser`, `heavy_cruiser`, `ship_hull_heavy`, `battleship`, `battle_cruiser`, `ship_hull_carrier`, `carrier`).
- Prefix string must be `prefix = "RPS "` with a mandatory trailing whitespace, applied consistently across ship-type specific and universal thematic pools.
- Fallback templates must follow standard syntax (`fallback_name = "..." %d`).
- Display names (`name = "..."`) must be <= 25–30 characters (strict maximum 32) and omit redundant national adjectives.
- Universal thematic pools must omit `ship_types` for universal availability across all hulls.
- No fabricated names: all historical figures (datus, rajahs, revolutionary officers, OSP heroes) must be verifiable individuals.
- Ideological separation: distinct dedicated pools for Republican, Socialist, and Nationalist ideals without mixing opposing doctrines.
- Zero-copy single-root workspace layout: all files maintained directly at repository root.

## Review Focus

1. **Foreign ship names in submarine pool**: Ensure all 18 Royal New Zealand Navy (*Hawea*, *Pukaki*, etc.) and Royal Australian Navy (*Echuca*, *Kiama*, etc.) vessels from vanilla are completely purged and replaced with 60+ authentic Philippine marine fauna and mythical sea guardians.
2. **Purge of fictional vanilla entry**: Ensure "General Manchatas" (a vanilla OCR/transcription error) is removed and replaced by verifiable historical commanders (*General Miguel Malvar*, *General Francisco Makabulos*, *General Macario Sakay*).
3. **Decoupling of cross-class duplicates**: Verify that cities (*Manila*, *Cabanatuan*, *Batangas*, *Cadiz*, *Davao*) and provinces (*Luzon*) are not duplicated across Light Cruisers, Heavy Cruisers, Battleships, Battlecruisers, and Carriers.
4. **Prefix trailing whitespace**: Verify that every `prefix = "RPS "` declaration in `PHI_ship_names.txt` has a trailing space so ship names do not concatenate into `RPSManila`.
5. **Documentation and test synchronization**: Verify that adding `PHI_ship_names.txt` immediately passes `tests/Shipnames.Tests.ps1`, `tests/Documentation.Tests.ps1`, and `tests/BuildScript.Tests.ps1`.

---

## Tasks

### Task 1: Author Philippine Ship Namelists (`common/units/names_ships/PHI_ship_names.txt`)

**Files:**
- Create: `common/units/names_ships/PHI_ship_names.txt`

**Interfaces:**
- Consumes: Historical Naval Research Dossier for PHI.
- Produces: 7 Ship-Type Specific namelists and 11 Universal Thematic & Ideological namelists for country tag `PHI`.

- [ ] **Step 1: Draft header, ship-type specific groups, and vanilla bug fixes in `common/units/names_ships/PHI_ship_names.txt`**
  - Group `PHI_DD_HISTORICAL`: Destroyers & Escorts (128 names). Pre-colonial Datus/Rajahs, Katipunan officers, OSP WWII heroes, historic gunboat waterways and straits.
  - Group `PHI_SS_HISTORICAL`: Submarines (62 names). Authentic native marine life, pelagic predators, and mythical sea guardians (*Bakunawa*, *Minokawa*, *Kurita*). Purges vanilla RNZN/RAN frigates.
  - Group `PHI_CL_HISTORICAL`: Light Cruisers (65 names). Major chartered cities, trading ports, and provincial capitals across Luzon, Visayas, Mindanao.
  - Group `PHI_CA_HISTORICAL`: Heavy Cruisers (47 names). Historical provinces of the archipelago, decoupled from cities.
  - Group `PHI_BB_HISTORICAL`: Battleships (42 names). Three Island Groups (*Luzon*, *Visayas*, *Mindanao*), pre-colonial thalassocracies/kingdoms (*Maynila*, *Tondo*, *Madja-as*, *Butuan*, *Sugbu*, *Sulu*, *Maguindanao*), foundational republics, founding fathers.
  - Group `PHI_BC_HISTORICAL`: Battlecruisers (42 names). Capital ship / battlecruiser pool.
  - Group `PHI_CV_HISTORICAL`: Aircraft Carriers (44 names). Volcanic summits, lofty peaks, avian raptors (*Haribon*, *Manaol*, *Banog*), and celestial storm deities (*Apolaki*, *Mayari*, *Kidlat*, *Gugurang*).

- [ ] **Step 2: Add universal thematic pools to `common/units/names_ships/PHI_ship_names.txt`**
  - `PHI_BIRDS`: Birds & Raptors (36 names).
  - `PHI_FISH`: Marine Life & Fish (45 names).
  - `PHI_GEOGRAPHY`: Mountain Peaks & Volcanoes (35 names).
  - `PHI_RIVERS`: Rivers & Waterways (40 names).
  - `PHI_RULERS`: Pre-Colonial Rulers, Datus & Rajahs (35 names).
  - `PHI_HEROES`: Revolutionary Patriots & Heroes (38 names).
  - `PHI_MYTHOLOGY`: Mythological Figures & Deities (35 names).
  - `PHI_VIRTUES`: Martial Virtues & Descriptors (35 names).

- [ ] **Step 3: Add dedicated ideological pools to `common/units/names_ships/PHI_ship_names.txt`**
  - `PHI_REPUBLICAN_IDEALS`: Republican & Constitutional Ideals (35 names).
  - `PHI_SOCIALISM`: Socialist & Agrarian Labor Ideals (35 names).
  - `PHI_NATIONALISM`: Nationalist & Synarchist/Ganap Ideals (35 names).

- [ ] **Step 4: Run syntax and engine validation**
  - Run: `powershell -File .\build.ps1 -ValidateOnly`
  - Expected: PASS with 0 syntax errors, 0 unbalanced braces, valid prefix spacing.

---

### Task 2: Synchronize Repository Documentation (`README.md` & `WORKSHOP_DESCRIPTION_GUIDELINES.md`)

**Files:**
- Modify: `README.md`
- Modify: `WORKSHOP_DESCRIPTION_GUIDELINES.md`

**Interfaces:**
- Consumes: Implemented `PHI` tag and group summary.
- Produces: Updated cross-reference table and workshop description bullets complying with Steam length guidelines.

- [ ] **Step 1: Update `README.md` Included Nations table**
  - Add Philippines (`PHI`) entry to the Included Nations Summary table with link to `wiki/Philippines.md`.

- [ ] **Step 2: Update `WORKSHOP_DESCRIPTION_GUIDELINES.md` Cross-Reference table**
  - Add `PHI_ship_names.txt` row with summary of expanded hulls, purged foreign frigates, and 11 universal thematic pools.

- [ ] **Step 3: Update `WORKSHOP_DESCRIPTION_GUIDELINES.md` Included nations section**
  - Add `[b]Philippines[/b]` entry under `[h1]Included nations:[/h1]` using standard 3-bullet BBCode format without individual ship names.

- [ ] **Step 4: Verify documentation test passes**
  - Run: `powershell -Command "Invoke-Pester -Path tests/Documentation.Tests.ps1 -Output Detailed"`
  - Note: Will fail wiki checks until Task 3 is completed. Verify README and Workshop Guide assertions pass.

---

### Task 3: Author Wiki Documentation (`wiki/Philippines.md`, `wiki/Home.md`, `wiki/_Sidebar.md`)

**Files:**
- Create: `wiki/Philippines.md`
- Modify: `wiki/Home.md`
- Modify: `wiki/_Sidebar.md`

**Interfaces:**
- Consumes: Complete namelist rosters and historical dossier for PHI.
- Produces: Detailed wiki documentation page and indexed sidebar links.

- [ ] **Step 1: Create `wiki/Philippines.md`**
  - Document Philippine naval doctrine: Commonwealth Offshore Patrol (OSP) "Mosquito Fleet", post-war RPS era, naming traditions, and vanilla fixes.
  - Include summary tables for all 18 ship namelist groups (Group Tag, UI Name, Target Ship Types, Entry Count, Sample Names, Description).

- [ ] **Step 2: Update `wiki/Home.md`**
  - Add Philippines (`PHI`) row to the Nations Overview table.

- [ ] **Step 3: Update `wiki/_Sidebar.md`**
  - Add `[[Philippines|Philippines]]` to the sidebar list in alphabetical order.

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
