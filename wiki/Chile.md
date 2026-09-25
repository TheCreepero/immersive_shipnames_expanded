# Chile (CHL) Ship Namelists

Source file: `common/units/names_ships/CHL_ship_names.txt`

---

## Overview

The *Armada de Chile* (Chilean Navy) stood as the decisive naval power along South America's Pacific coast and the third pillar of the historic ABC (*Argentina, Brazil, Chile*) naval race. Drawing on deep naval traditions closely modeled after the British Royal Navy, Chile pioneered the use of revolutionary naval technologies throughout the late 19th and early 20th centuries, including the world's first true Elswick protected cruiser (*Esmeralda* in 1884), the first automotive torpedo kills against an ironclad (*Almirante Lynch* and *Almirante Condell* in 1891), pre-dreadnought battleships (*Capitán Prat*, and *Constitución* and *Libertad* requisitioned as HMS *Swiftsure* and HMS *Triumph*), Armstrong-built super-dreadnoughts (*Almirante Latorre*, and sister *Almirante Cochrane* converted to HMS *Eagle*), Vickers *Serrano*-class destroyers, and British H-class and *Odin*-class submarines (*Guacolda*, *Capitán O'Brien*, *Almirante Simpson*).

In vanilla Hearts of Iron IV, Chile's ship namelist file (`CHL_ship_names.txt`) suffered from severe structural and historical corruptions:
- **Non-Combat Hulks as Dreadnoughts:** An 1875 Scottish 4-masted cargo sailing ship converted into a coal pontoon hulk in Punta Arenas (*County of Peebles*) was assigned as a heavy cruiser, battleship, and battlecruiser.
- **Peacetime Disasters as Battleships:** The 1848 paddle steamer transport *Cazador*, whose 1856 shipwreck claimed 300+ lives in the deadliest peacetime maritime disaster in Chilean history, was placed in battleship and battlecruiser pools.
- **Prize Merchantmen & Schooners:** Frontline combat classes were padded with captured 1830s merchantmen, schooners, and auxiliary steamers (*Lima*, *Peruana*, *Trujillana*, *Betelgeuse*, *Majestic*, *Rímac*, *Rambler*, *Gipsy*, *Thalaba*, *Joven Daniel*, *Fortunata*, *María*, *Begoña*, *Jerezana*, *Dolores*, *Socabaya*, etc.).
- **Intra-List Duplications:** *Orella* was duplicated within destroyers, *Araucano* within heavy cruisers, and *Valparaiso* and *Valparaíso* appeared simultaneously in light cruisers.
- **Cross-Class Hull Mismatches:** Ironclad battleships (*Blanco Encalada*, *Cochrane*) and pre-dreadnought *Capitán Prat* were demoted to destroyers and submarines.
- **Copy-Paste Submarine Tail:** The last 20 entries of the destroyer list were copied verbatim into submarines, assigning destroyers, battleships, and random nouns (*Fósforo* = Matchstick) to submarines.
- **Corrupted Diacritics & Backticks:** Vanilla used backticks instead of standard apostrophes (`Capitán O`Brien`, `O`Higgins`) and stripped diacritics across dozens of names (`Pueyrredn`, `guila`, `Bo Bo`, `Yaez`, `Muoz Gamero`, `Errzuriz`, `Caupolicn`, `Capitn Prat`).

**ISNE** comprehensively rebuilds Chile's naval namelists into two balanced tiers: dedicated ship-type categories grounded in authentic *Armada de Chile* doctrine, and expansive universal thematic pools covering Chilean geography, provinces, historical battles, founding heroes, Mapuche warrior traditions, waterways, and native fauna.

---

## Namelist Groups

### Ship-Type Specific Category

Dedicated namelists tied to specific ship hulls and naval classifications:

| Group Tag | Type | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `CHL_DD_HISTORICAL` | Destroyers & Escorts | `ship_hull_light destroyer` | Serrano, Orella, Riquelme, Hyatt, Videla, Aldea, Almirante Lynch, Almirante Condell, Almirante Riveros, Almirante Williams, Audaz, Intrépido, Relámpago |
| `CHL_SS_HISTORICAL` | Submarines | `ship_hull_submarine submarine` | Guacolda, Tegualda, Rucumilla, Quidora, Fresia, Guale, Capitán O'Brien, Almirante Simpson, Capitán Thomson, General Carrera, Tiburón, Orca, Cachalote |
| `CHL_CL_HISTORICAL` | Light Cruisers | `ship_hull_cruiser light_cruiser` | Chacabuco, Blanco Encalada, Ministro Zenteno, Presidente Errázuriz, Presidente Pinto, Esmeralda, Valparaíso, Concepción, Antofagasta, Iquique, Arica |
| `CHL_CA_HISTORICAL` | Heavy Cruisers & Coastal Defense | `ship_hull_cruiser heavy_cruiser` | O'Higgins, Esmeralda, Blanco Encalada, Almirante Cochrane, Capitán Prat, Bernardo O'Higgins, José Miguel Carrera, Manuel Rodríguez, Lautaro, Caupolicán |
| `CHL_BB_HISTORICAL` | Battleships & Dreadnoughts | `ship_hull_heavy battleship` | Almirante Latorre, Almirante Cochrane, Capitán Prat, Constitución, Libertad, Blanco Encalada, Bernardo O'Higgins, José Miguel Carrera, Diego Portales |
| `CHL_BC_HISTORICAL` | Battlecruisers | `ship_hull_heavy battle_cruiser` | Iquique, Punta Gruesa, Angamos, Chacabuco, Maipú, Abtao, Papudo, Casma, Yungay, Pisagua, Chorrillos, Miraflores, Huamachuco, Rancagua |
| `CHL_CV_HISTORICAL` | Aircraft Carriers | `ship_hull_carrier carrier` | Cóndor, Águila, Halcón, Aguilucho, Carancho, Gavilán, Albatros, Petrel, Los Andes, Aconcagua, Ojos del Salado, Arturo Merino Benítez, Dagoberto Godoy |

---

### Universal Thematic Topic Category (Ship Designer)

Universal selection pools available for any ship hull or squadron in the Ship Designer:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `CHL_CITIES` | Cities | Universal | Santiago, Valparaíso, Concepción, Antofagasta, Iquique, Arica, Coquimbo, La Serena, Valdivia, Puerto Montt, Punta Arenas, Talcahuano, Chillán |
| `CHL_PROVINCES` | Provinces | Universal | Tarapacá, Antofagasta, Atacama, Coquimbo, Aconcagua, Valparaíso, Santiago, O'Higgins, Colchagua, Curicó, Talca, Maule, Linares, Ñuble, Concepción |
| `CHL_HEROES` | Heroes | Universal | Prat, Condell, Lynch, Latorre, Riveros, Williams, Uribe, Serrano, Orella, Riquelme, Aldea, Hyatt, Videla, Cochrane, O'Higgins, Carrera, Rodríguez |
| `CHL_MAPUCHE` | Mapuche Warriors | Universal | Lautaro, Caupolicán, Colocolo, Galvarino, Janequeo, Pelantaro, Guacolda, Tegualda, Fresia, Quidora, Lincoyán, Tucapel, Elicura, Orompello |
| `CHL_BATTLES` | Historic Battles | Universal | Iquique, Punta Gruesa, Angamos, Chacabuco, Maipú, Abtao, Papudo, Casma, Yungay, Pisagua, Chorrillos, Miraflores, Huamachuco, Rancagua |
| `CHL_WATERWAYS` | Waterways & Fjords | Universal | Bío Bío, Mapocho, Maipo, Aconcagua, Maule, Toltén, Calle-Calle, Valdivia, Bueno, Baker, Loa, Magallanes, Beagle, Drake, Cabo de Hornos, Chiloé |
| `CHL_FAUNA` | Native Fauna | Universal | Cóndor, Huemul, Puma, Águila, Halcón, Guanaco, Vicuña, Pudú, Zorro Culpeo, Tiburón, Orca, Cachalote, Delfín, Ballena Azul, Lobo Marino, Albatros |
