# Sweden (SWE) Ship Namelists

Source file: `common/units/names_ships/SWE_ship_names.txt`

---

## Overview

Sweden maintained the most powerful indigenous naval force in the Baltic Sea throughout the interwar era and World War II, spearheaded by coastal defence ships (*pansarskepp* such as the *Sverige* class), modern destroyers (*Stadsjagare* and *Landskapsjagare*), fleet submarines, and specialized cruisers such as the seaplane cruiser *HMS Gotland* and later the *Tre Kronor* class. In vanilla Hearts of Iron IV, Swedish namelists suffered from critical typographical errors (such as *"Plisander"* and *"Aborren"*), heavy cross-category duplication between destroyers and light cruisers, mirrored 5-ship capital lists, and very shallow carrier rosters.

*Immersive Ship Names Expanded* provides complete, historically grounded namelists for Sweden, restoring authentic naval naming conventions, correcting vanilla typos, and introducing 10 universal thematic pools and a minesweeper role pool for the Ship Designer. All Swedish ships carry the historical prefix `HMS ` (*Hans/Hennes Majestäts Skepp*).

---

## Namelist Groups

### Ship-Type Specific Category

| Group Tag | Type | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `SWE_DD_HISTORICAL` | Destroyers & Escorts | `ship_hull_light destroyer` | Göteborg, Stockholm, Malmö, Karlskrona, Gävle, Norrköping, Visby, Sundsvall, Öland, Uppland, Halland, Småland, Mode, Magne, Mjölner, Munin, Ehrensköld, Nordenskjöld, Klas Horn, Psilander, Wrangel, Romulus, Spica, Castor |
| `SWE_SS_HISTORICAL` | Submarines | `ship_hull_submarine submarine ship_hull_midget_submarine` | Hajen, Sälen, Valrossen, Bävern, Illern, Uttern, Valen, Draken, Gripen, Ulven, Delfinen, Nordkaparen, Sjölejonet, Sjöhunden, Forellen, Abborren, Siken, Gäddan, Laxen, Makrillen, Neptun, Najad, Näcken, Ran, Ägir |
| `SWE_CL_HISTORICAL` | Light Cruisers | `ship_hull_cruiser light_cruiser` | Gotland, Fylgia, Tre Kronor, Göta Lejon, Clas Fleming, Älvsnabben, Örnen, Falken, Västervik, Halmstad, Luleå, Umeå, Härnösand, Hudiksvall, Uddevalla, Varberg, Landskrona, Nyköping, Piteå, Karlshamn, Ystad, Strömstad |
| `SWE_CA_HISTORICAL` | Heavy Cruisers & Coastal Defence | `ship_hull_cruiser heavy_cruiser` | Sverige, Drottning Victoria, Gustaf V, Dristigheten, Äran, Tapperheten, Wasa, Manligheten, Oscar II, Oden, Thor, Niord, Svea, Göta, Thule, John Ericsson, Tordön, Garmer, Sköld, Orvar Odd, Ragnar Lodbrok, Engelbrekt, Valdemar Birgersson |
| `SWE_BB_HISTORICAL` | Battleships & Capital Ships | `ship_hull_heavy battleship` | Gustav Vasa, Erik XIV, Johan III, Sigismund, Karl IX, Gustav II Adolf, Drottning Kristina, Karl X Gustav, Karl XI, Karl XII, Karl XIV Johan, Oscar I, Birger Jarl, Magnus Ladulås, Kronan, Stora Kronan, Svärdet, Riksäpplet, Riksnyckeln, Spiran, Svealand, Götaland |
| `SWE_BC_HISTORICAL` | Battlecruisers | `ship_hull_heavy battle_cruiser` | Mars, Draken, Smålands Lejon, Svenska Lejonet, Prins Gustaf, Sophia Magdalena, Lennart Torstensson, Johan Banér, Gustaf Horn, Carl Gustaf Wrangel, Arvid Horn, Magnus Stenbock, Drottning Lovisa Ulrika, Kronprins Gustaf Adolf, Carlsten, Kungsholm, Sveaborg, Svensksund |
| `SWE_CV_HISTORICAL` | Aircraft Carriers | `ship_hull_carrier carrier` | Sveriges Vapen, Valkyrian, Brynhild, Göndul, Hildur, Skuld, Sigrdriva, Gefjon, Skögul, Frigg, Havsörn, Kungsörn, Fiskgjuse, Pilgrimsfalk, Nordstjärnan, Polstjärnan, Norrsken, Morgonstjärnan |

---

### Universal Thematic Topic Category (Ship Designer)

