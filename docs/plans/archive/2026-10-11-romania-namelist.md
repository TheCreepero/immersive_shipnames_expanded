# Romania (TAG: ROM) Ship Namelist Plan

**Goal:** Replace the vanilla Romanian namelist (`ROM_ship_names.txt`, 9 groups, 108 names) with a full ISNE namelist. The work breaks the cloned cruiser and capital-ship rosters, restores the naming formulas of the *Marina Regală Română*, and adds thematic, ideological and role pools for the Ship Designer.

**Status:** planned 2026-10-11; implemented 2026-10-14 with the plan's defaults for the open decisions. Counts below are results.

**Sources:**
- Two parallel `isne-historical-researcher` dossiers (2026-10-11): A covered hulls, roles, language and vanilla fixes (5 web calls); B covered thematic and ideological pools (7 web calls). Both rest mostly on general knowledge and say so.
- Three `isne-audit-researcher` fact-check passes (2026-10-11, 75 web calls): vessels; naval persons and terminology; counties, rulers and the labour movement. What they settled and what they did not reach is listed under "Linguistic and Verification Notes".
- Six more `isne-audit-researcher` passes at implementation (2026-10-14, about 140 web calls): vessels; military persons; rulers and the royal house; the ideological pools; places, fortresses and battles; vocabulary.

**Author scope decisions (AskUserQuestion, 2026-10-11):**
- Pools: the full set, 11 thematic pools and 4 ideology-gated pools. A wildlife pool is left out (about 25 names).
- Role pools: `ROM_TORPEDO_BOATS` and a combined Danube-flotilla pool `ROM_GUNBOATS` ("Monitors & Gunboats"). The ex-Austro-Hungarian monitors *Ardeal*, *Basarabia* and *Bucovina* stay in BB as province names.

Names in this plan are written in standard Romanian orthography (`ș`, `ț`). The namelist file uses the cedilla forms instead; see "Romanian Glyphs".

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
4. **Misspellings:** `Timosoara` → `Timișoara`, `Rosiori de Vede` → `Roșiorii de Vede`, `Peste-Spada` → `Peștele-spadă`. `Viscul` is normalised to `Viscol`, the en.wikipedia and standard form (navypedia itself spells the 1913 ship *Viscul*).
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
- **Dropped:** the four admirals, `Pescarusul`, `Lastunul`, `Navodari`, `Puebla`, `Nautilus`, `Herta` (a town, not a region).
  - The admirals follow the Iran precedent: ship names that exist only after 1979 are dropped.
  - `Pescăruș` and `Lăstun` survive as birds in `ROM_BIRDS`.
- **Moved to a role pool:** `Zborul` becomes `Sborul` (the period spelling of the 1888 and 1920 torpedo boats) in `ROM_TORPEDO_BOATS`.
- **Kept as formula extrapolations in SS**, with the definite article the real boats carry: `Baracuda`, `Narvalul`, `Somonul`, `Peștele-spadă`.

## Romanian Glyphs

- **Ruling:** the namelist file writes the cedilla letters `ş` and `ţ`, because most game fonts, the map font among them, lack the comma-below letters [SPR-023].
- **Header fonts:** the two header fonts also lack `ă`, `ţ`, `č` and `ğ` [SPR-023]. The Yugoslav and Turkish lists already use `č` and `ğ`, so this plan accepts the same risk. It is checked in game (see Implementation Steps).
- **Docs:** `README.md`, the workshop description and the wiki prose use standard `ș` and `ț`. Wiki sample cells come from the namelist through `-SyncWiki` and carry the cedilla forms.

## Final Architecture (24 groups)

Every group has `prefix = "NMS "`. Fallbacks are shown as they appear in the file.

