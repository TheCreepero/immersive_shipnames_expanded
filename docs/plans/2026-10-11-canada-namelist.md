# Canada (TAG: CAN) Ship Namelist Plan

**Goal:** Replace the vanilla Canadian namelist (`CAN_ship_names.txt`, 10 groups, 272 names) with a full ISNE namelist of 31 groups. The work breaks the cloned cruiser and capital-ship rosters, restores the Royal Canadian Navy's naming formulas (rivers and peoples for destroyers, towns for escorts, provinces for cruisers), gives the wartime escort fleet its own role pools, and adds thematic and ideological pools for the Ship Designer.

**Status:** planned 2026-10-11; implemented 2026-10-14. `-Audit CAN`: FAIL 0, WARN 6 (depth of six short pools), INFO 3. The namelist file is the source for every name; this plan records the decisions and the verification.

**Sources:**
- Two parallel `isne-historical-researcher` dossiers (2026-10-11). Dossier A covered hulls, roles, language and vanilla fixes (36 tool calls, 23 pages read). Dossier B covered thematic and ideological pools (33 tool calls, 18 pages read).
- Six `isne-audit-researcher` fact-check passes (2026-10-14, 103 web calls in total): explorers (7), heroes and VC recipients (7), rebels, Loyalists and governors (23), CCF and labour (18), vessels and establishments (24), places and folklore (15, including a follow-up on folklore replacements).
- Escort rosters scripted from the wikitext of en.wikipedia "List of Royal Canadian Navy ships of the Second World War" (Flower, Castle, River, Loch, Bangor, Algerine, Fundy, Llewellyn, Isles, armed yachts, destroyers) and "List of River-class frigates" (Dunver, which the first page omits, and the 1943 cancellations).
- Six closing searches by the main session (Thomas Storrow Brown, Edward Jessup, Molly Brant and Tyendinaga, Odelltown and the Frères Chasseurs, the Ninety-Two Resolutions, Harvey Murphy).
- Scope decisions by the author (2026-10-11): the full set of about 31 groups; Indigenous names split by context.

## Vanilla Audit Findings (Step 0)

1. **Cloned rosters:** BB and BC were the same 11 names (*Canada*, *Dominion* and nine provinces). CA was CL plus `Kingston` and the typo `Kingson`.
2. **One list across five groups:** the nine provinces sat in CL, CA, BB, BC and the Provinces pool at once.
3. **Foreign vessels, dropped:** `Vendetta`, `Voyager`, `Waterhen` (Royal Australian Navy destroyers); `Lancaster` (Town class, Royal Navy only); `Olympus`, `Osiris` (Royal Navy Oberons, never HMCS).
4. **Town class confirmed:** *Buxton*, *Caldwell*, *Chelsea*, *Georgetown*, *Hamilton*, *Leamington*, *Mansfield*, *Montgomery*, *Richmond* and *Salisbury* served in the RCN (Wikipedia, Town-class destroyer). Kept in DD.
5. **Duplicate:** `Ottawa` twice in DD.
6. **Spelling:** `Chaudiere` → `Chaudière`, `St. Catherine's` → `St. Catharines`, `St. John` → `Saint John`, `Montreal` → `Montréal`, `Trois-Rivieres` → `Trois-Rivières`, `Kingson` gone.
7. **Untraceable:** `Ile de Québec` (CL, CA). Dropped; `Ville de Québec` is in Corvettes.
8. **Role mismatch:** 28 River-class frigates in DD moved to `CAN_FRIGATES`.
9. **Anachronisms, dropped:** `Nunavut` (1999); `Mississauga`, `Laval`, `Vaughan`, `Markham`, `Brampton`, `Surrey`, `Burnaby`, `Richmond` (as a city), `Gatineau` (the city was Hull until 2002); `Abbotsford` as a cruiser.
10. **Prefix:** `HMCS ` on all 10 groups. Kept on all 31.
11. **Fallbacks:** vanilla used `%s`, which prints a Roman numeral [NAM-005], and the three pools had none. Every group now has a `%d` fallback, as in every other ISNE file: `Destroyer`, `Submarine`, `Light Cruiser`, `Heavy Cruiser`, `Battleship`, `Battlecruiser`, `Aircraft Carrier`, `Corvette`, `Frigate`, `Minesweeper`, `Patrol Vessel`, and `Ship %d` for the pools, as in the USA file.
12. **Vanilla script:** `history/countries/CAN - Canada.txt` assigns `CAN_DD_HISTORICAL` by `name_group` [NAM-017]. Defined.
13. **Fonts:** every non-ASCII letter the file uses (á, â, ä, ç, è, é, É, Î, ó, û) is in every Latin game font; only the Cyrillic fonts lack them.

