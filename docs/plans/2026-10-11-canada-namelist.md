# Canada (TAG: CAN) Ship Namelist Plan

**Goal:** Replace the vanilla Canadian namelist (`CAN_ship_names.txt`, 10 groups, 272 names) with a full ISNE namelist of 31 groups. The work breaks the cloned cruiser and capital-ship rosters, restores the Royal Canadian Navy's naming formulas (rivers and peoples for destroyers, towns for escorts, provinces for cruisers), gives the wartime escort fleet its own role pools, and adds thematic and ideological pools for the Ship Designer.

**Status:** planned 2026-10-11, not implemented. No namelist, README, workshop or wiki change has been made yet.

**Sources:**
- Two parallel `isne-historical-researcher` dossiers (2026-10-11). Dossier A covered hulls, roles, language and vanilla fixes (36 tool calls, 23 pages read). Dossier B covered thematic and ideological pools (33 tool calls, 18 pages read). Both mark each list as page-checked or general knowledge (GK); the GK lists are the fact-check backlog in "Verification Plan".
- Scope decisions by the author (2026-10-11): the full set of about 31 groups; Indigenous names split by context (see "Indigenous Names Policy").

## Vanilla Audit Findings (Step 0)

1. **Cloned rosters:** BB and BC are the same 11 names (*Canada*, *Dominion* and nine provinces). CA is CL plus `Kingston` and the typo `Kingson`.
2. **One list across five groups:** the nine provinces sit in CL, CA, BB, BC and the Provinces pool at once. 56 of 109 capital-ship names are duplicates.
3. **Foreign vessels:** `Vendetta`, `Voyager` and `Waterhen` (DD) are Royal Australian Navy destroyers. `Lancaster` (DD) is a Town-class destroyer that served only in the Royal Navy. `Olympus` and `Osiris` (SS) are Royal Navy Oberons that were never commissioned as HMCS. All six are dropped.
4. **Town class confirmed:** *Buxton*, *Caldwell*, *Chelsea*, *Georgetown*, *Hamilton*, *Leamington*, *Mansfield*, *Montgomery*, *Richmond* and *Salisbury* all served in the RCN (Wikipedia, Town-class destroyer). Kept.
5. **Duplicate:** `Ottawa` appears twice in DD.
6. **Spelling:** `Chaudiere` → `Chaudière`, `St. Catherine's` → `St. Catharines`, `St. John` → `Saint John`, `Montreal` → `Montréal`, `Trois-Rivieres` → `Trois-Rivières` (CL has it unaccented, CA accented), `Kingson` → gone with the CA rebuild.
7. **Untraceable name:** `Ile de Québec` (CL, CA) matches no place. It is probably a corruption of *Ville de Québec*, the corvette. Dropped from the cruisers; `Ville de Québec` goes to the Corvettes pool.
8. **Role mismatch:** 28 River-class frigates sit in the destroyer list (21 Canadian-named, 7 Royal Navy loans). They move to the Frigates pool.
9. **Cross-hull names:** `Rainbow` is in CL, CA and SS; `Victoria` and `Windsor` in CL, CA and SS; `Hamilton`, `Ottawa`, `Vancouver` and `Saskatchewan` in DD and the cruisers.
10. **Anachronisms:**
    - Provinces pool: `Nunavut` (1999).
    - Cities pool: `Mississauga` (1968), `Laval` (1965), `Vaughan`, `Markham`, `Brampton`, `Surrey`, `Burnaby`, `Richmond` (townships or district municipalities until 1974-1993), `Gatineau` (the city was Hull until 2002).
    - Cruisers: `Abbotsford`, `Kelowna` and `Barrie` are small inland towns, not cruiser names; the last two are real escort names and move to the role pools.
11. **Tribes pool:** it mixes nations, single bands and a language family (`Wakashan`), and repeats nine destroyer names. Vanilla's display name is "Native Tribes".
12. **Prefix:** `HMCS ` on all 10 groups. Kept on all 31.
13. **Fallbacks:** English terms with `%s` (`"Destroyer %s"`). The three thematic pools have no fallback. All groups get a `%d` fallback.
14. **Vanilla script:** `history/countries/CAN - Canada.txt` assigns `CAN_DD_HISTORICAL` three times by `name_group`. The tag stays defined.
15. **Thin groups:** CV 6, SS 11, BB 11, BC 11.

## Rulings

- **Era:** a name is judged by whether the name itself is plausible for 1936-1950, not by the commissioning date of the ship that bore it. Post-war RCN ship names stay when the name is a period river, people or city (*Mackenzie*, *Ojibwa*, *Corner Brook*). Places created or renamed after 1949 are dropped. Newfoundland and Labrador names are allowed: vanilla has them and a Canadian player can annex the dominion.
- **French names:** standard Canadian orthography with diacritics everywhere (`Québec`, `Montréal`, `Chaudière`, `Lévis`, `Trois-Rivières`, `Jonquière`, `Qu'Appelle`). Dossier A proposed the unaccented `Quebec` for the cruiser, as the navy wrote it in 1944. This plan keeps vanilla's `Québec`, so that the cruiser and the province in the Provinces pool do not appear under two spellings. The RCN's own ships-histories index accents *Montréal*, *Lévis* and *Chaudière*.
- **Corvette and fortress:** `Louisburg` is the corvette's own spelling and `Louisbourg` the fortress. If `-Audit` reports the pair, the fortress is listed as `Forteresse de Louisbourg`.
- **Living persons:** kept where their fame predates 1936, as in the Peru plan, and listed under "Verification Plan". The CCF pool consists largely of such persons; the author chose to include it.
- **No Royal Navy sister-class names:** Dossier A offered the *Majestic* and *Colossus* class names for CV. They are foreign vessels the RCN never used. Not adopted.

## Final Architecture (31 groups)

Counts are estimates until the rosters are scripted and fact-checked.

### Hull groups (7)