| Group | Display name | Fallback | Count | Formula |
|---|---|---|---|---|
| `ROM_DD_HISTORICAL` | vanilla key | `Distrugător %d` | 87 | Real destroyers and the 1913 order; storms and winds in the bare form; battles of 1877 and 1916–17; senior naval commanders dead by 1936; heroes of the ranks; rivers with the definite article; old troops and weapons |
| `ROM_SS_HISTORICAL` | vanilla key | `Submarin %d` | 51 | Marine animals with the definite article (*Delfinul*, *Rechinul*, *Marsuinul*), Black Sea and Danube species first |
| `ROM_CL_HISTORICAL` | vanilla key | `Crucişător uşor %d` | 72 | *Elisabeta*; ports and cities of Greater Romania in their 1930s names |
| `ROM_CA_HISTORICAL` | vanilla key | `Crucişător greu %d` | 35 | Warrior princes; the captains of Mihai Viteazul; outlaws and leaders of 1784, 1821 and 1848; generals and heroes of 1877 and 1916–19 |
| `ROM_BB_HISTORICAL` | vanilla key | `Cuirasat %d` | 35 | Sovereignty and union; historical provinces and lands; founders and great rulers |
| `ROM_BC_HISTORICAL` | vanilla key | `Crucişător de linie %d` | 39 | Historic vessels; medieval, Dacian and Greek fortresses and citadels; the Danube mouths; battles of the voivodes |
| `ROM_CV_HISTORICAL` | vanilla key | `Portavion %d` | 33 | Carpathian peaks and massifs; raptors; aviation pioneers; sky figures of folklore |
| `ROM_TORPEDO_BOATS` | `"Torpedo Boats"` | `Torpilor %d` | 25 | See role pools |
| `ROM_GUNBOATS` | `"Monitors & Gunboats"` | `Canonieră %d` | 19 | See role pools |
| `ROM_CITIES` | `"Cities & Ports"` | `Oraş %d` | 88 | Cities in the 1936 borders, 1930s names |
| `ROM_PROVINCES` | `"Provinces & Counties"` | `Judeţ %d` | 53 | Historical provinces, the historical lands (*Țara Bârsei*, *Țara Hațegului*) and the interwar județe whose name differs from their seat |
| `ROM_RIVERS` | `"Rivers & Lakes"` | `Râu %d` | 63 | The Danube and its arms, rivers, lakes and lagoons, capes |
| `ROM_GEOGRAPHY` | `"Mountains"` | `Munte %d` | 47 | Carpathian massifs, peaks and passes |
| `ROM_RULERS` | `"Rulers"` | `Voievod %d` | 59 | Dacian kings, early voivodes and dukes, voivodes of Wallachia and Moldavia, Cuza |
| `ROM_HEROES` | `"Heroes & Scholars"` | `Erou %d` | 50 | Leaders of uprisings, the Transylvanian School, soldiers, writers, artists, scientists and aviators |
| `ROM_BATTLES` | `"Battles"` | `Bătălie %d` | 35 | 1330 to 1917 |
| `ROM_MYTHOLOGY` | `"Myth & Folklore"` | `Legendă %d` | 39 | Dacian and Thracian gods, folk-tale heroes, creatures and calendar figures |
| `ROM_BIRDS` | `"Birds"` | `Pasăre %d` | 46 | Danube Delta, raptors and owls, forest and field birds |
| `ROM_FISH` | `"Fish"` | `Peşte %d` | 35 | Sturgeons, Black Sea fish, Danube and mountain fish |
| `ROM_VIRTUES` | `"Virtues & Elements"` | `Virtute %d` | 39 | Martial virtues; winds and storms; sky and stars |
| `ROM_MONARCHISM` | `"Royal House"` | `Coroană %d` | 24 | Gated: every government except `communism` |
| `ROM_REVOLUTION` | `"Union & Liberty"` | `Ideal %d` | 30 | Gated: `democratic` |
| `ROM_SOCIALISM` | `"Labour Movement"` | `Socialist %d` | 22 | Gated: `communism` |
| `ROM_NATIONALISM` | `"Nationalist Ideals"` | `Naţionalist %d` | 20 | Gated: `fascism` |

Structure notes:
- **`ROM_PROVINCES` replaces vanilla `ROM_REGIONS`.** No vanilla script references the tag, and Yugoslavia set the same precedent (`YUG_REGIONS` → `YUG_PROVINCES`).
- **`TORPEDO_BOATS` and `GUNBOATS`** are already in `Get-RolePoolSuffixes`; `build.ps1` is unchanged.
- **Depth below target, accepted** (`-Audit` WARN, floors met): DD 87 (the minor-navy minimum is 80; only eight senior commanders dead by 1936 could be sourced, and the list is not padded with invented officers), SS 51, `ROM_GUNBOATS` 19, and the four ideological pools (20 to 30), as Peru's are.
- **No BEASTS pool:** about 25 names.

### Hull doctrines