## Rulings

- **Era:** a name is judged by whether the name itself is plausible for 1936-1950. Post-war RCN names stay when the name is a period river, people or city (*Mackenzie*, *Terra Nova*, *Ojibwa*, *Corner Brook*). Places created or renamed after 1949 are dropped. Newfoundland names are allowed (vanilla has them; a Canadian player can annex the dominion).
- **French names:** standard Canadian orthography with diacritics (`Québec`, `Montréal`, `Chaudière`, `Lévis`, `Trois-Rivières`, `Jonquière`, `Ste. Thérèse`, `Matapédia`, `Gaspé`). The cruiser keeps vanilla's `Québec` rather than the unaccented form the navy wrote in 1944, so the cruiser and the province do not appear under two spellings. Ship names otherwise keep the navy's own form: `Lasalle`, `Rivière du Loup`, `Grandmère`, `Dunver`, `Daerwood`, `Lavallee`, `Louisburg` (the corvette; the fortress in BC is `Louisbourg`).
- **Living persons:** kept where their fame predates 1936 (Peru plan precedent), and listed below. Sitting politicians and serving officers of 1936 are left out of the hull groups and pools that are not gated (Mackenzie King, Bennett, Meighen; Percy Nelles, Chief of the Naval Staff 1934-44). The Crown and its viceregal representatives are exempt, as they are above party: the sovereigns of 1936 in BB and Rulers, and *Tweedsmuir*, Governor General 1935-40, in Rulers.
- **No Royal Navy sister-class names in CV:** the *Majestic* and *Colossus* class names the dossier offered are foreign vessels the RCN never used.
- **Royal names in BB:** *King George V*, *Queen Mary*, *Queen Elizabeth* and the other sovereigns and consorts also named Royal Navy ships. They stand here as the sovereigns of Canada and their consorts, not as the British ships. The same holds for the reserve division *Unicorn* (CV; HMS *Unicorn* was a Royal Navy carrier of 1943) and the Nova Scotia port *Sydney* (CL; HMAS *Sydney* was an Australian cruiser).

## Final Architecture (31 groups)

### Hull groups

| Group | Count | Formula |
|---|---|---|
| `CAN_DD_HISTORICAL` | 105 | Every RCN fleet destroyer of 1920-1945 (S, A, C, D, E, F, G, H, Tribal, V, Cr and Town classes, the ex-US river-named hulls); post-war destroyer escorts *Mackenzie* and *Terra Nova*; 59 further Canadian rivers || `CAN_SS_HISTORICAL` | 60 | *Grilse*, the Oberon names *Ojibwa*, *Onondaga*, *Okanagan*, the Victoria-class names *Victoria*, *Windsor*, *Corner Brook*; fish of Canadian waters, the formula *Grilse* (a young salmon) stands for; three whales |
| `CAN_CL_HISTORICAL` | 53 | *Niobe*, *Rainbow*, *Aurora*, *Uganda*, *Québec*, *Ontario*; provinces and territories; former colonies, districts and regions; 14 cities that had no wartime escort namesake |
| `CAN_CA_HISTORICAL` | 40 | Navigators and explorers; commanders of New France; defenders of British North America; Kingsmill and William Hall |
| `CAN_BB_HISTORICAL` | 37 | The Dominion and its realms; *Maple Leaf*, *Red Ensign*; sovereigns of Canada; Fathers of Confederation, prime ministers, fathers of responsible government |
| `CAN_BC_HISTORICAL` | 61 | Provincial Marine and Great Lakes squadrons; ships of New France; ships of discovery and the Arctic; the armed merchant cruisers of 1940; fortresses; straits and waters |
| `CAN_CV_HISTORICAL` | 37 | The RCN's carriers; naval bases and reserve divisions; seabirds and raptors; summits |

