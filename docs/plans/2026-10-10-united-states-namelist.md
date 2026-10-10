# United States (TAG: USA) Ship Namelist Plan

**Goal:** Bring the vanilla US file (`USA_ship_names.txt`, 24 groups, about 2,800 names) into ISNE without losing its depth. The work repairs vanilla's bugs, decouples the cruiser and carrier rosters, turns vanilla's four hull-bound sub-type lists into role pools, and adds role, thematic and ideology pools built on documented US Navy naming conventions. The seven Confederate lists are kept and repaired.

**Sources:**
- Two parallel `isne-historical-researcher` dossiers (2026-10-10): A covered hulls and roles, B covered thematic and ideological pools and the Confederate spelling check.
- Scripted rosters: English Wikipedia list pages fetched as raw wikitext and parsed for ship names with hull numbers (destroyers, destroyer escorts, cruisers, carriers, escort carriers, submarines, mine warfare vessels, patrol vessels, auxiliaries, amphibious ships, oilers, monitors, Coast Guard cutters, sailing frigates, sloops of war, ships of the line, Continental Navy, Liberty ships). Every roster-derived name is a real ship with an article or list entry.
- No separate fact-check pass: the persons in the new pools are either ship namesakes confirmed in those rosters or well-documented public figures (see Verification Notes).

