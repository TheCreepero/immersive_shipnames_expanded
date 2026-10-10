# Norway (NOR) Ship Namelists

Source file: `common/units/names_ships/NOR_ship_names.txt`

---

## Overview

Norway possesses an extensive maritime heritage dating from the medieval *Leidang* naval defense fleet and Norse longships to the modern Royal Norwegian Navy (*Sjøforsvaret* / *Den Kongelige Norske Marine*). Entering World War II, Norway's naval defense centered on *panserskip* coastal defence battleships (*Norge*, *Eidsvold*), sleek *Sleipner*-class and *Draug*-class destroyers, coastal submarines, and torpedo boats. In exile, the Free Norwegian Navy operated Allied destroyers, corvettes, and submarines with distinction in the Battle of the Atlantic, the English Channel, and the Normandy landings.

In vanilla Hearts of Iron IV, Norwegian namelists were plagued by severe translation errors (such as `"Lys Krysseren"`—literally translating "light" as luminosity—and `"deleggeren"`), duplicate entries, submarines mistakenly listed under aircraft carriers, and extremely shallow pools.

*Immersive Ship Names Expanded* provides complete, historically grounded namelists for Norway, correcting vanilla translation and encoding bugs, purging role mismatches, and providing 11 universal thematic pools and a minesweeper role pool for the Ship Designer. All Norwegian ships bear the historical prefix `HNoMS ` (*His Norwegian Majesty's Ship*).

---

## Namelist Groups

### Ship-Type Specific Category

| Group Tag | Type | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `NOR_DD_HISTORICAL` | Destroyers & Escorts | `ship_hull_light destroyer` | Sleipner, Gyller, Æger, Odin, Balder, Tor, Draug, Troll, Garm, Kristiansund, Oslo, Bergen, Trondheim, Stavanger, Narvik, Stord, Svenner, Arendal, Haugesund, Tromsø, Hval, Storm, Gnist, Snar, Ålesund |
| `NOR_SS_HISTORICAL` | Submarines | `ship_hull_submarine submarine ship_hull_midget_submarine` | Kobben, A-1, B-1, Uredd, Ula, Utstein, Uthaug, Utvær, Utsira, Viking, Kya, Kaura, Kinn, Kunna, Sklinna, Skolpen, Stadt, Håbrann, Pigghå, Brugde, Havmus, Kveite, Torsk, Breiflabb, A-2, A-3 |
| `NOR_CL_HISTORICAL` | Light Cruisers | `ship_hull_cruiser light_cruiser` | Kristiansand, Drammen, Ålesund, Bodø, Molde, Larvik, Sandefjord, Arendal, Hamar, Kongsberg, Halden, Porsgrunn, Moss, Horten, Fredrikstad, Tønsberg, Harstad, Hammerfest, Vardø, Freia, Desideria, Ellida |
| `NOR_CA_HISTORICAL` | Heavy Cruisers & Coastal Defence | `ship_hull_cruiser heavy_cruiser` | Norge, Eidsvold, Tordenskjold, Harald Haarfagre, Nidaros, Bjørgvin, Skorpionen, Mjølner, Thrudvang, Thor, Brage, Frithjof, Cort Adeler, Ivar Huitfeldt, Roald Amundsen, Fridtjof Nansen, Vidar, Heimdal |
| `NOR_BB_HISTORICAL` | Battleships & Capital Ships | `ship_hull_heavy battleship` | Nord-Norge, Haakon VII, Dronning Maud, Kronprins Olav, Olav Tryggvason, Magnus Lagabøte, Vestlandet, Østlandet, Trøndelag, Telemark, Kronprinsesse Märtha, St. Olaf, Kong Sverre, Håkon Håkonsson, Eirik Blodøks |
| `NOR_BC_HISTORICAL` | Battlecruisers | `ship_hull_heavy battle_cruiser` | Ormen Lange, Trana, Ormen Skamme, Visund, Bøkesuden, Eirik Raude, Erling Skjalgsson, Einar Tambarskjelve, Mariasuden, Kristsuden, Olavssuden, Erkesuden, Gungne, Gorsuden, Raudsuden, Tyrfing |
| `NOR_CV_HISTORICAL` | Aircraft Carriers | `ship_hull_carrier carrier` | Asgard, Valhall, Midgard, Utgard, Gimle, Bifrost, Yggdrasil, Valkyrien, Brynhild, Skuld, Nordlys, Midnattssol, Morgonstjerna, Polstjerna, Hugin, Munin, Havørn, Kongeørn, Gøndul, Hild, Gunn |

---

### Universal Thematic Topic Category (Ship Designer)

Universal selection pools available for any ship hull or squadron:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `NOR_CITIES` | Cities | Universal | Oslo, Bergen, Trondheim, Stavanger, Kristiansand, Drammen, Tromsø, Ålesund, Haugesund, Bodø, Arendal, Molde, Larvik, Sandefjord, Hamar, Kongsberg, Halden, Porsgrunn, Moss, Horten, Fredrikstad |
| `NOR_PROVINCES` | Provinces & Regions | Universal | Vestlandet, Østlandet, Nord-Norge, Sørlandet, Trøndelag, Finnmark, Troms, Nordland, Møre og Romsdal, Sogn og Fjordane, Hordaland, Rogaland, Telemark, Vestfold, Buskerud, Akershus, Svalbard |
| `NOR_FJORDS` | Fjords & Waterways | Universal | Hardangerfjord, Geirangerfjord, Sognefjord, Nærøyfjord, Oslofjord, Boknafjord, Lysefjord, Trondheimsfjord, Varangerfjord, Saltstraumen, Romsdalsfjord, Nordfjord, Vestfjord, Porsangerfjord |
| `NOR_RULERS` | Monarchs & Rulers | Universal | Haakon VII, Dronning Maud, Kronprins Olav, Harald Hårfagre, Eirik Blodøks, Olav Tryggvason, Olav den Hellige, Harald Hardråde, Sverre Sigurdsson, Magnus Lagabøte, Håkon den Gode, Harald Gråfell |
| `NOR_HEROES` | Heroes & Explorers | Universal | Peter Wessel Tordenskiold, Ivar Huitfeldt, Cort Adeler, Roald Amundsen, Fridtjof Nansen, Otto Sverdrup, Carsten Borchgrevink, Eirik Raude, Einar Tambarskjelve, Henrik Bjelke, Kristoffer Trondsson Rustung |
| `NOR_MYTHOLOGY` | Norse Mythology | Universal | Odin, Balder, Tyr, Heimdall, Njord, Idun, Skadi, Brage, Ægir, Fenris, Midgårdsormen, Sleipner, Yggdrasil, Valhall, Bifrost, Mjølner, Valkyrien, Brynhild, Tor, Frøy, Frøya, Forsete, Uller |
| `NOR_BIRDS` | Birds | Universal | Havørn, Kongeørn, Fiskeørn, Jaktfalk, Vandrefalk, Hønsehauk, Spurvehauk, Fjellvåk, Musvåk, Hubro, Snøugle, Ravn, Teist, Lunde, Havsvale, Lom, Alke, Haukugle, Havhest |
| `NOR_FAUNA` | Wildlife | Universal | Ulven, Bjørnen, Gaupen, Jerven, Fjellreven, Rødreven, Elgen, Hjorten, Rådyret, Reinen, Moskusen, Oteren, Beveren, Grønlandsselen, Steinkobben, Nisen, Spekkhoggeren, Villsvinet |
| `NOR_FISH` | Fish | Universal | Håbrann, Pigghå, Brugde, Sverdfisk, Kveite, Torsk, Laks, Sjøørret, Makrell, Sild, Sei, Hyse, Brosme, Lange, Steinbit, Havmus, Breiflabb, Uer, Rødspette, Skrei, Lodde |
| `NOR_NATURE` | Natural Phenomena | Universal | Nordlys, Midnattssol, Polstjernen, Storm, Kuling, Orkan, Virvelvind, Havbåre, Bølge, Torden, Lynild, Frost, Isbre, Snøstorm, Vinter, Nordavind, Polarnatt, Brenning |
| `NOR_VIRTUES` | Martial Virtues | Universal | Dristig, Tapper, Modig, Snar, Rask, Djerv, Hvass, Kvikk, Trofast, Vaktsom, Uredd, Seirende, Uforferdet, Hardfør, Frihet, Enighet, Rettferd, Vakt, Skjold, Vern, Heder, Ære |

---

### Role-Specific Pools (Ship Designer)

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `NOR_MINESWEEPERS` | Minesweepers | Universal | Otra, Rauma, Vinstra, Gaula, Driva, Vorma, Begna, Rana, Sauda, Sira, Tana, Ogna, Vosso, Glomma, Tista, Kvina, Utla, Orkla |

Follows the Royal Norwegian Navy's river names for minesweepers (*Otra* and *Rauma* of 1939, the NYMS type, the Sauda class, and *Orkla* of the Alta class). The pool holds 18 verified names and is not padded; *Alta* itself is left out because `NOR_CL_HISTORICAL` holds the town. Other roles were considered and skipped: minelayers (no naming convention of their own, and every name already sits in a hull group), torpedo boats, corvettes, escort destroyers and patrol vessels (their names already fill `NOR_DD_HISTORICAL`), coastal defence ships, monitors and gunboats (in `NOR_CA_HISTORICAL`), and training ships, tenders and state yachts (too few distinct names).

---

## Scope Notes

- **Orthography**: a name a Royal Norwegian Navy ship actually bore keeps that ship's spelling (*Harald Haarfagre*, *Tordenskjold*, *Eidsvold*, *Thor*, *Kong Sverre*, *St. Olaf*). Every other name takes the modern Norwegian form: *Håkon* for medieval kings and jarls, *Sigurd Jorsalfare*, *Leiv Eiriksson*, and Norwegian forms of mythic names (*Frøy*, *Frøya*, *Tor*, *Gungne*, *Skinfakse*). *Haakon VII* keeps the king's own spelling.
- **Persons**: `NOR_RULERS`, `NOR_HEROES` and the hull groups hold only documented figures who ruled Norway, were born there, or belong to Norwegian saga tradition. Legendary Danish and Swedish kings, union-era Danish officers and entries that could not be sourced were removed.
- **Era**: the lists run past 1936. They carry post-war ship classes, the heroes of 1940–45 (naval officers such as *Odd Isaachsen Willoch*, *Per Askim* and *Leif Andreas Larsen*, the commando leader *Martin Linge* and the saboteur *Max Manus*) and the explorers *Helge Ingstad* and *Thor Heyerdahl*, whose names the navy later gave to frigates.
- **Kings and coastal defence ships**: `NOR_CA_HISTORICAL` keeps the real *panserskip* names, so *Norge* and *Harald Haarfagre* appear there and not among the battleships. `NOR_BB_HISTORICAL` holds the other kings, with *Kong Sverre* and *St. Olaf* in the form the navy's steam frigates carried.
- **Battlecruisers**: `NOR_BC_HISTORICAL` pairs saga longships with royal swords, saga sea-heroes and decisive naval battles from Hafrsfjord (872) to Lyngør (1812).
- **Carriers**: `NOR_CV_HISTORICAL` is an alternate-history extrapolation (Norway never built a carrier). Valkyries and sun-horses without a confirmed Norwegian form were removed.
- **Fjords and wildlife**: `NOR_FJORDS` uses the indefinite form Norwegian liners and ferries carry (*Oslofjord*, *Trollfjord*); `NOR_FAUNA` uses the definite form of the old Dano-Norwegian tradition (*Ulven*, *Bjørnen*).
