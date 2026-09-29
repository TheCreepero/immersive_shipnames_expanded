# Sweden (SWE) Namelist Audit — 2026-09-29

File: `common/units/names_ships/SWE_ship_names.txt`

## Initial report (`-Audit SWE`)
- FAIL=5: `CrossClass` BB/CV (Kronan, Svärdet, Riksäpplet, Riksnyckeln, Spiran), BB/BC (Gustav II Adolf, Karl X Gustav, Karl XII, Gustav III), CA/BB (Oscar II, Birger Jarl, Magnus Ladulås), CA/CV (Dristigheten, Tordön), CL/CV (Gotland, Örnen, Falken, Freja).
- WARN=2: `Depth` RULERS 34/35; `DocsWikiSamples` FISH `Tumlaren`.
- Found on manual review, not by the script: spelling-variant collisions CA `Gustav V` / BB `Gustaf V`, BC `Gustaf Vasa` / BB `Gustav Vasa`, BC `Götalejon` / CL `Göta Lejon`. Display names `Birds of Prey` (the pool also holds seabirds, a crane and a cuckoo) and `Naval Heroes & Admirals` (about half the entries are army generals).

## User decisions
- RULERS: top up with well-documented monarchs (chosen: "Top up").

## Research
One `isne-historical-researcher` dispatch (Sonnet). Sources: sv.wikipedia lists of Swedish sailing warships, pansarskepp, monitors, torpedo boats, minesweepers, gunboats, minelayers and more; en.wikipedia and SBL biographies.

## Per-group changes

| Group | Before → After | Added | Removed | Respelled / moved |
|---|---|---|---|---|
| CL | 65 → 65 | — | — | Claes Fleming → Clas Fleming (1912 mine cruiser) |
| CA | 45 → 48 | Garmer, Sköld, Fenris, Gerda, Björn, Sölve, Ulf (19th-c. monitors) | Rolf Krake (Danish ironclad and Danish legendary king); Birger Jarl, Magnus Ladulås (kept in BB); Scania (spelling variant of BB Skåne) | Gustav V → Gustaf V (HMS Gustaf V); Valdemar → Valdemar Birgersson |
| BB | 44 → 41 | — | Oscar II, Gustaf V (kept in CA as pansarskepp); Wasaorden (an honour, not a ship name) | — |
| BC | 35 → 34 | Mars, Draken, Smålands Lejon, Prins Gustaf, Sophia Magdalena, Carlsten, Kungsholm, Karlsborg, Bohus, Sveaborg, Svensksund | Gustav II Adolf, Karl XII, Karl X Gustav, Gustav III, Gustaf Vasa (kept in BB); Götalejon (in CL as Göta Lejon); coinages Vasa Lejon, Stormakt, Segerkronan, Nordens Lejon, Segersäll, Fältmarskalken | Lennart Torstenson → Torstensson; Hans von Königsmarck → Hans Christoff von Königsmarck; Prins Gustaf Adolf → Kronprins Gustaf Adolf (1782 ship of the line) |
| CV | 40 → 38 | Skögul, Sigrun, Eir, Frigg, Stenfalk, Bivråk, Kärrhök, Karlavagnen, Vintergatan | Dristigheten, Tordön (CA); Gotland, Örnen, Falken, Freja (CL); Kronan, Riksäpplet, Spiran, Svärdet, Riksnyckeln (BB) | Gondul → Göndul, Sigrdrifa → Sigrdriva, Gefion → Gefjon (Swedish rather than Danish form), Skadi → Skade |
| RULERS | 34 → 42 | Erik Segersäll, Karl Sverkersson, Erik Knutsson, Valdemar Birgersson, Birger Magnusson, Magnus Eriksson, Albrekt av Mecklenburg, Karl Knutsson Bonde | — | — |
| MYTHOLOGY | 42 → 42 | — | — | Skadi → Skade |
| BIRDS | 40 → 40 | — | — | Display name `Birds of Prey` → `Birds` |
| HEROES | 35 → 37 | Clas Fleming, Nils Ehrenskiöld, Otto Henrik Nordenskjöld, Johan af Puke | Gustaf von Kochen (no such officer found), Salomon von Otter (civil official, not an admiral) | Display name → `Heroes & Commanders`; Johan Peter Toll → Johan Christopher Toll; Erik Sjöblad → Erik Carlsson Sjöblad; Fredric Henric af Chapman → Fredrik Henrik af Chapman; Lennart Torstenson → Torstensson; Hans von Königsmarck → Hans Christoff von Königsmarck |
| MINESWEEPERS (new) | — → 35 | Sökaren (1930s), Arholma (WWII), Hanö (1950s), Arkö (1950s–60s) and Landsort (Cold War; plausible expansion) class names | — | — |

