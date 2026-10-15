# Canada (CAN) Ship Namelists

Source file: `common/units/names_ships/CAN_ship_names.txt`

---

## Overview

The Naval Service of Canada was founded in 1910 with two old Royal Navy cruisers, *Niobe* and *Rainbow*, and became the Royal Canadian Navy in 1911. Between the wars it was a handful of destroyers: the ex-Royal Navy *Patriot*, *Patrician*, *Champlain* and *Vancouver*, then *Saguenay* and *Skeena* (1931), the first ships built to Canadian order. From then on the navy named its destroyers after Canadian rivers, and the Tribal-class destroyers of 1942-45 after Indigenous peoples.

The Second World War turned it into one of the largest navies in the world, built around convoy escorts for the Battle of the Atlantic. Over a hundred Flower-class corvettes and some seventy River-class frigates were named after the Canadian towns that adopted them; more than eighty Bangor, Algerine, Fundy and Llewellyn-class minesweepers followed the same rule. Armed yachts bought in 1940 took animal names. The cruisers *Uganda*, renamed *Quebec*, and *Ontario* joined in 1944-45, and the escort carriers *Nabob* and *Puncher* sailed with Canadian crews.

In vanilla Hearts of Iron IV, Canada's ship namelist file (`CAN_ship_names.txt`) had these problems:
- **Cloned capital ships:** battleships (`CAN_BB_HISTORICAL`) and battlecruisers (`CAN_BC_HISTORICAL`) were the same 11 names, *Canada*, *Dominion* and nine provinces.
- **Cloned cruisers:** heavy cruisers (`CAN_CA_HISTORICAL`) copied the light cruisers, plus the typo `Kingson`. The nine provinces sat in five lists at once.
- **Foreign vessels:** three Australian destroyers (*Vendetta*, *Voyager*, *Waterhen*), the Royal Navy-only Town-class destroyer *Lancaster*, and the Royal Navy submarines *Olympus* and *Osiris*.
- **Frigates listed as destroyers:** 28 River-class frigates sat in the destroyer list.
- **Spelling:** `Chaudiere`, `St. Catherine's`, `St. John`, `Trois-Rivieres`, `Ottawa` twice, and the untraceable `Ile de Québec`.
- **Anachronisms:** Nunavut (1999) and post-war suburbs such as Mississauga, Laval and Vaughan.

**ISNE** rebuilds the Canadian namelists as 31 groups:
- **Destroyers follow the RCN's formula.** Every fleet destroyer of 1920-1945 is kept, the river names are extended with further Canadian rivers, and the Tribal-class names keep the spellings the navy gave its ships.
- **Light cruisers carry provinces.** The navy's two wartime cruisers were light cruisers named for provinces, so the light cruiser list holds the cruiser names, the provinces and territories, former colonies and districts, and cities that had no wartime escort namesake.
- **Heavy cruisers carry explorers and champions:** the navigators of the Atlantic and the Arctic, the commanders of New France, and the defenders of 1812.
- **Battleships and battlecruisers are split by doctrine.** Battleships carry the Dominion and its realms, the sovereigns, and the Fathers of Confederation. Battlecruisers carry the Provincial Marine and Great Lakes squadrons of 1812, the ships of New France and of discovery, fortresses, and straits. No name is shared between them.
- **Carriers** carry the RCN's carriers, its naval bases and reserve divisions, seabirds, and summits.
- **Four role pools** hold the wartime escort fleet under its own names: corvettes, frigates, minesweepers, and patrol vessels (armed yachts and naval trawlers).
- **Indigenous names are split by context.** Hull lists keep the names of real ships (*Micmac*, *Nootka*, *Iroquois*). The Indigenous Peoples pool uses current self-designations (*Mi'kmaq*, *Nuu-chah-nulth*, *Haudenosaunee*, *K'ómoks*) and repeats none of the ship names.
- **Four ideological pools are gated by government through `can_use`.** Confederation requires a democratic government. Reform & Co-operation requires the non-aligned government, which in the game is the CCF. Labour Struggle requires communism. Patriotes & Rebels (1837-38) is open to democratic and communist governments. There is no fascist pool: the only source material is the party press of an antisemitic movement.
- **Short where the record is short:** Myth & Folklore holds 20 names, because Indigenous sacred and crest figures are left out. The ideological pools hold 20-41 names.
- The vanilla prefix `HMCS ` is kept on every group.

---

## Namelist Groups

### Ship-Type Specific Category

Dedicated namelists tied to specific ship hulls and naval classifications:

| Group Tag | Type | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `CAN_DD_HISTORICAL` | Destroyers | `ship_hull_light destroyer` | Saguenay, Skeena, Fraser, St. Laurent, Assiniboine, Ottawa, Restigouche, Qu'Appelle, Chaudière, Haida, Athabaskan, Iroquois, Micmac, Sioux, Crescent, Annapolis, Mackenzie |
| `CAN_SS_HISTORICAL` | Submarines | `ship_hull_submarine submarine` | Grilse, Ojibwa, Onondaga, Okanagan, Victoria, Windsor, Corner Brook, Salmon, Sockeye, Sturgeon, Pike, Muskellunge, Halibut, Narwhal |
| `CAN_CL_HISTORICAL` | Light Cruisers | `ship_hull_cruiser light_cruiser` | Niobe, Rainbow, Aurora, Uganda, Québec, Ontario, Alberta, British Columbia, Nova Scotia, Keewatin, Assiniboia, Gaspésie, Kingston, St. John's |
| `CAN_CA_HISTORICAL` | Heavy Cruisers | `ship_hull_cruiser heavy_cruiser` | Jacques Cartier, John Cabot, Henry Hudson, Radisson, d'Iberville, La Vérendrye, Alexander Mackenzie, Simon Fraser, Montcalm, Wolfe, Brock, Tecumseh, Salaberry, William Hall |
| `CAN_BB_HISTORICAL` | Battleships | `ship_hull_heavy battleship` | Canada, Dominion, Confederation, Acadia, New France, Rupert's Land, Maple Leaf, Queen Victoria, King George V, John A. Macdonald, George-Étienne Cartier, Wilfrid Laurier |
| `CAN_BC_HISTORICAL` | Battlecruisers | `ship_hull_heavy battle_cruiser` | St. Lawrence, Prince Regent, Royal George, General Hunter, Confiance, Grande Hermine, Pélican, Machault, Nonsuch, St. Roch, Bluenose, Prince Robert, Louisbourg, Fort Henry, Cabot Strait |
| `CAN_CV_HISTORICAL` | Aircraft Carriers | `ship_hull_carrier carrier` | Warrior, Magnificent, Bonaventure, Nabob, Puncher, Stadacona, Naden, Shearwater, Protector, Cataraqui, Gannet, Gyrfalcon, Mount Logan |

---

### Role-Specific Category

Universal pools for ship roles that have no hull token of their own:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `CAN_CORVETTES` | Corvettes | Universal | Sackville, Arvida, Chambly, Moose Jaw, Oakville, Regina, Ville de Québec, Halifax, Calgary, Trillium, Snowberry, Arnprior, St. Thomas |
| `CAN_FRIGATES` | Frigates | Universal | Swansea, Saint John, St. Catharines, Prince Rupert, Waskesiu, New Glasgow, Matane, Toronto, Montréal, Annan, Ettrick, Loch Alvie |
| `CAN_MINESWEEPERS` | Minesweepers | Universal | Esquimalt, Chedabucto, Clayoquot, Bayfield, Trois-Rivières, Ungava, Sault Ste. Marie, Winnipeg, Fundy, Gaspé, Llewellyn, Revelstoke |
| `CAN_PATROL_VESSELS` | Patrol Vessels | Universal | Beaver, Caribou, Grizzly, Moose, Sans Peur, Hochelaga, Margaret, Vimy, Ypres, Givenchy, Anticosti, Manitoulin |

---

### Universal Thematic Topic Category (Ship Designer)

