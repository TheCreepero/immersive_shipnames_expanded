# United States (USA) Ship Namelists

Source file: `common/units/names_ships/USA_ship_names.txt`

---

## Overview

The United States Navy named its ships by type, and kept to the system through the largest building program in history. Battleships took the names of states, cruisers of cities, destroyers and destroyer escorts of Navy and Marine Corps heroes, submarines of fish and sea creatures, and carriers of historic ships and battles. The auxiliaries followed the same logic: oilers were rivers, fleet tugs Native nations, ammunition ships volcanoes, cargo ships stars, repair ships figures of myth, and minesweepers birds or single words such as *Admirable* and *Staunch*.

Vanilla Hearts of Iron IV already ships a deep American file of about 2,800 names. *Immersive Ship Names Expanded* keeps that depth: no list is trimmed to a quota. The work repairs the file and builds on it:

- **Repairs:** names broken by stray tab characters and spaces, duplicates inside the destroyer and cruiser lists, typos (*Picketts* for *Ricketts*, *Liscombe Bay* for *Liscome Bay*), two foreign submarines and the container ship *Ever Given* in the carrier list.
- **One home per name:** vanilla listed 24 cities as both light and heavy cruisers and repeated carrier names across two lists. Each name now sits with the ship that carried it in 1936-45.
- **Role pools:** vanilla's destroyer-escort, anti-aircraft cruiser, light and escort carrier and minelayer lists become universal role pools, joined by eight new ones.
- **Thematic pools:** vanilla's six pools are extended and seven new ones follow the auxiliary naming conventions.
- **Confederate lists:** vanilla's seven lists are kept and repaired. They remain bound to hull types because the `CSA` tag has no other lists.

**Prefixes.** Every US Navy group uses `USS `. The Coast Guard cutter pool uses `USCGC `, and the Confederate lists keep vanilla's `CSS `.

---

## Namelist Groups

### Ship-Type Specific Category

| Group Tag | Type | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `USA_DD_HISTORICAL` | Destroyers | `ship_hull_light destroyer` | Porter, Mahan, Gridley, Benson, Gleaves, Fletcher, O'Bannon, The Sullivans, Johnston, Heermann, Hoel, Laffey, Allen M. Sumner, Gearing, Mitscher, Forrest Sherman, Reuben James, Farragut, Paulding, Cassin Young |
| `USA_SS_HISTORICAL` | Submarines | `ship_hull_submarine submarine ship_hull_midget_submarine ship_hull_cruiser_submarine` | Tarpon, Salmon, Seawolf, Tambor, Gato, Wahoo, Albacore, Barb, Balao, Tang, Archerfish, Tench, Nautilus, Argonaut, Squalus, Octopus |
| `USA_CL_HISTORICAL` | Light Cruisers | `ship_hull_cruiser light_cruiser` | Brooklyn, Philadelphia, Helena, St. Louis, Cleveland, Montpelier, Santa Fe, Birmingham, Omaha, Marblehead, Olympia, Baton Rouge, Anchorage |
| `USA_CA_HISTORICAL` | Heavy Cruisers | `ship_hull_cruiser heavy_cruiser` | Quincy, Vincennes, Wichita, Baltimore, Houston, Indianapolis, San Francisco, New Orleans, Salt Lake City, Pensacola, Des Moines, Seattle, San Antonio |
| `USA_BB_HISTORICAL` | Battleships | `ship_hull_heavy battleship` | North Carolina, Washington, South Dakota, Iowa, Missouri, Montana, Arizona, West Virginia, Maine |
| `USA_BC_HISTORICAL` | Battlecruisers | `ship_hull_heavy battle_cruiser` | Alaska, Guam, Hawaii, Constitution, Constellation, United States, Chesapeake, Alliance, Macedonian, Niagara, Hartford, Monitor, Merrimack, Susquehanna |
| `USA_CV_HISTORICAL` | Aircraft Carriers | `ship_hull_carrier carrier` | Yorktown, Enterprise, Hornet, Lexington, Saratoga, Essex, Intrepid, Midway, Langley, Crown Point, Kings Mountain, Lake Erie, Chapultepec, Fort Fisher |

---

