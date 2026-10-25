# Peru (TAG: PRU) Ship Namelist Plan

**Goal:** Replace the vanilla Peruvian namelist (`PRU_ship_names.txt`, 7 groups, 53 names) with a full ISNE namelist. The work breaks the cloned cruiser and capital-ship rosters, restores the *Marina de Guerra del Perú* naming formulas, and adds thematic, ideological and role pools for the Ship Designer.

**Status:** implemented 2026-10-10. The original plan of 2026-09-27 was re-validated against current standards first, as `docs/ROADMAP.md` required. The changes that came out of that are listed under "Changes from the 2026-09-27 plan".

**Sources:**
- Two parallel `isne-historical-researcher` dossiers (2026-10-10): A covered hulls, roles, language and vanilla fixes; B covered thematic and ideological pools. Dossier B was compiled without web lookups.
- Three `isne-audit-researcher` fact-check passes (2026-10-10, 71 web calls in total) on the names neither dossier could source.

## Vanilla Audit Findings (Step 0)

1. **Cloned rosters:** CL and CA were the same 10 names. BB and BC were the same 3 names.
2. **Missing diacritics:** `Ferre` → `Ferré`, `Capitán Quinones` → `Capitán Quiñones`.
3. **Duplicate:** `Angamos` appeared twice in SS.
4. **Shared names:** *Coronel Bolognesi*, *Capitán Quiñones* and *Aguirre* sat in DD, CL and CA at once.
5. **Untraceable name:** `Gloriosa` (BB and BC) matches no Peruvian vessel in either ship list the researchers read. Dropped.
6. **Not a ship:** `República del Perú` (CV) was never a vessel. It moves to BB as a sovereignty symbol.
7. **No mojibake:** the 2026-09-27 plan reported corrupted characters (`Capitn`, `Garca`, `Glvez`). The vanilla file is valid UTF-8 with a BOM, and those names are spelled correctly in it. The earlier reading was a tool artefact.
8. **Prefix:** vanilla uses `BAP ` on every group. Kept on all 22 groups.
9. **Fallbacks:** vanilla's Spanish terms are correct and kept (`Destructor`, `Submarino`, `Crucero Ligero`, `Crucero Pesado`, `Acorazado`, `Crucero de Batalla`, `Portaaviones`).
10. **Thin groups:** DD 12, SS 11 unique, CL 10, CA 10, BB 3, BC 3, CV 3.

All vanilla names except `Gloriosa` are kept. *Rodríguez* is kept as `Teniente Rodríguez`, the form of the 1909 destroyer.

## Changes from the 2026-09-27 plan

- **Ideology gating:** the three ideological pools now carry `can_use` (CLAUDE.md §2B). The old plan had no gating.
- **APRA dropped:** the old `"Socialist & APRA Ideals"` pool is now `"Socialist Ideals"`. APRA was neither communist nor fascist in 1936, so its names would be mislabelled in a `communism`-gated pool.
- **Role pool added:** `PRU_GUNBOATS` (the old plan predates CLAUDE.md §2C).
- **Tags aligned with the standard suffixes:** `PRU_MOUNTAINS` → `PRU_GEOGRAPHY`, `PRU_INCA` → `PRU_RULERS`.
- **Display names changed to describe the final lists:** `"Birds"` (not "Birds of Prey"), `"Aquatic Life"` (not "Marine Fauna", since the pool holds Amazon and Titicaca species), `"Incas & Rulers"`, `"Heroes & Scholars"`, `"Departments & Regions"`, `"Mountains"`.
- **BC doctrine:** the old plan filled BC with battles. BC now follows CLAUDE.md §2 (historic war vessels, fortresses, naval encounters, sea kingdoms). The land battles went to SS and the Battles pool.
- **Capitán Quiñones:** the old plan listed him in both CL and CV. He stays in CL only (real cruiser name).
- **Workshop block:** the 2-bullet format replaces the old plan's 3-bullet format.

## Final Architecture (22 groups)

