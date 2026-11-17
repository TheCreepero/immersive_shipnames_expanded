# Poland (POL) Ship Namelists

Source file: `common/units/names_ships/POL_ship_names.txt`

---

## Overview

The Polish Navy (*Marynarka Wojenna*) was founded in November 1918. Its first ship, the survey vessel *Pomorzanin*, was bought in 1920, and in 1919–1920 the Pińsk flotilla fought the Bolsheviks on the rivers of Polesie. The interwar navy named its ships by a few clear formulas:
- **Destroyers** after storms and lightning: *Wicher* and *Burza* (French-built, 1930–32), *Grom* and *Błyskawica* (British-built, 1937). *Huragan* and *Orkan* were ordered in 1939.
- **Torpedo boats** after regional peoples: *Kaszub*, *Mazur*, *Podhalanin*. The British Hunt-class escorts of the war carried the same formula (*Krakowiak*, *Kujawiak*, *Ślązak*).
- **Submarines** after predators: *Wilk*, *Ryś*, *Żbik*, *Orzeł*, *Sęp*.
- **Minesweepers** after birds: *Jaskółka*, *Mewa*, *Czajka*.
- **River monitors** after cities, and **river gunboats** after qualities (*Zaradna*, *Zuchwała*, *Zawzięta*).

In exile the navy fought from Britain with the cruisers *Dragon* and *Conrad* and with loaned destroyers and submarines (*Piorun*, *Garland*, *Sokół*, *Dzik*). After 1945 the People's Republic kept the formulas going: weather words for patrol ships, adjectives for torpedo boats and sub-chasers, birds, beasts and lakes for minesweepers. The older Commonwealth fleet supplies the historic war vessels: the royal squadron that beat the Swedes at Oliwa in 1627 (*Rycerz Święty Jerzy*, *Latający Jeleń*, *Panna Wodna*) and the ships of Władysław IV (*Wielkie Słońce*, *Czarny Orzeł*).

In vanilla Hearts of Iron IV, Poland's ship namelist file (`POL_ship_names.txt`) had these problems:
- **Cloned rosters:** light and heavy cruisers were the same 22-name list; battleships, battlecruisers and carriers were the same 13 names.
- **Mixed lists:** destroyers and cruisers held cities and battles; the submarine list held torpedo-boat names and *Kujawiak* four times.
- **Missing diacritics** in the hull lists (`Wisla`, `Gdansk`, `Pilsudski`, `Sokól`), and `Józef Piłsudzki` in the figures pool.
- **The Cities pool was a copy of the Regions pool**, and the battlecruiser fallback read "cruiser".

