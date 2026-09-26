# Immersive Ship Names Expanded (ISNE)

A Hearts of Iron IV mod providing immersive, linguistically accurate, and historically plausible naval ship namelists for historical and alternate-history campaigns.

---

## Overview

Vanilla Hearts of Iron IV ship namelists often run dry during extended naval campaigns, large fleet expansions, and alternate-history paths, leaving players with generic or numbered placeholders.

**ISNE** expands and refines naval namelists with:
- **Historical Plausibility & Naval Traditions**: Designations anchored in authentic peacetime construction programs, naval traditions, regional ship-naming schemes, and mythological/cultural heritage.
- **Linguistic Precision**: Proper grammatical casing, agreement, and native diacritics (e.g. *Väinämöinen*, *Hämeenmaa*, *L'Audacieux*).
- **Comprehensive Coverage**: Complete flavor across all hull categories: fleet destroyers, escort destroyers/torpedo boats, submarines, light cruisers, heavy cruisers/coastal defense ships, battleships/battlecruisers, and aircraft carriers.

---

## Technical Architecture & Engine Mechanics

### File Structure & Clean Replacement
- All ship namelists reside in:
  ```text
  common/units/names_ships/<TAG>_ship_names.txt
  ```
- By matching the exact filename of vanilla namelists (`<TAG>_ship_names.txt`), Hearts of Iron IV's Virtual File System (VFS) cleanly replaces the vanilla file. This prevents Clausewitz additive merging bugs (which duplicate prefixes like `NRB NRB` or `BACH BACH` and leave vanilla typos/duplicate ships at the front of lists).

### Overhauls & New Thematic Pools
- **Vanilla Historical Groups**: All historical groups (e.g. `FIN_DD_HISTORICAL`, `BRA_BB_HISTORICAL`) are overhauled with complete class lineages, eliminating vanilla typos and non-combat entries.
- **New Thematic Groups**: ISNE introduces rich universal thematic groups following `<TAG>_<THEME>` (e.g. `Cities`, `Provinces`, `Heroes`, `Fauna`) selectable for any hull type in the Ship Designer.

### Ship Namelist Invariants
- **Recognized Hull Subunit Tokens**: In `ship_types = { ... }`, only valid naval combat tokens are recognized:
  `battle_cruiser`, `battleship`, `capital_ship`, `carrier`, `destroyer`, `heavy_cruiser`, `light_cruiser`, `screen_ship`, `ship_hull_carrier`, `ship_hull_cruiser`, `ship_hull_cruiser_submarine`, `ship_hull_heavy`, `ship_hull_light`, `ship_hull_midget_submarine`, `ship_hull_submarine`, `submarine`.
- **Ordered & Unique Blocks**: Keys inside `ordered = { ... }` must be unique integers (`1 = "..."`). Blocks must not be empty.
- **Fallback Formats**: Every group requires a `fallback_name` containing an ordinal token (`%d` for Arabic, `%s` for Roman numerals).
- **Link Numbering**: `link_numbering_with` is used exclusively across separate external groups. Self-referential links are invalid.
- **Encoding**: Files must be UTF-8 without BOM with balanced brackets `{}` and quotes `"`.

---

## Developer Automation (`build.ps1`)

The repository includes a PowerShell automation tool (`build.ps1`) for validation, live local testing, release packaging, and Steam Workshop publishing.

### Key Commands

```powershell
# Validate syntax, bracket balance, double quotes, duplicate keys, and ship subunit tokens
powershell -File .\build.ps1 -ValidateOnly

# Run full automated Pester unit test suites (ship namelists, documentation, build automation)
powershell -File .\build.ps1 -Test

# DevLink: Point Paradox Launcher directly to this dev folder (zero-copy live editing)
powershell -File .\build.ps1 -DevLink

# Deploy: Copy files into local Paradox Interactive mod directory
powershell -File .\build.ps1 -Deploy

# Package: Build a clean distribution zip (isne.zip) excluding git/dev artifacts
powershell -File .\build.ps1 -Package

# Inspect vanilla ship files for a country tag
powershell -File .\build.ps1 -InspectVanilla FIN
powershell -File .\build.ps1 -InspectVanilla ENG -Group ENG_DD_HISTORICAL

# Publish update to Steam Workshop via SteamCMD (supports -DryRun)
powershell -File .\build.ps1 -PublishSteam -DryRun
powershell -File .\build.ps1 -PublishSteam -ChangeNote "Add Finnish ship namelists"
```

---

## Included Nations Summary

| Tag | Nation | Source File |
| :--- | :--- | :--- |
| `ARG` | Argentina | `ARG_ship_names.txt` |
| `AUS` | Austria | `AUS_ship_names.txt` |
| `BRA` | Brazil | `BRA_ship_names.txt` |
| `CHL` | Chile | `CHL_ship_names.txt` |
| `CUB` | Cuba | `CUB_ship_names.txt` |
| `DEN` | Denmark | `DEN_ship_names.txt` |
| `FIN` | Finland | `FIN_ship_names.txt` |
| `NOR` | Norway | `NOR_ship_names.txt` |
| `SWE` | Sweden | `SWE_ship_names.txt` |
| `TUR` | Turkey | `TUR_ship_names.txt` |
| `YUG` | Yugoslavia | `YUG_ship_names.txt` |

*(Refer to [WORKSHOP_DESCRIPTION_GUIDELINES.md](WORKSHOP_DESCRIPTION_GUIDELINES.md) for full descriptions, examples, and Steam BBCode formatting rules).*