- **DD.** Documented: *Mărăști*, *Mărășești* (1920), *Regele Ferdinand* (1930), *Regina Maria* (1931), *Amiral Murgescu* (1941 minelayer and escort, a light hull), and the 1913 Pattison order *Vifor*, *Vijelie*, *Vârtej*, *Viscol* (bare forms confirmed, en.wikipedia "Vifor-class destroyer"). Extensions follow the navy's own formulas: storm words (Vifor class), battles (*Mărăști*, *Mărășești*), commanders (*Amiral Murgescu*), rivers with the article (the river torpedo boats *Argeșul* and *Trotușul*, the gunboats *Oltul* and *Siretul*). The old troops (*Dorobanțul*, *Roșiorul*, *Pandurul*) and weapons (*Buzduganul*, *Paloșul*) extend the warrior formula, as Peru's list does.
- **SS.** *Delfinul* (1936); *Rechinul* and *Marsuinul*, both full-size Galați-built boats commissioned in 1943 (navypedia; *Marsuinul* is not a CB midget). Extensions: Black Sea and Danube fish, then sea creatures, all with the article; the four corrected vanilla names kept as formula extrapolations.
- **CL.** *Elisabeta* (the protected cruiser of 1888, flagship to 1920), then ports and cities: the nine vanilla towns, the six cities moved from BB, BC and CV, and the 1936-border cities vanilla lacks.
- **CA.** Warrior princes, the captains of Mihai Viteazul, the outlaws Pintea and Jianu, the leaders of 1784, 1821 and 1848, and the generals and heroes of 1877 and 1916–19.
- **BB.** Sovereignty symbols, the historical provinces (including *Ardeal*, *Basarabia* and *Bucovina*, which were also monitor names), and the founders and great rulers from Burebista to Carol I.
- **BC.** The brig *Mircea* (1882) and the liner and minelayer *Dacia*; fortresses under their `Cetatea ...` titles; the Dacian fortresses of the Orăștie Mountains and the Greek and Roman citadels of the coast; the Danube mouths and Snake Island; the battles of the voivodes.
- **CV.** Carpathian peaks, raptors with the article, the aviators Vlaicu, Vuia and Coandă, and the sky figures of folklore.

### Ideological pools

| Pool | `can_use` | Content |
|---|---|---|
| `ROM_MONARCHISM` | `NOT = { has_government = communism }` | Kings, queens and princes of the House of Hohenzollern-Sigmaringen to 1936; *Nihil Sine Deo*; *Coroana de Oțel*; the anthem *Trăiască Regele*; the four royal orders; *Peleș*, *Pelișor*, *Cotroceni*, *Castelul Bran* |
| `ROM_REVOLUTION` | `has_government = democratic` | 1848 and the unions: *Proclamația de la Islaz*, *Câmpia Libertății*, *Dreptate, Frăție*, *Divanul ad-hoc*, *Mica Unire*, *Marea Unire*, *Memorandul*; statesmen dead by 1936 |
| `ROM_SOCIALISM` | `has_government = communism` | Socialists and labour activists dead by 1936; the revolt of 1907, 13 December 1918, the strikes of Lupeni and Grivița, Doftana; the socialist press and labour vocabulary |
| `ROM_NATIONALISM` | `has_government = fascism` | National-revival vocabulary and the Legionary movement's institutional names and press (open decision 1, default applied; no persons) |

- **Monarchy gate:** Romania stays a kingdom under its democratic, non-aligned and fascist governments alike (the Legionary state of 1940 kept King Mihai). Only a communist government abolishes it. `NOT` is an allowed operator (CLAUDE.md §7). Italy's `ITA_MONARCHISM` uses `neutrality` alone; see open decision 2.
- **Living persons kept out of the ideological pools:** Maniu, Mihalache, Vaida-Voevod, Titulescu, Dinu Brătianu; Gheorghiu-Dej, Pătrășcanu, Foriș, Doncea, Rakovsky, Alexandru Dobrogeanu-Gherea; Codreanu, Sima, A. C. Cuza, Goga. The royal pool is the exception: it names the living royal family, as a royal pool must.
- **Left out of `ROM_SOCIALISM`:** Max Goldstein (the Senate bombing of 1920), Ion Nădejde (he left socialism for the Liberals in 1899), and the wartime dead (Pintilie 1940, Sârbu 1941, Bancic 1944, Elena Pavel 1943), who were unknown in 1936.
- **Left out of `ROM_NATIONALISM`:**
  - Ion Moța and Vasile Marin: alive at the 1936 start (both d. 13 January 1937), so out under the living-persons rule (review fix).
  - Nicolae Filipescu (d. 1916), a conservative interventionist and no fascist; placing him in a fascism-gated pool would misrepresent him.
  - *Renașterea Națională*: it recalls Carol II's Frontul Renașterii Naționale (1938), which outlawed the Legion, so it would mix two hostile currents (review fix).
  - The leader's title *Căpitanul*, the assassination squads (*Nicadorii*, *Decemvirii*) and the antisemitic league names.

## Role Pools: considered / created / skipped