| Group | Count | Formula |
|---|---|---|
| `PRU_DD_HISTORICAL` | 112 | Historic destroyers and escorts; officers of the *Huáscar* and the squadrons of 1866 and 1879; founders, explorers and scholars of the navy; gunboats, torpedo boats and transports; brigs and schooners of the 1820s and 1830s; extrapolated warriors, regiments, Andean weapons, storms and winds |
| `PRU_SS_HISTORICAL` | 64 | Pioneers (*Toro Submarino*, Blume, the 1911-13 boats); R-class names; the real battle-name boats; further battles in the same formula; extrapolated predators and water spirits |
| `PRU_CL_HISTORICAL` | 56 | The four historic cruiser names; ports with transport and landing-ship precedent; cities; further Pacific and river ports |
| `PRU_CA_HISTORICAL` | 39 | Ironclads and monitors; Inca conquerors and war captains; precursors of independence; champions of 1866 and the War of the Pacific |
| `PRU_BB_HISTORICAL` | 42 | Capital and departments; founders of the Republic; Grand Marshals; sovereignty symbols |
| `PRU_BC_HISTORICAL` | 40 | Historic flagships and war vessels; coastal fortresses and citadels; naval encounters, islands and passages; sea kingdoms of the coast |
| `PRU_CV_HISTORICAL` | 46 | Andean ranges; peaks and volcanoes; sky deities; raptors; aviation pioneers |
| `PRU_GUNBOATS` | 21 | See role pools |
| `PRU_CITIES` | 72 | Cities & Ports |
| `PRU_DEPARTMENTS` | 35 | Departments & Regions |
| `PRU_RIVERS` | 72 | Rivers & Lakes |
| `PRU_GEOGRAPHY` | 60 | Mountains |
| `PRU_RULERS` | 49 | Incas & Rulers |
| `PRU_MYTHOLOGY` | 45 | Mythology |
| `PRU_BATTLES` | 45 | Battles |
| `PRU_HEROES` | 57 | Heroes & Scholars |
| `PRU_BIRDS` | 55 | Birds |
| `PRU_FISH` | 73 | Aquatic Life |
| `PRU_VIRTUES` | 53 | Virtues |
| `PRU_REPUBLICAN_IDEALS` | 34 | `democratic` or `neutrality` |
| `PRU_SOCIALISM` | 33 | `communism`-gated |
| `PRU_NATIONALISM` | 20 | `fascism`-gated |

Depth notes:
- **Ideological pools sit below the 35-name target** (floor 20 met). `PRU_NATIONALISM` has only 7 names specific to the Unión Revolucionaria; the other 13 are corporatist and nationalist vocabulary. It is not padded further.
- **`PRU_REPUBLICAN_IDEALS` gate:** it opens under `democratic` or `neutrality`, as Mexico's does. Peru's non-aligned government in 1936 is the constitutional republic of the 1933 charter, and Peru has no monarchist tradition that would need the `neutrality` slot.
- **No `PRU_MONARCHISM` pool:** Dossier B rated a viceroys pool marginal, because the viceroys read as colonial rulers in republican memory.

## Role Pools: considered / created / skipped

- **River gunboats:** created (`PRU_GUNBOATS`). The Amazon flotilla has existed since the 1860s and names its boats after Amazon rivers and departments. Eleven names are verified pre-1950 vessels: *Morona*, *Pastaza*, *Napo*, *Putumayo* (1862), *Iquitos* (1875), *Coronel Portillo* (c. 1902), *América* (1904), *Loreto*, *Amazonas* (1934), and the Titicaca gunboats *Yavarí* and *Yapurá*. Ten more extend the river formula: *Marañón* and *Ucayali* (the 1951 gunboats; *Ucayali* was also an 1853 paddle steamer) and eight Amazon tributaries. `GUNBOATS` is already in `Get-RolePoolSuffixes`.
- **Monitors:** considered, skipped: five names (*Manco Cápac*, *Atahualpa*, *Victoria*, *Loa*, *Huáscar*), folded into CA.
- **Torpedo boats:** considered, skipped: three names (*República*, *Alianza*, *Alay*). The first two are in DD; *Alay* is left out because its spelling is disputed (*Allay* in one list).
- **Corvettes, frigates, escort destroyers, patrol vessels:** considered, skipped: the post-war corvette and frigate names are the same 1879 officers as DD.
- **Avisos, sloops:** considered, skipped: no such designation in the Peruvian navy.
- **Scout cruisers, flotilla leaders:** considered, skipped: two scout cruisers (*Almirante Grau*, *Coronel Bolognesi*), both in CL.
- **Fast attack craft:** considered, skipped: no precedent before 1945.
- **Minelayers, minesweepers:** considered, skipped: no precedent found.
- **Coastal defense, fast battleships, large and armoured cruisers:** considered, skipped: no series; the ironclads are in CA.
- **Escort and light carriers, seaplane tenders:** considered, skipped: no precedent.
- **Cruiser, coastal and minelaying submarines:** considered, skipped: one submarine formula covers all boats.
- **Auxiliary cruisers and transports:** considered, skipped: the transport and landing-ship names are ports, already in CL.
- **Training ships:** considered, skipped: four names (*Apurímac*, *Loa*, *Independencia*, *Unión*), all in hull groups.
- **Oilers and hydrographic ships:** considered, skipped: not combat roles. The oilfield ports (*Talara*, *Zorritos*, *Lobitos*, *Pimentel*) are in CL and the hydrographers (*Carrasco*, *Stiglich*, *Melo*, *Carrillo*) in DD.
- **Icebreakers, submarine tenders, state yachts:** considered, skipped: no precedent.

