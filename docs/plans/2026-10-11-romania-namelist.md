# Romania (TAG: ROM) Ship Namelist Plan

**Goal:** Replace the vanilla Romanian namelist (`ROM_ship_names.txt`, 9 groups, 108 names) with a full ISNE namelist. The work breaks the cloned cruiser and capital-ship rosters, restores the naming formulas of the *Marina Regală Română*, and adds thematic, ideological and role pools for the Ship Designer.

**Status:** planned 2026-10-11, not implemented. No file under `common/` has been written. Counts below are targets, not results.

**Sources:**
- Two parallel `isne-historical-researcher` dossiers (2026-10-11): A covered hulls, roles, language and vanilla fixes (5 web calls); B covered thematic and ideological pools (7 web calls). Both rest mostly on general knowledge and say so.
- Three `isne-audit-researcher` fact-check passes (2026-10-11, 75 web calls): vessels; naval persons and terminology; counties, rulers and the labour movement. What they settled and what they did not reach is listed under "Linguistic and Verification Notes".

**Author scope decisions (AskUserQuestion, 2026-10-11):**
- Pools: the full set, 11 thematic pools and 4 ideology-gated pools. A wildlife pool is left out (about 25 names).
- Role pools: `ROM_TORPEDO_BOATS` and a combined Danube-flotilla pool `ROM_GUNBOATS` ("Monitors & Gunboats"). The ex-Austro-Hungarian monitors *Ardeal*, *Basarabia* and *Bucovina* stay in BB as province names.

Names in this plan are written in standard Romanian orthography (`ș`, `ț`). The namelist file uses the cedilla forms instead; see "Engine Finding: Romanian Glyphs".

## Vanilla Audit Findings (Step 0)

1. **Cloned rosters:** CL and CA are the same 10 names. BB and BC are the same 3 names.
2. **Calqued fallbacks:**
   - `Crucisator Lumina` (light as illumination) → `Crucișător ușor`
   - `Crucisator Grea` → `Crucișător greu`
   - `Vas de Razboi` ("warship") → `Cuirasat`
   - `Crucisator Lupta` → `Crucișător de linie`
   - `Distrugator` → `Distrugător`
   - `Submarin` and `Portavion` are correct. The two thematic pools have no fallback at all.
3. **No diacritics in the hull groups; mixed in the pools:** `Marasti`, `Marasesti`, `Constanta`, `Bistrita`; the cities pool has `Brăila` and `Bacău` beside `Botosani` and `Piatra Neamt`.
4. **Misspellings:** `Timosoara` → `Timișoara`, `Viscul` → `Viscol`, `Rosiori de Vede` → `Roșiorii de Vede`, `Peste-Spada` → `Peștele-spadă`.
5. **Foreign entry:** `Puebla` (a Mexican city) in `ROM_CITIES`.
6. **Duplicate:** `Piatra Neamt` twice in `ROM_CITIES`.
7. **Post-war ship names in DD:**
   - `Vice-Amiral Rosca`, `Amiral Barbuneanu`, `Contraamiral Sebastian` and `Contraamiral Macellariu` are the Tetal-class corvettes of the 1980s. All four men were alive in 1936 (Bărbuneanu 1881–1979, a serving contraamiral; Roșca 1881–1950; Sebastian 1856–1943, retired; Macellariu 1894–1989, a junior officer).
   - `Zborul`, `Pescarusul` and `Lastunul` are the Tarantul-class missile corvettes of the 1990s.