- **CL takes the provinces, not CA.** The navy's two wartime cruisers were light cruisers named for provinces. The escort fleet took almost every Canadian town of note, so a city-based CL would have needed post-war suburbs.
- **BB against BC:** no shared name. BB holds realms, sovereigns, founders and symbols; BC holds vessels, forts and waters.
- **CV:** every base and division used is named for a place, a ship or a bird, not a person (fact-check pass 5). `Protector` is the Point Edward naval base at Sydney, NS (1940-64). `Scotian` dates from 1947, inside the era. Left out: `Hunter` (named for the brig *General Hunter*, in BC), `Avalon` (commissioned only in 1951; the colony is in CL), `Cornwallis` (named for Edward Cornwallis, whose 1749 proclamation set a bounty on the Mi'kmaq; contested, and at odds with this file's Indigenous names policy) and `Powerful` (the launch name of the *Bonaventure* hull; one hull, one name; it stays in Virtues).

### Role pools

| Group | Count | Series |
|---|---|---|
| `CAN_CORVETTES` | 121 | 99 Flower-class town names, the 10 flower names of the Royal Navy order, 12 Castle class. *Vancouver* is left to DD. |
| `CAN_FRIGATES` | 84 | 58 River-class town names (with *Dunver*), the 7 Royal Navy loans, 3 Loch class, 16 River-class names ordered and cancelled in December 1943 |
| `CAN_MINESWEEPERS` | 80 | Bangor (54), Algerine (12), Fundy (4), Llewellyn (10) |
| `CAN_PATROL_VESSELS` | 44 | 16 armed yachts of 1940; 8 patrol vessels of 1914-18; 12 Battle-class and 8 Isles-class trawlers |

### Thematic pools

| Group | Count | Display name |
|---|---|---|
| `CAN_CITIES` | 112 | Cities |
| `CAN_PROVINCES` | 49 | Provinces & Regions |
| `CAN_RIVERS` | 82 | Rivers & Lakes |
| `CAN_COASTS` | 80 | Capes, Isles & Straits |
| `CAN_GEOGRAPHY` | 30 | Mountains |
| `CAN_TRIBES` | 78 | Indigenous Peoples |
| `CAN_BIRDS` | 68 | Birds |
| `CAN_FISH` | 70 | Aquatic Life |
| `CAN_BEASTS` | 37 | Wildlife |
| `CAN_RULERS` | 64 | Monarchs & Governors |
| `CAN_EXPLORERS` | 39 | Explorers |
| `CAN_HEROES` | 41 | Heroes |
| `CAN_BATTLES` | 43 | Battles |
| `CAN_MYTHOLOGY` | 20 | Myth & Folklore |
| `CAN_VIRTUES` | 52 | Virtues & Elements |
| `CAN_LOYALISTS` | 20 | Loyalists & Empire (heritage, not gated) |

### Ideological pools

| Group | Count | Display name | Gate |
|---|---|---|---|
| `CAN_CONFEDERATION` | 41 | Confederation | `democratic` |
| `CAN_REVOLUTION` | 24 | Patriotes & Rebels | `democratic` or `communism` |
| `CAN_REFORM` | 21 | Reform & Co-operation | `neutrality` (the CCF in vanilla) |
| `CAN_SOCIALISM` | 21 | Labour Struggle | `communism` |

