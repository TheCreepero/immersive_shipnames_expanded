# Denmark (DEN) Ship Namelists

Source file: `common/units/names_ships/DEN_ship_names.txt`

---

## Overview

The Royal Danish Navy (*Kongelige Danske Marine*) possesses one of Europe's oldest continuous naval traditions, officially founded in 1510 under King Hans. Guarding the crucial Danish straits (*Øresund*, *Storebælt*, and *Lillebælt*) controlling access to the Baltic Sea, Danish naval strategy centered historically on coastal defense, minelaying, and archipelagic littoral warfare. Entering World War II, Denmark's naval combat force was anchored by coastal defense artillery ships (*artilleriskibe* such as *Niels Juel* and *Peder Skram*), coastal torpedo boats, and submarines.

In vanilla Hearts of Iron IV, Danish namelists suffered from severe non-ASCII encoding corruption (`Sridderen`, `Svrdfisken`, `Stren`, `Slven`, `rnen`, `gir`), absurd pseudo-English fallback translations (`"Lys Cruiseren"`—literally translating "light" as illumination/sunlight—and `"Tung Cruiseren"`), patrol boats and fish assigned to cruisers (*Flynderen* [Flounder], *Ulken* [Sculpin], *Mågen* [Seagull]), identical 5-ship lists mirrored across Battleships and Battlecruisers, and intra-list duplicates in submarines.

*Immersive Ship Names Expanded* provides a comprehensive overhaul for Denmark, fixing all encoding corruption and translation errors, establishing proper class lineages for all standard hulls, and providing 8 universal thematic pools for the Ship Designer. All Danish ships bear the historical prefix `HDMS ` (*Hans/Hendes Danske Majestæts Skib*).

---

## Namelist Groups

### Ship-Type Specific Category

| Group Tag | Type | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `DEN_DD_HISTORICAL` | Destroyers & Escorts | `ship_hull_light destroyer` | Huitfeldt, Willemoes, Bille, Bredal, Hammer, Krieger, Norby, Rodsteen, Sehested, Suenson, Schiønning, Dahlerup, Jens Munk, Ove Gjedde, Just Juel, Nymfen, Najaden, Daphne, Dryaden, Flora, Bellona, Glenten, Høgen, Ørnen, Falken, Kometen, Nordstjernen, Flyvefisken, Søridderen, Søulven, Søløven, Søhunden, Buhl, Marstrand, Krag |
| `DEN_SS_HISTORICAL` | Submarines | `ship_hull_submarine submarine ship_hull_midget_submarine` | Rota, Bellona, Flora, Daphne, Dryaden, Havmanden, Havfruen, Havkalen, Havhesten, Dykkeren, Thetis, 2. April, Ægir, Ran, Triton, Neptun, Nereus, Proteus, Poseidon, Oceanus, Galathea, Delfinen, Spækhuggeren, Tumleren, Springeren, Nordkaperen, Narhvalen, Hvalen, Hvalrossen, Sælen, Kaskelotten, Marsvinet, Sværdfisken |
| `DEN_CL_HISTORICAL` | Light Cruisers | `ship_hull_cruiser light_cruiser` | Fyen, Sjælland, Jylland, Bornholm, Lolland, Falster, Møn, Langeland, Als, Amager, Samsø, Mors, Læsø, Anholt, Fanø, Rømø, Grønland, Færøerne, Disko, Godthaab, Thule, Julianehåb, St. Thomas, St. Jan, St. Croix, Tranquebar, Hekla, Gejser, Valkyrien, Fylla, Ingolf, Dagmar, Ærø, Islands Falk, Danmarkshavn |
| `DEN_CA_HISTORICAL` | Heavy Cruisers & Coastal Defense | `ship_hull_cruiser heavy_cruiser` | Niels Juel, Peder Skram, Herluf Trolle, Olfert Fischer, Iver Hvitfeldt, Absalon, Esbern Snare, Vitus Bering, Peter Willemoes, Steen Bille, Edouard Suenson, Hans Birch Dahlerup, Jens Munk, Ove Gjedde, Markor Rodsteen, Just Juel, Cort Adeler, Rolf Krake, Skjold, Dan, Tordenskjold, Gorm, Lindormen, Helgoland |
| `DEN_BB_HISTORICAL` | Battleships & Capital Ships | `ship_hull_heavy battleship` | Valdemar Sejr, Valdemar den Store, Christian IV, Frederik IV, Christian V, Harald Blåtand, Svend Tveskæg, Knud den Store, Margrete I, Dannebroge, Norske Løve, Tre Kroner, Elephanten, Erik Klipping, Christian IX, Frederik VIII, Christian X, Valdemar Atterdag, Frederik II, Christian III, Frederik I, Frederik III, Christian VI |
| `DEN_BC_HISTORICAL` | Battlecruisers | `ship_hull_heavy battle_cruiser` | Holger Danske, Starkad, Svend Estridsen, Knud Lavard, Palnatoke, Roar, Helge, Amled, Bødvar Bjarke, Hjalte, Hagbard, Signe, Fenris, Midgårdsormen, Sleipner, Dragen, Ormen, Jætten, Fafner, Nidhug, Sigurd Fafnersbane, Regnar Lodbrog, Angantyr, Hervør, Harald Hildetand, Sigurd Ring, Lagertha |
| `DEN_CV_HISTORICAL` | Aircraft Carriers | `ship_hull_carrier carrier` | Thor, Balder, Frej, Tyr, Ull, Brage, Forsete, Vidar, Vale, Njord, Brynhild, Skidbladner, Sol, Mani, Hugin, Munin, Nordlyset, Morgenstjernen, Aftenstjernen, Gøndul, Skøgul, Geirskøgul, Sigrun, Skinfaxe, Rimfaxe, Breidablik, Gladsheim, Folkvang, Trudvang, Bilskirner, Lidskjalv, Karlsvognen |

