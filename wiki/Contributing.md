# Contributing

This page describes how to contribute new ship namelists or expand existing ones in the ISNE project.

---

## Quick Start

1. **Clone the repository:**
   ```
   git clone https://github.com/TheCreepero/immersive_shipnames_expanded.git
   ```
2. **Set up a dev link** so changes are live in your Paradox launcher immediately:
   ```powershell
   powershell -File .\build.ps1 -DevLink
   ```
3. **Validate** before committing:
   ```powershell
   powershell -File .\build.ps1 -ValidateOnly
   ```
4. **Run tests**:
   ```powershell
   powershell -File .\build.ps1 -Test
   ```

---

## File Structure

All ship namelist files live in:
```
common/units/names_ships/ISNE_<TAG>_ship_names.txt
```

---

## Authoring a New Ship Namelist

### Step 1 — Research

Before writing:
- **Historical Navy Lists**: Research historical combatants, planned ships, cancelled classes, and unbuilt naval expansion programs (e.g. Two-Ocean Navy Act, Z-Plan, Project 23, 1938 Naval Program).
- **Class Naming Conventions**: Did the nation name battleships after provinces/states? Cruisers after cities? Destroyers after naval heroes, winds, rivers, or virtues?
- **Prefixes**: Does the navy use an official ship prefix (e.g., *USS*, *HMS*, *ORP*)?
- **Alternate History**: What naming schemes would a growing naval power employ?

### Step 2 — Check Vanilla Coverage

Use the build script to inspect vanilla lists:
```powershell
powershell -File .\build.ps1 -InspectVanilla SWE
powershell -File .\build.ps1 -InspectVanilla ENG -Group ENG_DD_HISTORICAL
```

### Step 3 — Write the Namelist

- Encode strictly in **UTF-8 without BOM**.
- Ensure matching braces `{}` and quotes `"`.
- Verify every group has a `fallback_name` with `%d` or `%s`.
- Run validation:
  ```powershell
  powershell -File .\build.ps1 -ValidateOnly
  ```