- **Torpedo boats and motor torpedo boats:** created (`ROM_TORPEDO_BOATS`, 25 names, all verified as hulls):
  - *Rândunica* (1875, the spar-torpedo boat that sank the Ottoman monitor *Seyfi*); *Șoimul*, *Vulturul* (1882, Yarrow).
  - *Năluca*, *Sborul*, *Smeul* (1888, Normand; the names were reused for the ex-Austro-Hungarian boats of 1920).
  - *Vedea*, *Argeșul*, *Trotușul*, *Teleorman* (1894, Schichau; en.wikipedia "NMS Trotușul").
  - The eight Thames Iron Works river torpedo boats of 1906–07, in navypedia's surname-first forms: *Maior Ene Constantin*, *Căpitan Nicolae Lascăr Bogdan*, *Căpitan Romano Mihail* (navypedia *Michail*), *Maior Giurescu Dimitrie*, *Maior Șonțu Gheorghe*, *Maior Nicolae Grigore Ioan*, *Locotenent Călinescu Dimitrie*, *Căpitan Valter Mărăcineanu*.
  - *Viforul*, *Vârtejul*, *Vijelia* (1920, ex-Austro-Hungarian; reused by the motor torpedo boats); *Viscolul* (1940, Vosper); *Vedenia*, *Vântul*, *Vulcanul* (1943–44, Galați).
- **Monitors and gunboats:** created (`ROM_GUNBOATS`, 19 names, all verified as hulls):
  - Monitors of the Brătianu class (1907–08): *Ion C. Brătianu*, *Lascăr Catargiu*, *Mihail Kogălniceanu*, *Alexandru Lahovari*.
  - Gunboats and guard ships: *Fulgerul* (1873), *Grivița* (1880), *Rahova*, *Smârdan*, *Opanezul* (1882), *Alexandru cel Bun* (1882), *Oltul*, *Siretul* (1888), *Monteano*, *Olteano*, *Imeo* (1893).
  - The four ex-French gunboats of 1920: *Căpitan Dumitrescu Constantin*, *Locotenent-Comandor Stihi Eugen*, *Sublocotenent Ghiculescu*, *Locotenent Lepri Remus*.
- **Monitors alone:** considered, skipped: seven names, below the floor of 10. The four statesmen join the gunboats; the three province names are in BB.
- **Minelayers:** considered, skipped: six names (*Amiral Murgescu*, the cancelled *Cetatea Albă*, *Aurora*, and the liners *Dacia*, *Regele Carol I* and *România*, minelayers in 1940–41). They are in DD, BC and BB; *Aurora* is left out.
- **Minesweepers:** considered, skipped: the M40-type boats of 1943 were numbered (DB-13 to DB-16); the *Democrația* class is from 1954–56.
- **Auxiliary cruisers and seaplane tenders:** considered, skipped: no naval role was found for the SMR liners *Împăratul Traian* and *Principesa Maria*, and the navy listed *Dacia*, *România* and *Regele Carol I* only from 1940.
- **Escort destroyers, corvettes, frigates, sloops, avisos, patrol vessels:** considered, skipped: no named series. The ex-French boats served as escorts and are in the gunboat pool.
- **Scout cruisers, flotilla leaders:** considered, skipped: *Mărăști* and *Mărășești* only, both in DD.
- **Fast attack craft:** covered by the torpedo-boat pool. The German boats of 1944 were numbered.
- **Coastal defense, armored cruisers, fast battleships, large cruisers, AA cruisers:** considered, skipped: no ship, and no name in the 1899 or 1912 programmes.
- **Escort and light carriers:** considered, skipped: no precedent.
- **Cruiser, coastal and minelaying submarines:** considered, skipped: the midget boats were numbered (CB-1 to CB-6); *Rechinul* and *Marsuinul* are in SS.
- **Training ships, submarine tenders, state yachts, icebreakers:** considered, skipped: one or two names each (*Mircea*, *Constanța*, *Luceafărul*), in BC, CL and CV.

## Collision Resolutions

Role pools may not share a name with CL, CA, BB, BC or CV, so each name below has one owner. `-Audit ROM`: no `CrossClass`, `CrossClassVariant`, `BBBCMirror` or `RoleOverlap` finding.

| Name | Owner | Consequence |
|---|---|---|
| *Bistrița* | CL (vanilla city name) | The 1888 gunboat of that name is left out of `ROM_GUNBOATS` |
| *Alexandru cel Bun* | `ROM_GUNBOATS` (1882 vessel) | BB and CA do not list him |
| *Grivița*, *Rahova*, *Smârdan*, *Opanezul* | `ROM_GUNBOATS` | BC lists no battle of 1877; *Plevna* and *Vidin* are in DD |
| *Brătianu*, *Catargiu*, *Kogălniceanu*, *Lahovari* | `ROM_GUNBOATS` | BB lists no statesmen; `ROM_REVOLUTION` repeats two of them |
| *Șoimul*, *Vulturul* | `ROM_TORPEDO_BOATS` | CV raptors use other species |
| *Rândunica*, *Fulgerul* | role pools | Not listed in BC as historic vessels |
| *Argeșul* | `ROM_TORPEDO_BOATS` | DD takes *Streiul* instead |
| *Ardeal*, *Basarabia*, *Bucovina* | BB | The three monitors are not in `ROM_GUNBOATS` |
| *Constanța*, *București*, *Cluj*, *Târgu Mureș*, *Mangalia*, *Sulina* | CL | Removed from BB, BC and CV |
| *România*, *Banat* | BB | Removed from CV |
| *Cetatea Albă* | BC | CL does not list the city. The other fortress towns stay plain in CL (*Hotin*, *Soroca*, *Tighina*) and take the `Cetatea ...` title in BC. `-Audit` reports *Tighina* ~ *Cetatea Tighina* as a `CrossClassPerson` INFO: city and fortress, kept |
| *Vaslui* | CL | BC uses *Podul Înalt* for the battle of 1475 |
| *Mircea* / *Mircea cel Bătrân* | BC (the brig) / BB (the ruler) | The brig carried the bare name |
| *Regele Carol I* | BB | DD lists only the two royal names that real destroyers carried |