8. **Anachronisms:** `Cluj Napoca` (the name dates from 1974; `Cluj` in the 1930s), `Tirgu Mures` (the `î` spelling of 1953–93), `Navodari` (a village before 1968), `Sighetu Marmatiei` (today's form).
9. **Exonyms in `ROM_REGIONS`:** `Dobruja` → `Dobrogea`, `Bukovina` → `Bucovina`, `Budjak` → `Bugeac`. Two cities (`Bucuresti`, `Constanta`) and one town (`Herta`) sit among the regions.
10. **Role mismatches:** BB and BC hold only cities. CV holds cities, a region and the liner *România*. CL holds inland towns beside the one real cruiser, *Elisabeta*.
11. **Invented submarine names:** only *Delfinul*, *Rechinul* and *Marsuinul* were real boats. `Baracuda`, `Narval`, `Nautilus`, `Somonul` and `Peste-Spada` match no Romanian vessel.
12. **Prefix:** vanilla uses `NMS ` on all 9 groups. Kept on all 24 groups.
13. **Tags vanilla script assigns:** `ROM_DD_HISTORICAL` and `ROM_SS_HISTORICAL` (starting variants in `history/countries/ROM - Romania.txt`). Both stay defined. `ROM_REGIONS` and `ROM_CITIES` are not referenced by script.
14. **Thin groups:** DD 13, SS 8, CL 10, CA 10, BB 3, BC 3, CV 7, Regions 14, Cities 40 (39 unique).

**Vanilla names kept or dropped:**
- **Kept, corrected and reassigned:** every hull name except those below. *Constanța*, *Târgu Mureș*, *Cluj*, *București*, *Mangalia* and *Sulina* go to CL. *România* and *Banat* go to BB.
- **Dropped:** the four admirals, `Pescarusul`, `Lastunul`, `Navodari`, `Puebla`, `Nautilus`.
  - The admirals follow the Iran precedent: ship names that exist only after 1979 are dropped.
  - `Pescăruș` and `Lăstun` survive as birds in `ROM_BIRDS`.
- **Moved to a role pool:** `Zborul` becomes `Sborul` (the period spelling of the 1888 and 1920 torpedo boats) in `ROM_TORPEDO_BOATS`.
- **Kept as formula extrapolations in SS**, with the definite article the real boats carry: `Baracuda`, `Narvalul`, `Somonul`, `Peștele-spadă`.

## Engine Finding: Romanian Glyphs

Checked against the vanilla bitmap fonts in `gfx/fonts/*.fnt`:

| Character | Code points | Coverage |
|---|---|---|
| `ș` `ț` (comma below, correct Romanian) | U+0218–U+021B | Only `hoi_20`, `hoi_22tech`, `hoi_30`, `hoi_33` and the arrow font. Missing from `hoi_mapfont4`, `hoi_16mbs`, `hoi_18mbs`, the typewriter fonts and the tooltip font. |
| `ş` `ţ` (cedilla, legacy encoding) | U+015E–U+0163 | Every Latin UI font, including the map font. `hoi_24header` and `hoi_36header` lack `ţ`. |
| `ă` | U+0102–U+0103 | Every Latin UI font except the two header fonts. |
| `â` `î` | Latin-1 | Everywhere. |

- **Ruling:** the namelist file writes `ş` and `ţ` (cedilla). A comma-below letter would render as a missing glyph on the map and in most fleet views. Vanilla itself has no comma-below letter anywhere in `common/`, `history/` or the English localisation.
- **Header fonts:** the two header fonts also lack `č` and `ğ`, which the Yugoslav and Turkish lists already use, so this plan accepts the same risk. It is checked in game (see Implementation Steps).
- **Docs:** `README.md`, the workshop description and the wiki prose use standard `ș` and `ț`. Wiki sample cells come from the namelist through `-SyncWiki` and carry the cedilla forms.

## Final Architecture (24 groups)

Every group has `prefix = "NMS "`. Fallbacks are shown as they will appear in the file.

| Group | Display name | Fallback | Target | Formula |
|---|---|---|---|---|
| `ROM_DD_HISTORICAL` | vanilla key | `Distrugător %d` | 85+ | Real destroyers and the 1913 order; storms and winds in the bare form; battles of 1877 and 1916–19; navy commanders dead by 1936; rivers with the definite article |
| `ROM_SS_HISTORICAL` | vanilla key | `Submarin %d` | 50+ | Marine animals with the definite article (*Delfinul*, *Rechinul*, *Marsuinul*), Black Sea and Danube species first |
| `ROM_CL_HISTORICAL` | vanilla key | `Crucişător uşor %d` | 55 | *Elisabeta*; cities and ports of Greater Romania in their 1930s names |
| `ROM_CA_HISTORICAL` | vanilla key | `Crucişător greu %d` | 35+ | Warrior voivodes; leaders of 1784, 1821 and 1848; commanders and heroes of 1877 and 1916–17 dead by 1936 |
| `ROM_BB_HISTORICAL` | vanilla key | `Cuirasat %d` | 35 | Historical provinces and lands; founding rulers and kings; sovereignty symbols (*România*, *Unirea*, *Independența*) |
| `ROM_BC_HISTORICAL` | vanilla key | `Crucişător de linie %d` | 38 | Medieval fortresses under their `Cetatea ...` titles; medieval and early modern battles; historic vessels |
| `ROM_CV_HISTORICAL` | vanilla key | `Portavion %d` | 32 | Carpathian peaks and massifs; raptors; aviation pioneers; sky figures of folklore |
| `ROM_TORPEDO_BOATS` | `"Torpedo Boats"` | `Torpilor %d` | 21–25 | See role pools |
| `ROM_GUNBOATS` | `"Monitors & Gunboats"` | `Canonieră %d` | 16–19 | See role pools |
| `ROM_CITIES` | `"Cities & Ports"` | `Oraş %d` | 70 | Cities in the 1936 borders, 1930s official names |
| `ROM_PROVINCES` | `"Provinces & Counties"` | `Judeţ %d` | 50 | Historical provinces, the ethnographic lands (*Țara Bârsei*, *Țara Hațegului*) and the interwar județe whose name differs from their seat |
| `ROM_RIVERS` | `"Rivers & Lakes"` | `Râu %d` | 55 | Rivers, Danube arms, lagoons, lakes, capes |
| `ROM_GEOGRAPHY` | `"Mountains"` | `Munte %d` | 45 | Carpathian massifs, peaks and passes |
| `ROM_RULERS` | `"Rulers"` | `Voievod %d` | 55 | Dacian kings, early voivodes, rulers of Wallachia and Moldavia with their customary epithets |
| `ROM_HEROES` | `"Heroes & Scholars"` | `Erou %d` | 50 | National leaders, soldiers, scholars, writers, inventors, aviators |
| `ROM_BATTLES` | `"Battles"` | `Bătălie %d` | 38 | 1330 to 1919 |
| `ROM_MYTHOLOGY` | `"Folklore"` | `Legendă %d` | 38 | Dacian deities and Romanian folk-tale figures |
| `ROM_BIRDS` | `"Birds"` | `Pasăre %d` | 45 | Danube Delta and Carpathian species |
| `ROM_FISH` | `"Fish"` | `Peşte %d` | 35 | Black Sea and Danube species, sturgeons first |
| `ROM_VIRTUES` | `"Virtues & Storms"` | `Virtute %d` | 42 | Martial virtues; winds, storms and celestial names |
| `ROM_MONARCHISM` | `"Royal House"` | `Coroană %d` | 25 | Gated: every government except `communism` |
| `ROM_REVOLUTION` | `"Union & Liberty"` | `Ideal %d` | 30 | Gated: `democratic` |
| `ROM_SOCIALISM` | `"Labour Movement"` | `Socialist %d` | 20–25 | Gated: `communism` |
| `ROM_NATIONALISM` | `"Nationalist Ideals"` | `Naţionalist %d` | 20–30 | Gated: `fascism` |

Structure notes:
- **`ROM_PROVINCES` replaces vanilla `ROM_REGIONS`.** No vanilla script references the tag, and Yugoslavia set the same precedent (`YUG_REGIONS` → `YUG_PROVINCES`).
- **`TORPEDO_BOATS` and `GUNBOATS`** are already in `Get-RolePoolSuffixes`; no change to `build.ps1` is needed for them.
- **Depth below target, accepted:** DD aims at the minor-navy minimum (80+), not 100. The verified naval material is small and the list is not padded with invented officers. The ideological pools sit below the 35-name thematic target, as Peru's do.
- **No BEASTS pool:** about 25 names. *Zimbru* and *Bour* (the Moldavian arms) can go to `ROM_VIRTUES` or stay out.

### Hull doctrines and seeds

**DD.** Documented seeds: *Mărăști*, *Mărășești* (1920), *Regele Ferdinand* (1930), *Regina Maria* (1931), *Amiral Murgescu* (1941 minelayer and escort, a light hull), and the 1913 Pattison order *Vifor*, *Vijelie*, *Vârtej*, *Viscol*. Extensions:
- Storms and winds in the bare form: *Crivăț*, *Austru*, *Băltăreț*, *Furtună*, *Uragan*, *Trăsnet*, *Tunet*, *Grindină*, *Rafală*.
- Battles in the formula of *Mărăști* and *Mărășești*: *Oituz*, *Jiu*, *Neajlov*, *Prunaru*, *Robănești*, *Nămoloasa*, *Plevna*, *Vidin*, *Calafat*.
- Navy commanders dead by 1936, in the formula of *Amiral Murgescu* (d. 1913): Dumitrescu-Maican (1846–1902), Koslinski (1853–1909), Bălescu (1864–1929), Scodrea (1872–1934), Urseanu (1848–1926), Boteanu (1836–1897).
- Rivers with the definite article, in the formula of the gunboats *Oltul* and *Siretul*: *Prutul*, *Nistrul*, *Mureșul*, *Someșul*, *Argeșul*, *Jiul*.

**SS.** *Delfinul* (1936), *Rechinul* and *Marsuinul* (Galați, commissioned 1943). No further boat of the 1937 programme had a name. Extensions: *Calcanul*, *Morunul*, *Nisetrul*, *Păstruga*, *Cega*, *Chefalul*, *Stavridul*, *Lufarul*, *Zarganul*, *Scrumbia*, *Foca*, *Caracatița*, plus the four corrected vanilla names.

**CL.** *Elisabeta* (the protected cruiser of 1888, flagship to 1920), then cities: the nine vanilla towns, the six cities moved from BB, BC and CV, and the 1936-border cities vanilla lacks (*Cernăuți*, *Chișinău*, *Ismail*, *Bazargic*, *Silistra*, *Balcic*). *Constanța* is also the 1931 submarine tender.

**CA.** *Vlad Țepeș*, *Iancu de Hunedoara*, *Ioan Vodă cel Cumplit*, *Radu de la Afumați*, *Radu Șerban*, *Tudor Vladimirescu*, *Horea*, *Cloșca*, *Crișan*, *Avram Iancu*, *Gheorghe Magheru*, *Ecaterina Teodoroiu*, *General Dragalina*, *General Grigorescu*. The dossier reached about 20; the rest comes from the verified ruler lists.

**BB.** Provinces: *Moldova*, *Muntenia*, *Oltenia*, *Transilvania*, *Dobrogea*, *Banat*, *Crișana*, *Maramureș*, *Bucovina*, *Basarabia*, *Ardeal*, *Țara Românească*. Rulers: *Regele Carol I* (also the 1898 liner and minelayer), *Alexandru Ioan Cuza*, *Ștefan cel Mare*, *Mihai Viteazul*, *Mircea cel Bătrân*, *Basarab I*, *Dragoș Vodă*, *Burebista*, *Decebal*. Symbols: *România*, *Unirea*, *Independența*.

**BC.** Fortresses: *Cetatea Albă*, *Cetatea Neamțului*, *Cetatea Sucevei*, *Cetatea Hotinului*, *Cetatea Sorocii*, *Poenari*, *Enisala*, *Râșnov*. Battles: *Posada*, *Rovine*, *Podul Înalt*, *Războieni*, *Codrii Cosminului*, *Călugăreni*, *Șelimbăr*, *Guruslău*. Vessels: *Mircea* (the brig of 1882), *Dacia* and *Împăratul Traian* (auxiliary cruisers of 1916; the second is unverified).

**CV.** Peaks: *Moldoveanu*, *Negoiu*, *Omu*, *Peleaga*, *Ceahlău*, *Retezat*, *Bucegi*, *Rarău*, *Vlădeasa*. Raptors in forms the torpedo boats do not use: *Acvilă*, *Uliu*, *Erete*, *Codalb*, *Gaie*. Aviators: *Aurel Vlaicu* (d. 1913), *Traian Vuia* (flew in 1906; alive in 1936).

### Ideological pools

| Pool | `can_use` | Content |
|---|---|---|
| `ROM_MONARCHISM` | `NOT = { has_government = communism }` | Kings, queens and princes of the House of Hohenzollern-Sigmaringen to 1936; *Nihil Sine Deo*; *Coroana de Oțel*; royal residences (*Peleș*, *Pelișor*, *Cotroceni*) |
| `ROM_REVOLUTION` | `has_government = democratic` | 1848 and the Union: *Proclamația de la Islaz*, *Câmpia Libertății*, *Unirea Principatelor*, *Marea Unire*, *Dreptate și Frăție*; statesmen dead by 1936 (the Brătianus, Kogălniceanu, Rosetti, Bălcescu, Take Ionescu) |
| `ROM_SOCIALISM` | `has_government = communism` | Dead by 1936: Constantin Dobrogeanu-Gherea, I. C. Frimu, Ștefan Gheorghiu, Vasile Roaită (d. 1933), Haia Lifșiț (d. 1929), Leonte Filipescu; events: *Răscoala din 1907*, *Grivița 1933*, *Lupeni 1929*, *Doftana*; labour vocabulary |
| `ROM_NATIONALISM` | `has_government = fascism` | See open decision 1 |

- **Monarchy gate:** Romania stays a kingdom under its democratic, non-aligned and fascist governments alike (the Legionary state of 1940 kept King Mihai). Only a communist government abolishes it. `NOT` is an allowed operator (CLAUDE.md §7). Italy's `ITA_MONARCHISM` uses `neutrality` alone; see open decision 2.
- **Living persons kept out of the ideological pools:** Maniu, Mihalache, Vaida-Voevod, Titulescu, Dinu Brătianu; Gheorghiu-Dej, Pătrășcanu, Foriș, Doncea, Rakovsky, Alexandru Dobrogeanu-Gherea; Codreanu, Sima, A. C. Cuza, Goga.
- **Left out of `ROM_SOCIALISM`:** Max Goldstein (the Senate bombing of 1920) and Ion Nădejde (he left socialism for the Liberals in 1899). The wartime dead (Pintilie 1940, Sârbu 1941, Bancic 1944, Elena Pavel 1943) fall inside the game's timeframe but were unknown in 1936; they stay out unless the pool cannot reach 20.

## Role Pools: considered / created / skipped

- **Torpedo boats and motor torpedo boats:** created (`ROM_TORPEDO_BOATS`). Verified names, 21:
  - *Rândunica* (1875, the spar-torpedo boat that sank the Ottoman monitor *Seyfi*); *Șoimul*, *Vulturul* (1882, Yarrow).
  - *Năluca*, *Sborul*, *Smeul* (1888, Normand; the names were reused for the ex-Austro-Hungarian boats of 1920).
  - *Viforul*, *Vârtejul*, *Vijelia* (1920, ex-Austro-Hungarian; reused by the Vosper boats of 1940 and the Galați boats of 1943–44).
  - *Viscolul* (1940, Vosper); *Vedenia*, *Vântul*, *Vulcanul* (1943–44).
  - The eight Thames Iron Works boats of 1906–07, named for officers of 1877: *Maior Ene Constantin*, *Căpitan Nicolae Lascăr Bogdan*, *Căpitan Romano Mihail*, *Maior Giurescu Dimitrie*, *Maior Șonțu Gheorghe*, *Maior Grigore Ioan*, *Locotenent Călinescu Dimitrie*, *Căpitan Valter Mărăcineanu*.
  - Pending: the four Schichau boats of 1894 (*Vedea*, *Argeș*, *Trotuș*, *Teleorman*); the class is confirmed, the individual names are not.
- **Monitors and gunboats:** created (`ROM_GUNBOATS`). Verified names, 14:
  - Monitors of the Brătianu class (1907–08): *Ion C. Brătianu*, *Lascăr Catargiu*, *Mihail Kogălniceanu*, *Alexandru Lahovari*.
  - Gunboats: *Fulgerul* (1873), *Grivița* (1880), *Rahova*, *Smârdan*, *Opanezul* (1882), *Alexandru cel Bun* (1882 guard ship, a minelayer in 1916).
  - The four ex-French boats of 1920: *Căpitan Dumitrescu Constantin*, *Locotenent-Comandor Stihi Eugen*, *Sublocotenent Ghiculescu*, *Locotenent Lepri Remus*.
  - Pending: *Oltul* and *Siretul* (1888; class confirmed) and the three guard ships of the Monteano class (1893; names not fetched).
- **Monitors alone:** considered, skipped: seven names, below the floor of 10. The four statesmen join the gunboats; the three province names are in BB.
- **Minelayers:** considered, skipped: six names (*Amiral Murgescu*, the cancelled *Cetatea Albă*, *Aurora*, and the liners *Dacia*, *Regele Carol I* and *România*). They are in DD, BC and BB.
- **Minesweepers:** considered, skipped: the M40-type boats of 1943 were numbered (DB-13 to DB-16); the *Democrația* class is from 1954–56.
- **Auxiliary cruisers and seaplane tenders:** considered, skipped: five SMR liners of 1916, not yet verified beyond the three minelayers; the names are in BB and BC.
- **Escort destroyers, corvettes, frigates, sloops, avisos, patrol vessels:** considered, skipped: no named series. The ex-French boats served as escorts and are in the gunboat pool.
- **Scout cruisers, flotilla leaders:** considered, skipped: *Mărăști* and *Mărășești* only, both in DD.
- **Fast attack craft:** covered by the torpedo-boat pool. The German boats of 1944 were numbered.
- **Coastal defense, armored cruisers, fast battleships, large cruisers, AA cruisers:** considered, skipped: no ship, and no name in the 1899 or 1912 programmes.
- **Escort and light carriers:** considered, skipped: no precedent.
- **Cruiser, coastal and minelaying submarines:** considered, skipped: the midget boats were numbered (CB-1 to CB-6); *Rechinul*, the minelaying boat, is in SS.
- **Training ships, submarine tenders, state yachts, icebreakers:** considered, skipped: one or two names each (*Mircea*, *Constanța*, *Luceafărul*), in BC, CL and CV or left out.

## Collision Resolutions

Role pools may not share a name with CL, CA, BB, BC or CV, so each name below has one owner.

| Name | Owner | Consequence |
|---|---|---|
| *Bistrița* | CL (vanilla city name) | The 1888 gunboat of that name is left out of `ROM_GUNBOATS` |
| *Alexandru cel Bun* | `ROM_GUNBOATS` (1882 vessel) | BB and CA do not list him |
| *Grivița*, *Rahova*, *Smârdan*, *Opanezul* | `ROM_GUNBOATS` | BC lists no battle of 1877; *Plevna* and *Vidin* are in DD |
| *Brătianu*, *Catargiu*, *Kogălniceanu*, *Lahovari* | `ROM_GUNBOATS` | BB lists no statesmen; `ROM_REVOLUTION` may repeat them |
| *Șoimul*, *Vulturul* | `ROM_TORPEDO_BOATS` | CV raptors use other species and the bare form |
| *Rândunica*, *Fulgerul* | role pools | Not listed in BC as historic vessels |
| *Ardeal*, *Basarabia*, *Bucovina* | BB | The three monitors are not in `ROM_GUNBOATS` |
| *Constanța*, *București*, *Cluj*, *Târgu Mureș*, *Mangalia*, *Sulina* | CL | Removed from BB, BC and CV |
| *România*, *Banat* | BB | Removed from CV |
| *Cetatea Albă* | BC | CL does not list the city. The other fortress towns stay plain in CL (*Hotin*, *Soroca*, *Tighina*) and take the `Cetatea ...` title in BC |
| *Vaslui* | CL | BC uses *Podul Înalt* for the battle of 1475 |
| *Făgăraș* | CL | CV uses the peaks *Moldoveanu* and *Negoiu*, not the massif |
| *Mircea* / *Mircea cel Bătrân* | BC (the brig) / BB (the ruler) | Expected `CrossClassPerson` INFO; the brig carried the bare name |
| *Regele Carol I* | BB | DD lists only the two royal names that real destroyers carried |
| *Împăratul Traian* | BC | BB lists no *Traian* |

- **DD against the torpedo boats:** DD takes the bare forms of the 1913 order (*Vifor*, *Vijelie*, *Vârtej*, *Viscol*); the role pool takes the definite forms the boats carried (*Viforul*, *Vijelia*, *Vârtejul*, *Viscolul*). The strings differ, and DD overlap is a WARN at most.
- **DD against the gunboats:** DD rivers and battles avoid the pool's names (*Oltul*, *Siretul*, *Grivița*, *Rahova*, *Smârdan*).
- **Thematic pools** stand alone and may repeat hull names, as in the Finnish model file. Bare forms keep them apart in most cases (*Morun* in Fish, *Morunul* in SS; *Olt* in Rivers, *Oltul* in the gunboats).
- **Provinces against Rivers:** *Olt*, *Argeș*, *Mureș* and the other river-named counties appear in Rivers only.

## Linguistic and Verification Notes

**Terms**
- **Confirmed** (ro.wikipedia, "Listă de nave militare românești" and "Distrugător"): `cuirasat`, `distrugător`, `portavion`, `torpilor`, `vedetă torpiloare`, `canonieră`, `monitor`, `puitor de mine`. The navy used *distrugător*, not *contratorpilor*, for the interwar destroyers.
- **Battlecruiser:** `crucișător de linie` is the ro.wikipedia article title; `crucișător de bătălie` is a common variant. Dossier A's `crucișător de luptă` was not found anywhere.
- **Kept without a lookup:** `crucișător ușor`, `crucișător greu`, `submarin` (standard modern terms).
- **Prefix:** `NMS` is used consistently for the royal navy's ships. Its expansion (*Nava Majestății Sale*) was not sourced.

**Orthography**
- The `â`/`î` rules of 1904 match today's. Only the 1953–93 spelling (`Tîrgu`, `Romînia`) differs, and it is not used.
- Period forms: `Sborul` (not *Zborul*), `Cluj`, `Turnu Severin`, `Bazargic`, `Cetatea Albă`, `Tighina`.
- Rank spellings: `Viceamiral`, `Contraamiral`, `Locotenent-Comandor`, `Maior` (not *Major*).

**Verified so far**
- **Vessels** (navypedia; en.wikipedia "Romanian Danube Flotilla", "List of main Romanian Navy warships of World War II", "Căpitan Nicolae Lascăr Bogdan-class torpedo gunboat"): every name listed as verified under the role pools; *Elisabeta*; *Constanța*; the four destroyers; the three submarines; *Amiral Murgescu*; *Cetatea Albă* (laid down 1939, cancelled); the minelayers *Dacia*, *Durostor*, *Regele Carol I*, *România*.
- **Naval persons** (en.wikipedia, "Commander of the Navy (Romania)"): Murgescu (1846–1913), Dumitrescu-Maican, Koslinski, Bălescu, Scodrea, Boteanu, Murguleț (b. 1831), Urseanu (Muzeul Municipiului București). The four vanilla admirals' dates are in Step 0.
- **Ship eponyms:** Gheorghe Șonțu and Nicolae Valter Mărăcineanu, army officers killed at Grivița on 11 September 1877 (en.wikipedia, "Valter Mărăcineanu").
- **Counties:** 64 of the 71 interwar județe against JewishGen and the en.wikipedia county and ținut pages; seven Transylvanian and Banat names (Alba, Bihor, Caraș, Cluj, Năsăud, Satu Mare, Severin) corrected from memory because the table mixed pre-1925 names.
- **Rulers:** the Dacian kings Burebista, Deceneu, Cotiso, Comosicus, Scorilo, Duras, Decebal, Oroles, Rubobostes (en.wikipedia, "Dacia"); 24 Moldavian rulers (en.wikipedia, "List of monarchs of Moldavia"); 14 Wallachian rulers (en.wikipedia list, Dossier B).
- **Labour movement:** Roaită, Doncea, Pintilie, Lifșiț, Constantin David, Petre Gheorghe (en.wikipedia articles); Constantin Țurcanu "Peneș Curcanul" (d. 1932).

**Corrections from the fact-check**
- **The eight river torpedo boats honour army officers of 1877, not naval ones.** Only Șonțu and Mărăcineanu are identified. The names are kept on ship precedent; the other six eponyms are not confirmed.
- *Opanezul*, not *Opanez*; *Giurescu*, not *Giurăscu*; *Ioan Sturdza* or *Ioniță Sandu Sturdza* (two forms in use); *Bogdan III cel Chior* is the Romanian epithet (*cel Orb* is also used).
- *Fulgerul* (ex-84F) capsized in the Bosphorus in 1922 and never served as a torpedo boat. The name stays with the 1873 gunboat.
- The 1888 torpedo boats were French-built river and coastal craft, not sea-going boats.
- The post-war minesweeper names (*Democrația* class) are from 1954–56 and are out of scope.

**Fact-check queue for implementation**

Run as parallel `isne-audit-researcher` passes of at most 40 items each, persons apart from vessels and vocabulary.
1. **Vessels:** the Vedea, Oltul and Monteano class names; *Aurora*; the SMR liners of 1916 (*Împăratul Traian*, *Principesa Maria*) and of 1941–44 (*Transilvania*, *Basarabia*); *Mircea* (1882 and 1938); the yachts *Ștefan cel Mare* and *Luceafărul*; the four 1913 destroyer names in their bare forms; the surname-first or given-name-first order of the 1906–07 hull names (navypedia and en.wikipedia disagree).
2. **Naval and military persons:** Steriade, Petrescu, Barbieri, Niculescu-Rizea and Negru (confirmed as commanders, no dates); twelve officers no source reached (Negrescu, Isbășescu, Boerescu, Gavrilescu, Negulescu, Kirițescu, Pantazzi, Irimescu, Cătuneanu, Ciuchi, Rodrig, Lupu), to be dropped unless sourced; the four ex-French gunboat eponyms; the heroes of 1877 and 1916–17 (Cerchez, Dragalina, Grigorescu, Praporgescu, Teodoroiu, Ignat, Mușat, Măriuca Zaharia).
3. **Rulers and the royal house:** the early voivodes (Litovoi, Seneslau, Bărbat, Farcaș, Gelu, Glad, Menumorut), Dromichete, the Wallachian rulers not on the confirmed list, the royal family members and residences.
4. **Ideological persons:** dates for the liberal statesmen and for Dobrogeanu-Gherea, Frimu (form *I. C. Frimu*), Ștefan Gheorghiu (1879–1914 or d. 1930), Filipescu, Tcacenko; the events of 1907 and 13 December 1918.
5. **Places:** the ten place names not reached (*Chilia Nouă*, *Balcic*, *Cavarna*, *Turtucaia*, *Bolgrad*, *Roșiorii de Vede*, *Târgu Ocna*, *Eforie*, *Mamaia*, *Năvodari*); the 1930s form of *Sighet* (*Sighetul Marmației*); hyphenation of *Târgu Mureș* and *Turnu Severin*; the status of *Slobozia* and *Reșița*; fortresses and medieval battles for BC.
6. **Vocabulary:** bird, fish and folklore names against ro.wikipedia species lists; the storm and virtue words.

**English homonyms to resolve at authoring**
- Qualify or drop: `Roman` (city and county), `Bran`, `Brad`, `Dan` (ruler: use `Dan I`, `Dan II`), `Crap`, `Lin`, `Somn`, `Ger`, `Dor`, `Mare`, `Pace`, `Rege`.
- Kept as proper names: `Arad`, `Deva`, `Dacia`.

## Open Decisions

1. **Content of `ROM_NATIONALISM`.** A pool without Iron Guard names reaches about 20 entries, and most of those (Dacia, Traian, Latinity) fit any regime. In game, a fascist Romania is the Iron Guard state. Default in this plan, following `ITA_FASCISM` and `PRU_NATIONALISM`: national-revival vocabulary (*România Mare*, *Columna lui Traian*, *Latinitatea*, *Neamul*, *Glia*, *Strămoșii*) plus the movement's institutional names (*Garda de Fier*, *Arhanghelul Mihail*, *Legiunea*, *Totul pentru Țară*) and its two dead of January 1937, *Moța* and *Marin*. Left out: living leaders, the assassination squads (*Nicadorii*, *Decemvirii*), and the antisemitic league names. Alternatives: no Legionary names (about 20 entries), or no fascism pool.
2. **Gate of `ROM_MONARCHISM`.** `NOT = { has_government = communism }` (this plan) or `has_government = neutrality` (Italy's precedent).
3. **Glyph check in tooling.** Add a FAIL to `-ValidateOnly` for U+0218–U+021B in any namelist, with a line in `CLAUDE.md` §3 and its `GEMINI.md` mirror. Not part of this plan's steps until approved.
4. **`Contraamiral Sebastian`.** Dropped with the other three admirals. He was the navy's commander from 1909 to 1917 and retired, aged 80, in 1936, so he is the one a case could be made for.

## Implementation Steps

- [ ] Resolve open decisions 1 and 2.
- [ ] Run the six fact-check passes; record each person as sourced, kept on ship precedent, kept without a lookup, or dropped.
- [ ] Author `common/units/names_ships/ROM_ship_names.txt` (UTF-8 without BOM) with the 24 groups above.
- [ ] Convert `ș` `ț` `Ș` `Ț` to `ş` `ţ` `Ş` `Ţ` in the namelist file and confirm that no code point in U+0218–U+021B remains.
- [ ] `build.ps1 -ValidateOnly`, `-VerifyShipTypes ROM`, `-Audit ROM`, `-Test`. No `CrossClass`, `BBBCMirror`, `RoleOverlap`, `VanillaReference` or `CanUseTrigger` FAIL.
- [ ] In game, on a new save: the Ship Designer dropdown shows the 13 ungated pools and `"Royal House"` at the 1936 start; *Mărăşeşti* and *Constanţa* render in the fleet view, the map and the ship details header.
- [ ] Docs (CLAUDE.md §4): `README.md` summary row; workshop cross-reference row, Romania block and header pitch; `wiki/Romania.md`, `wiki/Home.md`, `wiki/_Sidebar.md`; delete the `ROM` row in `docs/ROADMAP.md`.
- [ ] `build.ps1 -SyncWiki ROM`; push only the Romania pages with `wiki/push-wiki.ps1`.
- [ ] Dispatch `isne-code-reviewer` with this plan, the audit summary lines and the implementation files; fix every Critical and Important finding.
- [ ] `git status` from the root.

Workshop block (17 lists: 11 thematic, 4 ideological, 2 role):

```bbcode
[b]Romania[/b]
- Expanded ship-type lists for destroyers, submarines, light and heavy cruisers, battleships, battlecruisers and carriers.
- Added 17 universal thematic lists for the Ship Designer (cities, provinces and counties, rivers, mountains, rulers, heroes, battles, folklore, birds, fish, virtues and storms, torpedo boats, Danube monitors and gunboats, and four ideology-gated lists).
```

## Review Focus

1. **Vanilla fixes:** fallbacks corrected, clones broken, `Puebla` and the duplicate gone, the post-war names out, every other vanilla name present in its new group.
2. **Glyphs:** no comma-below letter in the namelist file.
3. **Cross-class and role overlap:** zero overlap between CL, CA, BB, BC and CV; no role-pool name in any of those five; BB and BC follow separate doctrines.
4. **Vanilla references:** `ROM_DD_HISTORICAL` and `ROM_SS_HISTORICAL` defined.
5. **Ideological separation:** four pools, each gated with `has_government` only, no living leaders, no opposing currents mixed.
6. **Prefix:** `NMS ` with a trailing space on all 24 groups; no `ship_types` on any pool.
7. **Persons:** every named person is in the verification notes, either sourced or marked.
8. **Docs:** README, workshop row, block and pitch, the three wiki files, and the removed roadmap row.