**Author scope decisions (AskUserQuestion, 2026-10-10):**
- **No list significantly shortened** (the user's request): vanilla lists keep their depth even where they exceed the depth targets.
- **New pools, "Full set":** every role pool with real US Navy precedent, plus seven thematic pools drawn from auxiliary naming traditions.
- **Ideology, "Repair + new gated pools":** the Confederate lists are kept and repaired, not extended. New pools for the communist and democratic paths; a fascist pool only if research found enough verifiable material (it did not).

## Vanilla Audit Findings (Step 0)

1. **Hull-bound sub-type lists:** `USA_DE_HISTORICAL`, `USA_CLAA_HISTORICAL`, `USA_CVL_HISTORICAL` and `USA_MINELAYERS_HISTORICAL` carried `ship_types`. They are now universal role pools.
2. **Tags vanilla script assigns:** `name_group = USA_CVL_HISTORICAL` (the Casablanca Class built by a focus in `common/national_focus/usa.txt`) and `name_group = USA_MINELAYERS_HISTORICAL` (the starting Oglala Class in `history/countries/USA - USA.txt`). The mod file shadows the whole vanilla file, so both role pools keep their vanilla tags. The other two sub-type lists are not referenced: one takes the catalogue tag `USA_ESCORT_DESTROYERS`, the other the new suffix `USA_AA_CRUISERS`.
3. **Copy-paste padding:** one block of old cruisers (21 names, 22 in CLAA) sat in CL, CLAA and the minelayer list. CLAA also copied the canceled Cleveland and Fargo names. Each name now has one home.
4. **Cross-class collisions:** 24 city names shared by CL and CA; 12 carrier names shared by CV and CVL; `Saratoga` in CA and CV; `Wake Island` in BC and the escort carriers.
5. **In-list duplicates:** 15 in DD (Cassin, Ingraham, Little, Gregory, Colhoun, McKean, Barney, Biddle, Du Pont, Leary, Borie, Sampson, Barry, Lawrence, Decatur); Atlanta and Juneau in CL; three rivers in the Confederate submarine list.
6. **Damaged strings:** tab characters inside five destroyer-escort and minelayer names, trailing spaces in four names, and `"Herring""Haddo"` without a separating space.
7. **Not US Navy names:** `Ever Given` (CV; the 2021 container ship), `Kinn` (SS; Norwegian, ex-U-1202) and `Springeren` (SS and FISH; Danish).
8. **Typos:**
   - DE: `Picketts` → `Ricketts`, `Harveston` → `Harveson`, `Chatelaine` → `Chatelain`, `Eldon` → `Elden`, `Le Hardy` → `LeHardy`, `Le Ray Wilson` → `LeRay Wilson`, `Joseph C Hubbard` → `Hubbard`, `JRY Blakely` → `J. R. Y. Blakely`, `Leslie LB Knox` → `Leslie L. B. Knox`. `Albert W Grant` and `Bearss` were Fletcher-class destroyers listed among the Edsall class; they stay in DD only.
   - DD: `MacDonough` → `Macdonough`. `Prichett` is correct (USS Prichett, DD-561); a dossier suggestion to change it was rejected against the roster.
   - CV and escort carriers: `Shangri-la` → `Shangri-La`, `Liscombe Bay` → `Liscome Bay`.
   - CA: `St. Paul` → `Saint Paul` (CA-73).
   - Minelayers: `Barbicon` → `Barbican`, `Col. George Reacher` → `Col. George Ricker`, `Gen. Samuel L Mills` → `Gen. Samuel M. Mills`, `BG Henry L Abbott` → `Brig. Gen. Henry L. Abbot`; `MG`, `BG` and `1LT` spelled out.
   - Initials take their periods throughout (`Hilary P Jones` → `Hilary P. Jones`, `Lewis & Clark` → `Lewis and Clark`), following the Navy's own spelling.
9. **Confederate lists:**
   - `CSA_CL_CONFEDERATE` was bound to `ship_hull_light destroyer`; it is now `ship_hull_cruiser light_cruiser`.
   - `CSA_DD_CONFEDERATE` used the display key `NAME_THEME_CONFEDERATE_DESTROYERS`, which vanilla localisation does not define; the defined key is `NAME_THEME_CONFEDERATE_DD`.
   - All seven lists were gated by `OR = { tag = CSA has_completed_focus = USA_honor_the_confederacy }`. The gate is now `OR = { tag = CSA has_government = fascism }` (CLAUDE.md §2 and §7). Behaviour changes for the USA: a fascist USA sees the lists without the focus, and a non-aligned USA that took the focus no longer does.
   - Spelling fixes are listed under Verification Notes.
10. **Swapped section comments:** the Fish and Birds headers were exchanged.
11. **Thematic pools restricted by hull:** `USA_STATES` and `USA_CITIES` carried `ship_types`, and none of the six thematic pools had a `fallback_name`.
12. **Fallback:** `Battlecruiser BC-%d` used a designator the US Navy never had; it is now `Battlecruiser CC-%d` (the Lexington-class designation) in both the US and the Confederate battlecruiser lists.
13. **Prefix:** `USS ` on every US group and `CSS ` on the Confederate lists; both kept.

## Final Architecture (41 groups, about 4,355 names)

| Group | Count | Vanilla | Content |
|---|---|---|---|
| `USA_DD_HISTORICAL` | 642 | 629 | Vanilla class lists; adds 36 earlier destroyers of the Paulding, Wickes and Clemson classes and *Cassin Young* |
| `USA_SS_HISTORICAL` | 299 | 289 | Vanilla class lists; adds pre-1911 names, *Squalus* and renamed or canceled hulls. Also covers midget and cruiser submarine hulls |
| `USA_CL_HISTORICAL` | 95 | 92 | Brooklyn to Fargo classes, Omaha class, canceled hulls, earlier cruisers; 36 cities without a cruiser namesake |
| `USA_CA_HISTORICAL` | 61 | 61 | Pensacola to Des Moines classes, canceled hulls, armored cruisers under their city names; 13 major cities |
| `USA_BB_HISTORICAL` | 48 | 48 | The 48 states |
| `USA_BC_HISTORICAL` | 48 | 16 | Alaska class, vanilla's territory names, Lexington class of 1916, original frigates, sail-era and Civil War flagships |
| `USA_CV_HISTORICAL` | 65 | 42 | Vanilla carriers, *Langley*, *Crown Point*, and battles under the Essex-class convention |
| `USA_ESCORT_DESTROYERS` | 479 | 420 | Vanilla class lists plus further wartime hulls and the Dealey and Courtney classes |
| `USA_AA_CRUISERS` | 14 | 42 | Atlanta, Oakland, Juneau and Worcester classes |
| `USA_CVL_HISTORICAL` | 128 | 85 | Independence and Saipan classes; every escort carrier class, with names assigned to Royal Navy hulls |
| `USA_MINELAYERS_HISTORICAL` | 67 | 66 | CM, mine barrage ships, DM, ACM, Army mine planters |
| `USA_MINESWEEPERS` | 209 | new | Adroit, Auk and Admirable class word names; coastal minesweepers |
| `USA_FRIGATES` | 76 | new | Asheville and Tacoma classes |
| `USA_CORVETTES` | 25 | new | Temptress and Action classes |
| `USA_GUNBOATS` | 33 | new | Patrol gunboats and Yangtze river gunboats |
| `USA_PATROL_VESSELS` | 85 | new | Coast Guard cutters, prefix `USCGC ` |
| `USA_SEAPLANE_TENDERS` | 50 | new | AV and Barnegat class |
| `USA_SUBMARINE_TENDERS` | 23 | new | AS |
| `USA_MONITORS` | 40 | new | Civil War and New Navy monitors |
| `USA_STATES` | 48 | 48 | Vanilla |
| `USA_CITIES` | 143 | 143 | Vanilla |
| `USA_BATTLES` | 62 | 28 | Vanilla plus 34 battles |
| `USA_LEADERS` | 92 | 40 | Vanilla plus presidents, founders, soldiers, pioneers, inventors and four Native leaders |
| `USA_BIRDS` | 167 | 57 | Vanilla plus every bird-named minesweeper, coastal minesweeper and submarine rescue ship |
| `USA_FISH` | 296 | 273 | Vanilla plus the submarine names it lacked |
| `USA_NATIVE_NATIONS` | 76 | new | Fleet and auxiliary tugs |
| `USA_RIVERS` | 142 | new | Fleet oilers and gasoline tankers |
| `USA_GEOGRAPHY` | 50 | new | Ammunition ships, amphibious command ships, destroyer tenders |
| `USA_NATURE` | 114 | new | Cargo, attack cargo and stores ships (stars, constellations, planets and moons) |
| `USA_MYTHOLOGY` | 77 | new | Repair ships and PT-boat tenders |
| `USA_VIRTUES` | 61 | new | Coastal minesweepers, coastal patrol yachts, hospital ships |
| `USA_OLD_NAVY` | 45 | new | Continental Navy, sail-era sloops, brigs and schooners |
| `USA_REPUBLICAN_IDEALS` | 50 | new | `democratic`-gated |
| `USA_SOCIALISM` | 52 | new | `communism`-gated |
| `CSA_DD_CONFEDERATE` | 111 | 112 | Confederate generals |
| `CSA_CL_CONFEDERATE` | 86 | 86 | Confederate victories |
| `CSA_CA_CONFEDERATE` | 61 | 61 | Southern cities |
| `USA_BB_CONFEDERATE` | 20 | 20 | Southern and claimed states |
| `USA_BC_CONFEDERATE` | 13 | 13 | Stinging and venomous creatures |
| `USA_CV_CONFEDERATE` | 23 | 23 | Confederate leaders |
| `CSA_SS_CONFEDERATE` | 81 | 81 | Southern rivers |

Vanilla counts are unique names. Two lists are shorter than vanilla, both by design:
- **`USA_AA_CRUISERS` (42 → 14):** 30 names left the list and *Worcester* and *Roanoke* joined it. The 30 were the copied CL blocks and now sit in CL (15), CA (9), the minelayers (4), BC (*Hartford*) and the frigates (*Tacoma*). No further anti-aircraft cruiser was ever named (CL-154 to CL-159 were canceled unnamed), so the pool stays at 14 and `-Audit` reports the depth WARN. This cut is the author's reading of the "no list significantly shortened" request and still needs the user's sign-off.
- **`CSA_DD_CONFEDERATE` (112 → 111):** *D.H. Hill* also sat in the Confederate carrier list and stays there.

The six vanilla thematic pools keep their localisation keys (`NAME_THEME_STATES`, `NAME_THEME_FISH` and so on), which every game language translates. `USA_FISH` therefore still displays as "Fish" although it also holds sea mammals and the submarine names *Kraken* and *Unicorn*. The four converted role pools trade vanilla's translated keys for short English literals, like every other role pool in the mod (the vanilla key for the anti-aircraft cruisers is 33 characters long).

## Role Pools: considered / created / skipped

- **Destroyer escorts:** created (`USA_ESCORT_DESTROYERS`). Evarts to John C. Butler classes, hulls completed as fast transports, canceled hulls, Dealey and Courtney classes. French and Royal Navy names of transferred hulls are left out.
- **Anti-aircraft cruisers:** created (`USA_AA_CRUISERS`; suffix added to `Get-RolePoolSuffixes` and to the catalogue in both skill mirrors). 14 names.
- **Light carriers:** considered, folded: the ten names sit in `USA_CVL_HISTORICAL` with the escort carriers, as in vanilla, because that tag must survive and ten names fall short of the role target.
- **Escort carriers:** created inside `USA_CVL_HISTORICAL`.
- **Minelayers:** created (`USA_MINELAYERS_HISTORICAL`). The Army mine planters keep vanilla's rank-titled names under the `USS ` prefix.
- **Minesweepers:** created (`USA_MINESWEEPERS`). The bird-named sweepers go to `USA_BIRDS`, the virtue-named coastal sweepers to `USA_VIRTUES`.
- **Patrol frigates:** created (`USA_FRIGATES`). The Royal Navy names of PF-72 to PF-92 are left out.
- **Corvettes:** created (`USA_CORVETTES`). 25 names.
- **Gunboats:** created (`USA_GUNBOATS`). City names already used by cruisers stay with the cruisers.
- **Patrol vessels:** created (`USA_PATROL_VESSELS`) as Coast Guard cutters with the `USCGC ` prefix: Treasury, Lake, Owasco, Tampa, Algonquin, Thetis and Active classes.
- **Seaplane tenders:** created (`USA_SEAPLANE_TENDERS`). The destroyer conversions (AVD) keep their destroyer names in DD.
- **Submarine tenders:** created (`USA_SUBMARINE_TENDERS`). 23 names.
- **Monitors:** created (`USA_MONITORS`). The state-named Arkansas class stays with the battleships.
- **Sloops, avisos:** considered, skipped: no US class series under those designations in the era.
- **Scout cruisers, flotilla leaders, torpedo boats, fast attack craft:** considered, skipped: the Omaha class is in CL, the destroyer leaders and torpedo boats share the destroyer formula, PT boats were numbered.
- **Coastal defense, fast battleships, large cruisers, armored cruisers:** considered, skipped: state names belong to BB, the Alaska class to BC, the armored cruisers' city names to CA.
- **Cruiser, coastal and minelaying submarines:** considered, skipped: nine V-boat names, all in SS; the coastal boats were numbered.
- **Auxiliary cruisers:** considered, skipped: about 12 names from 1898 with no formula; half collide with cruisers.
- **Training ships, icebreakers, state yachts:** considered, skipped: below the floor or no series.
- **Destroyer tenders, repair ships, oilers, tugs, cargo ships, ammunition ships:** not role pools; their naming conventions supply the thematic pools.

**Thematic conventions considered and skipped:** gems and minerals (patrol yachts), counties (attack transports) and trees (net tenders) have real series but were left out to keep the Ship Designer dropdown within the approved scope. A fascist or non-aligned pool was skipped: no verifiable, non-living, non-Confederate material reaches 20 names.

## Collision Resolutions

- **CL and CA:** each shared city went to the class of the ship in commission or on order in 1936-45.
  - CA keeps Vincennes, Astoria, Houston, Boston, Chicago, Baltimore, Pensacola, San Francisco, Minneapolis, New Orleans, Albany, Des Moines and Norfolk.
  - CL keeps Helena, Brooklyn, Huntington, St. Louis, Milwaukee and Memphis.
  - *Dallas* stays with the destroyer (DD-199) and *Saratoga* with the carrier.
  - *Montgomery* (C-9) was renamed *Anniston* in 1918; CL keeps *Anniston* and the name *Montgomery* goes to the destroyer minelayer DM-17.
- **Backfill:** no unused cruiser nameplate exists beyond what vanilla had (Dossier A, from the Cleveland, Fargo and Worcester class pages). CL and CA are therefore extended with cities that never had a cruiser, chosen to collide with no other list.
- **CV and the carrier pool:** the battle names stay in CV. *Independence* and *Princeton* go to the light carriers (CVL-22, CVL-23). *Langley* goes to CV as the first carrier. *Midway* and *Coral Sea* stay in CV; the escort carriers that first bore them appear as *St. Lo* and *Anzio*.
- **BC:** *Constellation* and *United States* move from CV to BC as Lexington-class names of 1916; *Lexington*, *Saratoga* and *Ranger* stay with the carriers that bore them. *Hartford* moves from CL. Vanilla's invented territory names are kept except *Wake Island* (a real escort carrier) and *Midway Island* (a second form of *Midway*).
- **DD and destroyer escorts:** a shared name stays with the ship that bore it first. The older destroyers keep theirs. Six Gearing-class names taken from commissioned escorts stay with the escorts (Eversole, Fiske, Fechteler, Holder, Rich, Samuel B. Roberts). Names of canceled escort hulls stay with the destroyers that were built.
- **DD and minelayers:** the Robert H. Smith class and the flush-deck conversions (18 names) move to the minelayer pool; *Gwin* and *Aaron Ward* stay in DD.
- **Role pools:** a hull group keeps any name a role pool shares, except *Tacoma* (class leader of the frigates). Between role pools the earlier pool in file order keeps a name, except *Fulton* (submarine tenders), *Hamlin* and *St. George* (seaplane tenders) and *Gary* (anti-aircraft cruisers; the escort was renamed *Thomas J. Gary*).
- **New thematic pools:** names already in a hull or role group are left out (mythological submarine tenders, river-named escort carriers and minelayers, tribe-named monitors and cutters). Vanilla's six pools keep their overlap with the hull lists, as the user asked for no shortening.
- **Confederate set:** *Richmond* sat in both the battle and city lists; the city list keeps it.

## Tooling Changes

- **Regime-variant hull sets:** `-Audit` and `-VerifyShipTypes` accept a `can_use`-gated group tagged `<TAG3>_<HULL>_<SET>` as hull-bound (class `VARIANT`) only when `<SET>` is listed under `variantSets` in `data/ship_types_canon.json` (today: `CONFEDERATE`). They check its `ship_types` against the hull canon, decouple CL/CA/BB/BC/CV inside the set and apply no depth quota. `-Audit` also fails a variant tag that vanilla does not define. Rule: CLAUDE.md and GEMINI.md §2D.
- **`VanillaReference` (FAIL):** `-Audit` scans vanilla script for `name_group = <TAG>_...` and fails when the mod file no longer defines such a tag. `-InspectVanilla` prints the list.
- **`CanUseTrigger` (FAIL):** `can_use` may test only `has_government` and `tag` (with `OR`, `AND`, `NOT`).
- **Role suffixes:** `AA_CRUISERS`, and the vanilla-kept `MINELAYERS_HISTORICAL` and `CVL_HISTORICAL`.
- Tests for all of these are in `tests/BuildScript.Tests.ps1`.

## Linguistic and Verification Notes

- **Roster-derived names:** every name added to DD, SS, the role pools, `USA_BIRDS`, `USA_NATIVE_NATIONS`, `USA_RIVERS`, `USA_NATURE`, `USA_MYTHOLOGY` and `USA_VIRTUES` is a ship on the scraped Wikipedia rosters, apart from these well-documented additions made by hand: *Norton Sound*, *Salisbury Sound*, *Nourmahal*, *Alexander Hamilton*, *Northland*, *Bear*, *Cayuga*, *Chelan*, *Shoshone*, *Kilauea*, *Suribachi*, *Wassuc*, the hospital ships, and the repair ships *Achelous*, *Amycus*, *Agenor*, *Adonis*, *Patroclus*, *Bellona*, *Aeolus*, *Cerberus*, *Feronia*, *Chandra* and *Minerva* (Achelous-class page, Dossier B).
- **Persons, `USA_LEADERS`:** the additions are Liberty ship or Navy transport namesakes confirmed in the scraped lists, except *Rutherford B. Hayes* (the transport was USS *President Hayes*) and the four Native leaders *Geronimo*, *Osceola*, *Uncas* and *Samoset*, which are tug names. All died before 1936.
- **Persons, `USA_REPUBLICAN_IDEALS`:** Liberty ship or transport namesakes, except *George Mason* and *Samuel Gompers* (well documented, not found in the lists scraped). All died before 1936; Grace Abbott and Lillian Wald were left out as alive that year.
- **Persons, `USA_SOCIALISM`:** *Morris Hillquit*, *Meyer London*, *Morris Sigman*, *John Reed*, *Jack London*, *Peter J. McGuire*, *Robert Dale Owen*, *Edward Bellamy* and *Thorstein Veblen* are Liberty ship namesakes. The others are well-documented figures with death years from Dossier B (all before 1936). Left out as alive at the 1936 start: Emma Goldman, Alexander Berkman, Lincoln Steffens, Andrew Furuseth, Lucy Parsons, Art Young, Tom Mooney.
- **Vanilla persons alive in 1936:** `USA_LEADERS` keeps vanilla's Chester W. Nimitz, Dwight D. Eisenhower, George C. Marshall, Henry L. Stimson, Franklin D. Roosevelt and George Washington Carver, and DD keeps the post-war class names, because the user asked for no shortening.
- **Confederate spelling fixes (Dossier B):**
  - Generals: Lloyd Tilghman, Richard B. Garnett, John Dunovant, Stephen Elliott, Hiram B. Granbury, Otho F. Strahl, John C.C. Sanders, Victor J.B. Girardey, John R. Chambliss, Thomas R.R. Cobb, W.H.F. Lee, John Hunt Morgan, Pierce M.B. Young, Gustavus W. Smith.
  - Battles: Gaines' Mill, Chickamauga, Chustenahlah, Munfordville, Trevilian Station, Monocacy, Reams Station, Shepherdstown, Brices Cross Roads, Harpers Ferry.
  - Leaders: P.G.T. Beauregard, Nathan Bedford Forrest, Edmund Kirby Smith.
  - Rivers: Ouachita, Chattahoochee, Tallapoosa, Rappahannock, Nueces, Washita, Meramec, Bayou Macon, St. Johns.
  - City: Fort Worth.
- **Confederate entries replaced:** *Fort Pillow* and *Poison Spring*, remembered for the killing of surrendered Black Union soldiers, are replaced by *Sabine Pass* and *Palmito Ranch*; the battle *Richmond* (a duplicate of the city) by *Natural Bridge*. All three are Confederate victories. The list keeps its 86 names.
- **Confederate entries kept as vanilla:** *Thomas Alexander Harris* (a Missouri State Guard general, not a Confederate Army one), the non-victories *Parker's Cross Roads*, *Fort McAllister* and *Rappahannock Station*, and the Oklahoma cities.
- **Native nations:** *Papago*, *Mataco* and *Sarsi* (exonyms the peoples reject), the unclear *Moreno* and *Pinto* and the title *Sagamore* are left out of the tug names. The four individuals among them sit in `USA_LEADERS`.
- **English homonyms:** the word-named minesweepers and corvettes (*Fancy*, *Knave*, *Scurry*, *Vim*, *Pert*) and submarines (*Bang*, *Hoe*, *Jack*) are commissioned US Navy names and stay. Odd bird and sweeper names were dropped: Rail, Roller, Ruff, Driver, Hummer, Dipper, Sprig, Ruddy, Drake.
- **Review fixes (isne-code-reviewer, 2026-10-10):**
  - Variant sets tied to the canon list and to vanilla; `CanUseTrigger` turned into an allowlist; `VanillaReference` covers every tag prefix of the vanilla file.
  - `USA_SOCIALISM` displays as "Labor & Socialism" (19 of its entries are strikes, movements and communes); *May Day* and *Solidarity Forever* dropped, *Pullman* became *Pullman Strike*.
  - `USA_GEOGRAPHY` displays as "Peaks, Parks & Regions" (the destroyer-tender names are regions and parks).
  - CV lost *Valcour Island* (seaplane tender *Valcour*) and *Plattsburgh* (the same battle as *Lake Champlain*); CL swapped *Hampton* for *Wichita Falls* (CV *Hampton Roads*).
  - `USA_BATTLES` swapped the defeats *Java Sea*, *Kasserine Pass* and *Tassafaronga* for *Balikpapan*, *Remagen* and *Biak*.
  - Kept as they were, by choice: *Dallas* stays with the destroyer and *D.H. Hill* with the Confederate carriers, so each name has one home.
- **Era:** additions stop at names borne or assigned by about 1959. The 1960s Hamilton-class cutters, the Claud Jones class and later hulls are left out.

## Review Focus

1. **Vanilla fixes:** confirm the fixes above, and that no vanilla name was lost from the file except the documented removals (foreign vessels, joke entry, duplicates, the three replaced Confederate battles, *Midway Island*).
2. **Cross-class and role overlap:** confirm `-Audit` shows zero `CrossClass` and `RoleOverlap`, including inside the Confederate set.
3. **Vanilla references:** confirm `USA_CVL_HISTORICAL` and `USA_MINELAYERS_HISTORICAL` are defined and no pool other than the Confederate set carries `ship_types`.
4. **Gates:** confirm no `has_completed_focus` remains and each ideology pool is `has_government`-gated.
5. **Tooling:** confirm the variant-set, `VanillaReference` and `CanUseTrigger` checks are backed by tests and that CLAUDE.md and GEMINI.md carry the same rule text.
6. **Docs:** confirm docs sync (README, workshop cross-reference and United States block, header pitch, wiki page, Home, Sidebar, roadmap).