## Collision Resolutions

- **Cross-class sets:** CL/CA/BB/BC/CV are mutually exclusive (`-Audit` CrossClass = 0). The single CrossClassPerson INFO, *La Libertad* (department, BB) against *Libertad* (1827 corvette, BC), is a false positive.
- **Single owners of contested names:**
  - *Lima* → BB (capital and department; vanilla BB), although an 1880 cruiser bore the name.
  - *Callao*, *Arequipa*, *Cusco*, *Puno* → CL (vanilla CL); BB leaves those departments out.
  - *Huáscar*, *Independencia*, *Manco Cápac*, *Atahualpa* → CA (ironclads and monitors).
  - *Unión*, *Apurímac*, *Rímac*, *Libertad* → BC (historic war vessels).
  - *Almirante Grau*, *Coronel Bolognesi*, *Capitán Quiñones*, *Aguirre* → CL (real cruiser names); removed from DD.
  - *Junín*, *Ayacucho*, *Tarapacá* → BB (departments); SS and BC do not use them as battles.
  - *Sánchez Carrión* → BB (founder); the corvette name is left out of DD.
- **SS against BC:** the battle names of real boats stay in SS. BC takes the naval encounters no boat was named for (*Punta Gruesa*, *Punta Malpelo*, *Cruces*, *Jambelí*).
- **Person against a vessel named for his title:** *San Martín* (BB) and *Protector* (BC, the 1822 frigate, ex-*Prueba*) are different names; the frigate keeps its own.
- **Role pool against hulls:** zero overlap. *Amazonas*, *Loreto* and *Iquitos* are left out of BB and CL. *América* is left out of CA and BC. *Santa Rosa* (a coastal gunboat of 1883) is in DD, not in the river pool.
- **Same person in DD and another hull:** *Castilla* (DD, 1951 escort) and *Mariscal Castilla* (BB); *Gálvez* (DD) and *José Gálvez* (CA); *Ferré* and *Palacios* (DD) and *Teniente Ferré* and *Teniente Palacios* (SS). The navy reused these names across types, and DD and SS are outside the cross-class rule.
- **Thematic pools:** they stand alone and may repeat hull names, as in the Finnish model file. Rivers use the `Río ...` form (as the navy's own `Río`-named patrol craft do), which keeps them apart from the departments and the river gunboats.

## Linguistic and Verification Notes

- **Orthography:** *Cusco* (vanilla and modern Peruvian form; *Cuzco* was common in the 1930s), *Áncash*, *Pachacútec*, *Viracocha*, *Nazca*. Quechua and Aymara names use the Peruvian Spanish school spelling (c, qu, hu), not the 1985 alphabet.
- **`Diez Canseco`:** kept without an accent, as both ship lists and the family's own usage have it. Dossier A proposed `Díez`.
- **Persons verified (sources):**
  - *Huáscar* crew (Grau, Aguirre, Rodríguez, Carvajal, Gárezon, Palacios, Ferré, Diez Canseco, Santillana, Herrera): es.wikipedia, Combate naval de Angamos. Velarde: es.wikipedia, Combate naval de Iquique. De los Heros: en.wikipedia.
  - Villavicencio, Montero: Dossier A searches. Ferreyros (Carlos, *Pilcomayo* 1879; Manuel, *América* at Abtao), Nicolás Portal (*Unión* 1879): en.wikipedia and es.wikipedia.
  - Vivero, Carrasco, Carrillo: *Marinos Notables del Perú* (Archivo Histórico de Marina). Bouchard: Archivo Histórico de Marina. Boterín (frigate *Amazonas* circumnavigation 1856-58), Caballero y Lastres, Stiglich, Melo, the Valle Riestra brothers: fact-check pass 1.
  - Astete (commanded the *Huáscar* in 1877), Sánchez Lagomarsino (monitor *Manco Cápac* at Arica), Fanning (Guarnición de Marina, died of wounds 16 Jan 1881), Moore (killed on the Morro of Arica), Oyague (sinking of the *Covadonga*, 13 Sep 1880), Clavero (gunboat *América* at La Pedrera): fact-check pass 2.
  - Arica colonels (Arias y Aragüez, Zavala, Inclán, Bustamante): es.wikipedia, Batalla de Arica. De la Colina: es.wikipedia, Batalla de Miraflores. Recavarren, Albarracín, Antonia Moreno: es.wikipedia, Campaña de la Breña. Leonor Ordóñez, Ruiz Gallo, Tito Condemayta, Zela, Vilcapaza, Crespo y Castillo, Paillardelle, Espinar: fact-check pass 2.
  - Grand Marshals (Castilla, Cáceres, La Mar, Gamarra, Orbegoso, Nieto, San Román, Miller, Necochea, Gutiérrez de la Fuente): es.wikipedia and en.wikipedia, Mariscal del Perú.
  - Aviators: Chávez (d. 1910), Tenaud (d. 1911), Velasco Astete (d. 1925), Paulet (d. Jan 1945), Bielovucic (first flight in Peru 1911; d. 1949).
  - Socialism pool: Delfín and Manuel Lévano, Gutarra, Fonkén, Urviola, Zulen, Mayer, Castro Pozo. Nationalism pool: Luis A. Flores, the slogan *El Perú sobre Todo* and the Legión de Camisas Negras (es.wikipedia, Unión Revolucionaria).
- **Vessels verified:** every DD, CA and BC vessel name is in es.wikipedia "Anexo: Buques de la Marina de Guerra del Perú" or en.wikipedia "List of Peruvian Navy ships". That includes the spellings the reviewer queried: *Arequipeña* (goleta, 1828), *Flor de Mar* (goleta, 1830s) and *Catalina* (bergantín, 1830s).
- **Dropped as unverifiable:**
  - Persons: García del Postigo, Forcelledo, Belisario Suárez, Domingo Ayarza, Francisco de Paula Secada, Carlos Martínez de Pinillos (weak single source, alive until 1947).
  - Vessels: *Vigilante*, *Izcuchaca*, *Sachaca*, *Tambo*, *Mayro*, *Cahuapanas*, *Orellana*.
  - Combats: *Mirave*, *Rocafuerte*, *Carcabón*.
  - Other: *Chuchi Cápac* (a title of the Colla lord *Zapana*, who is listed), *Clavero* as a gunboat name (post-1950 class only; the officer is in Heroes), *Castelli* (the schooner *Sacramento* after its renaming; one vessel, one entry).
- **Fact-check corrections:** `Juan Guillermo Moore` (es.wikipedia form; *More* is also in use), `Ñancenpinco`, `Cuniraya`, `Cahuillaca`, `General Lerzundi`.
- **Kept on ship precedent, eponym not confirmed:**
  - *Larrea* (1981 corvette): eponym not identified.
  - *Mariátegui* (1987 frigate): probably the naval officer Ignacio Mariátegui (Dossier A search, medium confidence). The socialism pool uses the full `José Carlos Mariátegui` to keep the two men apart.
  - *Gálvez* (1981 destroyer; a 1947 frigate was *Teniente Gálvez*): which Gálvez the ships honour was not found. `José Gálvez` in CA is the minister killed at the Torre de la Merced on 2 May 1866.
  - *Diez Canseco* (1981 destroyer): Fermín Diez Canseco of the *Huáscar* is on the Angamos crew list, but no source ties the ship name to him.
- **Kept without a web lookup (well documented, author's and researchers' general knowledge):**
  - Persons the fact-check did not reach: Andrés Rázuri (Junín 1824), José Angulo (Cusco 1814), Illa Túpac, the Inca family names from the chronicles (Sarmiento de Gamboa, Betanzos, Garcilaso), Cuismancu and Chuquimancu (Garcilaso, *Comentarios Reales*), González Vigil, Rodríguez de Mendoza, Baquíjano y Carrillo, Rumi Maqui (Teodomiro Gutiérrez Cuevas).
  - Canonical figures not looked up individually (flagged "well documented" in the dossiers and corroborated by the reviewer):
    - Vanilla ship eponyms: Guise, Villar, García y García, Grau, Bolognesi, Quiñones; Federico Blume (SS); Pedro Portillo (*Coronel Portillo*).
    - CA: Cahuide, Rumiñahui, Quisquis, Calcuchímac, Ollantay (the hero of the Quechua drama), Túpac Amaru II, Micaela Bastidas, Pumacahua, Juan Santos Atahualpa, Olaya, Melgar, Parado de Bellido, Alfonso Ugarte, Leoncio Prado, José Gálvez.
    - BB: San Martín, Bolívar, Sucre, Riva-Agüero, Torre Tagle, Unanue, Luna Pizarro, Sánchez Carrión, Vidaurre.
    - BC and Rulers: the Sapa Incas, Naylamp, Tacaynamo, Fempellec, Guacricaur, Minchançaman, Cari, Zapana, Uscovilca.
    - Heroes: Viscardo y Guzmán, Ramón Castilla, Felipe Santiago Salaverry, Daniel Alcides Carrión, Raimondi, Cayetano Heredia, Ricardo Palma, Inca Garcilaso, Federico Villarreal.
    - Ideological pools: Manuel Pardo, Pedro Gálvez (drafted the 1854 decree abolishing the Indigenous tribute), Francisco García Calderón (president 1881, d. 1905; the full name keeps him apart from his sons), José Carlos Mariátegui, González Prada, Sánchez Cerro.
  - Myth: Tutayquiri and Macahuisa (Huarochirí manuscript), Catachillay, Inkarrí, Ai Apaec, and the Amazonian folklore names.
  - Places and dates: *Morro Solar*, *El Boquerón*, the Arequipa revolution of 22 August 1930.
  - Vocabulary: the fauna common names, the peak names, the regiments (*Húsares de Junín*, *Legión Peruana*), the titles *Los Parias*, *Horas de Lucha* and *Tempestad en los Andes*.
- **Living persons in 1936:** Bielovucic and Paulet (CV), Luis A. Flores (Nationalism), Dora Mayer, Castro Pozo and Delfín Lévano (Socialism). They are kept as figures whose fame predates 1936. José Quiñones (b. 1914) is the exception: he became a hero in July 1941. `Capitán Quiñones` is a vanilla name and falls inside the game's timeframe.
- **English homonyms:**
  - Qualified: `Nicolás Portal` (not bare *Portal*), `Juan Guillermo Moore` (not bare *More*), `Río Santa`, `Río Chili`, `Río Tigre`, `Río Mayo`.
  - Kept as real ship or place names: `Lima`, `Pisco`, `Islay`, `Victoria`, `Loa`, `Melo`.
  - Kept as meaningful cognates: `Valor`, `Honor`, `Gloria`, `Bravo`.
  - Dropped: `Apu`, `Lisa`, `Paco`, `Lorna`, `Verónica`, `Pota`, `Guitarra`, `Fragata` (reads as the ship type; the bird is listed as `Tijereta`), `Labor`.
  - Qualified after review: `La Bicolor` (not bare *Bicolor*).
- **Anachronisms:** Pasco (department 1944), Ucayali (department 1980), Pucallpa and Matarani (both grew after 1940) are left out. *Tumbes* is kept: it was a littoral province before becoming a department in 1942. The four 1941 war names (*Zarumilla*, *Quebrada Seca*, *Jambelí*, *Puerto Bolívar*) fall inside the game's timeframe.

## Review Fixes (isne-code-reviewer, 2026-10-10)

Verdict: pass with follow-ups, no Critical findings.

- **`Tumpis` removed from BC.** It is the pre-Hispanic form of *Tumbes* (BB), so the pair read as one place under two spellings. `Pachacámac`, the coastal sanctuary and citadel, takes its slot.
- **`Tarqui` and `Ingavi` removed from Battles.** They are commemorated as national victories in Ecuador and Bolivia, not as heroic defeats in Peru.
- **`José Carlos Mariátegui` and `Francisco García Calderón`** replace the bare surnames in the ideological pools.
- **`La Bicolor`** replaces *Bicolor*; `Lorna` and `Verónica` dropped (they read as given names); `Castelli` dropped.
- **Display name `"Incas & Rulers"` kept.** The reviewer noted that 13 of 49 entries are coyas and princesses. The name still covers the pre-Inca lords, which `"Incas & Coyas"` would not.

## Review Focus

1. **Vanilla fixes:** diacritics restored, the duplicate `Angamos` gone, `Gloriosa` dropped, every other vanilla name present.
2. **Cross-class and role overlap:** zero cross-class overlap between CL/CA/BB/BC/CV; BB and BC follow separate doctrines; no role-pool name in any hull group.
3. **Ideological separation:** the three pools are separate, each gated with `has_government`, with no focus triggers and no APRA names.
4. **Prefix:** `BAP ` with a trailing space on all 22 groups; no `ship_types` on any pool.
5. **Persons:** every named person is in the verification notes above, either sourced or marked as kept without a lookup.
6. **Docs:** README, workshop cross-reference row, Peru block and header pitch, `wiki/Peru.md`, `wiki/Home.md`, `wiki/_Sidebar.md`, and the removed `docs/ROADMAP.md` row.