- **Cap:** democratic sees Confederation and Patriotes & Rebels; communism sees Labour Struggle and Patriotes & Rebels; neutrality sees Reform & Co-operation; fascism sees none.
- **No fascism pool:** the only material is the party press of Adrien Arcand's antisemitic movement (Wikipedia, Adrien Arcand).
- **Separation:** Labour Struggle holds no CCF social democrats; the Winnipeg strike leaders who later joined the CCF (Ivens, Russell, Queen, Heaps, Woodsworth) are not in it, and Heaps and Woodsworth sit in Reform & Co-operation. *One Big Union* (syndicalist, not CPC) and *Ginger Goodwin* (Socialist Party of Canada) stand in Labour Struggle as militant labour; neither ideology opposes the pool's gate. The Tories who fought the Patriotes (MacNab, Strachan, Robinson) are in Loyalists & Empire only. Marshall Spring Bidwell, a reformer who took no part in the rising, is left out of Patriotes & Rebels. Wolfred Nelson, the one rebel with a later public career, never disavowed reform and stays with the rebels.
- **Loyalists & Empire is ungated** and treated like Monarchs & Governors. It was renamed from "Loyalists" because it also holds *Imperial Federation* and *Empire Day*. Gating it would give democratic governments a third pool.

### Depth warnings accepted

Mountains (30), Myth & Folklore (20), Loyalists & Empire (20), Patriotes & Rebels (24), Reform & Co-operation (21) and Labour Struggle (21) are below the 35 target and above the floor of 20. Each holds only verified names. Myth & Folklore lost five figures to the sacred-names rule below.

## Indigenous Names Policy (author decision: split by context)

- Hull groups keep the spellings the RCN gave its ships: *Athabaskan*, *Cayuga*, *Haida*, *Huron*, *Iroquois*, *Micmac*, *Nootka*, *Algonquin*, *Sioux* (DD); *Ojibwa*, *Onondaga*, *Okanagan* (SS).
- `CAN_TRIBES` keeps its vanilla tag, is renamed "Indigenous Peoples" ("First Nations" excludes Inuit and Métis), uses current self-designations, and repeats none of the hull names.
- Replacements: `Micmac` → `Mi'kmaq`, `Nootka` → `Nuu-chah-nulth`, `Athabaskan` → `Dene`, `Huron` and `Wyandot` → `Wendat`, `Iroquois` → `Haudenosaunee`, `Sioux` → `Dakota`, `Ottawa` → `Odawa`, `Kwakiutl` → `Kwakwaka'wakw`, `Lillooet` → `St'at'imc`, `Nlakapamuk` → `Nlaka'pamux`, `Shuswap` → `Secwepemc`, `Burrard` → `Tsleil-Waututh`, `Okanagan` → `Syilx`, `Kootenay` → `Ktunaxa`, `Assiniboine` → `Nakoda`.
- Dropped: `Wakashan` (a language family), `Stahlo` (*Stó:lō* needs a colon and macrons), `Algonquin`, `Haida`, `Cayuga`, `Onondaga` and `Ojibwa` (owned by the hull groups), `Songhees` (the English name of the Lekwungen, who are listed).
- Replaced after review so that the pool repeats no ship name of any group: `Comox` → `K'ómoks`, `Cowichan` → `Quw'utsun` (both are Bangor and Fundy minesweeper names); `Chipewyan` → `Denesuline` (the exonym beside `Dene`).
- Exonyms that are English words or slurs are not used (*Blood*, *Stoney*, *Carrier*, *Beaver*, *Neutral*, *Slavey*, *Sarcee*, *Eskimo*). Font-safe forms: `Tlicho`, `Mohawk`, `Oneida`, `Tuscarora`; Latin-1 forms `Nuxálk`, `Hän`, `Métis`.
- Source: Wikipedia, List of First Nations peoples in Canada (Dossier B).

## Role Pools: considered / created / skipped

