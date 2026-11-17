# Poland (TAG: POL) Ship Namelist Plan

**Goal:** Replace the vanilla Polish namelist (`POL_ship_names.txt`, 16 groups) with a full ISNE namelist: separate hull rosters at ISNE depth that follow the Polish Navy's naming formulas, vanilla's nine pools fixed under their own tags, seven new thematic pools, three role pools and four ideology pools.

**Status:** implemented 2026-11-17; `-Audit POL` FAIL=0 after the docs sync.

**Sources:**
- Step 0: `build.ps1 -InspectVanilla POL`, and a group-by-group diff of Jackhall's *Polish Ship Names* (Workshop 2157717129, frozen copy of 2026-10-17) against vanilla, reported to the author.
- One `isne-historical-researcher` dossier (37 web calls).
- Raw wikitext of pl.wikipedia list pages, parsed by script: *Marynarka Wojenna (II RP)*, *Flotylla Rzeczna Marynarki Wojennej*, *Polska Marynarka Wojenna*, *Admirałowie polscy*, the four hetman lists (*Hetman wielki/polny koronny/litewski*), *Bitwa pod Oliwą*, *Okręty patrolowe projektu 912*, *Trałowce projektu 206F / 207 / 254*, *Okręty podwodne projektu 613*, *Kazimierzowo (twierdza)*, *Ptaki Polski*, *Ryby Polski*, *Korona Gór Polski*, *Kategoria:Grupy etnograficzne Polski*; en.wikipedia *List of ships of the Polish Navy*.
- Four parallel `isne-audit-researcher` passes (79 web calls): vessels, fleets, forts, storm gods and aviators; naval commanders and seafarers; democratic and Commonwealth pools; socialist and nationalist pools.

## Author decisions (2026-11-17)

