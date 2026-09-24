# Engine Mechanics

This page explains how Hearts of Iron IV loads and processes ship namelist files, and the technical rules that govern how ISNE works.

---

## Additive File Loading

HoI4 loads **all files** in `common/units/names_ships/` additively at game start. This means:

- A file named `ISNE_FIN_ship_names.txt` coexists alongside vanilla `FIN_ship_names.txt`.
- Both files are active simultaneously.
- There is **no overwrite of the whole file** — only individual group tags can be overridden.

The ISNE file naming prefix (`ISNE_<TAG>_`) ensures ISNE files do not collide with vanilla files at the filesystem level.

---

## Tag Overriding vs. Additive Groups

Within the additive loading system, **individual group tags** follow a last-write-wins rule:

| Scenario | Result |
|:---|:---|
| ISNE defines `FIN_DD_HISTORICAL` (same as vanilla) | ISNE's version **overrides** vanilla for that group |
| ISNE defines `FIN_DE_HISTORICAL` (new tag, no vanilla equivalent) | ISNE adds a **new group** available in-game |
| ISNE omits a vanilla group | Vanilla definition remains **untouched** |

This means:
- You only need to define groups you actually want to change or expand.
- Any vanilla group not referenced in ISNE continues to work normally.

---

## Group Syntax Reference

```pdx
TAG_CATEGORY_THEME = 
{
    name = "UI Display Name or LOCALIZATION_KEY"

    for_countries = { TAG }

    can_use = { always = yes }

    type = ship

    ship_types = { ship_hull_light destroyer }

    # Optional prefix:
    prefix = "HMS "

    fallback_name = "Destroyer %d"

    unique = {
        "Ship One" "Ship Two" "Ship Three"
    }

    # Alternatively, ordered numbering:
    # ordered = {
    #     1 = "1st Ship"
    #     2 = "2nd Ship"
    # }
}
```

---

## Valid `ship_types` Tokens

The game engine expects tokens corresponding to naval subunit types and ship hulls:

- `ship_hull_light`, `destroyer`
- `ship_hull_cruiser`, `light_cruiser`, `heavy_cruiser`
- `ship_hull_heavy`, `battleship`, `battle_cruiser`
- `ship_hull_carrier`, `carrier`
- `ship_hull_submarine`, `submarine`, `ship_hull_cruiser_submarine`, `ship_hull_midget_submarine`
- `screen_ship`, `capital_ship`