- **Corvettes, frigates, minesweepers:** created (documented class series with the towns-adopt-a-ship naming rule).
- **Patrol vessels:** created, combining three auxiliary patrol series that are each at or below the floor on their own.
- **Escort destroyers:** considered, skipped: post-war, river names, in DD.
- **Escort carriers, light carriers:** considered, skipped: five names, all in CV.
- **Auxiliary cruisers:** considered, skipped: three names (*Prince David*, *Prince Henry*, *Prince Robert*), in BC.
- **Minesweepers of the Lake class:** left out; none was commissioned as HMCS. **Post-war Bay class:** left out; nine of 14 names repeat Bangor and Fundy names.
- **Castle-class corvettes cancelled in 1943:** left out; the 36 Canadian-built ships were ordered for the Royal Navy under Castle names.
- **Sloops, avisos, gunboats, torpedo boats, fast attack craft:** considered, skipped: no named series (the Fairmile launches carried numbers).
- **Scout cruisers, flotilla leaders, AA cruisers, armored and large cruisers, fast battleships, coastal defense, monitors:** considered, skipped: no precedent.
- **Minelayers, seaplane tenders, submarine tenders, icebreakers, state yachts:** considered, skipped: no named series before 1950.
- **Submarine sub-types:** considered, skipped: no named submarines before 1961.
- **Training ships and auxiliaries, gate vessels, Bird-class patrol vessels:** considered, skipped: a handful of names or post-war.

## Collision Resolutions

`-Audit CAN` reports no `CrossClass`, `CrossClassVariant` or `RoleOverlap` finding.

Single owners:
- *Ontario*, *Québec*, *Niobe*, *Rainbow*, *Aurora*, *Uganda* → CL (`Rainbow Trout` stands in SS).
- *Canada*, *Dominion*, *Acadia* → BB; the 1914-18 vessels *Canada* and *Acadia* are left out of Patrol Vessels.
- *Saskatchewan*, *Kootenay*, *Niagara*, *Columbia*, *Mackenzie*, *Vancouver*, *Hamilton*, *Ottawa*, *Champlain* → DD. *Yukon* → CL.
- *Victoria*, *Windsor*, *Corner Brook* → SS. *Chicoutimi* and *Kokanee* → the role pools; SS leaves them out.
- *Charlottetown*, *Lévis* (Flower and River names) → Corvettes. *Leamington* → DD. *Nanoose* (ex-*Nootka*) → Minesweepers.
- *Brock*, *Wolfe*, *Prevost*, *Simcoe* → CA; BC leaves out *Sir Isaac Brock* and *Wolfe*.
- *Griffon*, *Nonsuch*, *Discovery*, *Queen Charlotte*, *Chatham* → BC; CV leaves out the reserve divisions of the same names.
- *Stadacona* → CV; the 1915 yacht is not in Patrol Vessels.
- One hull, one name: `Charwell` (ex-*Earl of Moira*) and `Lord Beresford` (ex-*Prince Regent* schooner, later *Netley*) are left out; `Earl of Moira`, `Netley` and `Prince Regent` (the 1814 frigate) stand. `Powerful` is left out of CV for the same reason (the *Bonaventure* hull). `Megantic` is the hull commissioned as *Sea Cliff*.
- Qualified forms keep persons apart from escort names: `Comte de Frontenac` (corvette *Frontenac*), `Chevalier de Lévis`, `Cavelier de La Salle` (frigate *Lasalle*), `William Baffin` (trawler *Baffin*), `Alexander Galt` (corvette *Galt*), `Lord Melville` (minesweeper *Melville*).
- Left out because a role pool owns the name: CL *Ungava*, *Cape Breton*, *Algoma*, *Nelson* (DD); BC *Fort William*, *Fort Frances*, *Fort Erie*; DD *Miramichi*, *Matapédia*, *Klondike*.

INFO pairs in `-Audit` (`CrossClassPerson`), all different names:
- *Franklin* (CL, the district) and *John Franklin* (CA, the explorer it is named for): one is a place, one a person.
- *Prevost* (CA, Sir George Prevost) and *Lady Prevost* (BC, the 1812 schooner named for his wife).
- *Prince George* (CL, the city) and *Royal George* (BC, the 1809 corvette).

Thematic pools stand alone and may repeat hull and role names. Homonyms inside them take qualified forms: `Québec City`, `Ottawa River`, `Lake Winnipeg`, `Cape Breton Island`, `Samuel de Champlain`, `Alexander Mackenzie`, `William Lyon Mackenzie`, `George-Étienne Cartier`, `Jacques Cartier`, `Louisbourg 1758`, `Québec 1690`, `Chinook Salmon`, `Common Raven`.