| Group | Est. | Formula |
|---|---|---|
| `CAN_DD_HISTORICAL` | 105-110 | The 47 fleet destroyers of 1920-1945 (S class, River class, Tribal, V, Cr, Town and the ex-US river-named hulls); post-war river names (*Mackenzie*, *Terra Nova*); about 60 further Canadian rivers in the same formula |
| `CAN_SS_HISTORICAL` | 52-58 | *Grilse*; the Oberon "O" names and their extension (*Odawa*, *Oneida*, *Oji-Cree*); *Victoria*, *Windsor*, *Corner Brook*; fish, the formula *Grilse* stands for |
| `CAN_CL_HISTORICAL` | 50-54 | The six cruiser names (*Niobe*, *Rainbow*, *Aurora*, *Uganda*, *Québec*, *Ontario*); provinces and territories; districts and regions; major cities that had no wartime escort namesake |
| `CAN_CA_HISTORICAL` | 38-42 | Explorers and navigators; commanders and champions of 1660-1814; the person-named naval reserve divisions (*Montcalm*, *Tecumseh*, *Carleton*, *Donnacona*) |
| `CAN_BB_HISTORICAL` | 34-38 | *Canada*, *Dominion*, *Confederation*; realms (*Acadia*, *New France*, *Rupert's Land*, *Upper Canada*, *Lower Canada*); sovereigns; Fathers of Confederation and prime ministers; sovereignty symbols |
| `CAN_BC_HISTORICAL` | 45-50 | Provincial Marine and Great Lakes squadrons of 1812-14; French-regime ships; exploration vessels; forts and citadels; straits and naval encounters |
| `CAN_CV_HISTORICAL` | 35-40 | The five carriers and *Powerful*; "stone frigates" not named for persons (*Stadacona*, *Naden*, *Shearwater*, *York*, *Star*, *Cataraqui*); seabirds and raptors after *Shearwater*; peaks as "Mount ..." |

Doctrine notes:
- **CL takes the provinces, not CA.** The RCN's two wartime cruisers were light cruisers named for provinces. Dossier A put the provinces in CA and filled CL with cities, which splits *Ontario* and *Québec* from the other provinces. It also leaves CL short: the escort fleet took almost every Canadian town of note, and role pools may share no name with a major hull, so most of Dossier A's collision-free cities were post-war suburbs (*Mississauga*, *Laval*, *Vaughan*, *Thunder Bay*, *Iqaluit*).
- **Cities live in the role pools and the Cities pool.** That is where the RCN put them.
- **BB against BC:** BB holds realms, sovereigns, founders and symbols. BC holds vessels, forts and waters. No name is shared.
- **SS floor:** `-Audit` fails SS below 50. Only eight names are attested boats, so the fish formula carries the group. Single-word fish names are kept where the Royal Navy or US Navy used them for submarines (*Pike*, *Perch*, *Shad*, *Sturgeon*); `Sucker`, `Chub` and `Smelt` are left out.

### Role pools (4)

| Group | Est. | Display name | Fallback | Series |
|---|---|---|---|---|
| `CAN_CORVETTES` | ~120 | Corvettes | `Corvette %d` | Flower class (about 109 unique: Canadian towns, plus the ten flower names of the Royal Navy order) and Castle class (12) |
| `CAN_FRIGATES` | ~70 | Frigates | `Frigate %d` | River class (Canadian towns; the seven Royal Navy loans *Annan*, *Ettrick*, *Meon*, *Monnow*, *Nene*, *Ribble*, *Teme*) and Loch class (*Loch Achanalt*, *Loch Alvie*, *Loch Morlich*) |
| `CAN_MINESWEEPERS` | ~80 | Minesweepers | `Minesweeper %d` | Bangor (54), Algerine (12), Llewellyn (10), Fundy (4) |
| `CAN_PATROL_VESSELS` | 38-45 | Patrol Vessels | `Patrol Vessel %d` | Armed yachts of 1940 (16 animal names) and of 1915 (*Hochelaga*); Battle-class trawlers of 1917 (12 Canadian Corps battles); Isles-class trawlers (8 islands); Fisheries Protection vessels commissioned in 1914-18 |

All four suffixes are already in `Get-RolePoolSuffixes`; `build.ps1` needs no change.

### Thematic pools (15)

| Group | Est. | Display name | Notes |
|---|---|---|---|
| `CAN_CITIES` | ~90 | Cities | Ports and cities that existed by 1941, both coasts and the Great Lakes first |
| `CAN_PROVINCES` | ~50 | Provinces & Regions | Provinces, territories, former colonies and districts |
| `CAN_RIVERS` | ~85 | Rivers & Lakes | Lakes as `Lake ...` where the bare name is a city or river |
| `CAN_COASTS` | ~80 | Capes, Isles & Straits | Capes, islands, straits, sounds and bays |
| `CAN_GEOGRAPHY` | ~28 | Mountains | Peaks as `Mount ...` / `Mont ...`, and ranges. Thin by nature |
| `CAN_TRIBES` | ~60 | Indigenous Peoples | Vanilla tag kept. See the policy below |
| `CAN_BIRDS` | ~70 | Birds | |
| `CAN_FISH` | ~70 | Aquatic Life | Fish, marine mammals, shellfish |
| `CAN_BEASTS` | ~38 | Wildlife | Seeded by the 1940 armed yachts |
| `CAN_RULERS` | ~60 | Monarchs & Governors | Sovereigns, governors of New France, British governors, governors general to 1940 |
| `CAN_EXPLORERS` | ~45 | Explorers | |
| `CAN_HEROES` | ~40 | Heroes | War of 1812, New France, chiefs, naval figures, Victoria Cross recipients to 1918 |
| `CAN_BATTLES` | ~40 | Battles | 1690-1918; the Battle-class trawlers are the precedent |
| `CAN_MYTHOLOGY` | ~22 | Myth & Folklore | Each figure attributed to its people. Thin by nature |
| `CAN_VIRTUES` | ~60 | Virtues & Elements | Royal Navy style abstract names the RCN inherited, with northern weather and sky |

`CAN_COASTS` and `CAN_EXPLORERS` are not standard suffixes; `-Audit` grades any non-role tag as a thematic pool, so no script change is needed.

### Ideological and heritage pools (5)

| Group | Est. | Display name | Gate |
|---|---|---|---|
| `CAN_CONFEDERATION` | ~45 | Confederation | `has_government = democratic` |
| `CAN_REVOLUTION` | ~25 | Patriotes & Rebels | `democratic` or `communism` |
| `CAN_REFORM` | ~22 | Reform & Co-operation | `has_government = neutrality` |
| `CAN_SOCIALISM` | ~22 | Labour Struggle | `has_government = communism` |
| `CAN_LOYALISTS` | ~22 | Loyalists | none (heritage pool) |

- **Cap check (§2B, at most two pools per ideology):** democratic sees Confederation and Patriotes & Rebels; communism sees Labour Struggle and Patriotes & Rebels; neutrality sees Reform & Co-operation; fascism sees none.
- **Neutrality is the CCF:** vanilla's non-aligned Canadian party is the Co-operative Commonwealth Federation, so the `neutrality` pool is social-democratic, not monarchist.
- **Patriotes & Rebels under two gates:** the rebels of 1837-38 are claimed by liberal democrats and by the left alike; the Mackenzie-Papineau Battalion of 1937 took its name from them (Wikipedia, Mackenzie-Papineau Battalion).
- **Labour Struggle excludes the CCF:** the Winnipeg General Strike is listed as an event, but its leaders (Ivens, Russell, Queen, Heaps, Woodsworth) were socialists who later joined the CCF, and stay out of a `communism` pool.
- **No fascism pool:** the only material is the party press and party names of Adrien Arcand's antisemitic movement (Wikipedia, Adrien Arcand). A short honest list does not exist.
- **Loyalists ungated:** United Empire Loyalist heritage is mainstream in every Canadian government form short of a republic, and gating it to `democratic` would break the cap. It is treated like `CAN_RULERS`. Open decision 2 below.

## Indigenous Names Policy (author decision: split by context)

- **Destroyers** keep the spellings the RCN gave its ships: *Athabaskan*, *Cayuga*, *Haida*, *Huron*, *Iroquois*, *Micmac*, *Nootka*, *Algonquin*, *Sioux*. They are historical ship names. The same holds for the river-named destroyers *Assiniboine*, *Kootenay* and *Ottawa*, and for the submarines *Ojibwa*, *Okanagan* and *Onondaga*.
- **The pool** is renamed "Indigenous Peoples" ("First Nations" excludes Inuit and Métis) and uses current self-designations.
- **No overlap with the destroyers.** Where the ship name and the self-designation are the same word (*Haida*, *Cayuga*, *Algonquin*, *Onondaga*), the hull group owns it and the pool leaves it out.
- **Replacements:** `Micmac` → `Mi'kmaq`, `Nootka` → `Nuu-chah-nulth`, `Athabaskan` → `Dene`, `Huron` and `Wyandot` → `Wendat`, `Iroquois` → `Haudenosaunee`, `Sioux` → `Dakota`, `Ottawa` → `Odawa`, `Kwakiutl` → `Kwakwaka'wakw`, `Lillooet` → `St'at'imc`, `Nlakapamuk` → `Nlaka'pamux`, `Shuswap` → `Secwepemc`, `Burrard` → `Tsleil-Waututh`, `Okanagan` → `Syilx`, `Kootenay` → `Ktunaxa`, `Assiniboine` → `Nakoda`.
- **Dropped:** `Wakashan` (a language family), `Stahlo` (its correct form *Stó:lō* has a colon and macrons).
- **Font safety:** the game font covers Latin-1 and Latin Extended-A. Forms outside it take the plain spelling: `Tlicho`, `Mohawk`, `Oneida`, `Tuscarora`. Safe as written: `Nuxálk`, `Hän`, `Métis`.
- **Exonyms that are English words or slurs are never used:** *Blood*, *Stoney*, *Carrier*, *Beaver*, *Neutral*, *Slavey*, *Sarcee*, *Eskimo*. The pool lists *Kainai*, *Nakoda*, *Dakelh*, *Dane-zaa*, *Tsuut'ina*, *Inuit*.
- **Additions** (Wikipedia, List of First Nations peoples in Canada): Squamish, Musqueam, Katzie, Kwantlen, Tsawwassen, Songhees, Semiahmoo, Qualicum, Homalco, Klahoose, Tla'amin, Heiltsuk, Haisla, Tsimshian, Gitxsan, Nisga'a, Ditidaht, Tsilhqot'in, Dakelh, Wet'suwet'en, Gwich'in, Tahltan, Tagish, Kaska, Sekani, Hän, Tutchone, Dane-zaa, Sahtu, Tlicho, Kainai, Piikani, Siksika, Tsuut'ina, Saulteaux, Wolastoqiyik, Passamaquoddy, Abenaki, Beothuk, Naskapi, Mississauga; and Inuit, Inuvialuit, Métis.
- **Kept from vanilla:** Anishinaabe, Chipewyan, Comox, Cowichan, Cree, Innu, Lekwungen, Mohawk, Nipissing, Nuxálk, Oneida, Penelakut, Potawatomi, Sechelt, Seneca, Sinixt, Snuneymuxw, Tlingit, Tuscarora, Chehalis.

## Role Pools: considered / created / skipped

- **Corvettes:** created. The RCN commissioned over 120 Flower and Castle-class corvettes, named for Canadian communities.
- **Frigates:** created. About 70 River and Loch-class frigates, named for towns and cities; the British-built loans kept their river and loch names.
- **Minesweepers:** created. Four classes, about 80 names. The Lake class is left out: its hulls went to the Soviet Union or were cancelled, and none was commissioned as HMCS. The post-war Bay class is left out: nine of its 14 names repeat Bangor and Fundy names.
- **Patrol vessels:** created, combining three auxiliary patrol series that are each below or at the floor on their own (armed yachts 17, Battle-class trawlers 12, Isles-class trawlers 8).
- **Escort destroyers:** considered, skipped: the post-war destroyer escorts take river names and sit in DD.
- **Escort carriers, light carriers:** considered, skipped: two and three names, all in CV.
- **Auxiliary cruisers:** considered, skipped: three names (*Prince David*, *Prince Henry*, *Prince Robert*). Folded into BC as historic war vessels.
- **Sloops, avisos, gunboats, torpedo boats, fast attack craft:** considered, skipped: no named RCN series (the Fairmile launches carried numbers).
- **Scout cruisers, flotilla leaders, AA cruisers, armored cruisers, large cruisers, fast battleships, coastal defense, monitors:** considered, skipped: no precedent.
- **Minelayers, seaplane tenders, submarine tenders, icebreakers, state yachts:** considered, skipped: no named series before 1950.
- **Cruiser, coastal and minelaying submarines:** considered, skipped: the navy had no named submarines before 1961.
- **Training ships and auxiliaries:** considered, skipped: a handful of names (*Venture*, *Preserver*, *Provider*), which go to the Virtues pool.
- **Gate vessels:** considered, skipped: five names (Porte class), post-war.
- **Bird-class patrol vessels:** considered, skipped: post-war; the names are in the Birds pool.

## Collision Resolutions

Single owners of contested names:
- *Ontario*, *Québec*, *Niobe*, *Rainbow*, *Aurora*, *Uganda* → CL. `Rainbow` leaves SS (`Rainbow Trout` may stand there).
- *Canada*, *Dominion* → BB. The 1914 patrol vessel *Canada* is left out of the Patrol Vessels pool.
- *Acadia* → BB (the name floated for a 1913 Naval Aid Bill dreadnought, per Schleihauf 2000; treated as a hedge, not a fact). The hydrographic ship *Acadia* is left out of Patrol Vessels.
- *Saskatchewan*, *Kootenay*, *Niagara*, *Columbia*, *Mackenzie* → DD; CL leaves them out. *Yukon* → CL; the 1960s destroyer escort name is not used in DD.
- *Hamilton*, *Ottawa*, *Vancouver* → DD (real destroyers). The corvette *Vancouver* is left out of Corvettes.
- *Victoria*, *Windsor*, *Corner Brook* → SS; CL leaves them out. *Chicoutimi* → Corvettes (1941); SS leaves it out.
- *Champlain* → DD (the 1928 destroyer); CA leaves him out.
- *Brock*, *Wolfe*, *Prevost* → CA as persons; BC leaves out the 1812 vessels *Sir Isaac Brock*, *Wolfe* and *Sir George Prevost*.
- *Griffon*, *Nonsuch*, *Discovery*, *Queen Charlotte*, *Chatham* → BC as vessels; CV leaves out the reserve divisions of the same names.
- *Stadacona* → CV (the Halifax base); the 1915 yacht is left out of Patrol Vessels.
- *Montcalm*, *Tecumseh*, *Carleton*, *Donnacona*, *Cabot*, *Radisson*, *d'Iberville*, *Jolliet* → CA; CV takes only establishments not named for persons.
- *Restigouche* → DD; BC lists the 1760 action's ships (*Machault*, *Bienfaisant*, *Marquis de Malauze*) instead.

Names taken by a role pool and therefore closed to CL/CA/BB/BC/CV (`RoleOverlap` FAIL):
- CL districts: *Ungava* (Bangor), *Cape Breton* (frigate), *Algoma* (corvette) are left out. Every other district and city candidate is checked against the scripted rosters before it enters CL.
- CA persons that are also escort names take a qualified form: `Comte de Frontenac`, `Chevalier de Lévis`, `Cavelier de La Salle`, `William Baffin`.
- BC forts: *Fort William*, *Fort Frances*, *Fort Erie* are escort names and are left out.
- BB: no founder surname may match an escort (*Brockville* is distinct from *Brock*; check `Galt`, `Tupper`, `Tilley`, `Borden` against the rosters).

Between role pools (single owner):
- *Charlottetown*, *Lévis*: Flower and River classes both used them → Corvettes.
- *Leamington* → DD (Town class); the frigate of that name was renamed *Sea Cliff*.
- *Nootka* (Fundy class, renamed *Nanoose* in 1943) → listed as `Nanoose` in Minesweepers.
- *Nipigon* → Minesweepers (Bangor); not used in DD.
- *Dunver* is the frigate's official name (an anagram for Verdun). Kept as `Dunver`.

Thematic pools stand alone and may repeat hull and role names, as in the Finnish model file. Inside them, homonyms take qualified forms: `Québec City`, `Lake Winnipeg`, `Ottawa River`, `Vancouver Island`, `Cape Breton Island`, `Queen Victoria`, `Samuel de Champlain`, `Alexander Mackenzie` (the explorer), `William Lyon Mackenzie`, `George-Étienne Cartier`, `Jacques Cartier`, `Simon Fraser`, `David Thompson`, `John Franklin`, `Henry Hudson`, `Louisbourg 1758`, `Québec 1690`, `Charlottetown Conference`, `Chinook Salmon`, `Common Raven`.

## Candidate Lists

Recorded so the implementing session does not need a new dossier. "Page" means the dossier read the list on a named page; "GK" means general knowledge, to be fact-checked.

### DD
- **Fleet destroyers (page: RCN ships of WWII, Town class, Tribal class):** Patriot, Patrician, Champlain, Vancouver, Saguenay, Skeena, Fraser, St. Laurent, Restigouche, Assiniboine, Ottawa, Margaree, Kootenay, Gatineau, Qu'Appelle, Saskatchewan, Chaudière, Athabaskan, Cayuga, Haida, Huron, Iroquois, Micmac, Nootka, Algonquin, Sioux, Crescent, Crusader, Annapolis, Columbia, Niagara, St. Clair, St. Croix, St. Francis, Buxton, Caldwell, Chelsea, Georgetown, Hamilton, Leamington, Mansfield, Montgomery, Richmond, Salisbury.
- **To verify:** Roxborough (listed as RCN on the WWII page, not found on the Town-class page).
- **Post-war river names:** Mackenzie, Terra Nova.
- **Not adopted:** the six untransferred Cr-class names (Creole, Crispin, Cromwell, Crown, Croziers, Crystal); no source ties them to the RCN.
- **River extension (GK, checked against the escort rosters):** Peace, Nelson, Albany, Severn, Hayes, Coppermine, Back, Liard, Slave, Bow, Oldman, Souris, Rideau, Humber, Don, Credit, Grand, Thames, Trent, Moira, Madawaska, Petawawa, Mattawa, Richelieu, Saint-Maurice, Batiscan, Rouge, Yamaska, Nicolet, Manicouagan, Moisie, Natashquan, Nashwaak, Tobique, Shubenacadie, Mersey, Avon, Exploits, Thompson, Nass, Stikine, Bella Coola, Campbell, Porcupine, Klondike, Pelly, Alsek, Miramichi, Kaministiquia, Similkameen, Montmorency, Matapédia, Churchill, Thelon, Kazan, Dubawnt, Koksoak, Eastmain, Rupert, Attawapiskat, Nottaway. Homonym check needed on `Back`, `Don`, `Red`, `Bow`, `Milk`, `Hay`, `Peel`.

### SS
- **Boats (page: canada.ca submarine facts):** Grilse, Ojibwa, Onondaga, Okanagan, Victoria, Windsor, Corner Brook.
- **"O" extension (GK):** Odawa, Oneida, Oji-Cree.
- **Fish (GK):** Salmon, Sockeye, Coho, Steelhead, Sturgeon, Cod, Haddock, Halibut, Herring, Mackerel, Capelin, Shad, Gaspereau, Alewife, Pike, Muskellunge, Walleye, Perch, Whitefish, Cisco, Char, Trout, Rainbow Trout, Grayling, Burbot, Sauger, Sculpin, Lingcod, Sablefish, Rockfish, Dogfish, Wolffish, Pollock, Hake, Redfish, Turbot, Flounder, Plaice, Tuna, Swordfish, Lamprey, Kokanee, Eulachon, Goldeye, Porbeagle, Narwhal, Beluga, Orca.

### CL
- **Cruisers:** Niobe, Rainbow, Aurora, Uganda, Québec, Ontario.
- **Provinces and territories:** Alberta, British Columbia, Manitoba, New Brunswick, Nova Scotia, Prince Edward Island, Newfoundland, Labrador, Yukon, Northwest Territories.
- **Districts and regions (GK):** Keewatin, Assiniboia, Athabasca, Franklin, Cariboo, Klondike, Vancouver Island, New Caledonia, Canada East, Canada West, Île Royale, Île Saint-Jean, Gaspésie, Muskoka, Nipissing, Temiskaming, Abitibi, Charlevoix, Beauce, Mauricie, Kamouraska, Peace River, Red River, Avalon, Huronia.
- **Cities without a wartime escort namesake (GK, to check against the rosters):** Edmonton, Kingston, London, Sydney, Dartmouth, Yarmouth, Cornwall, Niagara Falls, Bathurst, Campbellton, St. John's, Whitehorse, Dawson City, Churchill, Prince George, Penticton.

### CA
Jacques Cartier, John Cabot, Frobisher, Henry Hudson, William Baffin, Cavelier de La Salle, Jolliet, Radisson, Groseilliers, d'Iberville, La Vérendrye, Kelsey, Hearne, Alexander Mackenzie, Simon Fraser, David Thompson, George Vancouver, John Franklin, Bernier, Brock, Tecumseh, Salaberry, Laura Secord, Dollard des Ormeaux, Madeleine de Verchères, Maisonneuve, Montcalm, Wolfe, Chevalier de Lévis, Comte de Frontenac, Carleton, Prevost, Donnacona, Joseph Brant, Kingsmill, William Hall, Jean Talon, Brébeuf, FitzGibbon, Simcoe. All GK except Kingsmill and William Hall (page).

### BB
- **Realms and symbols:** Canada, Dominion, Confederation, Acadia, New France, Rupert's Land, Upper Canada, Lower Canada, British North America, Maple Leaf, Red Ensign.
- **Sovereigns (GK):** Queen Victoria, King Edward VII, King George V, King George VI, Queen Mary, King George III, King Charles II, King Louis XIV, King Henri IV, King Francis I.
- **Founders and prime ministers (page: Fathers of Confederation; GK for the prime ministers):** John A. Macdonald, George-Étienne Cartier, George Brown, Charles Tupper, Leonard Tilley, Alexander Galt, D'Arcy McGee, Hector Langevin, Étienne-Paschal Taché, Oliver Mowat, Wilfrid Laurier, Robert Borden, John Abbott, Mackenzie Bowell, Robert Baldwin, LaFontaine, Joseph Howe.
- **Left out:** the sitting leaders of 1936 (Mackenzie King, Bennett, Meighen). They are party leaders in game.

### BC
- **Provincial Marine and Lakes squadrons (page: Provincial Marine):** Royal George, Prince Regent, Princess Charlotte, Queen Charlotte, General Hunter, Detroit, Earl of Moira, Caledonia, Confiance, Duke of Gloucester, Speedy, Nancy, St. Lawrence, Netley, Sir Sydney Smith, Psyche, Montague, General Gage.
- **To verify (GK):** Lady Prevost, Melville, Beresford, Charwell, Linnet.
- **French regime (page: Battle of the Restigouche):** Machault, Bienfaisant, Marquis de Malauze. **GK:** Pélican, Griffon, Don de Dieu, Grande Hermine, Petite Hermine, Émérillon.
- **Exploration and later vessels (GK):** Nonsuch, Discovery, Chatham, Resolution, Erebus, Terror, St. Roch, Matthew, Bluenose, Royal William, Prince David, Prince Henry, Prince Robert.
- **Forts (GK):** Louisbourg, Citadel, Fort Henry, Fort Frontenac, Fort York, Fort Malden, Fort George, Fort Chambly, Fort Anne, Fort Beauséjour, Fort Lennox, Fort Garry, Prince of Wales Fort, Signal Hill, Fort Rodd Hill.
- **Waters and encounters (GK):** Belle Isle, Cabot Strait, Northumberland Strait, Juan de Fuca, Hecate Strait, Davis Strait, Hudson Strait, Lancaster Sound, Hudson Bay.

### CV
- **Carriers:** Warrior, Magnificent, Bonaventure, Nabob, Puncher, Powerful (the name under which the *Bonaventure* hull was launched; vanilla).
- **Establishments (page: Royal Canadian Naval Reserve, for the divisions):** Star, York, Cataraqui, Chippawa, Malahat, Queen, Unicorn, Brunswicker, Hunter, Scotian. **GK:** Stadacona, Naden, Cornwallis, Shearwater, Avalon, Bytown, Venture, Royal Roads, Protector, Peregrine.
- **Seabirds and raptors:** Gannet, Fulmar, Albatross, Petrel, Kittiwake, Osprey, Gyrfalcon, Golden Eagle, Snowy Owl, Thunderbird.
- **Peaks:** Mount Logan, Mount Robson, Mount Waddington, Mount Columbia, Mount Saint Elias, Mount Royal.
- **To settle:** `Hunter` (Windsor division) and `Cornwallis` are named for persons; if the fact-check confirms it, they move to CA or drop.

### Role pools
Rosters are scripted, not typed (see "Implementation Steps"). Known inputs:
- **Flower flower-names:** Arrowhead, Bittersweet, Eyebright, Fennel, Hepatica, Mayflower, Snowberry, Spikenard, Trillium, Windflower.
- **Armed yachts:** Ambler, Beaver, Caribou, Cougar, Culver, Elk, Grizzly, Husky, Lynx, Moose, Otter, Raccoon, Reindeer, Renard, Sans Peur, Vison, Wolf, Hochelaga.
- **Battle class:** Arleux, Armentières, Arras, Festubert, Givenchy, Loos, Messines, St. Eloi, St. Julien, Thiepval, Vimy, Ypres.
- **Isles class:** Anticosti, Baffin, Cailiff, Ironbound, Liscomb, Magdalen, Manitoulin, Miscou.
- **Fisheries and patrol vessels of 1914-18 (canada.ca index, to verify):** Margaret, Malaspina, Galiano, Laurentian, Florence, Cartier, Earl Grey.
- **Spellings to settle:** `Daerwood` (index) against *Deerwood*; `Cranbrook` (one page misprints it); `Lunenburg` (the index prints *Lunenberg*).

### Thematic pools
- **Cities:** the vanilla 18 that survive (Toronto, Montréal, Calgary, Vancouver, Ottawa, Edmonton, Winnipeg, Québec City, Halifax, Hamilton, Regina, Victoria, Fredericton, London, Saskatoon, Longueuil, Kitchener, Windsor) plus Hull. Additions by region:
  - Atlantic: Dartmouth, Sydney, North Sydney, Glace Bay, Louisbourg, Yarmouth, Lunenburg, Digby, Annapolis Royal, Pictou, Liverpool, Shelburne, Canso, Saint John, Moncton, Chatham, Dalhousie, Campbellton, Charlottetown, Summerside, Georgetown.
  - Newfoundland: St. John's, Corner Brook, Harbour Grace, Placentia, Bonavista, Twillingate, Grand Falls.
  - Québec: Trois-Rivières, Sorel, Lévis, Rimouski, Rivière-du-Loup, Gaspé, Chicoutimi, Sept-Îles, Matane, Sherbrooke, Saint-Hyacinthe, Drummondville, Shawinigan, Valleyfield, Granby, Joliette, Verdun, Westmount, Saint-Jean, Tadoussac.
  - Ontario: Kingston, Sarnia, Port Arthur, Fort William, Sault Ste. Marie, Oshawa, Belleville, Cobourg, Brockville, Cornwall, Prescott, Niagara-on-the-Lake, St. Catharines, Port Colborne, Welland, Owen Sound, Collingwood, Midland, Orillia, Peterborough, Sudbury, North Bay, Guelph, Brantford, Stratford, Barrie.
  - Prairies: Brandon, Moose Jaw, Prince Albert, Lethbridge, Medicine Hat, Red Deer, Churchill.
  - British Columbia and the north: New Westminster, Nanaimo, Prince Rupert, Esquimalt, Kamloops, Kelowna, Vernon, Nelson, Port Alberni, Powell River, Chilliwack, Whitehorse, Dawson City, Yellowknife.
  - Left out: `Hope`, `Trail` (common nouns), Flin Flon, Baie-Comeau (founded 1937).
- **Provinces & Regions:** the vanilla 13 without Nunavut, plus the BB realms and the CL districts listed above, and Okanagan, Kootenay, Algoma, Ungava, Cape Breton, Niagara, Saguenay, Selkirk.
- **Rivers & Lakes:** the DD rivers, the river-named destroyers, and (page: longest rivers) Mackenzie, Yukon, Saint Lawrence, Columbia, Fraser, Athabasca, Winnipeg River, Red Deer River, Great Whale, Saint John River, Saguenay River. Lakes: Superior, Lake Huron, Lake Erie, Lake Ontario, Lake Winnipeg, Winnipegosis, Lake Manitoba, Great Bear, Great Slave, Lake Athabasca, Reindeer Lake, Lake Nipigon, Lake Nipissing, Lake Simcoe, Atlin, Kluane, Lac Saint-Jean, Mistassini, Lake of the Woods, Bras d'Or, Lake Champlain. Left out: La Grande (a hydro-era name), Pend d'Oreille.
- **Capes, Isles & Straits (GK):**
  - Capes: Cape Race, Cape Spear, Cape Bonavista, Cape Chidley, Cape Sable, Cape North, Cape Tormentine, Cape Scott, Cape Columbia, Cape Wolstenholme, Cape Bathurst, Cape Parry, Cape Mudge, Cape Beale, Cape St. Mary's, Cape Ray, Cap Tourmente, Cap Diamant, Cap Trinité, Cap-Chat.
  - Islands: Vancouver Island, Anticosti, Cape Breton Island, Manitoulin, Baffin Island, Ellesmere, Victoria Island, Banks Island, Melville Island, Devon Island, Southampton Island, Bylot, Axel Heiberg, Queen Charlotte Islands (period name), Sable Island, Grand Manan, Campobello, Île d'Orléans, Île Bonaventure, Île aux Coudres, Îles de la Madeleine, Saltspring, Texada, Thousand Islands.
  - Waters: the BC waters above, and Georgia Strait, Johnstone Strait, Barrow Strait, McClure Strait, Fury and Hecla, Smith Sound, Jones Sound, Haro Strait, James Bay, Ungava Bay, Bay of Fundy, Chaleur Bay, Placentia Bay, Trinity Bay, Conception Bay, Frobisher Bay, Georgian Bay, Burrard Inlet, Howe Sound, Barkley Sound, Clayoquot Sound, Nootka Sound, Chedabucto Bay, Minas Basin, Passamaquoddy Bay, Mahone Bay, Bay of Quinte.
- **Mountains (GK):** Mount Logan, Mount Robson, Mount Columbia, Mount Waddington, Mount Assiniboine, Mount Sir Donald, Mount Edith Cavell, Mount Temple, Mount Stephen, Mount Alberta, Mount Athabasca, Mount Lefroy, Mount Victoria, Mount Macdonald, Mount Saint Elias, Mount Lucania, Mount Steele, Mount Fairweather, Mount Royal, Mount Carleton, Mont Tremblant, Mont Jacques-Cartier, Mont Albert, Mont Mégantic, Rockies, Selkirks, Purcells, Monashees, Laurentians, Torngats.
- **Birds:** page-checked seabirds, waterfowl, grouse and shorebirds (Wikipedia, List of birds of Canada): Dovekie, Razorbill, Black Guillemot, Atlantic Puffin, Tufted Puffin, Kittiwake, Ivory Gull, Herring Gull, Arctic Tern, Common Loon, Trumpeter Swan, Snow Goose, Canada Goose, Brant, Wood Duck, Mallard, Pintail, Canvasback, King Eider, Harlequin Duck, Goldeneye, Merganser, Ruffed Grouse, Ptarmigan, Whooping Crane, Sandhill Crane, Killdeer, Whimbrel, Curlew, Godwit, Sanderling, Dunlin, Great Auk, Labrador Duck. GK: Peregrine Falcon, Gyrfalcon, Merlin, Kestrel, Osprey, Bald Eagle, Golden Eagle, Goshawk, Snowy Owl, Great Horned Owl, Great Gray Owl, Common Raven, Canada Jay, Blue Jay, Chickadee, Meadowlark, Snow Bunting, Kingfisher, Gannet, Fulmar, Shearwater, Storm Petrel, Cormorant, Great Blue Heron. Left out or compounded: bare `Loon`, `Coot`, `Ruff`, `Knot`, `Bufflehead`, `Eskimo Curlew`.
- **Aquatic Life:** the SS fish, and (page: List of mammals of Canada) Beluga, Narwhal, Bowhead, Humpback, Fin Whale, Blue Whale, Minke, Right Whale, Grey Whale, Orca, Sperm Whale, Pilot Whale, Harbour Porpoise, Walrus, Harp Seal, Hooded Seal, Ringed Seal, Bearded Seal, Grey Seal, Steller Sea Lion, Fur Seal, Sea Otter; Lobster, Snow Crab, Dungeness Crab. Left out: `Sucker`, `Chub`, `Shiner`, `Inconnu` (reads as "unknown").
- **Wildlife:** the armed-yacht names, and (page) Canada Lynx, Bobcat, Coyote, Arctic Fox, Red Fox, Black Bear, Polar Bear, Wolverine, Marten, Mink, Mule Deer, White-tailed Deer, Pronghorn, Bison, Mountain Goat, Muskox, Bighorn, Dall Sheep; GK: Muskrat, Marmot, Snowshoe Hare, Arctic Hare, Kermode Bear, Carcajou, Orignal. Left out: `Skunk`, `Lemming`, `Badger`, `Fisher`, `Buffalo`.
- **Monarchs & Governors:** the BB sovereigns, and (page: List of governors general of Canada) Montmagny, Courcelle, Frontenac, Denonville, Callière, Vaudreuil, Beauharnois, La Galissonière, La Jonquière, Duquesne, Amherst, Murray, Dorchester, Haldimand, Craig, Prevost, Drummond, Sherbrooke, Dalhousie, Kempt, Aylmer, Gosford, Colborne, Durham, Sydenham, Monck, Lisgar, Dufferin, Lorne, Lansdowne, Stanley, Aberdeen, Minto, Grey, Connaught, Devonshire, Byng, Willingdon, Bessborough, Tweedsmuir. GK (the page omitted 1841-67): Bagot, Metcalfe, Cathcart, Elgin, Head. Consorts with place-name precedent: Princess Louise, Princess Patricia.
- **Explorers (GK unless noted):** John Cabot, Jacques Cartier, Martin Frobisher, John Davis, Henry Hudson, William Baffin, Thomas James, Luke Foxe, Samuel de Champlain, Étienne Brûlé, Jean Nicolet, Louis Jolliet, Jacques Marquette, Cavelier de La Salle, Radisson, Groseilliers, d'Iberville, La Vérendrye, Henry Kelsey, Anthony Henday, Samuel Hearne, Peter Pond, Alexander Mackenzie, Simon Fraser, David Thompson, George Vancouver, James Cook, John Franklin, George Back, John Rae, Robert McClure, Francis Crozier, Joseph-Elzéar Bernier, Joseph Tyrrell, John Palliser, Henry Youle Hind. Alive in 1936: Stefansson, Bartlett, Larsen.
- **Heroes:** Isaac Brock, Tecumseh, Charles de Salaberry, Laura Secord, James FitzGibbon, Joseph Brant, John Norton, Dollard des Ormeaux, Madeleine de Verchères, Maisonneuve, Jeanne Mance, Louis Hébert, Jean Talon, François de Laval, Montcalm, James Wolfe, Duc de Lévis, Jean de Brébeuf, Poundmaker (also a frigate name), Crowfoot, William Hall (page), Charles Kingsmill (page), Walter Hose (page; alive in 1936), and Victoria Cross recipients to 1918 under full names (page gives surnames: Dunn, Kaeble, Brillant, Konowal, Peck, Barker, Bishop, Ricketts, McLeod, Pattison, Flowerdew, Zengel).
- **Battles:** the 12 Battle-class names (page), and GK: Passchendaele, Hill 70, Courcelette, Mont Sorrel, Cambrai, Amiens, Canal du Nord, Valenciennes, Mons, Drocourt-Quéant, Sanctuary Wood, Paardeberg, Leliefontein, Queenston Heights, Châteauguay, Crysler's Farm, Lundy's Lane, Stoney Creek, Beaver Dams, Chippawa, Michilimackinac, Lacolle, Québec 1690, Hudson Bay 1697, Port-Royal 1710, Louisbourg 1745, Louisbourg 1758, Carillon, Plains of Abraham, Sainte-Foy, Québec 1775.
- **Myth & Folklore (page: Canadian folklore):** Raven (Haida), Nanabozho (Anishinaabe), Glooscap (Mi'kmaq, Wabanaki), Chasse-galerie, Loup-garou, Ti-Jean, Dungarvon Whooper, Sam McGee. GK: Sedna (Inuit), Thunderbird, Wisakedjak (Cree), Mishipeshu (Ojibwe), Sasquatch, Ogopogo, Cadborosaurus, Memphré, Bonhomme Sept-Heures. Left out: Kitchi Manitou (religious), La Corriveau (a real executed woman), Wendigo unless the author wants it.
- **Virtues & Elements:** Warrior, Magnificent, Powerful, Crescent, Crusader, Patriot, Patrician, Venture, Preserver, Provider, Protector (RCN names); Valiant, Vigilant, Resolute, Intrepid, Indomitable, Formidable, Courageous, Fearless, Fortitude, Defiance, Constance, Diligence, Endeavour, Enterprise, Perseverance, Sentinel, Guardian, Vanguard, Triumph, Gallant; Chinook, Borealis, Aurora, Squall, Gale, Tempest, Zephyr, Williwaw, Sundog, Northern Lights, Polaris, Boreas, Nor'easter. Left out: `Blizzard`, `Whiteout`.

### Ideological and heritage pools
- **Confederation (page: Fathers of Confederation, 36 names):** the BB founders, and Adams Archibald, Alexander Campbell, Frederick Carter, Edward Chandler, Jean-Charles Chapais, James Cockburn, George Coles, Charles Fisher, Thomas Haviland, William Howland, William McDougall, Jonathan McCully, Peter Mitchell, Edward Palmer, William Pope, Ambrose Shea, Edward Whelan, Robert Wilmot. GK: Francis Hincks, Egerton Ryerson, Henri Bourassa (alive in 1936); Charlottetown Conference, Québec Resolutions, London Conference, British North America Act, Responsible Government, Durham Report, Statute of Westminster, Balfour Declaration.
- **Patriotes & Rebels (GK):** Louis-Joseph Papineau, Wolfred Nelson, Robert Nelson, Chevalier de Lorimier, Jean-Olivier Chénier, Ludger Duvernay, Joseph-Narcisse Cardinal, William Lyon Mackenzie, Samuel Lount, Peter Matthews, Charles Duncombe, Marshall Spring Bidwell, Nils von Schoultz; Saint-Denis, Saint-Charles, Saint-Eustache, Fils de la Liberté, Navy Island, Montgomery's Tavern, Short Hills.
- **Reform & Co-operation (page: Regina Manifesto, for the first four):** Regina Manifesto, Co-operative Commonwealth, J. S. Woodsworth, M. J. Coldwell; GK: William Irvine, A. A. Heaps, Angus MacInnis, Agnes Macphail, Henry Wise Wood, Nellie McClung, Emily Murphy, Louise McKinney, Irene Parlby, Henrietta Muir Edwards, Moses Coady, Jimmy Tompkins; Social Gospel, Wheat Pool, Farmer-Labour, Antigonish Movement. Left out: Tommy Douglas (his fame dates from 1944).
- **Labour Struggle (page: On-to-Ottawa Trek, Mackenzie-Papineau Battalion):** On-to-Ottawa Trek, Slim Evans, Regina Riot, Estevan, Relief Camp Workers, Workers' Unity League, Mackenzie-Papineau, Edward Cecil-Smith. GK: Tim Buck, Tom McEwen, Annie Buller, Beckie Buhay, Norman Bethune, Ginger Goodwin, Winnipeg General Strike, Bloody Saturday, One Big Union, Mike Sokolowski, Ballantyne Pier, Blairmore.
- **Loyalists (GK):** United Empire Loyalists, John Graves Simcoe, Sir John Johnson, John Butler, Butler's Rangers, Edward Winslow, Thomas Carleton, Ward Chipman, John Strachan, Allan MacNab, Beverley Robinson, Jonathan Odell, Canada First, Imperial Federation, Empire Day.

## Verification Plan

Every named person must be accounted for in this file before the review: sourced, kept on ship precedent, kept without a lookup, or dropped. Fact-checks go to `isne-audit-researcher` in passes of at most about 40 items, persons apart from vessels and vocabulary.

| Pass | Items | Batch pages to name in the prompt |
|---|---|---|
| 1. Explorers and CA persons | ~45 persons | Dictionary of Canadian Biography (biographi.ca); Wikipedia, List of explorers of Canada |
| 2. Heroes and VC recipients | ~35 persons, with life dates and alive-in-1936 status | Wikipedia, List of Canadian Victoria Cross recipients; DCB |
| 3. Rebels, Loyalists, 1841-67 governors | ~40 persons | Wikipedia, Rebellions of 1837-1838; United Empire Loyalist; DCB |
| 4. CCF and labour figures | ~30 persons | Wikipedia, Co-operative Commonwealth Federation; Communist Party of Canada; Winnipeg general strike |
| 5. Vessels and establishments | ~40 names | Wikipedia, Provincial Marine; Engagements on Lake Ontario; canada.ca ships-histories index (Roxborough, WWI patrol vessels, Hunter, Cornwallis, Stadacona, Naden, Avalon) |
| 6. Dated places | ~40 names | Incorporation or founding dates for the CL cities and the Cities pool additions; the CL districts |

Kept without a lookup (canonical, to be listed by name in the final plan): the sovereigns, the prime ministers, Cartier, Champlain, Brock, Tecumseh, Montcalm, Wolfe, and the vanilla ship eponyms.

Living in 1936, to be flagged in the final plan: King George VI, Queen Mary, Connaught, Devonshire, Willingdon, Bessborough, Tweedsmuir, Robert Borden, Henri Bourassa, Woodsworth, Coldwell, Irvine, Heaps, MacInnis, Macphail, Wise Wood, McClung, Coady, Tompkins, Tim Buck, McEwen, Buller, Buhay, Slim Evans, Bethune, Hose, Stefansson, Bartlett, Larsen, and the surviving VC recipients.

## Implementation Steps

1. **Script the escort rosters** (scratch script, not committed) from en.wikipedia "List of Royal Canadian Navy ships of the Second World War" (Flower, Castle, Bangor, Algerine, Llewellyn, Fundy) and "River-class frigate" / "List of River-class frigates" (River, Loch). Take spellings from the canada.ca ships-histories index, restore diacritics, and de-duplicate renamed hulls.
2. **Build the blocklist:** the union of the four role rosters. Check every CL, CA, BB, BC and CV candidate against it before authoring.
3. **Run the fact-check passes** above; record the outcome per name in this file.
4. **Author** `common/units/names_ships/CAN_ship_names.txt` (UTF-8 without BOM): 31 groups, `HMCS ` on each, `%d` fallbacks (`Destroyer`, `Submarine`, `Light Cruiser`, `Heavy Cruiser`, `Battleship`, `Battlecruiser`, `Aircraft Carrier`, the role terms above, and one noun per pool). Hull display names keep the vanilla `NAME_THEME_HISTORICAL_*` keys; pools take string names.
5. **Validate:** `-ValidateOnly`, `-Test`, `-VerifyShipTypes CAN`, `-Audit CAN`. Expected warnings: `Depth` on Mountains, Myth & Folklore and the four small ideological and heritage pools; `RoleOverlap` WARN where an escort borders DD.
6. **Docs:** README row; workshop cross-reference row, Canada block and header pitch; `wiki/Canada.md`, `wiki/Home.md`, `wiki/_Sidebar.md`; delete the `CAN` row from `docs/ROADMAP.md`. Push only the three Canada wiki files if another session is active.
7. **Review:** a fresh `isne-code-reviewer` with this plan, the validation summary lines and the implementation files.

Workshop block draft:
```bbcode
[b]Canada[/b]
- Expanded ship-type lists for destroyers, submarines, light cruisers, heavy cruisers, battleships, battlecruisers and carriers.
- Added 24 universal thematic lists for the Ship Designer (corvettes, frigates, minesweepers, patrol vessels, cities, provinces, rivers, coasts, mountains, Indigenous peoples, birds, aquatic life, wildlife, monarchs and governors, explorers, heroes, battles, folklore, virtues, Confederation, rebels of 1837, co-operative reform, labour, Loyalists).
```

## Open Decisions

1. **CL provinces, CA persons.** This departs from Dossier A (CL cities, CA provinces). If the author prefers the dossier's layout, CL drops to about 40 names and CA to about 25, below the CA floor of 35.
2. **Loyalists ungated.** The alternative is `NOT = { has_government = communism }`, which would give democratic governments three pools and break the cap unless Patriotes & Rebels is gated to `communism` alone.
3. **`Powerful` in CV.** A vanilla name, but the same hull as *Bonaventure* and never an HMCS name.
4. **Divisive names left out by default:** Riel, Dumont and the 1885 battles (Batoche, Duck Lake, Cut Knife); Seven Oaks. The 1837-38 engagements appear only in the gated Patriotes & Rebels pool. *Plains of Abraham*, *Sainte-Foy* and *Louisbourg 1758* stay in Battles.
5. **`Wendigo`** in Myth & Folklore: left out by default (a cannibal spirit; sensitive).

## Review Focus

1. **Vanilla fixes:** the six foreign vessels gone, the duplicate `Ottawa` gone, spellings corrected, `Ile de Québec` gone, the anachronistic cities and `Nunavut` gone, every other vanilla name present in some group.
2. **Cross-class and role overlap:** zero shared names between CL/CA/BB/BC/CV; BB and BC on separate doctrines; no role-pool name in a major hull.
3. **Indigenous names:** ship spellings only in DD and SS; self-designations only in the pool; no overlap; no character outside Latin-1 and Latin Extended-A.
4. **Ideology:** gates use `has_government` only; at most two pools per ideology; no CCF names in Labour Struggle; no fascism pool.
5. **Prefix and tags:** `HMCS ` with a trailing space on all 31 groups; no `ship_types` on any pool; `CAN_DD_HISTORICAL` and `CAN_TRIBES` defined.
6. **Persons:** every named person is in the verification notes.
7. **Docs:** README, workshop row, block and pitch, the three wiki files, and the removed roadmap row.
