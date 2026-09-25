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

### File Structure & Additive Loading
- All ship namelists reside in:
  ```text
  common/units/names_ships/ISNE_<TAG>_ship_names.txt
  ```
- Hearts of Iron IV loads ship namelist files additively. Files prefixed with `ISNE_` do not overwrite vanilla files (`<TAG>_ship_names.txt`), leaving base-game groups intact unless intentionally overridden.

### Tag Overriding & Fallback Behavior
- **Overriding Vanilla Groups**: Declaring a group with an existing base-game tag (e.g., `FIN_DD_HISTORICAL`) overrides that specific group in-game.
- **New Group Tags**: Custom ISNE groups follow the pattern `<TAG>_<CATEGORY>_<THEME/TYPE>`.
- **Scripted References & Fallbacks**: Base-game setup files or events that reference specific vanilla tags automatically fall back to vanilla definitions if omitted from `ISNE_<TAG>`.

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
| `ARG` | Argentina | `ISNE_ARG_ship_names.txt` |
| `AUS` | Austria | `ISNE_AUS_ship_names.txt` |
| `BRA` | Brazil | `ISNE_BRA_ship_names.txt` |
| `CHL` | Chile | `ISNE_CHL_ship_names.txt` |
| `FIN` | Finland | `ISNE_FIN_ship_names.txt` |

*(Refer to [WORKSHOP_DESCRIPTION_GUIDELINES.md](WORKSHOP_DESCRIPTION_GUIDELINES.md) for full descriptions, examples, and Steam BBCode formatting rules).*