---

### Universal Thematic Topic Category (Ship Designer)

Universal selection pools available for any ship hull or squadron:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `DEN_CITIES` | Cities | Universal | København, Aarhus, Odense, Aalborg, Esbjerg, Randers, Kolding, Horsens, Vejle, Roskilde, Helsingør, Silkeborg, Næstved, Fredericia, Viborg, Køge, Holstebro, Slagelse, Hillerød, Sønderborg, Svendborg, Frederikshavn, Rønne, Middelfart, Nyborg, Korsør, Nakskov, Grenaa, Skagen, Ribe |
| `DEN_PROVINCES` | Regions & Islands | Universal | Jylland, Sjælland, Fyn, Bornholm, Lolland, Falster, Møn, Langeland, Als, Amager, Samsø, Mors, Læsø, Anholt, Fanø, Rømø, Ærø, Vendsyssel, Himmerland, Thy, Nordslesvig, Grønland, Færøerne, Odsherred, Djursland, Salling, Christiansø |
| `DEN_RULERS` | Monarchs | Universal | Gorm den Gamle, Harald Blåtand, Svend Tveskæg, Harald II, Knud den Store, Knud den Hellige, Valdemar den Store, Knud VI, Valdemar Sejr, Erik Menved, Valdemar Atterdag, Margrete I, Erik af Pommern, Christoffer af Bayern, Christian I, Kong Hans, Christian II, Frederik I, Christian III, Frederik II, Christian IV, Frederik III, Christian V, Frederik IV, Christian VI, Frederik V, Christian VII, Frederik VI, Christian VIII, Frederik VII, Christian IX, Frederik VIII, Christian X |
| `DEN_HEROES` | Heroes & Luminaries | Universal | Niels Juel, Cort Adeler, Herluf Trolle, Peder Skram, Olfert Fischer, Peter Willemoes, Steen Bille, Vitus Bering, Absalon, Esbern Snare, Jens Munk, Ove Gjedde, Edouard Suenson, Hans Egede, Tycho Brahe, Ole Rømer, Holger Danske, Bertel Thorvaldsen, H.C. Andersen, Niels Bohr, Hans Christian Ørsted, Peter Tordenskiold, Ivar Huitfeldt |
| `DEN_MYTHOLOGY` | Norse Mythology | Universal | Odin, Thor, Freja, Balder, Heimdal, Tyr, Frigg, Loke, Idun, Brage, Njord, Skade, Ull, Vidar, Vale, Forsete, Sif, Ægir, Ran, Yggdrasil, Asgård, Midgård, Valhal, Gimle, Bifrost, Mjølner, Gungner |
| `DEN_BIRDS` | Birds | Universal | Havørnen, Kongeørnen, Fiskeørnen, Vandrefalken, Jagtfalken, Lærkefalken, Tårnfalken, Musvågen, Hvepsevågen, Duehøgen, Spurvehøgen, Havmågen, Stormmågen, Sølvmågen, Tejsten, Lunden, Lomvien, Alken, Skarven, Havternen, Knopsvanen, Fiskehejren, Tranen, Edderfuglen, Glenten |
| `DEN_FISH` | Aquatic Life | Universal | Delfinen, Spækhuggeren, Tumleren, Springeren, Nordkaperen, Narhvalen, Kaskelotten, Sælen, Hvalrossen, Marsvinet, Havkalen, Sværdfisken, Flyvefisken, Makrelen, Støren, Torsken, Laksen, Havørreden, Rødspætten, Pighajen, Brugden, Havkatten, Havtasken, Hornfisken, Ålen, Silden |
| `DEN_STRAITS` | Sounds & Waters | Universal | Øresund, Storebælt, Lillebælt, Kattegat, Skagerrak, Limfjorden, Isefjorden, Roskilde Fjord, Flensborg Fjord, Mariager Fjord, Vejle Fjord, Ringkøbing Fjord, Jammerbugt, Vadehavet, Køge Bugt, Fakse Bugt, Langelandsbælt, Alssund, Aarhus Bugt, Femern Bælt |