## Language and Homonym Notes

- Destroyer rivers left out as English words or confusable: `Slave`, `Back`, `Don`, `Bow`, `Credit`, `Grand`, `Campbell`, `Exploits`, `Rupert`, `Kazan` (reads Russian), `Churchill` (reads as Winston Churchill in a 1936-50 game; also left out of CL and Cities), `Thames`, `Avon`, `Mersey`, `Humber` (read as the British rivers and Royal Navy ships). `Peace` is listed as `Peace River`.
- Submarine fish left out: `Sucker`, `Chub`, `Smelt`, `Skate`, `Inconnu` (reads as "unknown"); `Char` is listed as `Arctic Char`.
- Birds: `Loon` only as `Common Loon` and `Red-throated Loon`; `Coot`, `Ruff`, `Knot`, `Bufflehead` and `Eskimo Curlew` left out.
- Wildlife: `Skunk`, `Lemming`, `Badger`, `Fisher`, `Buffalo` left out; `Husky` kept as the 1940 yacht name.
- Cities: `Hope`, `Trail` (as a city; *Trail* stays a corvette name) left out; `Shawinigan Falls` is the period name of the city (renamed 1958).
- Kept as real ship names despite the homonym: `Thunder`, `Speedy`, `Nancy`, `Star`, `Queen`, `Terror`, `Matthew`.

## Verification Notes

Every named person in the file, with its source. "WD" means well documented, kept without a lookup.

### Sourced
- **Explorers (pass 1):** Brûlé (Canadian Encyclopedia), Kelsey (DCB), Henday (DCB), Bernier (Canadian Encyclopedia), Tyrrell (Parks Canada), Palliser (DCB), Henry Youle Hind (Wikipedia), Bartlett (Canadian Encyclopedia), Larsen (Wikipedia), Donnacona (DCB).
- **Heroes (pass 2):** Kingsmill, Hose (Wikipedia, Chief of the Naval Staff (Canada)); William Hall and every VC recipient (Wikipedia, List of Canadian Victoria Cross recipients): Alexander Dunn, Filip Konowal, Thain MacDowell, John Pattison, Ellis Sifton, Okill Learmonth, Harcus Strachan, Billy Bishop, William Barker, Alan McLeod, Gordon Flowerdew, Cyrus Peck, Joseph Kaeble, Jean Brillant, Raphael Zengel, Coulson Mitchell, Thomas Ricketts, and Rowland Bourke (the London Gazette citation of 28 Aug 1918, Veterans Affairs Canada and the RCN use "Rowland"; review fix).
- **Governors (Dossier B):** the governors of New France, the British governors 1760-1841 and the governors general 1867-1940 (Wikipedia, List of governors general of Canada). 1841-67 governors Bagot, Metcalfe, Cathcart, Elgin and Edmund Head (pass 3, same page).
- **Fathers of Confederation (Dossier B):** all 28 in the Confederation pool and the ten in BB (Wikipedia, Fathers of Confederation).
- **Patriotes & Rebels (pass 3):** Papineau, Wolfred and Robert Nelson, Chevalier de Lorimier, Chénier, Duvernay, Cardinal, Joseph Duquet (hanged with Cardinal), William Lyon Mackenzie, Lount, Matthews, Duncombe, Nils von Schoultz (Wikipedia, Lower Canada Rebellion, Patriot War and individual pages). Thomas Storrow Brown (DCB; main-session search).
- **Loyalists (pass 3):** Simcoe, Sir John Johnson, John Butler, Edward Winslow, Thomas Carleton, Ward Chipman, John Strachan, Allan MacNab, John Beverley Robinson, Jonathan Odell. Edward Jessup (DCB), Molly Brant (New-York Historical Society), Tyendinaga (Canadian Encyclopedia, Crown grant to the Mohawks of the Bay of Quinte): main-session searches.
- **Reform & Co-operation (pass 4):** Woodsworth, Coldwell, Irvine, Heaps, MacInnis, Macphail, Henry Wise Wood, Coady, Tompkins, the Famous Five (Wikipedia, Co-operative Commonwealth Federation; Famous Five; Antigonish movement; individual pages).
- **Labour Struggle (pass 4):** Tim Buck, Tom McEwen, Annie Buller, `Becky Buhay` (respelled from "Beckie"), Norman Bethune (CPC from 1935), Ginger Goodwin, Slim Evans, Edward Cecil-Smith, Mike Sokolowski (Wikipedia and Canadian Encyclopedia). Harvey Murphy (Canadian Encyclopedia, Crowsnest Pass Strike 1932; main-session search).
- **Folklore persons (pass 6):** Jean Cadieux (Canadian Encyclopedia), Big Joe Mufferaw (Wikipedia, Joseph Montferrand), Louis Cyr (DCB).

