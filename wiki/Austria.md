# Austria (AUS) Ship Namelists

Source file: `common/units/names_ships/AUS_ship_names.txt`

---

## Overview

Austria's naval tradition is deeply anchored in the Austro-Hungarian Navy (*K.u.K. Kriegsmarine*) and interwar Danube patrol forces. In vanilla Hearts of Iron IV, Austrian ship namelists are sparse and disjointed. ISNE provides comprehensive coverage across both dedicated ship-type categories (destroyers, submarines, cruisers, battleships, battlecruisers, carriers) and universal thematic topic pools (monarchs, cities, crown lands, alpine peaks, folklore, and martial mottos) to support Austrian and Austro-Hungarian naval expansion campaigns.

---

## Namelist Groups

### Ship-Type Specific Category

| Group Tag | Type | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `AUS_DD_HISTORICAL` | Destroyers & Escorts | `ship_hull_light destroyer` | Huszár, Ulan, Streiter, Wildfang, Scharfschütze, Tátra, Balaton, Kaiman, Blitz, Komet, Meteor, Donner, Sturm |
| `AUS_SS_HISTORICAL` | Submarines | `ship_hull_submarine submarine` | Curie, Forelle, Hecht, Karpfen, Stör, Wels, Muräne, Seeteufel, Nautilus, Huchen, Otter, Biber, Salamander, Seehund |
| `AUS_CL_HISTORICAL` | Light Cruisers | `ship_hull_cruiser light_cruiser` | Novara, Saida, Helgoland, Zenta, Aspern, Admiral Spaun, Panther, Leopard, Tiger, Pola, Triest, Fiume, Linz, Graz |
| `AUS_CA_HISTORICAL` | Heavy Cruisers & Armored Cruisers | `ship_hull_cruiser heavy_cruiser` | Kaiserin und Königin Maria Theresia, Kaiser Karl VI, Sankt Georg, Kaiser Franz Joseph I, Gideon von Laudon, Admiral Dahlerup, Admiral von Sterneck, Großadmiral Haus |
| `AUS_BB_HISTORICAL` | Battleships | `ship_hull_heavy battleship` | Viribus Unitis, Tegetthoff, Prinz Eugen, Szent István, Monarch, Wien, Budapest, Habsburg, Erzherzog Karl, Kaiser Karl I, Österreich |
| `AUS_BC_HISTORICAL` | Battlecruisers | `ship_hull_heavy battle_cruiser` | Erzherzog Ferdinand Max, Kaiser, Don Juan d'Austria, Drache, Custozza, Lissa, Leitha, Otranto, Quarnero, Hohensalzburg, Komorn |
| `AUS_CV_HISTORICAL` | Aircraft Carriers | `ship_hull_carrier carrier` | Igo Etrich, Wilhelm Kress, Gottfried von Banfield, Godwin Brumowski, Doppeladler, Kaiseradler, Steinadler, Seeadler, Falke, Phönix, Pegasus |

**Battleship / Battlecruiser doctrine:** Battleships carry the k.u.k. dreadnought and pre-dreadnought names, the emperors, and the imperial crown lands. Battlecruisers carry the Lissa-era ironclads and frigates, the Danube Flotilla monitors, Adriatic naval encounters and waters, and fortresses such as Hohensalzburg, Komorn and Franzensfeste.

---

### Universal Thematic Topic Category (Ship Designer)

Universal selection pools available for any ship hull or squadron:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `AUS_RULERS` | Monarchs | Universal | Rudolf I von Habsburg, Maximilian I, Karl V, Maria Theresia, Joseph II, Franz Joseph I, Leopold VI, Friedrich III |
| `AUS_CITIES` | Cities | Universal | Wien, Graz, Linz, Salzburg, Innsbruck, Klagenfurt, Villach, Wels, Sankt Pölten, Bregenz, Steyr, Eisenstadt, Hallstatt |
| `AUS_PROVINCES` | Provinces & Crown Lands | Universal | Niederösterreich, Oberösterreich, Steiermark, Tirol, Kärnten, Salzburg, Burgenland, Vorarlberg, Küstenland, Istrien, Dalmatien |
| `AUS_RIVERS` | Rivers & Lakes | Universal | Donau, Inn, Enns, Drau, Mur, Salzach, Traun, Bodensee, Neusiedler See, Wörthersee, Attersee, Traunsee, Wolfgangsee |
| `AUS_GEOGRAPHY` | Mountains | Universal | Großglockner, Wildspitze, Dachstein, Großvenediger, Schneeberg, Rax, Hochkönig, Hoher Sonnblick, Ortler, Zugspitze, Tauern |
| `AUS_BATTLES` | Historic Battles | Universal | Lissa, Helgoland, Novara, Otranto, Kahlenberg, Zenta, Belgrad, Höchstädt, Kolin, Aspern, Wagram, Custozza, Karfreit |
| `AUS_HEROES` | Heroes & Cultural Icons | Universal | Wilhelm von Tegetthoff, Prinz Eugen, Andreas Hofer, Josef Ressel, Karl Weyprecht, Gregor Mendel, Wolfgang Amadeus Mozart, Franz Schubert |
| `AUS_MYTHOLOGY` | Folklore & Legends | Universal | Basilisk, Lindwurm, Tatzelwurm, Krampus, Perchta, Dietrich von Bern, Siegfried, Lieber Augustin, Frau Hitt, König Laurin |
| `AUS_BIRDS` | Birds | Universal | Kaiseradler, Steinadler, Seeadler, Falke, Habicht, Sperber, Kondor, Geier, Albatros, Rotmilan, Bussard, Turmfalke, Wanderfalke |
| `AUS_BEASTS` | Wildlife | Universal | Panther, Tiger, Leopard, Löwe, Luchs, Wolf, Braunbär, Steinbock, Gams, Hirsch, Murmeltier, Wildkatze, Wisent, Mufflon |
| `AUS_VIRTUES` | Virtues & Mottos | Universal | Viribus Unitis, AEIOU, Tu Felix Austria, Constantia et Fortitudine, Justitia et Clementia, Fortitudini, Tapferkeit, Treue |

---

## Prefix

Every group, hull-specific and thematic, uses the vanilla `SMS ` prefix (*Seiner Majestät Schiff*), the ship prefix of the k.u.k. Kriegsmarine.

## Historical Scope Notes

- **Heavy cruisers** combine the k.u.k. armored and protected cruiser names with individually verified Habsburg field marshals and k.u.k. admirals. Unsourced admirals were dropped rather than replaced with invented names.
- **Heavy cruisers** leave out persons already honoured by a battleship or battlecruiser name, such as Radetzky and Schwarzenberg.
- **Monarchs** covers the Babenberg and Habsburg rulers only. It ends with Karl I, so pretenders are not included.
- **Rivers & Lakes** excludes river names that read as common English words (March, Ill). Inn and Lech stay because they are major Alpine rivers, and SMS Inn was also a k.u.k. Danube monitor.
- The Provinces, Birds, Mountains, Rivers, Battles and Monarchs pools stay slightly under the 35-name thematic target by design.
