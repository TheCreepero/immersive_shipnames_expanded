# Italy (TAG: ITA) Ship Namelist Plan

**Goal:** Replace the vanilla Italian namelist (`ITA_ship_names.txt`, 12 groups, ~500 names) with a full ISNE namelist. The work separates the destroyer, torpedo-boat and scout rosters that vanilla merged into one group. It restores each Regia Marina class lineage and extends every documented naming formula. It adds thematic, ideological and role pools for the Ship Designer.

**Sources:**
- Two parallel `isne-historical-researcher` dossiers (2026-09-29): A covered hulls and roles, B covered thematic and ideological pools.
- One `isne-audit-researcher` fact-check of the lesser-known persons.

**Author scope decisions (AskUserQuestion, 2026-09-29):**
- **Depth ceilings waived:** lists may exceed the recommended sizes wherever verifiable names exist (the user's request).
- **Role pools, "Split + all roles":** DD keeps only true *cacciatorpediniere*. Torpedo boats and scouts get their own role pools. Corvettes, minelayers, monitors and auxiliary cruisers are created too.
- **Ideology, "Move to gated pool, full set":** overtly fascist names move out of the hull groups into `ITA_FASCISM` (`has_government = fascism`). There are 13 thematic pools plus one pool per ideology.

## Vanilla Audit Findings (Step 0)

1. **Mixed DD group:** it combined *cacciatorpediniere* with ~110 *torpediniere* and ~33 *esploratori*:
   - Torpedo boats: the Spica, Ciclone, Ariete and Orsa classes, plus the Pilo, Sirtori, La Masa, Generali, Palestro and Curtatone classes reclassified in 1929.
   - Scouts: the Navigatori, Leone and Mirabello classes.
2. **Typos:**
   - `Impetouso` → `Impetuoso`
   - `Ruthenio` → `Rutenio`
   - `Lucio Cornelio Silla` → `Cornelio Silla`
   - `Giovanni dalle Bande Nere` → `Giovanni delle Bande Nere`
   - `Alberto da Giussano` → `Alberto di Giussano` (the ship's own name)
   - `Dalmatia` → `Dalmazia`
   - `Kismaayo` → `Chisimaio`
   - `Biscia` (unverifiable colonial spelling) dropped
3. **Duplicate:** `Astore` appeared in DD (Spica class) and CV. It now sits only in `ITA_TORPEDO_BOATS`.
4. **Mislabelled "fictional names" that are real ships:**
   - Regioni and Basilicata cruisers.
   - *Carlo Alberto Racchia*, *Insidioso*, *Irrequieto*, *Pilade Bronzetti*, *Agostino Bertani*, *Benedetto Cairoli*.
   - Pre-dreadnoughts in BC.
   - Flutto Serie III (Attinio–Tungsteno) was a planned class, not fictional.
5. **Minelayer group:** `ITA_MINELAYERS_HISTORICAL` carried hull `ship_types`. It is renamed `ITA_MINELAYERS`, made universal, and given no `ship_types`.
6. **Thin groups:** CA 14, BB 12, BC 10, CV 8.
7. **Fascist names in hull groups:** Littorio, Impero, Camicia Nera, Squadrista, Michele Bianchi, Reginaldo Giuliani, Console Generale Liuzzi, and Costanzo Ciano. The Ciano-class name honoured the regime minister in 1939, although he was also a WWI gold-medal MAS commander; its sister name *Venezia* stays in CL.
8. **Prefixes:** vanilla uses hull-specific prefixes: `RCT ` (DD), `RI ` (CL/CA/BC), `RN ` (BB/CV/pools/minelayers), `RSmg ` (SS). They are kept per group. `-Audit` gained a per-group parity mode for multi-prefix vanilla schemes; its test is in `tests/BuildScript.Tests.ps1` and the rule is in CLAUDE.md/GEMINI.md §3. The new torpedo-boat pool uses the historical `RT ` (*Regia Torpediniera*).
9. **Fallbacks:** vanilla's Italian terms are correct (`Cacciatorpediniere`, `Incrociatore leggero`, `Incrociatore pesante`, `Corazzata`, `Incrociatore da battaglia`, `Portaerei`, `Sommergibile`, `Posamine`). The placeholder switches from vanilla's `%s` to the repository-standard `%d`.

## Final Architecture (30 groups)

| Group | Count | Formula |
|---|---|---|
| `ITA_DD_HISTORICAL` | 171 | Winds and darts, Soldati, virtues, writers and statesmen, Sauro irredentists, Comandanti Medaglie d'Oro, post-war eponyms, X MAS and WWI gold medals; extrapolated military specialties, virtues, winds and darts |
| `ITA_SS_HISTORICAL` | 220 | All vanilla classes. Adds Pullino, Pacinotti and the H 1–8 boats, and submarine gold medals (post-war Sauro and Todaro class eponyms). Extends the Ammiragli, gem and metal formulas |
| `ITA_CL_HISTORICAL` | 86 | Condottieri and Capitani Romani classes, Costanzo Ciano, Etna, prize cruisers, Regioni, protected and torpedo cruisers; more condottieri, Roman commanders and WWI generals |
| `ITA_CA_HISTORICAL` | 51 | Redeemed cities (Trento, Zara, Bolzano classes) and armoured cruisers; extended across Trentino, Venezia Giulia, Istria and the Quarnero–Dalmatian coast |
| `ITA_BB_HISTORICAL` | 36 | Dreadnoughts, royal and state names of the ironclad and pre-dreadnought eras, national symbols; great Italians (Dante Alighieri / Leonardo da Vinci formula) |
| `ITA_BC_HISTORICAL` | 51 | Caracciolo class, ironclad-era admirals, maritime republics as realm titles, historic war vessels and fortresses, naval victories, admirals of Venice, Genoa and the Regia Marina |
| `ITA_CV_HISTORICAL` | 61 | Aquila, Sparviero, seaplane carriers, raptors and owls, Icaro/Dedalo, aviation pioneers, WWI aces, WWII gold-medal airmen |
| `ITA_TORPEDO_BOATS` | 111 | See role pools |
| `ITA_SCOUT_CRUISERS` | 37 | See role pools |
| `ITA_CORVETTES` | 60 | See role pools |
| `ITA_MINELAYERS` | 22 | See role pools |
| `ITA_MONITORS` | 22 | See role pools |
| `ITA_AUXILIARY_CRUISERS` | 32 | See role pools |
| `ITA_REGIONS` | 70 | Regions |
| `ITA_CITIES` | 157 | Cities |
| `ITA_COLONIES` | 91 | Colonies |
| `ITA_MYTHOLOGY` | 135 | Mythology |
| `ITA_BIRDS` | 87 | Birds |
| `ITA_FISH` | 94 | Aquatic Life |
| `ITA_RIVERS` | 123 | Rivers & Lakes |
| `ITA_GEOGRAPHY` | 100 | Geography |
| `ITA_RULERS` | 49 | Rulers |
| `ITA_HEROES` | 81 | Heroes & Genius |
| `ITA_BATTLES` | 36 | Battles |
| `ITA_VIRTUES` | 38 | Virtues |
| `ITA_NATURE` | 61 | Weather & Skies |
| `ITA_FASCISM` | 45 | `fascism`-gated |
| `ITA_MONARCHISM` | 42 | `neutrality`-gated (House of Savoy) |
| `ITA_REPUBLICAN_IDEALS` | 44 | `democratic`-gated |
| `ITA_SOCIALISM` | 37 | `communism`-gated |

## Role Pools: considered / created / skipped

- **Torpedo boats:** created (`ITA_TORPEDO_BOATS`). Sources: the Spica, Ciclone, Ariete and Orsa classes, plus the destroyers reclassified in 1929 (Pilo, Sirtori, La Masa, Generali, Palestro, Curtatone). The Garibaldini formula is extended with members of the Thousand. The virtue-named Ciclone boats stay in DD with the 1913 and post-war destroyers of the same names.
- **Scout cruisers / flotilla leaders:** created (`ITA_SCOUT_CRUISERS`). Sources: the Navigatori, Leone, Mirabello, Poerio and Aquila classes (Falco, Nibbio; Aquila and Sparviero stay in CV) and the Quarto/Bixio scouts, with the navigators formula extended. *Premuda* (ex-Dubrovnik) stays in DD, where the Regia Marina classed it.
- **Corvettes:** created (`ITA_CORVETTES`). The Gabbiano class, 60 planned names.
- **Minelayers:** created (`ITA_MINELAYERS`). The Azio and Fasana classes and requisitioned motor ships. *Lepanto* went to BC (battle doctrine and the 1883 capital ship); *Zara* and *Brindisi* stay in CA and CL.
- **Monitors:** created (`ITA_MONITORS`). WWI *pontoni armati* from the difesaonline and agenziabozzo registers.
- **Auxiliary cruisers:** created (`ITA_AUXILIARY_CRUISERS`). The RAMB ships, the *Città di* ferries and requisitioned liners. Names shared with hull groups were left out (Pola, Zara, Lubiana, Duca degli Abruzzi, Francesco Morosini).
- **Minesweepers:** considered, skipped: R.D. boats were numbered.
- **Fast attack craft (MAS):** considered, skipped: numbered.
- **Escort carriers and light carriers:** considered, skipped: no program beyond Aquila and Sparviero.
- **Escort destroyers, frigates, sloops, patrol vessels:** considered, skipped: the escort torpedo boats (Ciclone, Orsa) are in `ITA_TORPEDO_BOATS`.
- **Avisos:** considered, skipped: a single colonial aviso (*Eritrea*).
- **Gunboats:** considered, skipped: about 17 names across mixed eras with no single formula.
- **Coastal defense, fast battleships, large and armoured cruisers:** considered, skipped: covered by CA and BB, with no separate formula.
- **Seaplane tenders:** considered, skipped: four names; Giuseppe Miraglia and Europa are in CV.
- **Cruiser, coastal/midget and minelaying submarines:** considered, skipped:
  - Midget boats (CB/CA/CM) were numbered.
  - The minelaying boats (Bragadin, Micca, Foca) are below the floor, so they stay in SS.
  - The cruiser submarines share the SS formula.
- **Training ships, icebreakers, submarine tenders, state yachts:** considered, skipped: fewer than 10 names, or no series.

## Collision Resolutions

- **Cross-class sets:** CL/CA/BB/BC/CV are mutually exclusive (`-Audit` CrossClass = 0). Maritime republics use realm titles in BC (*Repubblica di Pisa*, *Repubblica di Amalfi*, *Repubblica di Venezia*, *Repubblica di Ancona*), so the cruiser city names stay free. The remaining CrossClassPerson INFOs are false positives:
  - a city vs its republic;
  - Andrea Doria vs his great-nephew Giovanni Andrea Doria;
  - Calabria vs Fulco Ruffo di Calabria.
- **DD vs torpedo boats:** zero overlap. The Ciclone virtue names stay in DD; the Ciclone weather names go to torpedo boats.
- **Scouts vs CV:** Aquila and Sparviero go to CV; Falco and Nibbio go to scouts. CV uses distinct species names (*Nibbio Reale*).
- **Thematic pools:** names already used in hull or role groups were excluded. This covers the corvette myth and seabird names out of Mythology and Birds, Icaro and Dedalo out of Mythology into CV, battle names used by minelayers, monitors, torpedo boats and SS, and the cruiser and heavy-cruiser city names out of Cities.
- **Review fixes (isne-code-reviewer, 2026-09-29):**
  - *Vettor Pisani* is kept in CA only (armoured cruiser) and removed from SS.
  - *Ammiraglio di Saint Bon* is removed from BC; the SS Ammiragli-class boat keeps the name.
  - *Lisso* is replaced by *Isola di Coo*, a qualified form of Kos.
  - Dropped the ambiguous or duplicate names *Tito* (reads as Josip Broz Tito), *Re Soldato* (the same king as *Vittorio Emanuele III*) and *Lega Lombarda* (reads as the modern party).
  - Display names changed: `Fascist Regime` (no country name), `Weather & Skies` (the named winds are in DD), `Geography` (the pool also holds passes, straits and capes).
- **One place per name:** *Leonardo da Vinci* stays in SS (famous WWII boat), not BB. *Marcantonio Colonna* moves from SS to BC (Caracciolo class). *Formidabile* and *Terribile* sit in BB (1861 ironclads), not DD.

## Linguistic and Verification Notes

- **Persons verified (sources):**
  - DD Comandanti eponyms and X MAS gold medals (Birindelli, Bianchi, Marceglia, Schergat, Martellotta, Marino, Faggioni, Barberi, De Vito, Beccati, Cabrini, Carabelli, Falcomatà, Ferraro, Frassetto, Magro, Manisco, Marcolini, Pedretti, Tedeschi, Bosio, Conte): it.wikipedia Comandanti Medaglie d'Oro class page and the ANAIM gold-medal roll (Dossier A).
  - Tesei, Visintini, Mimbelli, Fasan, Slataper, Venezian, Lanza, Zanardelli: fact-check pass.
  - SS gold medals: Bertolotto, Del Greco, Bezzi, Farinati degli Uberti, Todaro, Fecia di Cossato, Gazzana Priaroggia, Longobardo, Pelosi, Prini, Venuti, Romei come from the marina.difesa.it submarine gold-medal page (Dossier A). The fact-check pass confirmed Marenco di Moriondo (it.wikipedia), Stiepovich (Marina Militare), Piomarta (it.wikipedia), Maffettone (it.wikipedia) and Forgiarini (Marina Militare).
  - Garibaldini: the it.wikipedia category of the Thousand (Dossier A). The fact-check confirmed Türr, Menotti Garibaldi, Canzio, Bandi, Bezzi, Damis, Plutino (#794 on the i1000 roll), Cucchi, Cella, Majocchi, Miceli, Sprovieri, Fasola and Paulon on the Elenco dei Mille. Braico is named by Abba (3rd company); Guerzoni was Garibaldi's secretary.
  - CL condottieri, Roman commanders and WWI generals; BC admirals; CV aces and airmen (it.wikipedia list of WWI aces, en.wikipedia pages); scouts' navigators; monitor pontoon names (difesaonline and agenziabozzo registers): Dossier A and the fact-check pass.

- **Fact-check corrections:**
  - monitors `Capitano Masotto`, `Umberto Missana`, `Monte Cucco`;
  - SS `Paolo Tolosetto Farinati degli Uberti`, with the non-existent `Luigi Longobardi` dropped;
  - CL `Metello Numidico` (was the ambiguous `Cecilio Metello`).
- **Unconfirmed Thousand members:** Celso Ceretti and Filippo Migliavacca were dropped from the Garibaldini extension because their membership could not be confirmed. Cesare Braico (named by Abba) and Giuseppe Guerzoni (Garibaldi's secretary) are kept.
- **Persons outside the fact-check:** well-documented figures were not individually looked up. This covers the canonical artists, composers, scientists, Roman emperors, Savoy rulers, and anti-fascist and socialist leaders.
- **English homonyms:**
  - Kept as real ship names: `Ape` (Gabbiano-class corvette), `Gru` (corvette), `Euro` (1900 and 1927 destroyers).
  - Kept as authentic place names: `Po`, `Capri`.
  - Dropped: `Coo` (Kos), `Uni`, `Cath`, `Latino`, `Sula`, `Crema`, `Nova`, `Tornado`, `Radio`, `Razza`, `Alice`.
- **Anachronisms:** `Plutonio` (Flutto Serie III per en.wikipedia; element named 1941–42) was left out. So were the fascist-era new-town names (Littoria/Latina, Sabaudia, Carbonia).

## Review Focus

1. **Vanilla fixes:** confirm the vanilla fixes listed above and the DD / torpedo boat / scout split.
2. **Cross-class and role overlap:** confirm zero cross-class overlap, zero role overlap, and that no `ship_types` sits on any pool.
3. **Ideological separation:** confirm the fascist, monarchist, republican and socialist pools are separate and each is `has_government`-gated.
4. **Prefixes:** confirm per-group vanilla prefix parity, and that the `-Audit` multi-prefix mode is backed by its test.
5. **Docs:** confirm docs sync (README, workshop cross-reference and Italy block, header pitch, wiki page, Home, Sidebar).
