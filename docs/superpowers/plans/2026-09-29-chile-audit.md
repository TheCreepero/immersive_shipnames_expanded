# Chile (CHL) Namelist Audit — 2026-09-29

File: `common/units/names_ships/CHL_ship_names.txt`

## Initial report (`-Audit CHL`)
- FAIL=4: `CrossClass` CL/BC (Chacabuco, Iquique, Arica, Valdivia, Talcahuano, Rancagua, Caldera, Papudo, Penco, Pisagua), CA/BB (25 names: the founding fathers, presidents and admirals were duplicated wholesale), CL/CA (Blanco Encalada, Esmeralda, O'Higgins), CL/BB (Blanco Encalada, Constitución).
- WARN=0. All depths already met target.
- Found on manual review, not by the script:
  - The same person appears in two capital classes under different forms: Pinto (CL `Presidente Pinto` / CA+BB `Aníbal Pinto`), Errázuriz, Portales (CL `Ministro Portales` / BB `Diego Portales`), Baquedano (CL `Baquedano`, `General Baquedano` / CA+BB `Manuel Baquedano`), Prat, Cochrane.
  - `CHL_BC_HISTORICAL` duplicated 41 of the 43 names in the `CHL_BATTLES` thematic pool, and most were land battles. That breaks the §2 BC doctrine.
  - BB mottos without a source: `Libertad y Orden` is Colombia's motto, and `Razón y Fuerza` misquotes the national motto.
  - `CHL_MAPUCHE` "Mapuche Warriors" held ethnonyms, animals, battle sites, Mapudungun numerals and Huarpe lakes.
  - DD held about 12 bare surnames with no traceable person.
  - SS `Loco` is an English homonym.

## User decisions
None required. No `VanillaPrefix`, `Depth` or `ThemeCount` finding, so the checkpoint questions did not apply.

## Research
One `isne-historical-researcher` dispatch (Sonnet). Main sources:
- armada.cl: *principales acciones navales* and biographies.
- es.wikipedia:
  - *Anexo: Buques históricos de la Armada de Chile de la era a vela*.
  - *Comandante en jefe de la Armada de Chile*.
  - *Toqui*.
  - *Anexo: Presidentes de Chile*.
  - *Sistema de fuertes de Valdivia* and *Sistema de fuertes de Chiloé*.
- Esmeralda (1879) crew roster.
- Cervantes Virtual (*La Araucana*).

## Class doctrine applied
- **CL**: protected cruisers (Blanco Encalada, Chacabuco, Ministro Zenteno, Presidente Errázuriz, Presidente Pinto) and port cities.
- **CA**: armored cruisers (O'Higgins, Esmeralda), admirals and naval commanders, historical toquis.
- **BB**: authentic battleship names (Almirante Latorre, Almirante Cochrane, Capitán Prat, Constitución, Libertad), presidents, founding fathers, sovereignty symbols and mottos.
- **BC** (§2): decisive naval engagements and amphibious operations, historic warships and prizes, coastal fortresses, straits and channels. Land battles stay in the `CHL_BATTLES` thematic pool.

## Per-group changes

| Group | Before → After | Added | Removed | Respelled / moved |
|---|---|---|---|---|
| DD | 138 → 125 | — | Medina, López, Fuenzalida, Amigo, Garrao, Ortiz Yáñez, Alférez Ortiz (no source); Segura, Cruz (ambiguous); Gana, Castillo (no naval eponym); Catrileo (unverified), Meli (numeral), as in MAPUCHE | Contreras → Guardiamarina Contreras (1896 torpedo boat); Alférez Díaz → Grumete Díaz (Venancio Díaz, Esmeralda; patrol boat LPC-1814) |
| SS | 83 → 81 | — | Loco (English homonym); Catrileo (unverified, as in MAPUCHE) | Ainavillo → Aillavilú; Comandante Hyatt → Hyatt (the Oberon boat's name; Eduardo Hyatt was an engineer, not a commander; review fix) |
| FAUNA | 54 → 53 | — | Loco (English homonym, as in SS; review fix) | — |
| CL | 70 → 60 | — | Esmeralda, O'Higgins (kept in CA); Baquedano, General Baquedano (person kept in CA); Ministro Portales (person kept in BB); Constitución (BB); Iquique, Papudo, Caldera, Pisagua (naval battles kept in BC) | — |
| CA | 45 → 40 | Almirante Wilson, Almirante Nef, Almirante Molinas, Almirante Castillo, Almirante Señoret, Almirante Muñoz Hurtado, Almirante Pérez Gacitúa, Almirante Langlois, Capitán Forster, Capitán Wilkinson, Capitán Wooster, Capitán Vidal Gormaz, Comandante Bynnon, Paillamachu, Lientur, Quilapán | Founding fathers and presidents kept in BB: Bernardo O'Higgins, José Miguel Carrera, Manuel Rodríguez, Diego Portales, Ramón Freire, Manuel Bulnes, José de San Martín, Camilo Henríquez, Pedro de Valdivia, José Manuel Balmaceda, Mariano Egaña, Andrés Bello. BB names: Almirante Cochrane, Lord Cochrane, Capitán Prat, Arturo Prat, Almirante Latorre. CL persons: Blanco Encalada, Manuel Blanco Encalada, Aníbal Pinto, Federico Errázuriz | Ainavillo → Aillavilú |
| BB | 42 → 40 | Joaquín Prieto, José Joaquín Pérez, Domingo Santa María, Germán Riesco, Ramón Barros Luco, Juan Luis Sanfuentes, José Tomás Ovalle, Mateo de Toro y Zambrano, José Miguel Infante, Manuel de Salas, Juan Egaña, Vencer o Morir, Primera Junta, Patria Vieja | Blanco Encalada, Manuel Blanco Encalada, Aníbal Pinto, Federico Errázuriz (CL); Arturo Prat, Lord Cochrane (same persons as Capitán Prat / Almirante Cochrane); Manuel Baquedano, Patricio Lynch, Carlos Condell, Almirante Riveros (CA); Libertad y Orden (Colombian motto), Unión Nacional, Estado de Chile, Igualdad, Fraternidad, Justicia (no source) | Razón y Fuerza → Por la Razón o la Fuerza (national motto, ratified 1920) |
| BC | 41 → 34 | Naval actions: Islay, Chipana, Mollendo, Ilo, Pisco, Curayaco, Punta Pichalo. Warships and prizes: María Isabel, Covadonga, Aquiles, Arequipeño, Confederación, Monteagudo, Moctezuma. Fortresses: Castillo de Niebla, San Sebastián de la Cruz, San Pedro de Alcántara, Amargos, Castillo San José. Straits and channels: Canal Chacao, Golfo de Penas, Primera Angostura | Land battles (kept in `CHL_BATTLES`): Chacabuco, Maipú, Yungay, Chorrillos, Miraflores, Huamachuco, Rancagua, San Carlos, Yerbas Buenas, El Roble, Cancha Rayada, Curapaligüe, Bellavista, Penco, Dolores, Tarapacá, Tacna, Campo de la Alianza, Topáter, San Juan, San Francisco, La Concepción, Portada de Guías, Buin, Quechereguas, El Membrillar, Tres Acequias, Concón, Placilla. City names kept in CL: Talcahuano, Valdivia, Arica. Socabaya was proposed but not added, because the file header documents vanilla's Socabaya as a misassigned captured vessel | Moved from CV: Estrecho de Magallanes, Canal Beagle, Cabo de Hornos |
| CV | 43 → 40 | — | — | Estrecho de Magallanes, Canal Beagle, Cabo de Hornos moved to BC; Armando Cortinez → Armando Cortínez |
| HEROES | 56 → 53 | — | Contreras, Gana, Castillo (bare surnames with no single identifiable hero) | — |
| MAPUCHE | 39 → 38 | Malloquete, Lemucaguín, Paillataru, Cadeguala, Cayancura, Guanoalca, Quintuguenu, Paillaeco, Vilumilla, Curiñancu (toquis), Mañil (1851 cacique), Leucotón (*La Araucana*; 1920s minelayer) | Catrileo, Calcurián, Mariguenu, Antifil, Pailacar (unverified); Meli (numeral "four"); Millarapue (battle); Guanacache (Huarpe lakes); Nahuel, Pangui (animals); Huilliche, Pehuenche, Pikunche (peoples) | Display name `Mapuche Warriors` → `Mapuche Heroes`, because the pool includes Ercilla's heroines and non-combatant leaders; Ainavillo → Aillavilú; Lemu-Lemu → Lemolemo |

## Kept on judgment
- **CA `O'Higgins` / BB `Bernardo O'Higgins`**: the same person in two capital classes, kept deliberately.
  - `O'Higgins` is the historical 1897 armored cruiser, the archetypal Chilean cruiser name.
  - `Bernardo O'Higgins` is the supreme founding father, as BB doctrine requires.
  - The two strings differ and `-Audit` raises no `CrossClassVariant`.
  - Every other same-person pair across CL/CA/BB was resolved.
- **CA `Ignacio Carrera Pinto` / BB `José Miguel Carrera`**: different persons.
- **BB `Pedro Montt` and `Manuel Montt` / CA `Almirante Montt` (Jorge Montt)**: different persons.
- **BB `Juan Egaña` and `Mariano Egaña`**: father and son, both founders.
- **DD `Teniente Rodríguez` and `Ingeniero Mery`**: attested names of 1896 Chilean torpedo boats (armada.cl, *Torpedero Ingeniero Mutilla*), although the eponyms are unresolved. They are kept as documented ship names. Bare `Rodríguez` is Manuel Rodríguez.
- **DD bare surnames kept**: the Esmeralda (1879) and Covadonga crews, and Chilean navy ship eponyms (see Persons verified).
- **MAPUCHE Ercilla characters** (Guacolda, Tegualda, Fresia, Glaura, Orompello, Elicura, Rengo, Lemolemo, Leucotón): literary national heritage. Several were Chilean submarine or minelayer names.
- **HEROES `Egaña` and `Vergara`**: bare surnames that point to documented figures (the Egaña founders; José Francisco Vergara).
- **BC land/sea overlap**: DD keeps `Papudo`, `Angamos` and `Huáscar`. DD/BC overlap is outside the cross-class rule.

## Role pools
| Role | Verdict | Reason |
|---|---|---|
| Torpedo boats, torpedo gunboats | considered, skipped | Covered by DD (Mapuche-heroine and rank + surname series; Almirante Lynch/Condell) |
| Gunboats, monitors | considered, skipped | Covered by DD (Magallanes, Pilcomayo, Huáscar) |
| Submarine sub-types | considered, skipped | Covered by SS |
| Patrol vessels | considered, skipped | Same rank + crew-surname formula as DD, and nearly all names are already in DD |
| Icebreakers / Antarctic | considered, skipped | Fewer than 10 (Yelcho, Piloto Pardo, Almirante Viel, Lientur) |
| Training ships | considered, skipped | Fewer than 10 (Esmeralda series, Baquedano) |
| Corvettes / frigates | considered, skipped | 6 names, all naval battle names already in BC/CA/DD |
| Minelayers / minesweepers | considered, skipped | About 6. The Golub-class Mapuche names went to MAPUCHE (Leucotón) |

## Persons verified
- **CA admirals**: Wilson (Arturo Wilson Navarrete), Nef (Francisco Nef Jara), Molinas (Francisco Javier Molinas Gacitúa), Castillo (Luis Anacleto Castillo Goñi), Pérez Gacitúa (Lindor Pérez Gacitúa), Muñoz Hurtado (Joaquín Muñoz Hurtado), Langlois (Luis Langlois Vidal).
  - Source: es.wikipedia *Comandante en jefe de la Armada de Chile*, plus armada.cl biographies for Wilson and Nef.
  - Señoret (Manuel Señoret): attested for the Pilcomayo capture, Angamos and the Magallanes naval outpost.
- **CA captains**:
  - armada.cl biographies: Forster (Robert Forster), Wilkinson (Guillermo Wilkinson), Wooster (Charles Wooster; 1818 squadron page).
  - es.wikipedia *Santiago Jorge Bynnon*: Bynnon.
  - Well documented: Vidal Gormaz (Francisco Vidal Gormaz, hydrographer).
- **CA / MAPUCHE toquis**:
  - es.wikipedia *Toqui*: Paillamachu, Lientur, Malloquete, Lemucaguín, Paillataru, Cadeguala, Cayancura, Guanoalca, Quintuguenu, Paillaeco, Vilumilla, Curiñancu, Aillavilú, Antiguenu, Huenecura, Turcupichun.
  - Attested, not fetched: Quilapán.
  - es.wikipedia *Revolución de 1851*: Mañil.
  - en.wikipedia *Juan Lorenzo Colipí*: Colipí.
- **BB presidents**: es.wikipedia *Anexo: Presidentes de Chile*.
- **BB founding era and mottos**:
  - Well documented: Toro y Zambrano, Infante, Salas, Juan Egaña.
  - es.wikipedia *Por la razón o la fuerza*: *Por la Razón o la Fuerza*.
  - La Tercera, 2024-10-23: *Vencer o Morir* (Armada motto, 1889) and *Honor y Gloria* (pre-1889 Armada motto, kept).
  - armada.cl: *Primera Junta* (18 Sep 1810).
- **DD eponyms**:
  - Esmeralda roster and es.wikipedia *Corbeta Esmeralda (1855)*: Sánchez (Francisco Sánchez Alvaradejo), Hurtado (Antonio Hurtado Rojas), Salinas (Grumete Santiago Salinas), Grumete Díaz (Venancio Díaz).
  - armada.cl: Cabrales (Gaspar Cabrales), Bolados (Luciano Bolados Rivera), Mutilla (Vicente Mutilla Arellano), Micalvi.
  - Toro / Policarpo Toro: Policarpo Toro Hurtado (armada.cl).
  - Bannen: Constantino Bannen Pradel (attested, thin).
  - Sotomayor: Rafael Sotomayor Baeza (well documented).
  - Guardiamarina Contreras: attested 1896 torpedo-boat name (armada.cl).
- **HEROES**:
  - Videla: Pedro Regalado Videla (armada.cl).
  - Zegers: Vicente Zegers Recasens (es.wikipedia Esmeralda).
  - Velásquez: José Velásquez Bórquez (en.wikipedia).
  - Pérez Canto, Montt Salamanca: La Concepción garrison 1882 (es.wikipedia *Combate de Concepción*).
  - Amengual: Recaredo Amengual Novajas (armada.cl).
  - Goñi: José Anacleto Goñi Prieto (armada.cl).
  - Well documented: Lillo (Eusebio Lillo), Escala (Erasmo Escala).
- **BC warships and prizes**:
  - armada.cl, *Captura de la fragata Reina María Isabel*: María Isabel.
  - es.wikipedia *Goleta Covadonga*: Covadonga.
  - es.wikipedia *Anexo: Buques históricos de la Armada de Chile de la era a vela*: Aquiles (brig 1825–39, at Islay and Casma), Arequipeño (brig captured 1839), Confederación (corvette captured 1838), Monteagudo (frigate 1836–39, at Islay), Moctezuma (schooner 1819–28).
- **BC fortresses**:
  - es.wikipedia *Sistema de fuertes de Valdivia*: Niebla, San Sebastián de la Cruz, San Pedro de Alcántara, Amargos.
  - es.wikipedia *Castillo San José*: Castillo San José.
- **CV aviators** (DGAC *Pioneros de la aeronáutica nacional*): Dagoberto Godoy, Armando Cortínez, Manuel Ávalos, Clodomiro Figueroa, Teniente Bello (Alejandro Bello Silva), David Fuentes.

## Review (isne-code-reviewer, Sonnet)
Verdict: PASS WITH MINOR FIXES, no Critical findings.
- **Fixed**:
  - `Loco` was also removed from FAUNA (Important).
  - SS `Comandante Hyatt` → `Hyatt`.
  - Wiki intro wording updated for the Mapuche pool.
  - BC ship and fortress sources added to Persons verified.
- **Kept on judgment**: `Honor y Gloria` (sourced Armada motto); generic BB `Victoria`, `Patria`, `Independencia` (legacy sovereignty-symbol entries); the "Valdivia & Valparaíso" fortress comment (accurate, since Castillo San José is at Valparaíso).
- **Pending author confirmation**: DD `Teniente Rodríguez` and `Ingeniero Mery`. The ship names are attested (1896 torpedo boats) but the eponyms are not identified. `Bannen` has thin attestation.

## Remaining WARNs
None expected after the docs sync.
