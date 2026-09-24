---
name: hoi4-isne-ship-namelist-authoring
description: >-
  Runbook for researching historical naval doctrine, class naming traditions, and authoring
  immersive ship namelists for Hearts of Iron IV in the Immersive Ship Names Expanded (ISNE) mod.
  Use when adding a new nation or expanding existing national ship namelists into ship-type specific
  and universal thematic topic categories.
---

# Hearts of Iron IV Ship Namelist Authoring Runbook

This skill provides step-by-step guidance for researching, scoping, authoring, and validating naval ship namelists for *Immersive Ship Names Expanded* (ISNE).

---

## 1. Guiding Philosophy: Historical Plausibility Over Rigid Accuracy

> [!IMPORTANT]
> The primary design philosophy of **Immersive Ship Names Expanded** is **historical plausibility**, NOT strict historical accuracy.

### What Historical Plausibility Means in ISNE:
- **Scalability for Gameplay**: Rigid historical accuracy artificially limits namelists only to hulls that historically entered commission (e.g., only 2 coastal defense ships and 5 submarines for Finland). When a player or AI mobilizes, expands dockyards, and constructs large wartime fleets (fleet carriers, heavy cruisers, battlecruisers, destroyers), rigid accuracy fails and ships receive generic numbered stubs.
- **Authentic Extrapolation**: Namelists must plausibly extrapolate how that nation's naval command would designate expanded fleets, drawing on:
  - Official class naming traditions (e.g., naming destroyers after fast natural phenomena, martial virtues, or historical naval commanders).
  - Geographic hierarchies (e.g., battleships after provinces/regions, cruisers after major coastal towns/ports, escorts after minor bays or straits).
  - Peacetime naval expansion plans, canceled designs, and war emergency programs.
  - National heritage, heroic folklore, mythological deities, and fauna (birds of prey for carriers, aquatic predators for submarines).
  - Alternative-history trajectories (e.g., monarchist dynasties, regional leagues, great-power ambitions).

---

## 2. Two-Category Namelist Architecture

Every nation's ship namelists must be organized into two distinct functional categories:

### A. Ship-Type Specific Category
Dedicated namelists bound to specific `ship_types` tokens. These represent the nation's primary naval doctrine and official ship classification traditions (modeled after `ISNE_FIN_ship_names.txt`):
- **Destroyers & Escorts (`DD`)**: Gunboats, torpedo craft, martial descriptors, weather/lightning virtues.
  - Tokens: `ship_hull_light destroyer`
  - Tag pattern: `<TAG>_DD_HISTORICAL`
- **Submarines (`SS`)**: Aquatic animals, sea beasts, mythological water deities/monsters.
  - Tokens: `ship_hull_submarine submarine`
  - Tag pattern: `<TAG>_SS_HISTORICAL`
- **Light Cruisers (`CL`)**: Major coastal cities, ports, trade centers.
  - Tokens: `ship_hull_cruiser light_cruiser`
  - Tag pattern: `<TAG>_CL_HISTORICAL`
- **Heavy Cruisers & Coastal Defense (`CA`)**: Epic cultural heroes, mythic figures, national champions.
  - Tokens: `ship_hull_cruiser heavy_cruiser`
  - Tag pattern: `<TAG>_CA_HISTORICAL`
- **Battleships & Capital Ships (`BB`)**: Historical provinces, regions, legendary monarchs.
  - Tokens: `ship_hull_heavy battleship battle_cruiser`
  - Tag pattern: `<TAG>_BB_HISTORICAL`
- **Aircraft Carriers (`CV`)**: Sky deities, heavens, weather phenomena, raptors/birds of prey.
  - Tokens: `ship_hull_carrier carrier`
  - Tag pattern: `<TAG>_CV_HISTORICAL`

### B. Thematic / Topic Namelist Category (Universal Selection)
Expansive thematic pools designed for universal selection across **any ship type** in the Ship Designer. By omitting the `ship_types` restriction (or defining universal coverage), players have complete roleplay freedom to designate entire flotillas or specialized task forces:
- **Fauna & Nature**:
  - Birds & Raptors (`<TAG>_BIRDS`)
  - Aquatic Life & Fish (`<TAG>_FISH`)
  - Predators & Beasts (`<TAG>_BEASTS`)