Universal selection pools available for any ship hull or squadron in the Ship Designer:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `CAN_CITIES` | Cities | Universal | Toronto, Montréal, Vancouver, Winnipeg, Québec City, Halifax, Sydney, St. John's, Trois-Rivières, Kingston, Port Arthur, Prince Rupert, Whitehorse |
| `CAN_PROVINCES` | Provinces & Regions | Universal | Ontario, Québec, Nova Scotia, British Columbia, Acadia, New France, Rupert's Land, Upper Canada, Keewatin, Assiniboia, Cariboo, Klondike |
| `CAN_RIVERS` | Rivers & Lakes | Universal | St. Lawrence, Mackenzie, Fraser, Ottawa River, Saskatchewan River, Saguenay, Restigouche, Lake Superior, Lake Winnipeg, Great Bear Lake, Bras d'Or |
| `CAN_COASTS` | Capes, Isles & Straits | Universal | Cape Race, Cape Spear, Cap Diamant, Sable Island, Anticosti, Baffin Island, Strait of Belle Isle, Cabot Strait, Bay of Fundy, Georgian Bay, Nootka Sound |
| `CAN_GEOGRAPHY` | Mountains | Universal | Mount Logan, Mount Saint Elias, Mount Robson, Mount Assiniboine, Mount Edith Cavell, Mount Royal, Mont Tremblant, Rockies, Laurentians, Torngats |
| `CAN_TRIBES` | Indigenous Peoples | Universal | Mi'kmaq, Wendat, Haudenosaunee, Anishinaabe, Cree, Dene, Siksika, Nakoda, Secwepemc, Nisga'a, Kwakwaka'wakw, Nuu-chah-nulth, Inuit, Métis |
| `CAN_BIRDS` | Birds | Universal | Peregrine Falcon, Gyrfalcon, Bald Eagle, Snowy Owl, Atlantic Puffin, Northern Gannet, Common Loon, Canada Goose, Whooping Crane, Great Auk, Canada Jay |
| `CAN_FISH` | Aquatic Life | Universal | Atlantic Salmon, Chinook Salmon, Arctic Char, Lake Sturgeon, Muskellunge, Atlantic Cod, Halibut, Bluefin Tuna, Blue Whale, Narwhal, Beluga, Walrus |
| `CAN_BEASTS` | Wildlife | Universal | Beaver, Caribou, Grizzly, Moose, Wolverine, Polar Bear, Kermode Bear, Muskox, Plains Bison, Mountain Goat, Bighorn, Arctic Fox |
| `CAN_RULERS` | Monarchs & Governors | Universal | Louis XIV, George III, Victoria, George VI, Frontenac, Vaudreuil, Dorchester, Lord Durham, Lord Elgin, Dufferin, Lord Stanley, Tweedsmuir |
| `CAN_EXPLORERS` | Explorers | Universal | John Cabot, Jacques Cartier, Henry Hudson, Samuel de Champlain, La Vérendrye, Samuel Hearne, Alexander Mackenzie, David Thompson, John Franklin, John Rae |
| `CAN_HEROES` | Heroes | Universal | Jeanne Mance, Dollard des Ormeaux, Madeleine de Verchères, Isaac Brock, Tecumseh, Laura Secord, Poundmaker, William Hall, Billy Bishop, Filip Konowal |
| `CAN_BATTLES` | Battles | Universal | Louisbourg 1745, Plains of Abraham, Sainte-Foy, Queenston Heights, Châteauguay, Paardeberg, Ypres, Vimy, Hill 70, Passchendaele, Amiens, Canal du Nord |
| `CAN_MYTHOLOGY` | Myth & Folklore | Universal | Glooscap, Nanabozho, Ogopogo, Cadborosaurus, Memphré, Chasse-galerie, Loup-garou, Rose Latulipe, Ti-Jean, Jean Cadieux, Big Joe Mufferaw |
| `CAN_VIRTUES` | Virtues & Elements | Universal | Warrior, Magnificent, Crusader, Patriot, Valiant, Vigilant, Resolute, Intrepid, Chinook, Williwaw, Aurora, Borealis, Northern Lights |
| `CAN_LOYALISTS` | Loyalists & Empire | Universal | United Empire Loyalists, Butler's Rangers, Joseph Brant, Molly Brant, Edward Winslow, John Graves Simcoe, John Strachan, Imperial Federation |
| `CAN_CONFEDERATION` | Confederation | Universal (democratic) | Robert Baldwin, Louis-Hippolyte LaFontaine, Joseph Howe, John A. Macdonald, George-Étienne Cartier, D'Arcy McGee, Charlottetown Conference, Statute of Westminster |
| `CAN_REVOLUTION` | Patriotes & Rebels | Universal (democratic or communism) | Louis-Joseph Papineau, Wolfred Nelson, Chevalier de Lorimier, Jean-Olivier Chénier, William Lyon Mackenzie, Samuel Lount, Saint-Denis, Fils de la Liberté |
| `CAN_REFORM` | Reform & Co-operation | Universal (non-aligned: the CCF) | Regina Manifesto, J. S. Woodsworth, Agnes Macphail, Henry Wise Wood, Antigonish Movement, Persons Case, Nellie McClung, Emily Murphy |
| `CAN_SOCIALISM` | Labour Struggle | Universal (communism) | Winnipeg General Strike, One Big Union, Estevan Strike, On-to-Ottawa Trek, Tim Buck, Annie Buller, Slim Evans, Mackenzie-Papineau, Norman Bethune |