---

## Scope Notes

- Capital-ship rosters share no names. `DEN_CA_HISTORICAL` carries the admirals and naval heroes of the historical coastal-defence ships (*Niels Juel*, *Peder Skram*, *Herluf Trolle*, *Olfert Fischer*, *Iver Hvitfeldt*, *Tordenskjold*) together with the armoured ships *Rolf Krake*, *Lindormen*, *Gorm*, *Odin*, *Skjold*, *Helgoland* and *Danmark*. `DEN_BB_HISTORICAL` holds monarchs and ships of the line, `DEN_BC_HISTORICAL` the saga heroes, legendary kings and mythical beasts.
- `DEN_CV_HISTORICAL` is an alternate-history extrapolation (Denmark never built a carrier): gods, valkyries, the horses of day and night, dwellings and seats of the gods, and sky names. Valkyries appear only in forms attested in Danish (*Brynhild*, *Sigrun*, *Gøndul*, *Skøgul*, *Geirskøgul*).
- `DEN_CL_HISTORICAL` uses the navy's own spelling for the 1894 cruiser *Hejmdal*; the god keeps the form *Heimdal* in `DEN_MYTHOLOGY`.
- Every named person is individually documented. Six legacy entries that could not be traced to a naval career were removed from the destroyer and heavy-cruiser rosters. *Buhl* and *Marstrand* in `DEN_DD_HISTORICAL` are the names of gunboats of the 1864 squadron, kept as historic ship names.
- Legendary figures use their Danish forms (*Regnar Lodbrog*, *Sigurd Fafnersbane*, *Frode Fredegod*, *Uffe hin Spage*), and the Norwegian king Harald Hårderåde was removed from the battlecruisers.
