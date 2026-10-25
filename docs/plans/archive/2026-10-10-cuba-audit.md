# Cuba (CUB) Namelist Audit - 2026-10-10

File: `common/units/names_ships/CUB_ship_names.txt`

## Initial report (`-Audit CUB`)
- AUDIT SUMMARY CUB: FAIL=2 WARN=5 INFO=3
- [FAIL] CrossClass CL/BB : La Habana, Matanzas, Pinar del Río, Camagüey
- [FAIL] MissingHull - : Missing CUB_BC_HISTORICAL; BB group also carries battle_cruiser (split BB/BC by doctrine)
- [WARN] Depth PROVINCES : 30 names; target 35 (floor 20 met)
- [WARN] Depth RIVERS : 32 names; target 35 (floor 20 met)
- [WARN] Depth BATTLES : 31 names; target 35 (floor 20 met)
- [WARN] Depth MYTHOLOGY : 28 names; target 35 (floor 20 met)
- [WARN] VanillaPrefix - : Vanilla prefix 'ARC ' vs mod ''; keep parity or document why
- [INFO] CrossClassPerson CL/BB : Santiago de Cuba ~ Cuba
- [INFO] PlanFile - : No docs/plans/*-cuba-*.md (create one with -AuditPlan CUB before review)
- [INFO] Prefix - : No prefix defined in any group
- Found on manual review: 
  - `PROVINCES` display name "Provinces" did not describe a pool of provinces, sierras, cays, peninsulas and peaks.
  - `MYTHOLOGY` held two historical caciques (Hatuey, Guamá).
  - Anachronisms in `DD` and `BATTLES`: Moncada (1953) and El Jigüe (1958); `DD` also carried El Zanjón, the 1878 capitulation pact, as a battle honour.
  - Unattested battle honours: Sabanilla (`DD`, `BATTLES`), San Jerónimo and Potrero de Consuegra (`DD`).
  - Wrong forms: Jíbaro, Loma de Hierro, Jobito (`DD`), Colina de San Juan (`BATTLES`), bare Máximo for the Río Máximo (`DD`).
  - `CV` listed "La Sabana" (inherited from vanilla) under rivers; no Cuban river has that name.
  - Centella appeared in both `DD` and `CV`.

## User decisions
- Prefix: keep the namelist prefix-free (vanilla `ARC ` is the Colombian Navy's prefix; documented in `wiki/Cuba.md`).
- Depth: top up all four thin thematic pools (`PROVINCES`, `RIVERS`, `BATTLES`, `MYTHOLOGY`) to 35+.

## Research
Two budgeted dispatches of `isne-audit-researcher` (18 + 14 web calls). Main sources: EcuRed (combat articles, "Fortificaciones españolas en Cuba", cacicazgo and zemi articles, Arroyo Naranjo chronology), Spanish and English Wikipedia, Navypedia, UNESCO (San Pedro de la Roca listing).

**Suspects**
- El Salado: kept. Combat of 8 Jan 1869, Mármol vs Valmaseda (EcuRed: Combate de El Salado; Wikipedia: Battle of El Salado).
- Melones: kept. 9 Jan 1874, Calixto García, northern Holguín (EcuRed: Combate de Melones).
- Guisa: kept. Taken by Calixto García on 28–29 Nov 1897 (EcuRed: Toma de Guisa (1897)).
- Taguasco: kept. Attack of 7–9 Aug 1895 under Serafín Sánchez (EcuRed: Ataque a Taguasco).
- Jíbaro → El Jíbaro: combat of 28 Feb 1874, Máximo Gómez (EcuRed: Combate de El Jíbaro (1874)).
- Loma de Hierro → Loma del Hierro: 21 Aug 1896, Calixto García, near Gibara (EcuRed: Loma del Hierro).
- Jobito → El Jobito: 13 May 1895, Antonio Maceo (EcuRed: Combate de El Jobito).
- Tumbas de Estorino: kept. 26 Sep 1896, Maceo, Pinar del Río (EcuRed: Combate de Tumbas de Estorino).
- Máximo → Río Máximo: the river exists in Camagüey (EcuRed: Humedal del Río Máximo; Ramsar site 1237).
- Sabanilla, San Jerónimo, Potrero de Consuegra: no combat found; removed.
- La Sabana (`CV`): no river of that name; removed.

**New entries**
- Battles: Las Taironas (17 Jan 1896), Sao del Indio (31 Aug 1895), Coliseo (23 Dec 1895), La Indiana (12 Aug 1871), Manaquitas (17 Nov 1896), Paso Real de San Diego (1 Feb 1896), El Rubí (20 Mar and 10 Nov 1896), Jiguaní (attack of 1897): EcuRed combat articles and Wikipedia. La Sacra (9 Nov 1873, Máximo Gómez) rests on one source (EcuRed 1873 chronology).
- `BC` fortifications: La Socapa and Castillo de la Estrella (UNESCO, EcuRed: Fortaleza La Estrella); Batería de Santa Clara, Batería de la Reina, Torreón de Bacuranao (EcuRed: Fortificaciones españolas en Cuba); Castillo de Seboruco (Baracoa, begun 1739); Fuerte El Viso (El Caney). The other fortresses and the straits are well-known places, added without a dispatch.
- `BC` cacicazgos: Cubanacán, Guamuhaya (EcuRed: Cacicazgo de Guamuhaya), Maniabón, Hanábana.
- `BC` landing sites: Duaba (Maceo, 1 Apr 1895), Playitas de Cajobabo (Martí and Gómez, 11 Apr 1895).
- Mythology: Boinayel, Márohu, Guataubá, Coatrisquie, Guahayona, Deminán Caracaracol, Itiba Cahubaba, Opiyelguobirán, Maquetaurie Guayaba (Pané's *Relación*; Wikipedia: Taíno mythology; EcuRed), Orisha Oko (Wikipedia: Oko (orisha)), Güije and Madre de Aguas (Wikipedia).

**Candidates dropped as unverified or unsuitable**
- Battles: Cocal del Olimpo, Montezuelo, Naranjo (not found); Saratoga (reads as the US carrier).
- `BC`: Maraví, Fuerte de la Loma; cacicazgos Guaniguanico, Ornofay, Marién, Maisí, Yucayo, Sabaneque, Cueiba, Bayatiquirí, Barajagua, Baní, Guanahacabibes, Boyuca, Magón (no source found within the budget); Macaca (unfortunate homonym).
- Mythology: Oddúa (treated as an aspect of Obatalá), Dadá, Oké, Babujal, Yayael (no source); Sikán (Abakuá, outside the pool's Taíno and orisha scope).

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| DD_HISTORICAL | 102 -> 102 | El Jíbaro, Loma del Hierro, El Jobito, Las Taironas, Sao del Indio, Coliseo, La Indiana, Manaquitas, Paso Real de San Diego, Jiguaní, Río Máximo | El Jigüe, Sabanilla, Moncada, El Zanjón, Jíbaro, Potrero de Consuegra, Loma de Hierro, Jobito, San Jerónimo, Centella, Máximo | - |
| CL_HISTORICAL | 55 -> 55 | Ciudad de La Habana, Ciudad de Matanzas, Ciudad de Pinar del Río, Ciudad de Camagüey | La Habana, Matanzas, Pinar del Río, Camagüey | - |
| BB_HISTORICAL | 31 -> 31 | - | - | ShipTypes 'ship_hull_heavy battleship battle_cruiser' -> 'ship_hull_heavy battleship' |
| BC_HISTORICAL | new, 32 | Tres Reyes del Morro, La Cabaña, La Real Fuerza, La Punta, Castillo del Príncipe, Castillo de Atarés, Castillo de Jagua, San Pedro de la Roca, San Severino, El Morrillo, Fuerte Matachín, Torreón de la Chorrera, Torreón de Cojímar, Torreón de San Lázaro, La Socapa, Castillo de la Estrella, Batería de Santa Clara, Batería de la Reina, Castillo de Seboruco, Torreón de Bacuranao, Fuerte El Viso, Estrecho de la Florida, Canal de Yucatán, Paso de los Vientos, Canal Viejo de Bahama, Canal de San Nicolás, Cubanacán, Guamuhaya, Maniabón, Hanábana, Duaba, Playitas de Cajobabo | - | - |
| CV_HISTORICAL | 40 -> 39 | - | La Sabana | - |
| PROVINCES | 30 -> 40 | Jardines de la Reina, Jardines del Rey, Sierra Cristal, Sierra de Nipe, Valle del Yumurí, Península de Hicacos, Gran Piedra, Topes de Collantes, Valle de los Ingenios, Archipiélago de los Canarreos | - | ThemeName 'Provinces' -> 'Provinces & Regions' |
| HEROES | 39 -> 41 | Hatuey (from MYTHOLOGY), Guamá (from MYTHOLOGY) | - | - |
| BATTLES | 31 -> 41 | Loma de San Juan, Las Taironas, Sao del Indio, Coliseo, La Indiana, Manaquitas, Paso Real de San Diego, El Jíbaro, Loma del Hierro, Taguasco, El Jobito, Tumbas de Estorino, El Rubí, La Sacra | Colina de San Juan, El Jigüe, Sabanilla, Moncada | - |
| MYTHOLOGY | 28 -> 38 | Boinayel, Márohu, Guataubá, Coatrisquie, Guahayona, Deminán Caracaracol, Itiba Cahubaba, Opiyelguobirán, Maquetaurie Guayaba, Orisha Oko, Güije, Madre de Aguas | Hatuey (to HEROES), Guamá (to HEROES) | - |
| RIVERS | 32 -> 38 | Río Caonao, Río Sagua de Tánamo, Río Saramaguacán, Río Hatiguanico, Río Guaso, Río Jobabo | - | - |

Unchanged: SS_HISTORICAL, CA_HISTORICAL, CITIES, FAUNA
<!-- END CHANGE TABLE -->

## Rationale
- **CL/BB collision**: the six historical provinces stay in `BB` (macro-regions, §2). The four provincial capitals in `CL` take the native designation "Ciudad de …" (shown as removed + added).
- **New `CUB_BC_HISTORICAL`** (32 names), per BC doctrine: coastal fortresses and batteries, straits, Taíno cacicazgos (native realm titles), and the 1895 landing sites of the Mambí expeditions. `battle_cruiser` removed from `BB` ship_types. No prefix; fallback `"Crucero de Batalla %d"`.
- **Respellings** (removed + added in the table): Jíbaro → El Jíbaro, Loma de Hierro → Loma del Hierro, Jobito → El Jobito, Máximo → Río Máximo (`DD`); Colina de San Juan → Loma de San Juan (`BATTLES`, the Cuban name of the hill).
- **Anachronisms removed**: Moncada (1953) and El Jigüe (1958) postdate the game era and belong to the 1950s revolution. El Zanjón is the 1878 capitulation, not an honour.
- **Hatuey and Guamá** moved from `MYTHOLOGY` to `HEROES`: historical caciques, not mythic beings. Both stay in `DD` (Hatuey was a Cuban Navy gunboat).
- **Centella** removed from `DD` (kept in `CV` with the other storm names).
- **`PROVINCES`** display name → "Provinces & Regions" to match its content; tag unchanged.
- **Top-ups**: `PROVINCES` 30 → 40, `RIVERS` 32 → 38, `BATTLES` 31 → 41, `MYTHOLOGY` 28 → 38. `MYTHOLOGY` gains a "Cuban Folklore Beings" section.
- `DD` keeps 102 names: seven removals replaced by seven verified battle honours.

## Persons verified
- **`CA` (37), all well documented** figures of the 1851–1898 independence movement: José Martí; Antonio Maceo; Máximo Gómez; Calixto García; Carlos Manuel de Céspedes; Ignacio Agramonte; Vicente García González; Juan Bruno Zayas; Serafín Sánchez; Guillermón Moncada; Flor Crombet; Quintín Banderas; Bartolomé Masó; Pedro Agustín Pérez; Salvador Cisneros Betancourt; Julio Sanguily; Néstor Aranguren; Manuel de Quesada; Donato Mármol; José María Rodríguez; José Lacret Morlot; Emilio Núñez; Francisco Carrillo; Francisco Vicente Aguilera; Perucho Figueredo; José Maceo; Manuel Sanguily; Bernabé Boza; Modesto Díaz; Félix Varela; Mariana Grajales; Marta Abreu; Ana Betancourt; Joaquín de Agüero; Narciso López; Gaspar Betancourt Cisneros.
- **Adolfo del Castillo** (`CA`, `HEROES`): brigadier general, Brigada del Centro de La Habana; lieutenant colonel at Santa María del Rosario (9 Feb 1896); killed at La Chorrera del Calvario on 25 Oct 1897 (EcuRed: Combates de Santa María del Rosario; EcuRed: Anexo, hechos históricos de Arroyo Naranjo). The death rests on one source.
- **`HEROES` (41)**: the 37 `CA` names plus José de la Luz y Caballero (well documented), Hatuey (Taíno cacique, well documented), Guamá (traditional Taíno cacique of the Baracoa resistance; his record is thinner than Hatuey's and rests largely on Cuban national tradition) and Enrique Villuendas.
- **Enrique Villuendas** (`DD`, `HEROES`): Enrique Villuendas de la Torre (1874–1905), Liberation Army colonel and politician (EcuRed: Enrique Villuendas); namesake of a Cuban coast-guard gunboat built in 1899 (Navypedia).
- **`DD`**: Hatuey and Guamá as above. No other persons.
- **`BB`**: Fulgencio Batista (well documented; inherited from vanilla).
- **`SS`, `CL`, `BC`, `CV`, other pools**: no persons. Mythic beings in `SS`, `CV` and `MYTHOLOGY` are listed under Research.

## Author confirmation
None. Not a person, but worth a glance: La Sacra (`BATTLES`) is single-sourced.

## Kept on judgment
- `VanillaPrefix` (WARN): kept prefix-free by user decision; `ARC ` is the Colombian Navy's prefix.
- `CrossClassPerson` CL/BB "Santiago de Cuba ~ Cuba": a city and the country; different names.
- `CrossClassPerson` CL/BC "Santa Clara ~ Batería de Santa Clara": a city in Las Villas and a Havana coastal battery; unrelated places.
- Olofin and Olorun (`MYTHOLOGY`, legacy): distinct names of the supreme being in Cuban Santería; kept as two entries.
- `CA` and `HEROES` share 37 names: a hull group and a universal pool may overlap.
- Osun and Oshún (`MYTHOLOGY`, legacy): different beings with close spellings (the guardian staff orisha and the river orisha); both kept.
- Guamuhaya (`BC`) and Sierra de Escambray (`BB`): the same massif under two names, one a cacicazgo title and one the mountain range; different names, both kept.
- Fulgencio Batista (`BB`, legacy): the only twentieth-century politician in the roster; kept as a vanilla entry and the leading Cuban figure at the 1936 start.

## Role pools
| Role | Verdict | Reason |
|---|---|---|
| Gunboats / patrol craft | considered, skipped | covered by `DD` (historical gunboat section: Baire, Yara, Patria, Hatuey, Enrique Villuendas, the three date names) |
| Coast-guard cutters / submarine chasers | considered, skipped | historical units carried numbers (CS-, GC-), no naming convention |
| Frigates / escorts | considered, skipped | the post-war Tacoma-class names (José Martí, Antonio Maceo, Máximo Gómez) are covered by `CA` |
| Training ships | considered, skipped | one ship (*Patria*), below the floor; in `DD` |
| All other roles (minelayers, minesweepers, carriers, tenders, monitors, auxiliaries) | considered, skipped | no Cuban precedent |

## Review
`isne-code-reviewer` (Sonnet): **approve**; no Critical, no Important, five Minor.
1. Guamá's historicity is weaker than Hatuey's: wording softened in Persons verified; entry kept.
2. "Castillo del Morro" was ambiguous between the Havana and Santiago castles, both in `BC`: renamed "Tres Reyes del Morro".
3. Guamuhaya / Sierra de Escambray, 4. Osun / Oshún, 5. Fulgencio Batista: recorded under Kept on judgment.