- **Same place, different class (kept):** CL *Constanța* and BC *Tomis*, CL *Mangalia* and BC *Callatis* (the ancient cities), CL *Chilia Nouă* and BC *Cetatea Chiliei*, CL *Suceava* and BC *Cetatea Sucevei*, CL *Tighina* and BC *Cetatea Tighina*: a city in CL and its citadel or ancient city in BC, by the same rule as Tighina.
- **Same place, two names in BB (kept):** *Ardeal* and *Transilvania*; both were ship names (the monitor of 1920 and the SMR liner).
- **DD against the torpedo boats:** DD takes the bare forms of the 1913 order (*Vifor*, *Vijelie*, *Vârtej*, *Viscol*); the role pool takes the definite forms the boats carried. The strings differ.
- **DD against the gunboats:** DD rivers and battles avoid the pool's names.
- **Thematic pools** stand alone and may repeat hull names, as in the Finnish model file. Bare forms keep them apart in most cases (*Morun* in Fish, *Morunul* in SS; *Olt* in Rivers, *Oltul* in the gunboats).
- **Provinces against Rivers:** counties named exactly like a river (*Olt*, *Argeș*, *Mureș*, *Prahova*, *Dâmbovița*, *Ialomița*, *Teleorman*, *Caraș*, *Someș*) appear in Rivers only; *Putna*, *Ilfov*, *Moldova* and the two *Târnava* counties appear in Provinces only.

## Linguistic and Verification Notes

**Terms**
- **Confirmed** (ro.wikipedia, "Listă de nave militare românești" and "Distrugător"): `cuirasat`, `distrugător`, `portavion`, `torpilor`, `canonieră`. The navy used *distrugător*, not *contratorpilor*, for the interwar destroyers.
- **Battlecruiser:** `crucișător de linie` is the ro.wikipedia article title; `crucișător de bătălie` is a common variant. Dossier A's `crucișător de luptă` was not found anywhere.
- **Kept without a lookup:** `crucișător ușor`, `crucișător greu`, `submarin`, and the pool fallbacks (`Oraș`, `Județ`, `Râu`, `Munte`, `Voievod`, `Erou`, `Bătălie`, `Legendă`, `Pasăre`, `Pește`, `Virtute`, `Coroană`, `Ideal`, `Socialist`, `Naționalist`).
- **Prefix:** `NMS` is used consistently for the royal navy's ships. Its expansion (*Nava Majestății Sale*) was not sourced.