### Role-Specific Pools (Ship Designer)

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `USA_ESCORT_DESTROYERS` | Destroyer Escorts | Universal | Evarts, Buckley, England, Cannon, Slater, Rudderow, John C. Butler, Samuel B. Roberts, Tabberer, Dealey |
| `USA_AA_CRUISERS` | Anti-Aircraft Cruisers | Universal | Atlanta, Juneau, San Diego, San Juan, Oakland, Reno, Worcester, Roanoke |
| `USA_CVL_HISTORICAL` | Light & Escort Carriers | Universal | Independence, Princeton, Cowpens, Long Island, Bogue, Card, Sangamon, Casablanca, Gambier Bay, St. Lo, White Plains, Commencement Bay |
| `USA_MINELAYERS_HISTORICAL` | Minelayers | Universal | Terror, Oglala, Aroostook, Shawmut, Robert H. Smith, Gamble, Chimo, Gen. Henry Knox |
| `USA_MINESWEEPERS` | Minesweepers | Universal | Adroit, Admirable, Staunch, Vigilance, Triumph, Dextrous, Sentinel, Pioneer |
| `USA_FRIGATES` | Patrol Frigates | Universal | Asheville, Tacoma, Sausalito, Albuquerque, Key West, Grand Rapids, El Paso, Peoria |
| `USA_CORVETTES` | Corvettes | Universal | Temptress, Surprise, Courage, Tenacity, Action, Alacrity, Vim, Vitality |
| `USA_GUNBOATS` | Gunboats | Universal | Erie, Sacramento, Wheeling, Panay, Oahu, Luzon, Mindanao, Tutuila |
| `USA_PATROL_VESSELS` | Coast Guard Cutters | Universal | Alexander Hamilton, Bibb, Campbell, Ingham, Spencer, Taney, Owasco, Northland, Thetis, Icarus |
| `USA_SEAPLANE_TENDERS` | Seaplane Tenders | Universal | Curtiss, Albemarle, Currituck, Norton Sound, Barnegat, Casco, Coos Bay, Half Moon |
| `USA_SUBMARINE_TENDERS` | Submarine Tenders | Universal | Fulton, Holland, Sperry, Bushnell, Proteus, Orion, Aegir, Canopus |
| `USA_MONITORS` | Monitors | Universal | Passaic, Montauk, Nahant, Saugus, Tecumseh, Manhattan, Dictator, Miantonomoh, Amphitrite |

Every role pool follows a documented US series:
- **Destroyer escorts:** the *Evarts* to *John C. Butler* classes, the hulls completed as fast transports, and the 1950s *Dealey* and *Courtney* classes.
- **Anti-aircraft cruisers:** the *Atlanta*, *Oakland*, *Juneau* and *Worcester* classes. Only 14 names were ever assigned, so the pool is short by design.
- **Light and escort carriers:** the *Independence* and *Saipan* classes and every escort carrier class, including the names assigned to hulls built for the Royal Navy.
- **Minelayers:** the minelayers proper, the ships of the 1918 North Sea Mine Barrage, the destroyer minelayers, the auxiliary minelayers and the Army's mine planters.
- **Minesweepers:** the word-named *Adroit*, *Auk* and *Admirable* classes. The bird-named sweepers are in the Birds pool and the virtue-named coastal sweepers in Virtues.
- **Patrol frigates:** the *Asheville* and *Tacoma* classes, named for small cities.
- **Corvettes:** the *Temptress* and *Action* classes.
- **Gunboats:** station gunboats, the Philippine gunboats, the *Erie* class and the Yangtze river gunboats.
- **Coast Guard cutters:** the Treasury, Lake, *Owasco*, *Tampa*, *Algonquin*, *Thetis* and *Active* classes.
- **Seaplane tenders:** the large tenders and the *Barnegat* class, named for sounds, bays and inlets.
- **Submarine tenders:** submarine pioneers and figures of myth.
- **Monitors:** the Civil War monitors and the New Navy monitors.

Vanilla script assigns two of these lists by tag: the Casablanca Class built by a national focus uses `USA_CVL_HISTORICAL`, and the starting Oglala Class uses `USA_MINELAYERS_HISTORICAL`. Both keep their vanilla tags for that reason.

Roles considered and skipped:
- **Torpedo boats and flotilla leaders:** named for naval heroes like the destroyers; PT boats were numbered.
- **Large cruisers and armored cruisers:** the *Alaska* class is the battlecruiser list and the armored cruisers' city names are in the heavy cruiser list.
- **Cruiser and coastal submarines:** nine V-boat names, all in the submarine list; the coastal boats were numbered.
- **Auxiliary cruisers, icebreakers, training ships and state yachts:** too few names, or no series.