## Kept on judgment
- CA keeps the legendary figures Starkodder and Styrbjörn, which fit the group's saga theme; a 1935 minesweeper carrying the name does not bar its use. It also keeps Orvar Odd, Hjalmar, Ingeborg, Hagbard, Signe and Folke Filbyter, all attested saga figures. Hagbard and Signe are Danish-legend figures but part of the shared Scandinavian tradition.
- CA keeps `Svithiod`: the older orthography matches the historical spellings `Wasa` and `Niord`.
- CL keeps `Marieholm` and `Jarramas`, both real Swedish Navy vessels.
- CV keeps `Sveriges Vapen`: a non-person emblem name in an alternate-history carrier roster.
- BC keeps its field-marshal roster, which is documented. The removed slots were refilled per §2 BC doctrine (flagships, fortresses, a decisive encounter).
- Fallbacks are kept as native indefinite nominative forms.

## Role pools
| Role | Verdict | Reason |
|---|---|---|
| Minesweepers | CREATED `SWE_MINESWEEPERS` (35) | Documented island/skerry convention (Arholma, Landsort, Hanö, Arkö classes) |
| Torpedo boats | considered, skipped | Star/weather series names already populate `SWE_DD_HISTORICAL`; the pool would only duplicate DD |
| Gunboats | considered, skipped | Only ~16 clean names (below the 20 target) and low relevance for 1936+; valkyrie names overlap the CV theme |
| Minelayers | considered, skipped | Only 5 verifiable names (Älvsnabben, Älvsborg, Visborg, Carlskrona, Clas Fleming) |
| Patrol vessels | considered, skipped | 17 names, nearly all already in DD |
| Seaplane tenders | considered, skipped | 2 precedents (Dristigheten, Gotland) |
| Training ships, icebreakers, corvettes | considered, skipped | Below floor, or the names duplicate DD/SS |
| Coastal defence / monitors | considered, skipped | Already carried by `SWE_CA_HISTORICAL` |

## Named-individual verification (SWE_HEROES, legacy entries)
Researcher's per-entry verdicts, with sources:
- Klas Horn, Jacob Bagge (Jakob Bagge), Claes Uggla, Gustaf von Psilander, Carl Olof Cronstedt, Baltzar von Platen, Nils Bielke, Johan Christopher Toll, Erik Carlsson Sjöblad: en.wikipedia biographies.
- Henrik Fleming (vice admiral 1628), Olof von Unge (vice admiral), Carl Georg Siöblad (admiral, son of Erik Carlsson Sjöblad), Claes Bielkenstierna (admiral), Carl Nathanael af Klercker (lieutenant general, Sveaborg squadron): sv.wikipedia biographies.
- Johan af Puke, Nils Ehrenskiöld: sv.wikipedia. Otto Henrik Nordenskjöld: Marinmuseum persongalleri.
- Army commanders and statesmen (Torstensson through Oxenstierna): well-documented figures of the Thirty Years' War and Great Northern War.

## Review (isne-code-reviewer, Sonnet)
Verdict: PASS WITH FIXES, no Critical findings. Fixed: Ehrenschiöld → Ehrenskiöld; CA Scania → Ulf (spelling-variant near-duplicate of BB Skåne); BC/CV comments corrected (Karlsborg is an inland fortress); minesweeper class eras added. Answered with sources: legacy HEROES persons (section above). Kept on judgment: CA Svea / Göta vs BB Svealand / Götaland (distinct realm names); K/C spelling variants (Klas Horn, Claes Uggla, Clas Fleming) follow each figure's attested form; borderline single words (Ran, Vale, Hel, Mars, Saga, Lom) are authentic proper names.

## Remaining WARNs
None expected after the docs sync.