- **Geography**:
  - Major & Coastal Cities (`<TAG>_CITIES`)
  - Historical Provinces & Counties (`<TAG>_PROVINCES`)
  - Rivers, Lakes & Waterways (`<TAG>_RIVERS`)
  - Mountains & Geographic Landmarks (`<TAG>_GEOGRAPHY`)
- **History & Culture**:
  - Legendary Monarchs & Rulers (`<TAG>_RULERS`)
  - Mythological Figures & Deities (`<TAG>_MYTHOLOGY`)
  - Famous Historical Battles & Victories (`<TAG>_BATTLES`)
  - National Heroes & Cultural Icons (`<TAG>_HEROES`)
- **Martial Virtues & Concepts**:
  - Virtues & Character Traits (`<TAG>_VIRTUES`)
  - Weather, Tempests & Celestial Bodies (`<TAG>_NATURE`)

> [!TIP]
> **UI Display Name Sizing**: The Hearts of Iron IV Ship Designer namelist dropdown has a narrow layout and handles long strings poorly.
> - Keep all display names (`name = "..."`) concise (**<= 25–30 characters**).
> - **Omit redundant country prefixes/adjectives** (e.g. use `name = "Cities"` rather than `name = "Finnish Cities"`, `name = "Monarchs"` rather than `name = "Habsburg & Babenberg Monarchs"`).

---

## 3. Research Protocol

### Investigating Naval Programs & Traditions
1. **Historical Navy & Canceled Programs**:
   - Investigate peacetime fleets, interwar naval acts, and emergency wartime construction programs.
   - Note ship naming conventions used across different eras (e.g. 19th-century sail/steam transitions, World War I, and interwar designs).
2. **Geographical & Cultural Grounding**:
   - Compile lists of major coastal cities, trade ports, provinces, islands, and bodies of water.
   - Research folklore, epics (e.g. Kalevala, Norse sagas, Arthurian legends), and national mythology.
   - Identify native fauna associated with speed, flight, or aquatic prowess.
3. **Vanilla Inspection via Build Tool (Token-Efficient)**:
   Avoid loading massive vanilla files into context. Use the automated inspector:
   ```powershell
   # Inspect vanilla coverage, group tags, and entry counts
   powershell -File .\build.ps1 -InspectVanilla <TAG>

   # Inspect a specific group without reading the whole file
   powershell -File .\build.ps1 -InspectVanilla <TAG> -Group <GROUP_TAG>
   ```
4. **Additive Loading & Tag Overrides**:
   - Files in `common/units/names_ships/` are loaded additively. ISNE files (`ISNE_<TAG>_ship_names.txt`) coexist with vanilla.
   - Using a vanilla tag (e.g., `<TAG>_DD_HISTORICAL`) **overrides** that vanilla list in game.
   - Defining a new tag adds a new selectable list in the Ship Designer.
   - Omitted vanilla tags remain untouched in the game engine.

---

## 4. Historical & Linguistic Verification Protocol

Before finalizing any namelist file, verify:

- [ ] **1. Linguistic Precision & Grammar**:
  - Are all names in the proper grammatical form (typically nominative singular)?
  - Are native diacritics (*ä, ö, å, é, è, ü, ł, ś, etc.*) correctly preserved?
  - Are articles, prepositions, or apostrophes formatted cleanly according to native orthography (e.g., *L'Audacieux*, *De Zeven Provinciën*)?
- [ ] **2. UI Display Name Length**:
  - Are all `name = "..."` display strings concise (**<= 25–30 characters**, maximum 32)?
  - Have redundant national adjectives (e.g., "Austrian ...", "Finnish ...") been omitted for cleaner UI rendering?
- [ ] **3. Naval Prefixes**:
  - Apply national prefixes where customary via `prefix = "..."` (e.g., `HMS `, `USS `, `ORP `, `HSwMS `) or leave blank if managed at country level.
- [ ] **4. Scalability & Depth**:
  - Provide sufficient depth: 15–30+ unique names for major classes so active players never exhaust the lists during wartime expansion.
  - Always provide a numbered fallback format (e.g. `fallback_name = "Hävittäjä %d"`).
- [ ] **5. Two-Category Balance**:
  - Are all standard hull types covered with doctrine-aligned ship-type namelists?
  - Are multiple rich topic namelists provided for universal hull selection?

---

## 5. Namelist File Syntax & Invariants

File path: `common/units/names_ships/ISNE_<TAG>_ship_names.txt`

```pdx
##### <COUNTRY> NAVAL NAME LISTS (ISNE) #####

### SHIP-TYPE SPECIFIC: DESTROYERS & ESCORTS ###
<TAG>_DD_HISTORICAL = {
	name = NAME_THEME_HISTORICAL_DESTROYERS

	for_countries = { <TAG> }

	type = ship
	ship_types = { ship_hull_light destroyer }

	fallback_name = "<Fallback> %d"

	unique = {
		"Name1" "Name2" "Name3"
	}
}

### UNIVERSAL TOPIC: BIRDS ###
<TAG>_BIRDS = {
	name = "Birds"

	for_countries = { <TAG> }

	type = ship
	# Omit ship_types for universal hull availability

	fallback_name = "<Bird> %d"

	unique = {
		"Eagle" "Falcon" "Hawk" "Osprey"
	}
}
```

### Critical Syntax Rules:
- **Encoding**: UTF-8 without BOM.
- **Curly Braces**: Strictly balanced `{}`.
- **Display Name Length**: Group `name = "..."` values must not exceed 30–32 characters to prevent visual truncation in the Ship Designer dropdown UI.
- **Valid Hull Tokens**:
  `battle_cruiser`, `battleship`, `capital_ship`, `carrier`, `destroyer`, `heavy_cruiser`, `light_cruiser`, `screen_ship`, `ship_hull_carrier`, `ship_hull_cruiser`, `ship_hull_cruiser_submarine`, `ship_hull_heavy`, `ship_hull_light`, `ship_hull_midget_submarine`, `ship_hull_submarine`, `submarine`.
- **Ordered Blocks**: Unique integer keys (if using `ordered = { ... }`).
- **No Empty Blocks**: Never leave empty `unique = { }` or `ordered = { }` blocks.
- **No Self-Links**: `link_numbering_with` must never reference its own group tag.
- **Global Tag Uniqueness**: Root-level group tags must be completely unique across the entire repository.

---

## 6. Documentation & Workshop Synchronization

Whenever a country's namelists are added or updated:

1. **`WORKSHOP_DESCRIPTION_GUIDELINES.md`**:
   - Add/update the row in the **Repository Cross-Reference** table:
     `| ISNE_<TAG>_ship_names.txt | <Country> | <TAG> | Included (<Summary of highlights>) |`
   - Add/update the country entry under `[h1]Included nations:[/h1]` using Steam BBCode:
     ```bbcode
     [b]<Country>[/b]
     - <Category Name>: Brief summary with italicized in-game examples ([i]Ship Name[/i])
     ```
   - Remove completed nations from `[h1]Planned:[/h1]`.
2. **`README.md`**:
   - Add the new country tag, name, and file path to the **Included Nations Summary** table.
3. **Wiki Documentation (`wiki/`)**:
   - Create or update the detailed page at `wiki/<Nation>.md` with full tables of group tags, types, and sample names.
   - Update `wiki/Home.md` and `wiki/_Sidebar.md` when introducing a new nation.
   - Push wiki changes:
     ```powershell
     powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Document <TAG> ship namelists"
     ```
4. **Steam Workshop Description Standards**:
   - Strictly **no emojis** anywhere.
   - Stay within Steam's ~17,000 character limit (concise bullets, no quote blocks).
   - If requested in chat, provide the complete, ready-to-copy BBCode text block.

---

## 7. Build, Validation & Test Protocol

Run validation and tests from the mod root:

```powershell
# 1. Syntax, engine invariant, and bracket validation
powershell -File .\build.ps1 -ValidateOnly

# 2. Automated Pester unit test suite (engine rules, docs sync, build script)
powershell -File .\build.ps1 -Test

# 3. Release packaging verification (ensures clean ZIP excluding dev artifacts)
powershell -File .\build.ps1 -Package

# 4. Live launcher link (optional: connects Paradox launcher directly to repo)
powershell -File .\build.ps1 -DevLink
```
