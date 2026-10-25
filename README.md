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

- All ship namelists reside in `common/units/names_ships/<TAG>_ship_names.txt`, the vanilla path and file name, so that each file takes the place of the vanilla one.
- How the game loads name list files, why ISNE replaces the vanilla files, and which tokens a group may use: [Engine Mechanics](https://github.com/TheCreepero/immersive_shipnames_expanded/wiki/Engine-Mechanics) in the wiki.

### Overhauls & New Thematic Pools
- **Vanilla Historical Groups**: All historical groups (e.g. `FIN_DD_HISTORICAL`, `BRA_BB_HISTORICAL`) are overhauled with complete class lineages, eliminating vanilla typos and non-combat entries.
- **New Thematic Groups**: ISNE introduces rich universal thematic groups following `<TAG>_<THEME>` (e.g. `Cities`, `Provinces`, `Heroes`, `Fauna`) selectable for any hull type in the Ship Designer.

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

# Publish update to Steam Workshop via SteamCMD (supports -DryRun). Under the Modding Manager, releases run
# through its Publish-Mod.ps1 and the hoi4-mod-release skill instead; -PublishSteam serves a standalone checkout.
powershell -File .\build.ps1 -PublishSteam -DryRun
powershell -File .\build.ps1 -PublishSteam -ChangeNote "Add Finnish ship namelists"
```

### AI Agent Configuration

Development rules live in `AGENTS.md` (short form; `GEMINI.md` and `CLAUDE.md` import it) and `docs/isne-agent-guide.md` (long form). The namelist authoring and audit runbooks are maintained as mirrored skills for two AI agents, `.agents/` (Google Antigravity) and `.claude/` (Claude Code); the subagent briefs live once in `.claude/agents/`, and a hook in `.claude/hooks/` protects the files the Modding Manager syncs. Changes to project skills must be applied to both mirrors. Neither folder is included in mod packages.

---

## Included Nations Summary

| Tag | Nation | Source File |
| :--- | :--- | :--- |
| `ARG` | Argentina | `ARG_ship_names.txt` |
| `AUS` | Austria | `AUS_ship_names.txt` |
| `BRA` | Brazil | `BRA_ship_names.txt` |
| `CAN` | Canada | `CAN_ship_names.txt` |
| `CHL` | Chile | `CHL_ship_names.txt` |
| `CUB` | Cuba | `CUB_ship_names.txt` |
| `DEN` | Denmark | `DEN_ship_names.txt` |
| `FIN` | Finland | `FIN_ship_names.txt` |
| `ITA` | Italy | `ITA_ship_names.txt` |
| `MEX` | Mexico | `MEX_ship_names.txt` |
| `NOR` | Norway | `NOR_ship_names.txt` |
| `PER` | Iran | `PER_ship_names.txt` |
| `PHI` | Philippines | `PHI_ship_names.txt` |
| `POR` | Portugal | `POR_ship_names.txt` |
| `PRU` | Peru | `PRU_ship_names.txt` |
| `ROM` | Romania | `ROM_ship_names.txt` |
| `SWE` | Sweden | `SWE_ship_names.txt` |
| `TUR` | Turkey | `TUR_ship_names.txt` |
| `USA` | United States | `USA_ship_names.txt` |
| `YUG` | Yugoslavia | `YUG_ship_names.txt` |

Candidate nations for future namelists are ranked in [docs/ROADMAP.md](docs/ROADMAP.md).

*(Refer to [WORKSHOP_DESCRIPTION_GUIDELINES.md](WORKSHOP_DESCRIPTION_GUIDELINES.md) for full descriptions, examples, and Steam BBCode formatting rules).*