1. **Jackhall compatibility dropped.** The author asked first for a report on what Jackhall's mod changes, then decided that ISNE no longer keeps compatibility with Jackhall's ship name mods. Poland is authored like any other nation under the vanilla filename. Both mods ship `POL_ship_names.txt`, so only one names Poland's ships [LOAD-010] [LOAD-014]; ISNE's descriptor has no `dependencies`, so with both enabled at equal priority Jackhall's "Polish Ship Names" mounts later by name and wins. The exclusion of all seven Jackhall nations was lifted in `AGENTS.md`, guide section 4 item 5, `WORKSHOP_DESCRIPTION_GUIDELINES.md`, `docs/ROADMAP.md` and the authoring skill.
2. **Scope (AskUserQuestion):** the full pool set (seven new thematic pools, three role pools, four ideology pools); names from any era (People's Republic and later ship names are used where they carry an older formula).
3. **Workshop text:** the Jackhall paragraph is rewritten for this release (author's own section; draft shown to the author).

## Vanilla Audit Findings (Step 0)

1. **Cloned rosters:** CL and CA are the same 22 names; BB, BC and CV the same 13.
2. **Mixed hull lists:** DD, CL and CA hold cities (*Warszawa*, *Lwów*, *Kraków* twice) and battles (*Zadwórze*, *Płowce*, *Odsiecz Wiedeńska*, *Psków*, *Raszyn*, *Przemyśl*, *Chocim*, *Kircholm*, *Fuengirola*); SS holds the torpedo-boat and M-XV names *Kaszub*, *Mazur*, *Krakowiak*, *Ślązak*, *Kurp* and *Kujawiak* four times; *Bałtyk* (a hulk) and *Król Władysław IV* sit in CL and CA.
3. **Missing diacritics:** `Wisla`, `Gdansk`, `Plowce`, `Przemysl`, `Wiedenska`, `Pilsudski`, `Wladyslaw`, `Boleslaw`, `Stanislaw`, `Zólkiewski`, `Lanckoronski`, `Sokól`, `Rys`; `Józef Piłsudzki` in Figures; `Podkapracie` in Regions; `Kazimierz Jagielończyk` in Kings.
4. **Cities pool = Regions pool** (regions, no cities). **Rivers** holds the town *Lida*. **Animals** holds *Tygrys*, *Lew*, *Pantera*.
5. **Fallbacks:** BC `Krążownik %d` (cruiser) → `Krążownik liniowy %d`; capitalised `Lekki Krążownik`, `Ciężki Krążownik`, `Okręt Podwodny` → Polish sentence case. The nine pools had no fallback.
6. **Hull-bound pools:** Kings and Historical Figures carried `ship_types` (heavy and carrier hulls); made universal [NAM-010].
7. **Prefix:** `ORP ` on all 16 groups; kept on all 30. Vanilla fallbacks carry no prefix and the engine adds none to a fallback [NAM-025]; kept that way, like every ISNE file.
8. **Tags vanilla script assigns:** `POL_DD_HISTORICAL`, `POL_SS_HISTORICAL` (`history/countries/POL - Poland.txt`); kept. The nine `POL_THEME_*` tags and their localisation keys are kept, so saves keep the lists [NAM-019] and every game language translates their names.

## Final Architecture (30 groups)

| Group | Display name | Fallback | Count | Formula |
|---|---|---|---|---|
| `POL_DD_HISTORICAL` | vanilla key | `Niszczyciel %d` | 99 | Real destroyers and Hunt escorts; project 912 weather names; storm words; Perun, Strzybóg, Pogwizd; the qualities of projects 912M, 664, 200 and 663D and their formula; old arms and troops |
| `POL_SS_HISTORICAL` | vanilla key | `Okręt podwodny %d` | 60 | Real boats 1931–1945, *Bielik*, *Kondor*; raptors, predators, fish and sea creatures; water spirits |
| `POL_CL_HISTORICAL` | vanilla key | `Lekki krążownik %d` | 84 | *Dragon*, *Conrad*; the monitor cities; coast, eastern lands, rest of Poland |
| `POL_CA_HISTORICAL` | vanilla key | `Ciężki krążownik %d` | 45 | Historical lands, Prussian and Baltic lands, *ziemie* and duchies |
| `POL_BB_HISTORICAL` | vanilla key | `Pancernik %d` | 35 | Sovereignty; Piast, Angevin, Jagiellonian and elected monarchs |
| `POL_BC_HISTORICAL` | vanilla key | `Krążownik liniowy %d` | 34 | Oliwa fleet, *Tygrys*, Władysław IV's fleet, coastal fortresses and citadels, waters of the sea fights |
| `POL_CV_HISTORICAL` | vanilla key | `Lotniskowiec %d` | 43 | Władysław IV's sun, star and eagle ships; sky words; peaks; aviators and balloonists |
| `POL_TORPEDO_BOATS` | `"Torpedo Boats"` | `Torpedowiec %d` | 35 | Role pool |
| `POL_MINESWEEPERS` | `"Mine Warfare"` | `Trałowiec %d` | 40 | Role pool |
| `POL_GUNBOATS` | `"River Flotilla"` | `Kanonierka %d` | 18 | Role pool |
| `POL_THEME_KINGS` | vanilla key | `Król %d` | 31 | Monarchs with regnal numbers; gate `NOT = { has_government = communism }` (vanilla) |
| `POL_THEME_HISTORICAL_FIGURES` | vanilla key | `Bohater %d` | 29 | Vanilla's soldiers and scholars (hetmans and admirals moved to their pools), plus writers, composers and painters; vanilla gate |
| `POL_HETMANS` | `"Hetmans"` | `Hetman %d` | 41 | Crown and Lithuanian hetmans |
| `POL_ADMIRALS` | `"Admirals & Seafarers"` | `Admirał %d` | 50 | Royal-fleet admirals, flag officers 1918–1945, WWII ship commanders, seafarers |
| `POL_BIRDS` | `"Birds"` | `Ptak %d` | 54 | |
| `POL_FISH` | `"Aquatic Life"` | `Ryba %d` | 42 | |
| `POL_LAKES` | `"Lakes & Lagoons"` | `Jezioro %d` | 34 | |
| `POL_GEOGRAPHY` | `"Mountains"` | `Szczyt %d` | 49 | Ranges, the Crown of Polish Mountains, Tatra and Czarnohora peaks |
| `POL_VIRTUES` | `"Virtues"` | `Cnota %d` | 33 | |
| `POL_THEME_WEATHER` | vanilla key | `Wicher %d` | 32 | Vanilla's 14 plus more |
| `POL_THEME_RIVERS` | vanilla key | `Rzeka %d` | 54 | *Lida* dropped |
| `POL_THEME_ANIMALS` | vanilla key | `Zwierzę %d` | 34 | Exotic big cats dropped |
| `POL_THEME_REGIONS` | vanilla key | `Region %d` | 25 | |
| `POL_THEME_CITIES` | vanilla key | `Miasto %d` | 50 | Real cities |
| `POL_THEME_BATTLES` | vanilla key | `Bitwa %d` | 40 | 972 to 1944 |
| `POL_THEME_SLAVIC_MYTHOLOGY` | vanilla key | `Licho %d` | 102 | Vanilla list unchanged |
| `POL_REPUBLICAN_IDEALS` | `"Republican Ideals"` | `Ideał %d` | 29 | `has_government = democratic` |
| `POL_MONARCHISM` | `"Commonwealth"` | `Korona %d` | 27 | `has_government = neutrality` (Poland starts non-aligned; the Commonwealth's institutions fit Sanacja and a restored monarchy alike) |
| `POL_SOCIALISM` | `"Labour Movement"` | `Towarzysz %d` | 20 | `has_government = communism` |
| `POL_NATIONALISM` | `"Nationalist Ideals"` | `Naród %d` | 20 | `has_government = fascism` |

Depth below target, accepted (`-Audit` WARN, floors met): DD 99, the ideology pools (20–29, as Romania's and Peru's), Regions 25, Kings 31, Figures 29, `POL_GUNBOATS` 18 (every attested flotilla name; the monitor cities stay in CL), and a few pools at 32–34.

### Rulings

- **Decoupling:** no name is shared by CL, CA, BB, BC and CV. `-Audit` reports `Wolin ~ Wołyń` (CrossClassVariant): *Wolin* is the island town in CL, *Wołyń* (Volhynia) the land in CA; different names. `Łęczyca ~ Ziemia Łęczycka` (INFO) is a town and the land named after it.
- **Monarchs:** where Polish usage numbers a monarch, BB carries the plain form (*Bolesław Chrobry*) and the Kings pool the regnal form (*Bolesław I Chrobry*); 13 names whose customary form is the same (*Mieszko I*, *Stefan Batory*, *Jan III Sobieski* and others) are identical in both, which the rules allow for a hull list and a pool. Hetmans left BB for `POL_HETMANS`.
- **BB *Józef Piłsudski*** is ungated, like every hull name; the Figures pool keeps vanilla's `NOT communism` gate.
- **Władysław IV's fleet** is split by theme: sun, star and eagles (*Wielkie Słońce*, *Gwiazda*, *Czarny Orzeł*, *Biały Orzeł*, *Nowy Czarny Orzeł*, *Mały Biały Orzeł*) to CV, the rest (*Prorok Samuel*, *Charitas*, *Strzelec*, *Fortuna*) to BC. "Święty Piotr or Fortuna" was one ship; *Fortuna* is kept.
- **Regional peoples:** the Hunt escorts *Krakowiak*, *Kujawiak*, *Ślązak* stay in DD; the torpedo boats and the rest of the formula form `POL_TORPEDO_BOATS`. No name is in both.
- **Bird, beast and lake minesweeper names** that are also submarine names (*Jastrząb*, *Dzik*, *Ryś*, *Żbik*) stay in SS only; *Krogulec* and *Orlik* (project 206F) stay in Mine Warfare only.
- **River pool vs DD:** *Nieuchwytny* (river cutter and OD-200 sub-chaser) is in `POL_GUNBOATS` only; the feminine gunboat names (*Zawzięta*) and the masculine patrol-ship name (*Zawzięty*) are different names.
- **Ideology pools:** persons dead by 1 January 1936 (Romania precedent). No pool mixes ideologies. The nationalist pool holds no person or body defined by antisemitism: Zygmunt Balicki (leader of National Democracy's antisemitic agitation, 1912 boycott) and his *Egoizm narodowy*, Jan Ludwik Popławski (unchecked), the ONR (1934), the Maritime and Colonial League (a state body, not the national camp), *Obóz Wielkiej Polski* (the ONR's parent, dissolved in 1933 for inciting racial hatred), *Gazeta Warszawska* (the 1922 campaign against Narutowicz) and *Stronnictwo Narodowe* (antisemitic programme of the 1930s) are out; Roman Dmowski died in 1939. The pool adds the 1917 *Komitet Narodowy Polski*, the 1910 *Pomnik Grunwaldzki* and the 1919 Sejny uprising, so it is named "Nationalist Ideals" rather than after the National Democracy alone.
- **Display names and mottoes:** "Lakes & Lagoons" (two lagoons and a bay); "Labour Movement" (persons, parties, events and songs). The motto *Bóg, Honor, Ojczyzna* was left out because its commas cannot be told from a list in docs; *Honor i Ojczyzna* stays.
- **Homonyms:** *Bug* (the river, vanilla; author's call) and *Tornado* (same meaning) kept; *Hart* became *Hart Ducha*; *Flaming* (project 206F) left out; *Grad* (vanilla Weather) kept, not in DD; *Mors*, *Tur*, *Lis*, *Wir*, *Kopia* kept (no unrelated English reading in a ship name).
- **Storm gods:** *Pogwizd* is the attested form (Miechowita); its historicity is disputed (pl.wikipedia *Lista pseudobóstw słowiańskich*). *Poświst* (a folk demon) and *Dogoda* (unsourced) dropped.

## Role pools (guide section 2C)

- **Torpedo boats** (`POL_TORPEDO_BOATS`, CREATE): *Kaszub*, *Mazur*, *Podhalanin* (ex-*Góral*), *Kurp* (M-XV submarine), *Pomorzanin* (survey ship of 1920, same formula); 29 ethnographic groups from *Kategoria:Grupy etnograficzne Polski*, in the singular.
- **Mine warfare** (`POL_MINESWEEPERS`, CREATE): minelayers *Gryf* and *Smok* (the auxiliary of the mine unit, pl.wikipedia *Marynarka Wojenna (II RP)*); minesweepers of 1920 and 1935–39, projects 206F, 254 and 207. A separate minelayer pool would hold two names.
- **River flotilla and gunboats** (`POL_GUNBOATS`, CREATE): *Generał Haller*, *Komendant Piłsudski*; *Zaradna*, *Zuchwała*, *Zawzięta*, *Nieuchwytny*; *Horodyszcze*, *Admirał Sierpinek*, *Admirał Dickman*, *Generał Szeptycki*, *Generał Sikorski*, *Hetman Chodkiewicz*, *Generał Sosnkowski*, *Mątwa*, *Pancerny*; the 1919 launches *Lech*, *Lisowczyk*, *Lizdejko*.
- Monitors: considered, skipped: six city names, kept in CL.
- Escort destroyers: considered, skipped: three Hunts, in DD.
- Patrol vessels and fast attack craft: considered, skipped: their weather and adjective names carry the destroyer formula and are in DD; motor torpedo boats were numbered (S-1 to S-10).
- Corvettes and frigates: considered, skipped: post-1980, about six names.
- Submarine sub-types: considered, skipped: three Wilk-class minelaying boats, in SS.
- Training ships: considered, skipped: about six names.
- Escort carriers, sloops, avisos, scout cruisers, flotilla leaders, coastal defence ships, capital sub-types, seaplane tenders, auxiliary cruisers, icebreakers, submarine tenders, state yachts: considered, skipped: no Polish precedent.

## Persons: verification notes

- **Sourced from fetched pages:**
  - Hetmans: all 41 from the four pl.wikipedia hetman lists. Targowica confederates (Franciszek Ksawery Branicki, Seweryn Rzewuski, Piotr Ożarowski, Szymon Kossakowski, Michał Józef Massalski) and Janusz Radziwiłł (Kėdainiai, 1655) left out.
  - Admirals: Commonwealth admirals and flag officers from *Admirałowie polscy* (Sierpinek is *Mateusz Scharping* there; the river staff ship *Admirał Sierpinek* uses the Polish form).
  - WWII commanders from unithistories.com *Polish navy*, en.wikipedia and uboat.net: Grudziński, Romanowski, Karnicki, Krawczyk, Kłopotowski, Koziołkowski, Pławski, Hulewicz, Hryniewiecki, Francki, de Walden, Gorazdowski (Tadeusz, not Stefan), Lichodziejewski, Namieśniowski, Dzienisiewicz. Henryk Kłoczkowski (left *Orzeł* at Tallinn in 1939; convicted and demoted in 1942 after his officers charged him with cowardice) and Jerzy Umecki (relieved for cowardice, 1940) left out; Romuald Tymiński left out (confusable with Nałęcz-Tymiński); a garbled name (Nowor?l) left out.
  - Seafarer: Władysław Wagner (dzieje.pl).
  - Aviators: Ludwik Idzikowski, Franciszek Hynek and Zbigniew Burzyński (balloonists, Gordon Bennett Cup), pl.wikipedia.
  - Ideology pools: Kuźnica Kołłątajowska, Piotr Ściegienny, Bartosz Głowacki, Stefan Okrzeja, Bronisław Wesołowski, Walery Wróblewski, Republika Tarnobrzeska, Powstanie Łódzkie, Proletariat, Liga Narodowa, Przegląd Wszechpolski, Zet, Zygmunt Miłkowski, Rota and the National Democratic parties (en.wikipedia *National Democracy (Poland)*, *Zygmunt Balicki*).
- **Kept on ship precedent:** the eponyms of *Komendant Piłsudski*, *Generał Haller*, *Generał Szeptycki*, *Generał Sikorski* (named for him as a colonel, 1920), *Generał Sosnkowski*, *Hetman Chodkiewicz*, *Admirał Dickman*.
- **Kept without a lookup (well documented):** the monarchs; vanilla's figures (Piłsudski, Kościuszko, Poniatowski, Dąbrowski, Pułaski, Bem, Haller, Szeptycki, Sikorski, Sosnkowski, Anders, Sosabowski, Kopernik, Heweliusz, Kochanowski, Rej); added figures (Wybicki, Skłodowska-Curie, Łukasiewicz, Krasicki, Mickiewicz, Słowacki, Norwid, Sienkiewicz, Prus, Wyspiański, Chopin, Moniuszko, Matejko); seafarers Zaruski, Teliga, Strzelecki, Arctowski, Dobrowolski; aviators Żwirko and Wigura, Skarżyński, Orliński; democratic figures (Kołłątaj, Ignacy Potocki, Małachowski, Staszic, Konarski, Kiliński, Lelewel, Dembowski, Traugutt, Plater, Narutowicz); socialists (Waryński, Kasprzak, Marchlewski, Dzierżyński, Luksemburg, Jogiches, Jarosław Dąbrowski).
- **Dropped:** Kazimierz Dłuski (PPS physician, weak fit), Henryk Dembiński (alive in 1936), Jan z Kolna (legendary), Ignacy Domeyko (not a seafarer), Bolesław Romanowski's homonym confusion resolved in favour of the submarine commander.

## Vocabulary: verification notes

- Birds: all 54 found on pl.wikipedia *Ptaki Polski*. Fish: all found on *Ryby Polski* except `Flądra`, which was dropped. Peaks: the Crown of Polish Mountains from *Korona Gór Polski*; the Tatra and Czarnohora peaks are well documented.
- Lakes: 17 attested as project 207 minesweeper names; the rest are well-documented major lakes. Obscure candidates (`Lubiąż`, `Wielimie`, `Jeziorsko`) were left out.
- Ships: Oliwa from *Bitwa pod Oliwą* and *Tygrys (1624)*; Władysław IV's fleet from en.wikipedia *Polish–Lithuanian Commonwealth Navy* (spelling per that page); post-war classes from the project pages and *Okręty Marynarki Wojennej wycofane po 1947 roku*.
- Fortresses: *Kazimierzowo* (pl.wikipedia *Kazimierzowo (twierdza)*); *Władysławowo* (the 1635 port and fort, pl.wikipedia *Władysławowo*); *Wisłoujście* (*Twierdza Wisłoujście*); *Kępa Oksywska*, *Westerplatte*, *Hel*, *Modlin* well documented.

## Docs sync (guide section 4)

- [x] `WORKSHOP_DESCRIPTION_GUIDELINES.md`: cross-reference row, Included nations entry, Poland in the header nation list, the Jackhall paragraph rewritten.
- [x] `README.md`: Included Nations row.
- [x] `wiki/Poland.md`, `wiki/Home.md`, `wiki/_Sidebar.md`.
- [x] `docs/ROADMAP.md`: Jackhall exclusion note replaced (POL had no candidate row).
- [x] Rule 4 of the Workshop guidelines and guide section 4 item 1 allow keeping the Jackhall overlap list current (review M2).
- [x] Wiki pushed (f814c00: Poland, Home, Sidebar).

## Review

- Round 1 (2026-11-17): not ready; I1 Henryk Kłoczkowski, I2 *Obóz Wielkiej Polski* (and by the same test *Gazeta Warszawska*, *Stronnictwo Narodowe*), I3 *Zatoka Puck*; minor M1–M8. All fixed except M5 (*Bug*, left to the author).
- Round 2 (2026-11-17): ready. Minor M9 (Workshop bullet "Lakes & Lagoons") and M10 (two comment date ranges) fixed.
