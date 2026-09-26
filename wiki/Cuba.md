# Cuba (CUB) Ship Namelists

Source file: `common/units/names_ships/CUB_ship_names.txt`

---

## Overview

The *Marina de Guerra* (Cuban Navy) maintained an active presence in the Caribbean throughout the early-to-mid 20th century. Following independence, Cuba constructed a modest coastal and territorial defense fleet centered on the cruiser *Cuba* (1911 flagship), the training gunboat/cruiser *Patria* (1911), and a series of gunboats such as *Baire* (1906), *Hatuey*, *Yara*, *Enrique Villuendas*, *20 de Mayo*, *Diez de Octubre*, and *Veinticuatro de Febrero*. During World War II, Cuba aligned with the Allies and contributed actively to Caribbean anti-submarine convoy escort operations, with the Cuban submarine chaser *CS-13* famously sinking the German submarine *U-176* in the Florida Straits in May 1943. In the post-war era, the fleet incorporated Tacoma-class frigates named in honour of Cuba's supreme independence titans: *José Martí*, *Antonio Maceo*, and *Máximo Gómez*.

In vanilla Hearts of Iron IV, Cuba's ship namelist file (`CUB_ship_names.txt`) suffered from severe structural and historical corruptions:
- **Erroneous National Prefix:** Vanilla assigned `prefix = "ARC "`, which stands for *Armada de la República de Colombia* (the Colombian Navy). The historical pre-1959 Cuban Navy (*Marina de Guerra Constitucional* / *Marina de Guerra*) did not employ a standardized English-style hull prefix.
- **Typographical Error:** Marianao (a prominent historic municipality of Havana) was misspelled as `"Marinao"`.
- **Verbatim Destroyer↔Submarine Duplication:** The submarine roster was a verbatim 9-name copy-paste of the destroyer roster, placing revolutionary dates and gunboats on submarines.
- **Verbatim Cruiser Duplication:** Heavy cruisers were an exact 5-name mirror of the light cruiser list.
- **Foreign Heads of State as Dreadnoughts:** Capital ship stubs consisted of only two ships, including US President *"Theodore Roosevelt"* as a Cuban battleship.
- **Extremely Shallow Rosters:** All classes exhausted almost immediately upon naval production (DD: 9 names, CL: 5 names, CA: 5 names, BB: 2 names, BC: 2 names, CV: 4 names, SS: 9 names).
- **Absence of Thematic Pools:** Zero universal thematic pools were provided for the Ship Designer.

**ISNE** completely overhauls Cuba's ship namelists: removing the erroneous Colombian prefix, fixing typographical errors, doctrinally segregating ship classes, removing foreign leaders, and providing expansive universal thematic pools covering Cuban cities, provinces, founding heroes, historic battles, Taíno and Afro-Cuban mythology, wildlife, and waterways.

---

## Namelist Groups

### Ship-Type Specific Category

Dedicated namelists tied to specific ship hulls and naval classifications:

| Group Tag | Type | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `CUB_DD_HISTORICAL` | Destroyers & Escorts | `ship_hull_light destroyer` | Diez de Octubre, Veinticuatro de Febrero, Veinte de Mayo, Patria, Yara, Baire, Enrique Villuendas, Caribe, Siboney, Hatuey, Mal Tiempo, Las Guásimas, Dos Ríos, Audaz, Intrépido |
| `CUB_SS_HISTORICAL` | Submarines | `ship_hull_submarine submarine` | Caguama, Manatí, Delfín, Tiburón, Barracuda, Carey, Cocodrilo, Morena, Aguja, Manjuarí, Almiquí, Majá, Yucajú, Atabey, Olokun, Cabo Maisí, Cabo Cruz, Cabo San Antonio |
| `CUB_CL_HISTORICAL` | Light Cruisers | `ship_hull_cruiser light_cruiser` | La Habana, Santiago de Cuba, Cienfuegos, Matanzas, Marianao, Guantánamo, Holguín, Bayamo, Trinidad, Cárdenas, Manzanillo, Nuevitas, Sagua la Grande, Sancti Spíritus, Santa Clara |
| `CUB_CA_HISTORICAL` | Heavy Cruisers & Coastal Defense | `ship_hull_cruiser heavy_cruiser` | José Martí, Antonio Maceo, Máximo Gómez, Calixto García, Carlos Manuel de Céspedes, Ignacio Agramonte, Vicente García González, Juan Bruno Zayas, Serafín Sánchez, Guillermón Moncada |
| `CUB_BB_HISTORICAL` | Battleships & Capital Ships | `ship_hull_heavy battleship battle_cruiser` | Cuba, República de Cuba, Isla de Cuba, Pinar del Río, Las Villas, Camagüey, Oriente, Isla de Pinos, Soberanía, Constitución, Libertad, Independencia, Victoria, Fulgencio Batista |
| `CUB_CV_HISTORICAL` | Aircraft Carriers | `ship_hull_carrier carrier` | Río Cauto, Río Toa, Río Almendares, Río Sagua la Grande, Río Zaza, Río Cuyaguateje, Bahía de Nipe, Golfo de Guacanayabo, Huracán, Ciclón, Changó, Oyá, Tocororo, Gavilán |

---

### Universal Thematic Topic Category (Ship Designer)

Universal selection pools available for any ship hull or squadron in the Ship Designer:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `CUB_CITIES` | Cities | Universal | La Habana, Santiago de Cuba, Camagüey, Holguín, Santa Clara, Guantánamo, Cienfuegos, Matanzas, Bayamo, Pinar del Río, Cárdenas, Manzanillo, Sancti Spíritus, Ciego de Ávila, Marianao |
| `CUB_PROVINCES` | Provinces | Universal | Pinar del Río, La Habana, Matanzas, Las Villas, Camagüey, Oriente, Isla de Pinos, Sierra Maestra, Sierra del Rosario, Sierra de los Órganos, Sierra de Cubitas, Sierra de Escambray |
| `CUB_HEROES` | Heroes | Universal | José Martí, Antonio Maceo, Máximo Gómez, Calixto García, Carlos Manuel de Céspedes, Ignacio Agramonte, Vicente García González, Juan Bruno Zayas, Serafín Sánchez, Guillermón Moncada |
| `CUB_BATTLES` | Battles & Dates | Universal | Diez de Octubre, Veinticuatro de Febrero, Veinte de Mayo, Grito de Yara, Grito de Baire, Dos Ríos, Las Guásimas, El Caney, Colina de San Juan, Mal Tiempo, Peralejo, Palo Seco |
| `CUB_MYTHOLOGY` | Mythology | Universal | Hatuey, Guamá, Atabey, Yucajú, Guabancex, Huracán, Yemayá, Olokun, Changó, Oshún, Obatalá, Elegguá, Oggún, Babalú-Ayé, Oyá, Inle, Agayú, Orunmila, Osain |
| `CUB_FAUNA` | Fauna | Universal | Tocororo, Zunzuncito, Gavilán, Cernícalo, Halcón, Flamenco, Cotorra, Pelícano, Caguama, Manatí, Delfín, Tiburón, Barracuda, Cocodrilo, Majá, Almiquí, Jutía, Carey |
| `CUB_RIVERS` | Rivers & Waterways | Universal | Río Cauto, Río Toa, Río Almendares, Río Sagua la Grande, Río Zaza, Río Cuyaguateje, Río Jatibonico, Río Damují, Bahía de Nipe, Golfo de Guacanayabo, Bahía de Cienfuegos, Bahía de La Habana |