Universal selection pools available for any ship hull or squadron:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `SWE_RULERS` | Monarchs & Regents | Universal | Erik Segersäll, Karl Knutsson Bonde, Gustav Vasa, Gustav II Adolf, Karl XII, Drottning Kristina, Karl XIV Johan, Gustaf V, Birger Jarl, Magnus Ladulås, Engelbrekt Engelbrektsson, Sten Sture den äldre |
| `SWE_PROVINCES` | Provinces & Regions | Universal | Svealand, Götaland, Norrland, Uppland, Södermanland, Östergötland, Västergötland, Småland, Skåne, Halland, Blekinge, Bohuslän, Dalarna, Gotland, Öland, Lappland |
| `SWE_CITIES` | Cities & Ports | Universal | Stockholm, Göteborg, Malmö, Uppsala, Karlskrona, Gävle, Norrköping, Helsingborg, Lund, Halmstad, Sundsvall, Umeå, Luleå, Kalmar, Visby, Karlshamn, Strömstad |
| `SWE_MYTHOLOGY` | Norse Mythology | Universal | Oden, Thor, Frej, Freja, Balder, Tyr, Heimdall, Njord, Idun, Skade, Ägir, Ran, Fenris, Midgårdsormen, Sleipner, Valkyrian, Yggdrasil, Valhall, Mjölner, Gungnir |
| `SWE_BIRDS` | Birds | Universal | Havsörn, Kungsörn, Fiskgjuse, Pilgrimsfalk, Jaktfalk, Duvhök, Sparvhök, Ormvråk, Fjällvråk, Berguv, Fjälluggla, Korpen, Lom, Havstrut, Grissla, Tordmule |
| `SWE_BEASTS` | Fauna & Predators | Universal | Vargen, Björnen, Loen, Järven, Älgen, Kronhjorten, Renen, Fjällräven, Rödräven, Vildsvinet, Bävern, Uttern, Gråsälen, Valrossen, Tumlaren, Späckhuggaren |
| `SWE_FISH` | Aquatic Life & Fish | Universal | Hajen, Delfinen, Svärdfisken, Valen, Laxen, Havsöringen, Gäddan, Abborren, Gösen, Makrillen, Sillen, Strömmingen, Torsken, Flundran, Rödspättan, Stören |
| `SWE_HEROES` | Heroes & Commanders | Universal | Klas Horn, Hans Wachtmeister, Gustaf von Psilander, Claes Uggla, Jacob Bagge, Clas Fleming, Carl Olof Cronstedt, Fredrik Henrik af Chapman, Johan af Puke, Lennart Torstensson, Johan Banér |
| `SWE_VIRTUES` | Martial Virtues | Universal | Dristigheten, Tapperheten, Manligheten, Äran, Försiktigheten, Rättvisan, Troheten, Enigheten, Vaksamheten, Frimodigheten, Ståndaktigheten, Vaksam, Segerrik |
| `SWE_BATTLES` | Battles & Victories | Universal | Svensksund, Hogland, Öland, Femern, Bornholm, Stångebro, Brunkeberg, Narva, Breitenfeld, Lützen, Jankov, Wittstock, Lund, Landskrona, Helsingborg, Gadebusch |

---

### Role-Specific Pools (Ship Designer)

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `SWE_MINESWEEPERS` | Minesweepers | Universal | Sökaren, Sveparen, Arholma, Landsort, Bremön, Holmön, Ulvön, Koster, Kullen, Vinga, Hanö, Tärnö, Utö, Arkö, Styrsö, Blidö |

Follows the Royal Swedish Navy's island-and-skerry convention for minesweepers (Arholma, Landsort, Hanö and Arkö classes). Other roles were considered and skipped: torpedo boats (their star and weather names already fill `SWE_DD_HISTORICAL`), minelayers (only five verifiable names), and seaplane tenders, training ships, icebreakers, patrol boats, gunboats and corvettes (too few distinct names, or names that duplicate hull groups).

---

## Scope Notes

- `SWE_HEROES` holds only documented Swedish admirals, generals and statesmen. Two unverifiable legacy entries were removed, and three names were corrected to their attested forms (Johan Christopher Toll, Erik Carlsson Sjöblad, Fredrik Henrik af Chapman).
- `SWE_BC_HISTORICAL` pairs the great field marshals with attested ships of the line (Mars, Smålands Lejon, Sophia Magdalena), fortresses and citadels (Carlsten, Kungsholm, Karlsborg, Bohus, Sveaborg) and the 1790 victory at Svensksund. Kings stay in `SWE_BB_HISTORICAL`.
- `SWE_CV_HISTORICAL` is an alternate-history extrapolation (Sweden never built a carrier). The historic aviation ships *Gotland* and *Dristigheten* remain in the cruiser and coastal-defence rosters.
