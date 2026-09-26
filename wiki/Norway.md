# Norway (NOR) Ship Namelists

Source file: `common/units/names_ships/NOR_ship_names.txt`

---

## Overview

Norway possesses an extensive maritime heritage dating from the medieval *Leidang* naval defense fleet and Norse longships to the modern Royal Norwegian Navy (*Sjøforsvaret* / *Den Kongelige Norske Marine*). Entering World War II, Norway's naval defense centered on *panserskip* coastal defence battleships (*Norge*, *Eidsvold*), sleek *Sleipner*-class and *Draug*-class destroyers, coastal submarines, and torpedo boats. In exile, the Free Norwegian Navy operated Allied destroyers, corvettes, and submarines with distinction in the Battle of the Atlantic, the English Channel, and the Normandy landings.

In vanilla Hearts of Iron IV, Norwegian namelists were plagued by severe translation errors (such as `"Lys Krysseren"`—literally translating "light" as luminosity—and `"deleggeren"`), duplicate entries, submarines mistakenly listed under aircraft carriers, and extremely shallow pools.

*Immersive Ship Names Expanded* provides complete, historically grounded namelists for Norway, correcting vanilla translation and encoding bugs, purging role mismatches, and providing 11 universal thematic pools for the Ship Designer. All Norwegian ships bear the historical prefix `HNoMS ` (*His Norwegian Majesty's Ship*).

---

## Namelist Groups

### Ship-Type Specific Category

| Group Tag | Type | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `NOR_DD_HISTORICAL` | Destroyers & Escorts | `ship_hull_light destroyer` | Sleipner, Gyller, Æger, Odin, Balder, Tor, Draug, Troll, Garm, Aalesund, Kristiansund, Oslo, Bergen, Trondheim, Stavanger, Narvik, Stord, Svenner, Arendal, Haugesund, Tromsø, Hval, Storm, Gnist, Snar |
| `NOR_SS_HISTORICAL` | Submarines | `ship_hull_submarine submarine ship_hull_midget_submarine` | Kobben, A-1, B-1, Uredd, Ula, Utstein, Uthaug, Utvær, Utsira, Viking, Varang, Votna, Kya, Kaura, Kinn, Kunna, Sklinna, Skolpen, Stadt, Håbrann, Pigghå, Brugde, Havmus, Kveite, Torsk, Breiflabb |
| `NOR_CL_HISTORICAL` | Light Cruisers | `ship_hull_cruiser light_cruiser` | Kristiansand, Drammen, Ålesund, Bodø, Molde, Larvik, Sandefjord, Arendal, Hamar, Kongsberg, Halden, Porsgrunn, Moss, Horten, Fredrikstad, Tønsberg, Harstad, Hammerfest, Vardø, Freia, Desideria, Ellida |
| `NOR_CA_HISTORICAL` | Heavy Cruisers & Coastal Defence | `ship_hull_cruiser heavy_cruiser` | Norge, Eidsvold, Tordenskjold, Harald Haarfagre, Nidaros, Bjørgvin, Skorpionen, Mjølner, Thrudvang, Thor, Brage, Frithjof, Heimdall, Peter Wessel, Cort Adeler, Ivar Huitfeldt, Roald Amundsen, Fridtjof Nansen |
| `NOR_BB_HISTORICAL` | Battleships & Capital Ships | `ship_hull_heavy battleship` | Norge, Haakon VII, Dronning Maud, Kronprins Olav, Harald Hårfagre, Olav Tryggvason, Olav den Hellige, Sverre Sigurdsson, Haakon Haakonsson, Magnus Lagabøte, Vestlandet, Østlandet, Nord-Norge, Trøndelag, Telemark |
| `NOR_BC_HISTORICAL` | Battlecruisers | `ship_hull_heavy battle_cruiser` | Ormen Lange, Trana, Ormen Skamme, Visund, Bøkesuden, Mariasuda, Gungnir, Mjølner, Gram, Tyrfing, Dauðahøgg, Leif Eiriksson, Eirik Raude, Torstein Knarresmed, Erling Skjalgsson, Einar Tambarskjelve |
| `NOR_CV_HISTORICAL` | Aircraft Carriers | `ship_hull_carrier carrier` | Asgard, Valhall, Midgard, Utgard, Gimle, Bifrost, Yggdrasil, Valkyrien, Brynhild, Gondul, Hildr, Skuld, Sigrdrifa, Nordlys, Midnattssol, Morgonstjerna, Polstjerna, Hugin, Munin, Havørn, Kongeørn |

---

### Universal Thematic Topic Category (Ship Designer)

Universal selection pools available for any ship hull or squadron:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `NOR_CITIES` | Cities | Universal | Oslo, Bergen, Trondheim, Stavanger, Kristiansand, Drammen, Tromsø, Ålesund, Haugesund, Bodø, Arendal, Molde, Larvik, Sandefjord, Hamar, Kongsberg, Halden, Porsgrunn, Moss, Horten, Fredrikstad |
| `NOR_PROVINCES` | Provinces & Regions | Universal | Vestlandet, Østlandet, Nord-Norge, Sørlandet, Trøndelag, Finnmark, Troms, Nordland, Møre og Romsdal, Sogn og Fjordane, Hordaland, Rogaland, Telemark, Vestfold, Buskerud, Akershus, Svalbard |
| `NOR_FJORDS` | Fjords & Waterways | Universal | Hardangerfjord, Geirangerfjord, Sognefjord, Nærøyfjord, Oslofjord, Boknafjord, Lysefjord, Trondheimsfjord, Varangerfjord, Vestfjorden, Saltstraumen, Romsdalsfjord, Porsangerfjorden, Nordfjord |
| `NOR_RULERS` | Monarchs & Rulers | Universal | Haakon VII, Dronning Maud, Kronprins Olav, Harald Hårfagre, Eirik Blodøks, Haakon den Gode, Olav Tryggvason, Olav den Hellige, Harald Hardråde, Sverre Sigurdsson, Haakon Haakonsson, Magnus Lagabøte |
| `NOR_HEROES` | Heroes & Explorers | Universal | Peter Wessel Tordenskiold, Ivar Huitfeldt, Cort Adeler, Roald Amundsen, Fridtjof Nansen, Otto Sverdrup, Carsten Borchgrevink, C.A. Larsen, Leif Eiriksson, Eirik Raude, Einar Tambarskjelve |
| `NOR_MYTHOLOGY` | Norse Mythology | Universal | Odin, Thor, Freyr, Freyja, Balder, Tyr, Heimdall, Njord, Idun, Skadi, Brage, Ægir, Ran, Fenris, Midgårdsormen, Sleipner, Yggdrasil, Valhall, Bifrost, Gungnir, Mjølner, Valkyrien, Brynhild |
| `NOR_BIRDS` | Birds of Prey | Universal | Havørn, Kongeørn, Fiskeørn, Jaktfalk, Vandrefalk, Hønsehauk, Spurvehauk, Fjellvåk, Musvåk, Hubro, Snøugle, Ravn, Korp, Teist, Lunde, Havsvale, Lom, Alke, Sule |
| `NOR_FAUNA` | Fauna & Predators | Universal | Ulven, Bjørnen, Gaupen, Jerven, Fjellreven, Rødreven, Elgen, Hjorten, Rådyret, Reinen, Moskusen, Oteren, Beveren, Grønlandsselen, Steinkobben, Valrossen, Nisen, Spekkhoggeren |
| `NOR_FISH` | Aquatic Life & Fish | Universal | Håbrann, Pigghå, Brugde, Sverdfisk, Kveite, Torsk, Laks, Sjøørret, Makrell, Sild, Sei, Hyse, Brosme, Lange, Steinbit, Havmus, Breiflabb, Uer, Rødspette, Skrei, Lodde |
| `NOR_NATURE` | Nature & Tempests | Universal | Nordlys, Midnattssol, Polstjernen, Storm, Kuling, Orkan, Virvelvind, Havbåre, Bølge, Torden, Lynild, Frost, Isbre, Snøstorm, Vinter, Nordavind, Polarbris, Brim |
| `NOR_VIRTUES` | Martial Virtues | Universal | Dristig, Tapper, Modig, Snar, Rask, Djerv, Hvass, Kvikk, Trofast, Vaktsom, Uredd, Seirende, Uforferdet, Hardfør, Frihet, Enighet, Rettferd, Vakt, Skjold, Vern, Heder, Ære |