### Well documented, kept without a lookup
- Sovereigns of France and Britain from François Ier to George VI; Princess Louise and Princess Patricia (pass 3 confirmed both).
- Prime ministers Laurier, Borden, Abbott, Bowell; Baldwin, LaFontaine, Howe, Hincks, Ryerson (pass 4 rated them WD).
- Canonical explorers and heroes (pass 1 and 2 rated them WD): Cartier, Cabot, Frobisher, Davis, Hudson, Baffin, Champlain, Jolliet, Marquette, La Salle, Radisson, Groseilliers, d'Iberville, La Vérendrye, Hearne, Mackenzie, Simon Fraser, David Thompson, Vancouver, Cook, Franklin; Brock, Tecumseh, Salaberry, Laura Secord, Joseph Brant, Dollard des Ormeaux, Madeleine de Verchères, Maisonneuve, Jeanne Mance, Talon, Laval, Brébeuf, Montcalm, Wolfe.
- Persons pass 1 and 2 kept from memory without a source (real, standard dates, no doubt raised): Thomas James, Luke Foxe, Jean Nicolet, Peter Pond, George Back, John Rae, Robert McClure, Francis Crozier, Stefansson; FitzGibbon, John Norton, Louis Hébert, Lévis, Poundmaker, Crowfoot.

### Dropped after fact-check
- Vessels: `Roxborough` (never RCN: served under the Royal Navy, then the Soviet Union), `Culver` (no RCN record; HMS *Culver* was a Royal Navy sloop), `Earl Grey` (commissioned only to deliver an icebreaker to Russia), `Charwell`, `Lord Beresford`, `Detroit` (reads as the US city). `Linnet` (built at Île aux Noix 1814, captured at Plattsburgh) is kept, like the other squadron ships taken by the Americans (*Confiance*, *Caledonia*, *Queen Charlotte*, *General Hunter*, *Lady Prevost*, *Duke of Gloucester*).
- Persons: Marshall Spring Bidwell (not a rebel), Henri Bourassa (not Confederation-era; alive and active in 1936), Percy Nelles (serving Chief of the Naval Staff), Bellenden Hutcheson (US-born; kept short), Napoléon La Rue (unverified), Sam McGee and Dan McGrew (literary characters, not folklore).
- Places: `Mauricie` (a 1930s coinage), `Yellowknife` and `Whitehorse` from CL (unincorporated in 1941; Whitehorse stays in Cities), `Powell River` (company town, incorporated 1955), `Churchill` (see homonyms).
- Folklore: Sedna, Wisakedjak, Mishipeshu, Thunderbird and Raven are sacred or crest figures (pass 6). Also Amarok (unverified), Wendigo, Kitchi Manitou and La Corriveau. `Qalupalik` (an Inuit cautionary figure, not a deity), `Nanabozho`, `Glooscap` and `Sasquatch` are kept as moderate-sensitivity figures that are widely used in place names and published folklore.
- Events: `Montgomery's Tavern` (a poor ship name), `London Conference` and `Balfour Declaration` (read as WWII and 1917 events), `Chippawa` from Battles (a US victory).

