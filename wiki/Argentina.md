# Argentina (ARG) Ship Namelists

Source file: `common/units/names_ships/ARG_ship_names.txt`

---

## Overview

The *Armada de la República Argentina* (ARA) stood as one of the premier naval forces of the Americas, actively participating in the fierce late-19th and early-20th-century South American ABC dreadnought race alongside Brazil and Chile. Argentina commissioned two state-of-the-art dreadnoughts (*Rivadavia* and *Moreno*) built by the Fore River Shipbuilding Company in Quincy, Massachusetts, Italian-built *Garibaldi*-class armored cruisers (*Garibaldi*, *San Martín*, *Belgrano*, *Pueyrredón*), Livorno-built *Veinticinco de Mayo*-class heavy cruisers (*Veinticinco de Mayo* and *Almirante Brown*), British-built cruisers and destroyers (*La Argentina*, *Mendoza*, and *Buenos Aires* classes), Italian-built *Tarantinos* submarines (*Santa Fe*, *Santiago del Estero*, *Salta*), and post-war *Colossus*-class aircraft carriers (*Independencia* and *Veinticinco de Mayo*).

In vanilla Hearts of Iron IV, Argentina's ship namelist file (`ARG_ship_names.txt`) suffered from noticeable historical and structural issues:
- **Corvette & Cruiser Confusion**: The light cruiser list inappropriately featured modern 1970s corvettes (*Drummond* / MEKO 140 classes) named after junior naval officers rather than traditional light cruiser names.
- **Copy-Paste Duplication**: The heavy cruiser list duplicated the entire tail of the light cruiser list, including modern corvettes and an internal duplicate entry for `"Rosales"`.
- **Typographical Errors & Patrol Vessels**: Armored cruiser *Pueyrredón* was missing its accent mark (`Pueyrredon`), and river patrol gunboats (*King*, *Murature*) were grouped under heavy cruisers.
- **Provincial Duplication**: The destroyer list contained duplicate references for the same province (`"La Rioja"` and `"Rioja"`).
- **Capital Ship Stubs**: Battleships and battlecruisers were represented by identical, reversed 5-ship stubs, erroneously designating gunboats and schooners (*Azopardo*, *Sarandí*, *Espora*) as capital ships.
- **Carrier & Submarine Exhaustion**: Carrier and submarine pools were capped at just 3 and 6 entries respectively, exhausting immediately under wartime dockyard expansion.

**ISNE** comprehensively redesigns Argentina's naval namelists into two balanced tiers: dedicated ship-type categories grounded in authentic *Armada de la República Argentina* doctrines, and expansive universal thematic pools covering Argentine geography, provinces, historical battles, founding statesmen, rivers, and native fauna.

---

## Namelist Groups

### Ship-Type Specific Category

Dedicated namelists tied to specific ship hulls and naval classifications:

| Group Tag | Type | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `ARG_DD_HISTORICAL` | Destroyers & Escorts | `ship_hull_light destroyer` | Buenos Aires, Catamarca, Córdoba, Jujuy, Almirante Brown, Espora, Rosales, Bouchard, Seguí, Py, Audaz, Intrépido, Pampero |
| `ARG_SS_HISTORICAL` | Submarines | `ship_hull_submarine submarine` | Santa Fe, Santiago del Estero, Salta, San Luis, Santa Cruz, San Juan, San Antonio, Tiburón, Orca, Delfín, Catriel, Namuncurá |
| `ARG_CL_HISTORICAL` | Light Cruisers | `ship_hull_cruiser light_cruiser` | La Argentina, Buenos Aires, Patagonia, Libertad, Independencia, Rosario, Bahía Blanca, Mar del Plata, Puerto Belgrano, Santa Fe |
| `ARG_CA_HISTORICAL` | Heavy Cruisers & Coastal Defense | `ship_hull_cruiser heavy_cruiser` | Veinticinco de Mayo, Almirante Brown, Pueyrredón, General Belgrano, Garibaldi, San Martín, Güemes, Las Heras, Mitre, Sarmiento |
| `ARG_BB_HISTORICAL` | Battleships & Dreadnoughts | `ship_hull_heavy battleship` | Rivadavia, Moreno, Julio Argentino Roca, Bernardino Rivadavia, Mariano Moreno, General San Martín, Manuel Belgrano, Sarmiento, Alberdi |
| `ARG_BC_HISTORICAL` | Battlecruisers | `ship_hull_heavy battle_cruiser` | San Lorenzo, Chacabuco, Maipú, Suipacha, Salta, Tucumán, Vuelta de Obligado, Martín García, Juncal, Los Pozos, Quilmes, Ituzaingó |
| `ARG_CV_HISTORICAL` | Aircraft Carriers | `ship_hull_carrier carrier` | Independencia, Veinticinco de Mayo, República, Libertad, Constitución, General San Martín, Almirante Brown, Cóndor, Águila, Halcón |

---

### Universal Thematic Topic Category (Ship Designer)

Universal selection pools available for any ship hull or squadron in the Ship Designer:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `ARG_PROVINCES` | Provinces | Universal | Buenos Aires, Córdoba, Santa Fe, Mendoza, Tucumán, Entre Ríos, Salta, Corrientes, Santiago del Estero, San Juan, Jujuy, Río Negro |
| `ARG_CITIES` | Cities | Universal | Buenos Aires, Rosario, Córdoba, La Plata, Mar del Plata, Bahía Blanca, Puerto Belgrano, Salta, Santa Fe, Corrientes, Paraná, Ushuaia |
| `ARG_HEROES` | Heroes | Universal | San Martín, Belgrano, Brown, Güemes, Pueyrredón, Moreno, Rivadavia, Sarmiento, Mitre, Urquiza, Bouchard, Espora, Rosales, Seguí |
| `ARG_BATTLES` | Historic Battles | Universal | San Lorenzo, Chacabuco, Maipú, Suipacha, Salta, Tucumán, Vuelta de Obligado, Martín García, Juncal, Los Pozos, Quilmes, Ituzaingó |
| `ARG_RIVERS` | Rivers & Waterways | Universal | Paraná, Uruguay, Río de la Plata, Paraguay, Bermejo, Pilcomayo, Río Negro, Río Colorado, Chubut, Deseado, Santa Cruz, Iguazú |
| `ARG_FAUNA` | Native Fauna | Universal | Cóndor, Águila, Halcón, Yaguareté, Puma, Zorro, Carancho, Gavilán, Albatros, Petrel, Orca, Tiburón, Delfín, Ballena, Hornero |