---

### Universal Thematic Topic Category (Ship Designer)

Universal selection pools available for any ship hull or squadron:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `USA_STATES` | States | Universal | Alabama, California, Texas, Virginia, New York |
| `USA_CITIES` | Cities | Universal | Washington, New York City, Chicago, Los Angeles, Annapolis, Key West, Santa Fe |
| `USA_BATTLES` | Famous Battles | Universal | Bunker Hill, Gettysburg, Shiloh, Midway, Normandy, Lookout Mountain, Santa Cruz, Leyte Gulf |
| `USA_LEADERS` | Famous Leaders | Universal | George Washington, Abraham Lincoln, Benjamin Franklin, Tecumseh, Kamehameha, John Hancock, Paul Revere, Kit Carson, Robert Fulton, Geronimo |
| `USA_BIRDS` | Birds | Universal | Lapwing, Owl, Pelican, Falcon, Osprey, Albatross, Peregrine, Kestrel, Mockingbird, Chanticleer |
| `USA_FISH` | Fish | Universal | Albacore, Barracuda, Swordfish, Thresher, Wahoo, Narwhal, Octopus, Orca |
| `USA_NATIVE_NATIONS` | Native Nations | Universal | Navajo, Seminole, Cherokee, Apache, Choctaw, Hopi, Pawnee, Zuni, Abnaki, Narragansett, Penobscot |
| `USA_RIVERS` | Rivers | Universal | Cimarron, Platte, Sabine, Kaskaskia, Guadalupe, Kennebec, Monongahela, Schuylkill, Rio Grande, Genesee |
| `USA_GEOGRAPHY` | Peaks, Parks & Regions | Universal | Lassen, Rainier, Shasta, Mauna Loa, Mount Hood, Mount McKinley, Blue Ridge, Teton, Yellowstone, Grand Canyon, Everglades |
| `USA_NATURE` | Celestial Bodies | Universal | Cassiopeia, Draco, Lyra, Ganymede, Arcturus, Betelgeuse, Andromeda, Aldebaran, Polaris, Sirius, Vega |
| `USA_MYTHOLOGY` | Mythology | Universal | Vulcan, Prometheus, Medusa, Hector, Jason, Poseidon, Minotaur, Zeus, Ulysses, Achilles |
| `USA_VIRTUES` | Virtues | Universal | Fearless, Fortitude, Valor, Loyalty, Endurance, Gallant, Valiant, Hope, Mercy, Solace |
| `USA_OLD_NAVY` | Age of Sail | Universal | Hannah, Fly, Ganges, Experiment, Syren, Rattlesnake, Frolic, Caledonia, Vandalia, Levant, Water Witch |

The first six are vanilla's pools: States and Cities unchanged, the other four extended. They keep vanilla's display names, which the game translates into every language. The other seven come from real ship series:
- **Native Nations:** fleet tugs and auxiliary tugs.
- **Rivers:** fleet oilers and gasoline tankers.
- **Peaks, Parks & Regions:** ammunition ships (volcanoes), amphibious command ships (mountains and ranges) and destroyer tenders (regions and parks).
- **Celestial Bodies:** cargo ships, attack cargo ships and stores ships, named for stars, constellations, planets and moons.
- **Mythology:** repair ships and PT-boat tenders.
- **Virtues:** coastal minesweepers, coastal patrol yachts and hospital ships.
- **Age of Sail:** vessels of the Continental Navy and the sloops, brigs and schooners of the sailing navy.

---

### Ideology-Gated Pools (Ship Designer)

Each pool is available only while the United States has the matching government (`can_use = { has_government = ... }`); neither is tied to a national focus.

| Group Tag | Topic Name | Ideology | Sample Names |
| :--- | :--- | :--- | :--- |
| `USA_REPUBLICAN_IDEALS` | Liberty & Reform | `democratic` | Liberty, Union, Thomas Paine, Frederick Douglass, Harriet Tubman, Susan B. Anthony, Clara Barton, Horace Mann |
| `USA_SOCIALISM` | Labor & Socialism | `communism` | Eugene V. Debs, Joe Hill, Mother Jones, John Reed, Jack London, John Brown, Haymarket, Pullman Strike, Bread and Roses |

No fascist or non-aligned pool was written: research found too little verifiable material that was neither Confederate nor named for people still living in 1936.

---