### Living on 1 January 1936
King George V (d. 20 Jan 1936), King George VI, Queen Mary, Queen Elizabeth (BB); Connaught, Devonshire, Willingdon, Bessborough, Tweedsmuir, Princess Louise, Princess Patricia (Rulers); Robert Borden (BB, Confederation; d. 1937); Tyrrell, Stefansson, Bartlett, Larsen (Explorers); Walter Hose, Konowal, MacDowell, Strachan, Bishop, Peck, Zengel, Mitchell, Bourke, Ricketts (Heroes); Woodsworth, Coldwell, Irvine, Heaps, MacInnis, Macphail, Henry Wise Wood, McClung, Parlby, Coady, Tompkins (Reform & Co-operation); Tim Buck, McEwen, Buller, Buhay, Bethune, Slim Evans, Cecil-Smith, Harvey Murphy (Labour Struggle).

## Review Fixes (isne-code-reviewer, 2026-10-14)

Verdict: approve after three Important fixes; no Critical findings. All applied:
- **Tweedsmuir** kept: the living-persons rule now exempts the Crown and its viceregal representatives explicitly (see Rulings).
- **`Rowland Bourke`** replaces `Roland Bourke`.
- **`Hull`** dropped from Cities (reads as the Ship Designer's own term, and as Hull, England).

Minor findings applied:
- `Linnet` restored to BC; the captured-ships reasoning made consistent (see Verification Notes).
- `Powerful` and `Cornwallis` out of CV; `Protector` (Point Edward base, 1940-64) in. `Albatross` → `Goshawk` (no Canadian rationale; a Royal Navy seaplane carrier). `Mount Royal` → `Mount Lucania` (near-variant of the frigate *Royal Mount*).
- Destroyer rivers that read as British rivers or ships, a US city or a phrase (`Severn`, `Trent`, `Albany`, `Nelson`, `Oldman`) replaced by `Harricana`, `Romaine`, `Péribonka`, `Caniapiscau`, `Bersimis`; the Rivers pool lists them as `Severn River`, `Trent River`, `Albany River`, `Nelson River`, `Oldman River`.
- `Brant` → `Brant Goose`; `Killdeer` dropped; `Anne` → `Queen Anne`; `Frobisher` → `Martin Frobisher`; `Triumph` dropped from Virtues (a *Colossus*-class name); `Orignal` and `Carcajou` dropped (French synonyms of animals already listed); `Forrest Hill` → `Forest Hill` (Wikipedia, HMCS Forest Hill).
- `New Caledonia` → `Rainy River` in CL and Provinces (reads as the French Pacific colony, a state in the game; the District of Rainy River dates from 1885).
- Indigenous pool: `K'ómoks`, `Quw'utsun`, `Denesuline` (see the policy section).
- Workshop block uses the exact display names.

Noted, no change: *Unicorn*, *Sydney* and the royal names in BB (see Rulings); *Asbestos* is an authentic corvette name; Loyalists & Empire stays ungated. `Dalbec` (Myth & Folklore) is a Québec folk hero (Wikipedia, Dalbec (folklore); pass 6).

## Review Focus

1. **Vanilla fixes:** the six foreign vessels gone, `Ottawa` once, spellings corrected, `Ile de Québec`, the anachronistic cities and `Nunavut` gone, every other vanilla name in some group.
2. **Cross-class and role overlap:** zero shared names between CL/CA/BB/BC/CV; BB and BC on separate doctrines; no role-pool name in a major hull.
3. **Indigenous names:** ship spellings only in DD and SS; self-designations only in the pool; no overlap.
4. **Ideology:** gates use `has_government` only; at most two pools per ideology; no CCF names in Labour Struggle; no fascism pool.
5. **Prefix and tags:** `HMCS ` on all 31 groups; no `ship_types` on any pool; `CAN_DD_HISTORICAL` defined.
6. **Persons:** every named person is in the verification notes.
7. **Docs:** README row, workshop row, Canada block and header pitch, `wiki/Canada.md`, `wiki/Home.md`, `wiki/_Sidebar.md`, the removed roadmap row.