**ISNE** rebuilds the Polish namelists as 30 groups:
- **Hull lists follow the navy's formulas.** Destroyers carry the real destroyers and escorts, the weather names of the patrol ships, storm words and storm gods, the qualities of the post-war light craft, and the old arms and troops. Submarines carry the real boats, raptors, predators and sea creatures. Light cruisers carry *Dragon*, *Conrad*, the monitor cities and the cities of the coast, the eastern lands and the rest of Poland. Heavy cruisers carry the historical lands and duchies.
- **Battleships and battlecruisers are split by doctrine.** Battleships carry sovereignty symbols and the monarchs from Mieszko I to Stanisław August. Battlecruisers carry the ships of Oliwa and of Władysław IV, coastal fortresses and citadels, and the waters of the sea fights. No name is shared between them.
- **Carriers** carry the sun, star and eagle ships of Władysław IV, sky words, peaks of the Tatra, the Carpathians and the Sudetes, and Polish aviators and balloonists.
- **Three role pools:** Torpedo Boats (the regional-peoples formula and Poland's ethnographic groups), Mine Warfare (the minelayer *Gryf* and the bird, beast and lake minesweepers) and River Flotilla (gunboats and armed river ships).
- **Vanilla's nine pools are kept under their own tags and translated names, with their errors fixed.** Kings and Historical Figures become universal, Cities holds real cities, and Rivers, Battles and Weather are deeper.
- **Seven new pools:** Hetmans, Admirals & Seafarers, Birds, Aquatic Life, Lakes & Lagoons, Mountains and Virtues.
- **Four ideological pools are gated by government through `can_use`.** Republican Ideals requires a democratic government, Commonwealth a non-aligned one, Labour Movement communism, and Nationalist Ideals fascism. Persons in these pools died before 1936.
- The vanilla prefix `ORP ` (*Okręt Rzeczypospolitej Polskiej*) is kept on every group.

### Compatibility with Jackhall's Polish Ship Names

ISNE and Jackhall's *Polish Ship Names* both replace `common/units/names_ships/POL_ship_names.txt`, so only one of them names Poland's ships in a game. Use one or the other.

---

## Namelist Groups

### Ship-Type Specific Category

Dedicated namelists tied to specific ship hulls and naval classifications:

| Group Tag | Type | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `POL_DD_HISTORICAL` | Destroyers & Escorts | `ship_hull_light destroyer` | Wicher, Burza, Grom, Błyskawica, Piorun, Orkan, Huragan, Krakowiak, Kujawiak, Ślązak, Szkwał, Zorza, Nawałnica, Perun, Czujny, Husarz |
| `POL_SS_HISTORICAL` | Submarines | `ship_hull_submarine submarine` | Wilk, Ryś, Żbik, Orzeł, Sęp, Sokół, Dzik, Jastrząb, Bielik, Kondor, Raróg, Niedźwiedź, Rekin, Jesiotr, Syrena |
| `POL_CL_HISTORICAL` | Light Cruisers | `ship_hull_cruiser light_cruiser` | Dragon, Conrad, Warszawa, Kraków, Wilno, Pińsk, Toruń, Gdynia, Gdańsk, Lwów, Grodno, Poznań, Łódź, Lublin, Częstochowa |
| `POL_CA_HISTORICAL` | Heavy Cruisers | `ship_hull_cruiser heavy_cruiser` | Wielkopolska, Małopolska, Mazowsze, Pomorze, Śląsk, Kujawy, Wołyń, Podole, Warmia, Kaszuby, Żmudź, Inflanty, Ziemia Chełmińska, Księstwo Siewierskie |
| `POL_BB_HISTORICAL` | Battleships | `ship_hull_heavy battleship` | Rzeczpospolita, Polonia, Korona, Wawel, Józef Piłsudski, Mieszko I, Bolesław Chrobry, Kazimierz Wielki, Władysław Jagiełło, Stefan Batory, Jan III Sobieski |
| `POL_BC_HISTORICAL` | Battlecruisers | `ship_hull_heavy battle_cruiser` | Rycerz Święty Jerzy, Latający Jeleń, Panna Wodna, Król Dawid, Tygrys, Prorok Samuel, Kazimierzowo, Wisłoujście, Westerplatte, Hel, Kamieniec Podolski, Oliwa |
| `POL_CV_HISTORICAL` | Aircraft Carriers | `ship_hull_carrier carrier` | Wielkie Słońce, Gwiazda, Czarny Orzeł, Biały Orzeł, Jutrzenka, Świt, Rysy, Giewont, Babia Góra, Śnieżka, Howerla, Żwirko i Wigura |

---

### Role-Specific Category

Universal pools for ship roles that have no hull token of their own:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `POL_TORPEDO_BOATS` | Torpedo Boats | Universal | Kaszub, Mazur, Podhalanin, Góral, Kurp, Pomorzanin, Warmiak, Kociewiak, Borowiak, Łemko, Lasowiak |
| `POL_MINESWEEPERS` | Mine Warfare | Universal | Gryf, Smok, Jaskółka, Mewa, Rybitwa, Czajka, Kormoran, Albatros, Żubr, Rosomak, Gopło, Mamry, Wigry |
| `POL_GUNBOATS` | River Flotilla | Universal | Generał Haller, Komendant Piłsudski, Zaradna, Zuchwała, Zawzięta, Nieuchwytny, Horodyszcze, Admirał Sierpinek, Mątwa, Lisowczyk |

---

### Universal Thematic Topic Category (Ship Designer)

Universal selection pools available for any ship hull or squadron in the Ship Designer:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `POL_THEME_KINGS` | Kings | Universal (every government except communism) | Mieszko I, Bolesław I Chrobry, Kazimierz III Wielki, Królowa Jadwiga, Władysław II Jagiełło, Zygmunt II August, Stefan Batory, Jan III Sobieski |
| `POL_THEME_HISTORICAL_FIGURES` | Historical Figures | Universal (every government except communism) | Józef Piłsudski, Tadeusz Kościuszko, Józef Poniatowski, Kazimierz Pułaski, Mikołaj Kopernik, Maria Skłodowska-Curie, Adam Mickiewicz, Fryderyk Chopin |
| `POL_HETMANS` | Hetmans | Universal | Jan Amor Tarnowski, Jan Zamoyski, Stanisław Żółkiewski, Stanisław Koniecpolski, Stefan Czarniecki, Konstanty Ostrogski, Jan Karol Chodkiewicz |
| `POL_ADMIRALS` | Admirals & Seafarers | Universal | Arend Dickmann, Mateusz Sierpinek, Józef Unrug, Jerzy Świrski, Jan Grudziński, Bolesław Romanowski, Eugeniusz Pławski, Mariusz Zaruski |
| `POL_BIRDS` | Birds | Universal | Orzeł, Bielik, Sokół, Bocian, Żuraw, Łabędź, Zimorodek, Słowik, Skowronek, Głuszec |
| `POL_FISH` | Aquatic Life | Universal | Jesiotr, Łosoś, Troć, Węgorz, Szczupak, Sandacz, Dorsz, Śledź, Morświn, Foka Szara |
| `POL_LAKES` | Lakes & Lagoons | Universal | Śniardwy, Mamry, Niegocin, Wigry, Hańcza, Gopło, Łebsko, Morskie Oko, Świteź, Zalew Szczeciński |
| `POL_GEOGRAPHY` | Mountains | Universal | Tatry, Pieniny, Bieszczady, Karkonosze, Rysy, Babia Góra, Śnieżka, Giewont, Kasprowy Wierch, Howerla |
| `POL_VIRTUES` | Virtues | Universal | Honor, Męstwo, Odwaga, Wierność, Dzielność, Hart Ducha, Chwała, Zwycięstwo, Honor i Ojczyzna, Virtuti Militari |
| `POL_THEME_WEATHER` | Weather | Universal | Burza, Sztorm, Wicher, Huragan, Orkan, Błyskawica, Piorun, Grom, Zamieć, Zorza |
| `POL_THEME_RIVERS` | Rivers | Universal | Wisła, Odra, Warta, Bug, Narew, San, Dunajec, Niemen, Prypeć, Dniestr |
| `POL_THEME_ANIMALS` | Animals | Universal | Wilk, Ryś, Żbik, Niedźwiedź, Żubr, Łoś, Kozica, Orzeł, Sęp, Gryf |
| `POL_THEME_REGIONS` | Regions | Universal | Mazowsze, Kujawy, Małopolska, Wielkopolska, Śląsk, Pomorze, Podlasie, Polesie, Warmia, Wołyń |
| `POL_THEME_CITIES` | Cities | Universal | Warszawa, Kraków, Gniezno, Poznań, Wilno, Lwów, Łódź, Gdańsk, Gdynia, Toruń |
| `POL_THEME_BATTLES` | Famous Battles | Universal | Cedynia, Grunwald, Kircholm, Kłuszyn, Chocim, Oliwa, Wiedeń, Racławice, Somosierra, Monte Cassino |
| `POL_THEME_SLAVIC_MYTHOLOGY` | Slavic Mythology | Universal | Strzyga, Bazyliszek, Boruta, Leszy, Licho, Płanetnik, Południca, Rusałka, Skarbnik, Żmij |
| `POL_REPUBLICAN_IDEALS` | Republican Ideals | Universal (democratic) | Konstytucja 3 Maja, Sejm Czteroletni, Hugo Kołłątaj, Jan Kiliński, Powstanie Styczniowe, Joachim Lelewel, Gabriel Narutowicz |
| `POL_MONARCHISM` | Commonwealth | Universal (non-aligned) | Rzeczpospolita Obojga Narodów, Unia Lubelska, Złota Wolność, Wolna Elekcja, Jagiellonowie, Szczerbiec, Husaria |
| `POL_SOCIALISM` | Labour Movement | Universal (communism) | Ludwik Waryński, Stefan Okrzeja, Julian Marchlewski, Róża Luksemburg, Jarosław Dąbrowski, Wielki Proletariat, Czerwony Sztandar |
| `POL_NATIONALISM` | Nationalist Ideals | Universal (fascism) | Liga Polska, Liga Narodowa, Przegląd Wszechpolski, Narodowa Demokracja, Komitet Narodowy Polski, Rota, Strajk Wrzesiński, Powstanie Wielkopolskie |