### Confederate Lists (vanilla, shared with `CSA`)

Vanilla gives the Confederate States (`CSA`) and a United States that honored the Confederacy a second set of hull lists with the `CSS ` prefix. They are kept as vanilla wrote them, with repairs.

| Group Tag | Type | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `CSA_DD_CONFEDERATE` | Destroyers | `ship_hull_light destroyer` | J.E.B. Stuart, Jubal Early, George Pickett, Patrick Cleburne |
| `CSA_CL_CONFEDERATE` | Light Cruisers | `ship_hull_cruiser light_cruiser` | First Manassas, Fort Sumter, Fredericksburg, Chancellorsville |
| `CSA_CA_CONFEDERATE` | Heavy Cruisers | `ship_hull_cruiser heavy_cruiser` | Birmingham, New Orleans, Richmond |
| `USA_BB_CONFEDERATE` | Battleships | `ship_hull_heavy battleship` | Virginia, Alabama, Texas |
| `USA_BC_CONFEDERATE` | Battlecruisers | `ship_hull_heavy battle_cruiser` | Yellow Jacket, Copperhead |
| `USA_CV_CONFEDERATE` | Aircraft Carriers | `ship_hull_carrier carrier` | Robert E. Lee, Stonewall Jackson |
| `CSA_SS_CONFEDERATE` | Submarines | `ship_hull_submarine submarine` | Mississippi River, Red River |

Repairs:
- **Hull binding:** the light cruiser list was bound to destroyer hulls in vanilla.
- **Display name:** the destroyer list used a display key that vanilla's localisation does not define.
- **Gate:** vanilla opened the lists for the `CSA` tag or after the focus *Honor the Confederacy*. They now open for the `CSA` tag or for a fascist United States (`OR = { tag = CSA has_government = fascism }`), so they no longer depend on a focus ID. A fascist United States sees them without taking the focus; a non-aligned one no longer does.
- **Spelling:** about 35 corrections to generals, battles and rivers (*Lloyd Tilghman*, *Chickamauga*, *Munfordville*, *Ouachita River*).
- **Replaced entries:** *Fort Pillow* and *Poison Spring*, remembered for the killing of surrendered Black Union soldiers, are replaced by the Confederate victories *Sabine Pass* and *Palmito Ranch*. The battle *Richmond* duplicated the city in the heavy cruiser list and is replaced by *Natural Bridge*.

---

## Scope Notes

- **Depth:** vanilla's lists were kept whole even where they exceed the mod's usual targets. Two lists are shorter than in vanilla. The anti-aircraft cruiser pool went from 42 names to 14: the others were a block copied from the light cruiser list, and they now sit in the light cruiser, heavy cruiser, minelayer, battlecruiser and frigate lists. The Confederate destroyer list lost one name that also sat in the Confederate carrier list.
- **`USA_CL_HISTORICAL` and `USA_CA_HISTORICAL`:** a city shared by both lists went to the class of the ship in commission in 1936-45: *Houston*, *Vincennes* and *Astoria* are heavy cruisers, *Helena* and *St. Louis* light cruisers. No unused cruiser name survives from the canceled programs, so both lists are extended with cities that never had a cruiser.
- **`USA_BC_HISTORICAL`:** the *Alaska* class, the *Lexington* class of 1916 (*Constitution*, *Constellation*, *United States*), vanilla's territory names and the historic warships whose names the Navy handed down: the original frigates, the War of 1812 flagships and the steam frigates and ironclads of the Civil War. *Lexington*, *Saratoga* and *Ranger* stay with the carriers that bore the names.
- **`USA_CV_HISTORICAL`:** *Langley* joins as the first carrier and *Crown Point* as the original name of CV-32. The list is extended with battles of the Revolution, the War of 1812, the Mexican War, the Civil War and World War I, following the *Essex*-class convention.
- **Destroyers and destroyer escorts:** a name carried by both stays with the ship that bore it first. *Reuben James* is a destroyer; *Samuel B. Roberts* is a destroyer escort.
- **Spelling:** initials take their periods (*Hilary P. Jones*, *Joseph P. Kennedy Jr.*), as in the Navy's own usage.
- **Fallbacks:** fallback names use the Navy's hull designators (`Destroyer DD-%d`, `Destroyer Escort DE-%d`, `Minesweeper AM-%d`). The battlecruiser fallback uses `CC`, the designation of the *Lexington* class, in place of vanilla's `BC`.