**Orthography**
- The `â`/`î` rules of 1904 match today's. Only the 1953–93 spelling (`Tîrgu`, `Romînia`) differs, and it is not used.
- Period forms: `Sborul` (not *Zborul*), `Cluj`, `Turnu Severin`, `Bazargic`, `Cetatea Albă`, `Tighina`, `Sighet` (the city's name until 1960).
- Review replacements: `Ghiborț` (the ruffe) for `Șip`, which reads as *Sip* or *Ship*; `Barză Neagră` (the black stork) for `Cocostârc`, a synonym of `Barză`.
- DOOM3 forms from the vocabulary pass: `Ieruncă`, `Zărgan`, `Pescăraș Albastru` (the kingfisher; *pescăruș* is the gull), and the hyphenated sea creatures (`scorpie-de-mare`, `pisică-de-mare`, `vulpe-de-mare`, `câine-de-mare`, `cal-de-mare`, `drac-de-mare`, `rândunică-de-mare`, a gurnard). `Zamolxe` is the Romanian form of *Zalmoxis*.

**Vessels**
- Verified (navypedia; en.wikipedia "Romanian Danube Flotilla", "List of main Romanian Navy warships of World War II", "Vifor-class destroyer", "NMS Trotușul", "NS Mircea", "Nahlin (yacht)"): every role-pool name; *Elisabeta*; *Constanța*; the four destroyers and the 1913 order; the three submarines; *Amiral Murgescu*; *Cetatea Albă* (laid down 1939, cancelled); *Dacia* (liner of 1907, minelayer from 1940); the brig *Mircea* (existence only) and the barque *Mircea* (1939); the yacht *Luceafărul* (1937).
- Dropped after the fact-check: *Împăratul Traian* and *Principesa Maria* (postal steamers with no naval role found) and *Durostor* (a mine transport listed only from 1940) from BC.

**Persons: sourced**
- Senior naval commanders (en.wikipedia, "Commander of the Navy (Romania)"; ro.wikipedia "Nicolae Dimitrescu-Maican" and "Vasile Urseanu"; Muzeul Marinei): Ioan Murgescu (1846–1913), Emanoil Boteanu (1836–1897), Nicolae Dimitrescu-Maican (1846–1902; the ro.wikipedia and en.wikipedia spelling, not *Dumitrescu*; ro.wikipedia gives general, Muzeul Marinei contraamiral, and the ship name carries no rank), Emanoil Koslinski (1853–1909), Constantin Bălescu (1864–1929), Vasile Scodrea (1872–1934), Vasile Urseanu (1848–1926, viceamiral; he commanded the first sea division, *Elisabeta* and the brig *Mircea*, and is not in the commanders table). Nicolae Steriade (first commander, 1860–63) and Scarlat Murguleț (b. 1831) are sourced as commanders; their death dates were not found, but both commanded in the 1860s and were dead by 1936.
- Left out: Constantin Niculescu-Rizea (alive in 1938), Nicolae Negru (no dates), Constantin Petrescu and Anton Barbieri (no dates; not needed), and the twelve officers no source reached in the planning pass.
- 1877 and 1916–19 (en.wikipedia articles; Adevărul; Carpica 2015 via CEEOL; ziaruldebacau.ro): Mihail Cerchez (1839–1885), Alexandru Cernat (1828–1893, Minister of War in 1877), Grigore Ignat (1889–1917; rank disputed, so no rank), Constantin Mușat (killed at Oituz, 1917), Măriuca Zaharia (killed at Mărășești, 1917), Constantin Țurcanu "Peneș Curcanul" (d. 1932), Gheorghe Șonțu and Nicolae Valter Mărăcineanu (killed at Grivița, 1877).
- Early modern and 1848 (en.wikipedia; euroavocatura.ro; Chastain, Ohio University): Baba Novac (d. 1601), Preda and Stroe Buzescu and Radu Calomfirescu (commanders of Mihai Viteazul; dates not found), Pintea Viteazul (d. 1703), Iancu Jianu (1787–1842), Ioan Buteanu (1821–1849), Petre Dobra (d. 1849; the sources' form, not *Petru*).
- Rulers (en.wikipedia lists of princes of Wallachia and monarchs of Moldavia, "Dacia", "Dromichaetes", "Litovoi", "Gelou", "Glad (duke)", "Menumorut"): every name in `ROM_RULERS`, the rulers in CA and BB, and Dromichete. Gelu, Glad and Menumorut are known only from the *Gesta Hungarorum*; Negru Vodă is the legendary founder of Wallachia. `Vlaicu Vodă` replaces *Vladislav Vlaicu*, a form the list does not use.
- Royal house (Unofficial Royalty; en.wikipedia; peles.ro; Muzeul Unirii Alba Iulia): every person, symbol, order and residence in `ROM_MONARCHISM`. The heir's title from 1930 is *Mare Voievod de Alba Iulia*; the planned *Marele Voievod Mihai* is not attested.
- Democratic pool (en.wikipedia, "List of prime ministers of Romania", "Wallachian Revolution of 1848", "Transylvanian Memorandum", articles): every statesman and event. *Ion Câmpineanu* is the radical of 1798–1863. *Vasile Goldiș* (1862–1934) stands for 1918, not the Memorandum.
- Communist pool (en.wikipedia articles): Constantin Dobrogeanu-Gherea (1855–1920), I. C. Frimu (1871–1919), Ștefan Gheorghiu (1879–1914), Leonte Filipescu (1895–1922), Pavel Tcacenco (d. 1926; not *Tcacenko*), Vasile Roaită (d. 1933), Haia Lifșiț (1903–1929); the 1907 revolt, 13 December 1918, the Lupeni and Grivița strikes, Doftana, *România Muncitoare*, *Socialismul*.
- Fascist-government pool (en.wikipedia, "Iron Guard"): *Legiunea Arhanghelului Mihail* (1927), *Totul pentru Țară* (1935), *Pământul Strămoșesc* (1927), *Buna Vestire* (in the movement's media list), *Cuibul* ("a chapter of the Legion was called a *cuib*"), *Frăția de Cruce* (the youth wing, *Frățiile de Cruce*); *Ginta Latină* (Alecsandri, 1878). The pool names no person.

**Persons: kept without a lookup (well documented)**
- CA and HEROES: Iancu de Hunedoara, Horea, Cloșca, Crișan, Tudor Vladimirescu, Avram Iancu, Nicolae Bălcescu, Gheorghe Magheru, Axente Sever, Ion Dragalina, Eremia Grigorescu, David Praporgescu, Ecaterina Teodoroiu (confirmed in the persons pass as well documented).
- HEROES: Andrei Mureșanu, Simion Bărnuțiu, Samuil Micu, Gheorghe Șincai, Petru Maior, Ion Budai-Deleanu, Gheorghe Lazăr, Gheorghe Asachi, Ion Heliade Rădulescu, Mihai Eminescu, Ion Creangă, Ion Luca Caragiale, Vasile Alecsandri, George Coșbuc, Alexandru Vlahuță, Barbu Delavrancea, Ioan Slavici, Titu Maiorescu, Bogdan Petriceicu Hasdeu, Dimitrie Bolintineanu, Grigore Alexandrescu, Costache Negruzzi, Alecu Russo, Iancu Văcărescu, Nicolae Grigorescu, Theodor Aman, Ciprian Porumbescu, Anghel Saligny, Spiru Haret, Carol Davila, Victor Babeș, Ion Cantacuzino, Petrache Poenaru, Ion Ionescu de la Brad.
- CV and HEROES: Aurel Vlaicu (d. 1913), Traian Vuia and Henri Coandă (alive in 1936, famous since 1906 and 1910).
- `ROM_REVOLUTION` dates of C. A. Rosetti, Ioan Rațiu and Gheorghe Pop de Băsești (roles sourced).

**Places and vocabulary**
- Sourced: 64 of the 71 interwar județe; the 1930s status of *Chilia Nouă*, *Reni*, *Bolgrad*, *Balcic* and *Cavarna*; the fortresses (en.wikipedia "List of castles and fortresses in Romania", "List of fortifications in Wallachia"; rri.ro); every battle in BC and `ROM_BATTLES` except *Valea Jiului* (1916, named only in the en.wikipedia navbox) and *Răzoare* and *Muncelu* (sourced as sites of the Mărășești battle, dates not found).
- Dropped after the fact-check: *Nămoloasa* (a planned attack of 1917, cancelled before it began) and *Cașin* (no Romanian action sourced), from DD and `ROM_BATTLES`; *Năvodari* (a village until 1968).
- Kept without a lookup: *Slobozia* (a vanilla city; its 1930s status was not found), the Dacian and Greek citadels (*Sarmizegetusa*, *Blidaru*, *Piatra Roșie*, *Căpâlna*, *Bănița*, *Histria*, *Tomis*, *Callatis*, *Capidava*), and most bird, fish, folklore, mountain and river names (the vocabulary pass confirmed about 21 entries, corrected 4 and reached no list page for the rest).

**English homonyms**
- Qualified: `Voievodul Glad` (not bare *Glad*), `Dan I`, `Roman I`, `Pescăraș Albastru`.
- Replaced or left out: `Clean` (the chub; `Sabiță` instead), `Șip` (the ship sturgeon; `Ghiborț` instead; `Șipul` stays in SS), `Roman` (city and county), `Bran` (`Castelul Bran` only), `Brad`, `Crap`, `Lin`, `Ger`, `Dor`, `Mare`, `Pace`, `Rege`.
- Kept as proper names or meaningful cognates: `Arad`, `Deva`, `Dacia`, `Gaia` (the kite), `Gloria`, `Victoria`, `Aurora`, `Meteor`.

## Open Decisions

No answer came before implementation (2026-10-14), so the plan's defaults were applied. Each can be reversed with `-EditNames`.
1. **Content of `ROM_NATIONALISM`: default applied, without persons.** National-revival vocabulary plus the Legionary movement's institutional names and press. Moța and Marin were dropped at review (alive in 1936). Alternatives: no Legionary names (11 entries, below the floor), or no fascism pool.
2. **Gate of `ROM_MONARCHISM`: default applied,** `NOT = { has_government = communism }`. Alternative: `has_government = neutrality` (Italy's precedent).
3. **Glyph check in tooling: not done.** A FAIL in `-ValidateOnly` for U+0218–U+021B would need a rule in `CLAUDE.md` and `GEMINI.md`; it waits for approval.
4. **`Contraamiral Sebastian`: dropped** with the other three admirals.

## Change Table

| Group | Vanilla | ISNE | Change |
|---|---|---|---|
| `ROM_DD_HISTORICAL` | 13 | 87 | 6 vanilla names kept (*Viscul* → *Viscol*); 4 admirals and 2 corvettes dropped; *Zborul* → `ROM_TORPEDO_BOATS` as *Sborul* |
| `ROM_SS_HISTORICAL` | 8 | 51 | *Nautilus* dropped; *Narval* → *Narvalul*, *Peste-Spada* → *Peștele-spadă*; *Baracuda* and *Somonul* kept |
| `ROM_CL_HISTORICAL` | 10 | 72 | Vanilla towns kept and corrected; 6 cities added from BB, BC and CV |
| `ROM_CA_HISTORICAL` | 10 | 35 | Clone of CL replaced |
| `ROM_BB_HISTORICAL` | 3 | 35 | Cities moved to CL |
| `ROM_BC_HISTORICAL` | 3 | 39 | Clone of BB replaced |
| `ROM_CV_HISTORICAL` | 7 | 33 | *România*, *Banat* → BB; 4 cities → CL; *Năvodari* dropped |
| `ROM_REGIONS` → `ROM_PROVINCES` | 14 | 53 | Exonyms corrected; cities and *Herța* removed |
| `ROM_CITIES` | 40 | 88 | *Puebla* and the duplicate dropped; diacritics |
| 15 new groups | – | – | 2 role pools, 9 thematic pools, 4 ideological pools |

## Implementation Steps

- [x] Open decisions 1 and 2: defaults applied (no answer before implementation).
- [x] Six fact-check passes (2026-10-14, about 140 web calls); persons recorded above as sourced, kept on ship precedent or kept without a lookup, and the unsourced ones dropped.
- [x] Authored `common/units/names_ships/ROM_ship_names.txt` (UTF-8 without BOM), 24 groups.
- [x] Comma-below letters converted to cedilla letters; none remains [SPR-023].
- [x] `-ValidateOnly`, `-VerifyShipTypes ROM`, `-Audit ROM` (FAIL=0), `-Test`: see Review Fixes.
- [ ] In game, on a new save: the Ship Designer dropdown shows the 13 ungated pools and `"Royal House"` at the 1936 start; *Mărăşeşti* and *Constanţa* render in the fleet view, the map and the ship details header. Not done: needs a game launch.
- [x] Docs: `README.md`; workshop row, Romania block and header pitch; `wiki/Romania.md`, `wiki/Home.md`, `wiki/_Sidebar.md`; `ROM` row removed from `docs/ROADMAP.md`.
- [x] `-SyncWiki ROM` (0 rows changed). Wiki push: waits for the user's word.
- [x] `isne-code-reviewer`: see Review Fixes.

## Review Fixes (isne-code-reviewer, 2026-10-14)

Verdict: approve after three Important fixes; no Critical findings. All three Important findings and the Minor ones below were fixed.

- **`Nicolae Dimitrescu-Maican`** replaces the misspelt *Dumitrescu-Maican* in DD.
- **Moța and Marin dropped from `ROM_NATIONALISM`:** alive at the 1936 start, against the living-persons rule. *Renașterea Națională* dropped as well (Carol II's front, hostile to the Legion). *Cuibul*, *Frăția de Cruce* and *Buna Vestire* (en.wikipedia "Iron Guard") keep the pool at 20.
- **`Ghiborț` replaces `Șip`** in Fish (English homonym).
- **`Barză Neagră` replaces `Cocostârc`** in Birds (a synonym of *Barză*).
- **Display names:** `"Myth & Folklore"` (the pool holds four Dacian and Thracian gods) and `"Virtues & Elements"` (it holds eight sky entries).
- **Plan:** the same-place pairs across CL and BC are listed under Collision Resolutions; the stale *Făgăraș* row is gone; the SS change line, the dropped *Herța* and the *Viscul* note are corrected; Urseanu is described as a senior commander, not a commander of the navy.
- **Wiki:** the Romania row in `wiki/Home.md` follows Portugal; `wiki/Romania.md` says "senior naval commanders" and "the map and main UI fonts".
- **Re-run after the fixes:** `-ValidateOnly` passed, `-Audit ROM` FAIL=0, `-Test` passed.

## Review Focus

1. **Vanilla fixes:** fallbacks corrected, clones broken, `Puebla` and the duplicate gone, the post-war names out, every other vanilla name present in its new group.
2. **Glyphs:** no comma-below letter in the namelist file.
3. **Cross-class and role overlap:** zero overlap between CL, CA, BB, BC and CV; no role-pool name in any of those five; BB and BC follow separate doctrines.
4. **Vanilla references:** `ROM_DD_HISTORICAL` and `ROM_SS_HISTORICAL` defined.
5. **Ideological separation:** four pools, each gated with `has_government` only, no living leaders outside the royal pool, no opposing currents mixed.
6. **Prefix:** `NMS ` with a trailing space on all 24 groups; no `ship_types` on any pool.
7. **Persons:** every named person is in the verification notes, either sourced or marked.
8. **Docs:** README, workshop row, block and pitch, the three wiki files, and the removed roadmap row.
