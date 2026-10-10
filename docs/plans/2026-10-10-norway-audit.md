# Norway (NOR) Namelist Audit - 2026-10-10

File: `common/units/names_ships/NOR_ship_names.txt`

## Initial report (`-Audit NOR`)
- AUDIT SUMMARY NOR: FAIL=4 WARN=10 INFO=4
- [FAIL] CrossClass CA/BB : Norge, Olav Tryggvason, Magnus Barfot, Sverre Sigurdsson, Harald Hardråde
- [FAIL] CrossClass CL/CV : Albatross
- [FAIL] CrossClass CA/BC : Mjølner, Erling Skjalgsson, Einar Tambarskjelve
- [FAIL] CrossClass CL/CA : Nidaros
- [WARN] CrossClassVariant CA/BB : Harald Haarfagre ~ Harald Hårfagre, Håkon den Gode ~ Haakon den Gode
- [WARN] Depth VIRTUES : 27 names; target 35 (floor 20 met)
- [WARN] Depth FJORDS : 30 names; target 35 (floor 20 met)
- [WARN] Depth BIRDS : 28 names; target 35 (floor 20 met)
- [WARN] Depth HEROES : 27 names; target 35 (floor 20 met)
- [WARN] Depth RULERS : 32 names; target 35 (floor 20 met)
- [WARN] Depth NATURE : 27 names; target 35 (floor 20 met)
- [WARN] Depth FISH : 30 names; target 35 (floor 20 met)
- [WARN] Depth FAUNA : 24 names; target 35 (floor 20 met)
- [WARN] DocsWikiSamples - : Wiki sample names not in their group: HEROES: C.A. Larsen
- [INFO] CrossClassPerson BB/BC : Hålogaland ~ Ottar fra Hålogaland
- [INFO] CrossClassPerson CL/BB : St. Olaf ~ Kronprins Olav
- [INFO] CrossClassPerson CA/BB : Norge ~ Nord-Norge
- [INFO] PlanFile - : No docs/plans/*-norway-*.md (create one with -AuditPlan NOR before review)
- Found on manual review (Phase A triage, 2(b) / 2(b′) read-through of every group):
  - **Same person or name under two forms, missed by the script**
    - CA/BB: *Sigurd Jorsalfare* ~ *Sigurd Jorsalfar* (spelling variant).
    - CL/BB(/CA): *Kong Sverre* and *Sverre* (CL) ~ *Sverre Sigurdsson* (CA, BB); *St. Olaf* (CL) ~ *Olav den Hellige* (BB).
    - CA/BB exonym: *Norge* ~ *Norvegia* (Latin form of the same name).
    - In-group: CA *Tordenskjold* ~ *Tordenskiold* ~ *Peter Wessel* (one man, three entries); HEROES *Peter Wessel Tordenskiold* ~ *Peder Tordenskjold*; DD *Heimdal* ~ *Heimdall* and *Troll* ~ *Trold*; BC *Ormen Skamme* ~ *Ormen Korte* (one ship, two translations of *Ormr inn skammi*); BIRDS *Ravn* ~ *Korp* and *Havsule* ~ *Sule*.
  - **Wrong person under a heroic label**: *Torstein Knarresmed* (BC, HEROES) is the shipwright who wounded St. Olaf at Stiklestad, not a navigator or sea-hero; the intended figure is *Torberg Skavhogg*, stem-smith of Ormen Lange. *Thomas von Westen* (HEROES, "naval commanders") was a missionary priest. *Christian Radich* (HEROES, "naval commanders") was a merchant and benefactor.
  - **Not Norwegian**: *Ragnar Lodbrok* (CA, RULERS) and *Bjørn Jernside* (BC, HEROES) are legendary Danish/Swedish kings; *Henrik Gerner* (CA, HEROES) and *Hans Birch Dahlerup* (HEROES) are Copenhagen-era Danes with no Norwegian birth or command; CL *St. Thomas* and *Gefion* look like Royal Danish Navy vessels (research).
  - **Unattested coinages**: BC *Dauðahøgg* (hybrid ð + ø, no such legendary weapon), SS *Varang* and *Votna* (mimic the British V-class names, never RNoN boats), FJORDS *Ryfylkefjord* (no such fjord), NATURE *Polarbris*; BC *Håkonssuda* unplaced (research).
  - **Foreign or wrong-language forms**: BIRDS *Strømand* (Danish; Norwegian is *harlekinand*), FAUNA *Valrossen* (Swedish; Bokmål *hvalross*), DD *Lax* (ship was *Laks*; also reads as English "lax"), FJORDS *Saltenfjorden* / *Namsfjorden* (the fjords are Saltfjorden / Namsenfjorden).
  - **Orthography drift**: Haakon / Håkon and Jorsalfar / Jorsalfare mixed across CA, BB, RULERS; BC saga ships mix *-suda* (and Icelandic *Ó*) with *-suden*; Old Norse or English forms of mythic names (*Freyr*, *Freyja*, *Gungnir*, *Skinfaxi*, *Hildr* ...) beside Norwegian ones (*Balder*, *Mjølner*, *Magne*); FJORDS mixes definite *-fjorden* with indefinite *-fjord*; FAUNA mixes definite and indefinite.
  - **Display names vs content**: "Birds of Prey" holds seabirds, divers and ducks; "Aquatic Life & Fish" holds only fish; "Fauna & Predators" holds elk, deer, beaver and seals; "Nature & Tempests" holds weather, sea-state and sky phenomena only. FAUNA fallback `Rovdyr %d` ("predator") has the same mismatch.
  - *Albatross* (CL/CV collision): no RNoN precedent found for a cruiser-type vessel; not a raptor either, but fits the carrier's ocean-flyer theme.
  - *VIRTUES* *Bane* is not a virtue (and reads as English "bane").
  - **English homonyms with no RNoN precedent** (whole-file pass): CV *Mist*; DD *Mode*, *Brim*, *Skate*; SS *Ran*, *Grip*; MYTHOLOGY *Ran*, *Mode*; BC *Gram*; NATURE *Brim*.
  - CA *Heimdall* is the 1892 patrol ship under the god's spelling; the ship was *Heimdal*.

## User decisions
Made by the orchestrator on the user's behalf (no interactive checkpoint in this run):
- **Depth**: top all eight thin pools (VIRTUES, FJORDS, BIRDS, HEROES, RULERS, NATURE, FISH, FAUNA) up to 35+ wherever real, verifiable material exists; RULERS and HEROES take individually verifiable persons only; where honest scope cannot reach 35, keep the shorter list and justify the WARN.
- `VanillaPrefix` and `ThemeCount` did not fire; no question needed.

Made by the auditing agent on the user's behalf (conservative option per `CLAUDE.md`), Phase A:
- **Orthography convention** (see Rationale): (1) a name an actual RNoN ship bore keeps that ship's spelling; (2) every other name takes the modern Norwegian standard form (Store norske leksikon headword); (3) *Haakon VII* keeps the king's own regnal spelling.
- **Scope of persons**: only figures who ruled Norway, were born in Norway, or belong to the Norwegian saga tradition. Legendary Danish/Swedish kings and union-era Danes are dropped rather than respelled.
- **Display names**: BIRDS "Birds", FISH "Fish", FAUNA "Wildlife" (fallback `Villdyr %d`), NATURE "Natural Phenomena". "Norse Mythology" kept ("Norse" names the mythology, not the nation; same as SWE and DEN).
- **FJORDS** normalized to the indefinite ship-name form (*Stavangerfjord*, *Oslofjord*, *Trollfjord* convention of Norwegian liners, coastal steamers and ferries); **FAUNA** normalized to the definite form its majority already uses (the Dano-Norwegian *Ørnen* / *Skorpionen* tradition).
- **HEROES era scope**: heroes of 1940–45 are admissible (six naval officers, plus the commando leader Martin Linge and the saboteur Max Manus), since the file already carried Birger Eriksen and post-war ship classes.
- **Research in two budgeted dispatches** (persons; ships, saga vessels, mythic forms and roles), because the backlog needing a source exceeded one dispatch.

Made by the orchestrator on the user's behalf after the research (Phase B rulings):
- **Unverified entries are dropped, not parked**: the Author confirmation section stays empty.
- **Era scope accepted**: the file already carried post-war classes, *Helge Ingstad* and *Thor Heyerdahl* are names the navy itself gave frigates, and the 1940–45 officers fall inside the game's timeframe. The scope is stated in the wiki scope notes.
- **Persons**: all fourteen low-confidence HEROES candidates pass in the researcher's forms (*Leif Welding Olsen*, *Kristoffer Trondsson Rustung*, *Ingolv Arnesson*); the eleven high-confidence ones are accepted as well documented; *Torberg Skavhogg* is kept in that form. RULERS takes the eleven standard-list rulers plus the optional *Håkon Magnusson Toresfostre*; the spares *Halvdan Svarte* and *Skule Bårdsson* are not used.
- **Ships**: CL keeps *Ørnen* and drops *St. Thomas* and *Gefion*; DD drops *Trold* and adds *Varg*; *Lougen* and *Glommen* stay as the 1864 gunboats; SS drops *Varang* and *Votna*, adds *Knerter*, and keeps *Utstein*, *Uthaug* and *Utvær*.
- **Saga ships and swords**: drop *Håkonssuda* and *Draken*; keep *Reinen*, *Skjoldmøya*, *Erkesuden*; use the *-suden* forms; add *Kvernbit* and *Leggbit* (Norwegian form, not the English translation's "Legbit"); legacy swords are respelled only where the Norwegian form is certain. (The review later dropped *Reinen*, *Skjoldmøya* and *Krossuden* and added *Gorsuden* and *Raudsuden*; see Review.)
- **Valkyries and sun-horses**: keep only names with a defensible Norwegian form; drop the rest without refill.
- **English homonyms**: a name an RNoN vessel actually bore stays (recorded under Kept on judgment); a homonym with no such precedent gets a qualified form or goes.
- **Role pools**: minelayers skipped; `NOR_MINESWEEPERS` created from the verified river names, without *Alta* (hard collision with CL).

## Research
Two budgeted `isne-audit-researcher` dispatches, run in parallel by the orchestrator (web-call counts were not relayed with the reports).
- **Dispatch 1, named persons**: all HEROES candidates and the RULERS additions. Main sources: Store norske leksikon (SNL), lokalhistoriewiki.no, English Wikipedia biographies, uboat.net (Allied commanders), the Fram Museum, Heimskringla (Olav Tryggvason's saga, translation excerpts).
- **Dispatch 2, ships, saga vessels, mythic forms and roles**. Main sources: English Wikipedia "List of Royal Norwegian Navy ships", "HNoMS Kong Sverre", "Glommen-class minelayer" and the Hakon Adelsteen Sommerfeldt biography; navypedia (Norwegian submarines, Knerter); uboat.net (U-4706); axelnelson.com "Skipsnavn fra Vikingtiden og Middelalderen" (the only saga-ship source that could be fetched: popular, single-source); thingsites.com (Gulatinget, *Kvernbit*); Heimskringla, Magnus Barefoot's saga; Norwegian Wikipedia "Valkyrje".
- Limits the researchers reported: no SNL headword for *Torberg Skavhogg*, *Henrik Bjelke*, *Jochum Nicolay Müller*, *Svein Jarl* or *Odd Isaachsen Willoch* (each sourced elsewhere, see Persons verified); the saga-ship attributions rest on one popular site (the review re-checked them against Norwegian Wikipedia, see Review); no explicit statement of the minesweepers' river formula, though the pattern is evident across three classes in the navy list.

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| DD_HISTORICAL | 134 -> 129 | Ålesund, Laks, Varg, Forsete | Aalesund, Lax, Skate, Trold, Forseti, Mode, Heimdall, Nidelven, Brim | - |
| SS_HISTORICAL | 80 -> 77 | Knerter | Varang, Votna, Grip, Ran | - |
| CL_HISTORICAL | 77 -> 69 | - | St. Olaf (to BB_HISTORICAL), Albatross, Kong Sverre (to BB_HISTORICAL), Sverre, St. Thomas, Nidaros, Najaden, Gefion | - |
| CA_HISTORICAL | 45 -> 42 | Heimdal, Håkon Jarl, Helge Ingstad, Thor Heyerdahl, Hjalmar Riiser-Larsen, Kristiansten, Munkholmen, Fredriksvern, Karljohansvern, Christiansholm, Kongsten | Heimdall, Haakon Jarl, Olav Tryggvason, Erling Skjalgsson, Einar Tambarskjelve, Håkon den Gode (to RULERS), Magnus Barfot, Sigurd Jorsalfare (to RULERS), Sverre Sigurdsson, Harald Hardråde, Ragnar Lodbrok, Peter Wessel, Tordenskiold, Henrik Gerner | - |
| BB_HISTORICAL | 51 -> 48 | St. Olaf (from CL_HISTORICAL), Kong Sverre (from CL_HISTORICAL), Håkon Håkonsson, Håkon den Gode (from CA_HISTORICAL), Sigurd Jorsalfare (from CA_HISTORICAL), Håkon V Magnusson, Håkon Sverresson | Norge, Norvegia, Harald Hårfagre, Olav den Hellige, Sverre Sigurdsson, Haakon Haakonsson, Haakon den Gode, Sigurd Jorsalfar, Haakon V Magnusson, Haakon Sverresson | - |
| BC_HISTORICAL | 37 -> 42 | Mariasuden, Kristsuden, Olavssuden, Gorsuden, Raudsuden, Gungne, Skibladner, Draupne, Kvernbit, Leggbit, Leiv Eiriksson, Torberg Skavhogg, Torfinn Karlsevne, Hafrsfjord, Hjørungavåg, Svolder, Nesjar, Fimreite, Holmengrå, Florvåg, Niså, Dynekilen, Alvøen, Lyngør | Mariasuda, Korssuda, Kristsuda, Ormen Korte, Håkonssuda, Ólavssuda, Reinen, Skjoldmøya, Draken, Gungnir, Mjølner, Gram, Dauðahøgg, Skidbladnir, Draupnir, Leif Eiriksson, Torstein Knarresmed, Thorfinn Karlsefni, Bjørn Jernside | - |
| CV_HISTORICAL | 46 -> 38 | Gøndul, Hild, Gunn, Rådgrid, Skinfakse, Rimfakse, Gullfakse | Gondul, Hildr, Sigrdrifa, Kåra, Rota, Gunnr, Herfjotur, Radgrid, Geirskogul, Mist, Skinfaxi, Rimfaxi, Gullfaxi, Alsvid, Arvak | - |
| FJORDS | 30 -> 41 | Vestfjord, Porsangerfjord, Tanafjord, Altafjord, Ofotfjord, Høgsfjord, Lyngenfjord, Ullsfjord, Saltfjord, Namsenfjord, Storfjord, Gloppefjord, Sørfjord, Fensfjord, Åkrafjord, Jøsenfjord, Hjørundfjord, Aurlandsfjord, Lustrafjord, Fjærlandsfjord, Bjørnafjord, Ranfjord, Tysfjord, Balsfjord, Laksefjord, Trollfjord, Iddefjord | Vestfjorden, Porsangerfjorden, Tanafjorden, Altafjorden, Ofotfjorden, Ryfylkefjord, Lyngenfjorden, Ullsfjorden, Saltenfjorden, Namsfjorden, Storfjorden, Gloppefjorden, Sørfjorden, Fensfjorden, Åkrafjorden, Jøsenfjorden | - |
| RULERS | 32 -> 43 | Håkon den Gode (from CA_HISTORICAL), Håkon Jarl, Sigurd Jorsalfare (from CA_HISTORICAL), Håkon Sverresson, Håkon Håkonsson, Håkon V Magnusson, Eirik Jarl, Svein Jarl, Magnus Haraldsson, Håkon Magnusson Toresfostre, Olav Magnusson, Øystein Haraldsson, Magnus Eriksson, Håkon VI Magnusson, Olav Håkonsson, Christian IV, Christian Frederik, Karl Johan | Haakon den Gode, Haakon Jarl, Sigurd Jorsalfar, Haakon Sverresson, Haakon Haakonsson, Haakon V Magnusson, Ragnar Lodbrok | - |
| HEROES | 27 -> 46 | Henrik Bjelke, Kristoffer Trondsson Rustung, Thomas Fasting, Jochum Nicolay Müller, Hjalmar Riiser-Larsen, Helge Ingstad, Thor Heyerdahl, Olav Bjaaland, Sverre Hassel, Eivind Astrup, Gunnar Isachsen, Colin Archer, Svend Foyn, Leiv Eiriksson, Torberg Skavhogg, Torfinn Karlsevne, Erling Skakke, Ragnvald Mørejarl, Ingolv Arnesson, Naddodd, Odd Isaachsen Willoch, Per Askim, Leif Welding Olsen, Skule Storheill, Thore Horve, Leif Andreas Larsen, Martin Linge, Max Manus | Peder Tordenskjold, Henrik Gerner, Hans Birch Dahlerup, Thomas von Westen, Christian Radich, Leif Eiriksson, Torstein Knarresmed, Thorfinn Karlsefni, Bjørn Jernside | - |
| MYTHOLOGY | 38 -> 40 | Tor, Frøy, Frøya, Forsete, Gungne, Kvase, Skinfakse, Rimfakse, Gullfakse, Draupne, Skibladner, Frigg, Hugin, Munin | Thor, Freyr, Freyja, Forseti, Gungnir, Kvasir, Mode, Skinfaxi, Rimfaxi, Gullfaxi, Draupnir, Skidbladnir | - |
| BIRDS | 28 -> 39 | Tårnfalk, Dvergfalk, Myrhauk, Hornugle, Kattugle, Lappugle, Tjeld, Terne, Storskarv, Toppskarv, Storjo, Svartbak, Alkekonge, Fossekall | Korp, Sule, Strømand | ThemeName 'Birds of Prey' -> 'Birds' |
| FAUNA | 24 -> 37 | Måren, Grevlingen, Røyskatten, Snømusen, Isbjørnen, Hvalrossen, Ringselen, Storkobben, Haverten, Narhvalen, Hvithvalen, Knølhvalen, Kaskelotten, Vågehvalen, Grønlandshvalen, Blåhvalen, Finnhvalen | Røyskatt, Snømus, Isbjørn, Valrossen | ThemeName 'Fauna & Predators' -> 'Wildlife'; Fallback 'Rovdyr %d' -> 'Villdyr %d' |
| FISH | 30 -> 42 | Lyr, Hvitting, Ørret, Røye, Harr, Gjedde, Abbor, Brisling, Størje, Rognkjeks, Berggylt, Blåkveite | - | ThemeName 'Aquatic Life & Fish' -> 'Fish' |
| NATURE | 27 -> 40 | Polarnatt, Brenning, Snøfokk, Rimfrost, Stormkast, Uvær, Skodde, Stjerneskudd, Morgenrøde, Daggry, Mørketid, Malstrøm, Springflo, Isfjell, Drivis | Polarbris, Brim | ThemeName 'Nature & Tempests' -> 'Natural Phenomena'; Fallback 'Natur %d' -> 'Naturfenomen %d' |
| VIRTUES | 27 -> 38 | Kjekk, Traust, Trygg, Stolt, Standhaftig, Årvåken, Ukuelig, Utholdende, Staut, Freidig, Styrke, Troskap | Bane | - |
| MINESWEEPERS | new, 18 | Otra, Rauma, Vinstra, Gaula, Driva, Vorma, Begna, Rana, Sauda, Sira, Tana, Ogna, Vosso, Glomma, Tista, Kvina, Utla, Orkla | - | - |

Unchanged: CITIES, PROVINCES
<!-- END CHANGE TABLE -->

## Rationale
A respelling shows as removed + added in the table above.

### Orthography convention
1. **RNoN-attested ship names keep the ship's own spelling**: *Harald Haarfagre* (1897), *Tordenskjold* (1897), *Eidsvold* (1900), *Thor* (1872), *Thrudvang*, *Frithjof* (1895), *Heimdal* (1892), *Kong Sverre* (frigate launched 1860, in service 1864–1932), *St. Olaf* (frigate designed 1856, in the navy list 1860–1925), *Laks* (1900), *Uller*, *Vale*, *Æger*.
2. **Everything else takes the modern Norwegian standard form** (Store norske leksikon headword). The navy's own inter-war practice supports it: *Olav Tryggvason* (1932), *Tor* (1939), the Ålesund class (1939). Hence *Håkon* for every medieval king and jarl, *Sigurd Jorsalfare*, *Leiv Eiriksson*, *Torfinn Karlsevne*, *-suden* for the saga ships, and Norwegian forms of mythic names (*Frøy*, *Frøya*, *Tor*, *Forsete*, *Gungne*, *Draupne*, *Skibladner*, *Skinfakse* ...). Kept on purpose: *Skadi* (the standard form *Skade* is the Norwegian word for "damage"), *Idun*, *Ægir*, *Fenris* (all current in Norwegian). Where no Norwegian form could be confirmed, a person-free legacy entry either keeps its form (*Skofnung*, *Misteltein*, *Hrist*; *Tyrfing* is itself the Norwegian Wikipedia headword) or, in CV with depth to spare, is dropped.
3. ***Haakon VII*** keeps the king's own regnal spelling, which the navy used for its ships (1942, 1958).

### Edits per group
- **Cross-class (prescribed)**: CA keeps the real coastal-defence ships *Norge*, *Harald Haarfagre*, *Nidaros* and the monitor *Mjølner*; BB keeps the kings *Olav Tryggvason*, *Magnus Barfot*, *Harald Hardråde*, *Håkon den Gode*, *Sigurd Jorsalfare* and takes *Kong Sverre* and *St. Olaf* in their RNoN forms (replacing *Sverre Sigurdsson* and *Olav den Hellige*); BC keeps the saga sea-heroes *Erling Skjalgsson* and *Einar Tambarskjelve*; CV keeps *Albatross*.
- **DD** 134 → 129: remove *Heimdall* (variant of the real *Heimdal*), *Trold* (never a ship of its own; replaced by the torpedo boat *Varg*, 1894), *Nidelven* (the union-era brig never passed into Norwegian service; not in the RNoN list) and the homonyms *Mode*, *Brim*, *Skate*; respell *Aalesund* → *Ålesund*, *Lax* → *Laks*, *Forseti* → *Forsete*. *Lougen* and *Glommen* stay as the 1864 steam gunboats.
- **SS** 80 → 77: remove the coinages *Varang* and *Votna* and the homonyms *Ran* and *Grip*; add *Knerter* (ex-U-4706, commissioned October 1948). *Utstein*, *Uthaug* and *Utvær* stay: the ex-British V-class boats transferred in 1946.
- **CL** 77 → 69: remove *St. Olaf* and *Kong Sverre* (both move to BB), bare *Sverre* (duplicate of the same king), *Nidaros* (CA keeps it), *Albatross* (CV keeps it), the Danish *St. Thomas* and *Gefion* (not in the RNoN list), and *Najaden* (the Dano-Norwegian frigate built in Copenhagen and destroyed at Lyngør in 1812; it never served Norway after 1814, the same criterion). *Ørnen* stays (corvette, 1829–1874).
- **CA** 45 → 42: respell *Heimdall* → *Heimdal* (the 1892 ship's spelling); remove *Olav Tryggvason*, *Magnus Barfot*, *Sverre Sigurdsson*, *Harald Hardråde*, *Håkon den Gode*, *Sigurd Jorsalfare*, *Erling Skjalgsson*, *Einar Tambarskjelve*, *Peter Wessel*, *Tordenskiold*, *Ragnar Lodbrok*, *Henrik Gerner*; rename *Haakon Jarl* → *Håkon Jarl*; add fortresses *Kristiansten*, *Munkholmen*, *Fredriksvern*, *Karljohansvern*, *Christiansholm*, *Kongsten* and explorers *Helge Ingstad*, *Thor Heyerdahl*, *Hjalmar Riiser-Larsen* (Fridtjof Nansen-class precedent).
- **BB** 51 → 48: remove *Norge*, *Harald Hårfagre*, *Norvegia*; rename *Sverre Sigurdsson* → *Kong Sverre*, *Olav den Hellige* → *St. Olaf*, *Haakon Haakonsson* → *Håkon Håkonsson*, *Haakon den Gode* → *Håkon den Gode*, *Sigurd Jorsalfar* → *Sigurd Jorsalfare*, *Haakon V Magnusson* → *Håkon V Magnusson*, *Haakon Sverresson* → *Håkon Sverresson*. *Olav Tryggvason* stays in BB, since no minelayer pool was created.
- **BC** 37 → 42: remove *Ormen Korte*, *Mjølner*, *Dauðahøgg*, *Bjørn Jernside*, *Håkonssuda* (unverified), *Draken* (a ship type; a proper name in one popular source only), *Reinen*, *Skjoldmøya* and *Korssuda* (each attested on one popular site only; dropped in the review) and *Gram* (English homonym); rename *Mariasuda* → *Mariasuden*, *Kristsuda* → *Kristsuden*, *Ólavssuda* → *Olavssuden*, *Gungnir* → *Gungne*, *Draupnir* → *Draupne*, *Skidbladnir* → *Skibladner*, *Leif Eiriksson* → *Leiv Eiriksson*, *Thorfinn Karlsefni* → *Torfinn Karlsevne*, *Torstein Knarresmed* → *Torberg Skavhogg*; add the saga ships *Gorsuden* and *Raudsuden* (Norwegian Wikipedia, the list of *suder* in the article "Mariasuden"), the royal swords *Kvernbit* (attested through Håkon den Gode's saga) and *Leggbit* (Magnus Barfot; the old Norwegian Heimskringla translation on no.wikisource reads "et meget skarpt Sverd, der kaldtes Leggbit") and, per BC doctrine, the decisive naval battles *Hafrsfjord*, *Hjørungavåg*, *Svolder*, *Nesjar*, *Fimreite*, *Holmengrå*, *Florvåg*, *Niså*, *Dynekilen*, *Alvøen*, *Lyngør*. *Erkesuden* stays: Norwegian Wikipedia attributes it to Nikolas Kuvung (built before 1175). *Tyrfing* keeps its legacy form, which is the Norwegian Wikipedia headword; *Skofnung* and *Misteltein* are left as they were.
- **CV** 46 → 38: respell *Skinfaxi* → *Skinfakse*, *Rimfaxi* → *Rimfakse*, *Gullfaxi* → *Gullfakse*, *Hildr* → *Hild*, *Gunnr* → *Gunn*, *Gondul* → *Gøndul*, *Radgrid* → *Rådgrid*; remove the valkyries left without a confirmed Norwegian form (*Sigrdrifa*, *Geirskogul*, *Kåra*, *Rota*, *Herfjotur*), the sun-horses *Alsvid* and *Arvak* for the same reason, and *Mist* (English homonym). No refill: the group stays above target.
- **RULERS** 32 → 43: remove *Ragnar Lodbrok*; the same Håkon / Jorsalfare renames as BB plus *Haakon Jarl* → *Håkon Jarl*; add from the standard regnal list *Eirik Jarl*, *Svein Jarl*, *Magnus Haraldsson*, *Håkon Magnusson Toresfostre*, *Olav Magnusson*, *Øystein Haraldsson*, *Magnus Eriksson*, *Håkon VI Magnusson*, *Olav Håkonsson*, *Christian IV*, *Christian Frederik*, *Karl Johan*. The spares *Halvdan Svarte* (petty king, unverified) and *Skule Bårdsson* (pretender) were not used.
- **HEROES** 27 → 46: remove *Peder Tordenskjold*, *Henrik Gerner*, *Hans Birch Dahlerup*, *Thomas von Westen*, *Christian Radich*, *Bjørn Jernside*; rename *Leif Eiriksson* → *Leiv Eiriksson*, *Thorfinn Karlsefni* → *Torfinn Karlsevne*, *Torstein Knarresmed* → *Torberg Skavhogg*; add naval commanders *Henrik Bjelke*, *Kristoffer Trondsson Rustung*, *Thomas Fasting*, *Jochum Nicolay Müller*; explorers and maritime pioneers *Hjalmar Riiser-Larsen*, *Helge Ingstad*, *Thor Heyerdahl*, *Olav Bjaaland*, *Sverre Hassel*, *Eivind Astrup*, *Gunnar Isachsen*, *Colin Archer*, *Svend Foyn*; saga figures *Erling Skakke*, *Ragnvald Mørejarl*, *Ingolv Arnesson*, *Naddodd*; and a new 1940–45 section with *Odd Isaachsen Willoch*, *Per Askim*, *Leif Welding Olsen*, *Skule Storheill*, *Thore Horve*, *Leif Andreas Larsen*, *Martin Linge*, *Max Manus*.
- **MYTHOLOGY** 38 → 40: remove the English homonym *Mode* (*Ran* stays, see Kept on judgment); add *Frigg*, *Hugin*, *Munin*; rename *Thor* → *Tor*, *Freyr* → *Frøy*, *Freyja* → *Frøya*, *Forseti* → *Forsete*, *Gungnir* → *Gungne*, *Kvasir* → *Kvase*, *Skinfaxi* → *Skinfakse*, *Rimfaxi* → *Rimfakse*, *Gullfaxi* → *Gullfakse*, *Draupnir* → *Draupne*, *Skidbladnir* → *Skibladner*.
- **BIRDS** 28 → 39, display "Birds": remove *Korp*, *Sule*, *Strømand*; add *Tårnfalk*, *Dvergfalk*, *Myrhauk*, *Hornugle*, *Kattugle*, *Lappugle*, *Tjeld*, *Terne*, *Storskarv*, *Toppskarv*, *Storjo*, *Svartbak*, *Alkekonge*, *Fossekall*.
- **FAUNA** 24 → 37, display "Wildlife", fallback `Villdyr %d`: rename *Røyskatt* → *Røyskatten*, *Snømus* → *Snømusen*, *Isbjørn* → *Isbjørnen*, *Valrossen* → *Hvalrossen*; add *Måren*, *Grevlingen*, *Ringselen*, *Storkobben*, *Haverten*, *Narhvalen*, *Hvithvalen*, *Knølhvalen*, *Kaskelotten*, *Vågehvalen*, *Grønlandshvalen*, *Blåhvalen*, *Finnhvalen*.
- **FISH** 30 → 42, display "Fish": add *Lyr*, *Hvitting*, *Ørret*, *Røye*, *Harr*, *Gjedde*, *Abbor*, *Brisling*, *Størje*, *Rognkjeks*, *Berggylt*, *Blåkveite*.
- **NATURE** 27 → 40, display "Natural Phenomena", fallback `Naturfenomen %d` (was `Natur %d`): replace *Polarbris* with *Polarnatt* and *Brim* (English homonym) with *Brenning*; add *Snøfokk*, *Rimfrost*, *Stormkast*, *Uvær*, *Skodde*, *Stjerneskudd*, *Morgenrøde*, *Daggry*, *Mørketid*, *Malstrøm*, *Springflo*, *Isfjell*, *Drivis*.
- **VIRTUES** 27 → 38: remove *Bane*; add *Kjekk*, *Traust*, *Trygg*, *Stolt*, *Standhaftig*, *Årvåken*, *Ukuelig*, *Utholdende*, *Staut*, *Freidig*, *Styrke*, *Troskap*.
- **FJORDS** 30 → 41: rename to the indefinite form *Vestfjord*, *Porsangerfjord*, *Tanafjord*, *Altafjord*, *Ofotfjord*, *Lyngenfjord*, *Ullsfjord*, *Storfjord*, *Gloppefjord*, *Sørfjord*, *Fensfjord*, *Åkrafjord*, *Jøsenfjord*; *Saltenfjorden* → *Saltfjord*, *Namsfjorden* → *Namsenfjord*, *Ryfylkefjord* → *Høgsfjord*; add *Hjørundfjord*, *Aurlandsfjord*, *Lustrafjord*, *Fjærlandsfjord*, *Bjørnafjord*, *Ranfjord*, *Tysfjord*, *Balsfjord*, *Laksefjord*, *Trollfjord*, *Iddefjord*.
- **MINESWEEPERS** (new role pool, 18): *Otra*, *Rauma* (1939); *Vinstra*, *Gaula*, *Driva*, *Vorma*, *Begna*, *Rana* (NYMS type); *Sauda*, *Sira*, *Tana*, *Ogna*, *Vosso*, *Glomma*, *Tista*, *Kvina*, *Utla* (Sauda class); *Orkla* (Alta class, 1996; added in the review). All rivers, all from the RNoN ship list. *Alta* is left out because CL holds the town.
- **CITIES**, **PROVINCES**: no change.
- **Section comments**: DD "Aalesund class" → "Ålesund class"; BB "Sovereign symbols & modern royalty" → "Modern royal house"; HEROES "Famous polar explorers & navigators" → "Polar explorers, navigators & maritime pioneers"; FAUNA "Semi-aquatic mammals & pinnipeds" → "Marine & semi-aquatic mammals".

## Persons verified
Every person the file keeps after the audit. "Well documented" marks national figures the researcher was told not to look up; "R1" / "R2" mark the two research dispatches. DD, SS, CV, MYTHOLOGY and the noun pools carry no persons (mythic beings there are attested Eddic names).

- **CA** (16)
  - Ship names of the navy: *Tordenskjold* (Peter Wessel Tordenskiold, 1690–1720; coastal defence ship 1897) and *Harald Haarfagre* (Harald Hårfagre; coastal defence ship 1897): well documented.
  - *Håkon Jarl* (Håkon Sigurdsson Ladejarl), *Øystein Magnusson* (king 1103–1123): well documented.
  - *Ivar Huitfeldt* (born Halden 1665), *Cort Adeler* (born Brevik 1622), *Jens Munk* (born Barbu 1579), *Birger Eriksen* (Oscarsborg, 1940): well documented.
  - *Roald Amundsen*, *Fridtjof Nansen*, *Otto Sverdrup*, *C.A. Larsen* (Carl Anton Larsen), *Carsten Borchgrevink*, *Hjalmar Riiser-Larsen*: well documented. *Helge Ingstad*, *Thor Heyerdahl*: well documented; both are Fridtjof Nansen-class frigate names.
  - Not counted as persons: *Frithjof* is the 1895 gunboat (named for the saga hero Fridtjov), *Thor*, *Gor* and *Thrudvang* are mythic ship names of the navy.
- **BB** (18)
  - *Haakon VII*, *Dronning Maud*, *Kronprins Olav*, *Kronprinsesse Märtha*: the royal house in 1936, well documented.
  - *Olav Tryggvason*, *Håkon Håkonsson*, *Magnus Lagabøte*, *Eirik Blodøks*, *Håkon den Gode*, *Magnus den Gode*, *Sigurd Jorsalfare*, *Harald Hardråde*, *Magnus Barfot*, *Håkon V Magnusson*, *Håkon Sverresson*, *Dronning Margrete*: standard regnal list, well documented.
  - *St. Olaf* (Olav II Haraldsson, in the frigate's spelling): R2, Wikipedia "List of Royal Norwegian Navy ships" (frigate "St Olaf", 1860–1925). *Kong Sverre* (Sverre Sigurdsson, in the frigate's form): R2, Wikipedia "HNoMS Kong Sverre" (launched at Horten 1860, in service 1864–1932).
- **BC** (10)
  - *Leiv Eiriksson*, *Eirik Raude*, *Torfinn Karlsevne* (Vinland sagas); *Erling Skjalgsson*, *Einar Tambarskjelve*, *Bjørn Farmann*, *Gange-Rolv*, *Harald Grenske* (Heimskringla); *Ottar fra Hålogaland* (his own account at King Alfred's court): well documented saga figures.
  - *Torberg Skavhogg*: R1, Heimskringla, Olav Tryggvason's saga: he had charge of the stem and stern of Ormen Lange. No SNL headword exists, but the reviewer found exactly this spelling in Norwegian Bokmål Wikipedia ("Ormen Lange", "Båtbygging") and Nynorsk Wikipedia, both naming him as the longship's builder.
- **CL** (1): *Desideria*, queen of Norway and Sweden 1818–1844 and the name of an RNoN frigate: well documented.
- **RULERS** (43)
  - Legacy (31): *Haakon VII*, *Dronning Maud*, *Kronprins Olav*, *Harald Hårfagre*, *Eirik Blodøks*, *Håkon den Gode*, *Harald Gråfell*, *Håkon Jarl*, *Olav Tryggvason*, *Olav den Hellige*, *Svein Knutsson* (Svein Alfivason, 1030–1035), *Magnus den Gode*, *Harald Hardråde*, *Olav Kyrre*, *Magnus Barfot*, *Sigurd Jorsalfare*, *Øystein Magnusson*, *Inge Krokrygg*, *Sverre Sigurdsson*, *Håkon Sverresson*, *Inge Bårdsson*, *Håkon Håkonsson*, *Magnus Lagabøte*, *Eirik Prestehater* (Eirik II Magnusson), *Håkon V Magnusson*, *Dronning Margrete*, *Harald Gille*, *Magnus Blinde*, *Sigurd Munn*, *Magnus Erlingsson*, *Håkon Herdebrei*: standard regnal list and royal house, well documented.
  - Added: *Eirik Jarl* (R1, SNL "Eirik jarl": ruled c. 1000–1015); *Svein Jarl* (R1, lokalhistoriewiki "Svein Håkonsson": earl until Nesjar 1016); *Håkon Magnusson Toresfostre* (R1, SNL headword: king 1093–95); *Håkon VI Magnusson* (R1, SNL "Håkon 6. Magnusson": king 1355–80); *Magnus Eriksson* (R1, lokalhistoriewiki: 1316–1374, king from 1319); *Olav Håkonsson* (R1, SNL: Olav IV, 1370–1387); *Magnus Haraldsson*, *Olav Magnusson*, *Øystein Haraldsson*, *Christian IV*, *Christian Frederik*, *Karl Johan*: standard regnal list, well documented.
- **HEROES** (46)
  - Legacy (21): *Peter Wessel Tordenskiold*, *Ivar Huitfeldt*, *Cort Adeler*, *Birger Eriksen*, *Jens Munk*, *Roald Amundsen*, *Fridtjof Nansen*, *Otto Sverdrup*, *Carsten Borchgrevink*, *Carl Anton Larsen*, *Helmer Hanssen*, *Oscar Wisting*, *Hjalmar Johansen*, *Leiv Eiriksson*, *Eirik Raude*, *Einar Tambarskjelve*, *Erling Skjalgsson*, *Torfinn Karlsevne*, *Ottar fra Hålogaland*, *Gange-Rolv*: well documented. *Torberg Skavhogg*: as under BC.
  - Added, well documented: *Hjalmar Riiser-Larsen*, *Helge Ingstad*, *Thor Heyerdahl*, *Olav Bjaaland*, *Sverre Hassel*, *Colin Archer*, *Svend Foyn*, *Martin Linge*, *Max Manus*, *Erling Skakke*; *Leif Andreas Larsen* (R1, SNL: "Shetlands-Larsen", born Bergen 1906).
  - Added, sourced by R1:
    - *Odd Isaachsen Willoch*: lokalhistoriewiki and Wikipedia: captain of Eidsvold, killed at Narvik 9 April 1940.
    - *Per Askim*: SNL: captain of Norge at Narvik 1940.
    - *Leif Welding Olsen*: SNL headword (no hyphen): captain of Pol III, killed in the invasion night 1940.
    - *Skule Storheill*: SNL; uboat.net: commanded Stord 1943–44, North Cape action, later vice admiral.
    - *Thore Horve*: SNL; lokalhistoriewiki: commanded Draug 1939–40, head of the navy 1946–51.
    - *Henrik Bjelke*: lokalhistoriewiki: born Elingård, Onsøy 1615; Admiral of the Realm 1662–79.
    - *Kristoffer Trondsson Rustung*: SNL headword: Norwegian noble, c. 1500–1564, privateer and admiral.
    - *Thomas Fasting*: SNL: born Vanse 1769; led the gunboat flotilla 1814, head of the Navy Department and minister 1815–39.
    - *Jochum Nicolay Müller*: Wikipedia; lokalhistoriewiki "Müller (slekt)": born Trondheim 1775, vice admiral in the Norwegian navy. Spelling "Nicolay" follows the biography; the family page has "Nicolai".
    - *Eivind Astrup*: SNL: born Christiania 1871, Peary's Greenland expeditions.
    - *Gunnar Isachsen*: SNL; Fram Museum: second Fram expedition, Svalbard, Norvegia 1930–31.
    - *Ingolv Arnesson*: SNL headword: first settler of Iceland, born in Norway c. 845.
    - *Naddodd*: SNL: Norwegian Viking who found Iceland c. 860.
    - *Ragnvald Mørejarl*: SNL: jarl of Møre, d. c. 900, father of Gange-Rolv.

## Author confirmation
None. Entries that could not be sourced were dropped (*Håkonssuda*, *Draken*, *Reinen*, *Skjoldmøya*, *Krossuden*, *Halvdan Svarte* as a candidate, the valkyries and sun-horses without a confirmed Norwegian form).

## Kept on judgment
- **WARN `Depth` MINESWEEPERS, 18 of 20**: the pool holds the 18 river names verified in the navy list across four classes (Otra class, NYMS type, Sauda class, and *Orkla* of the Alta class). *Alta* itself stays out (CL collision). Role pools are never padded (`CLAUDE.md` §2C), and 18 clears the minor-navy minimum of 10.
- **INFO `CrossClassPerson` BB/BC *Hålogaland* ~ *Ottar fra Hålogaland***: a region and a man named for it. **CA/BB *Norge* ~ *Nord-Norge***: the country and one of its regions.
- **BB *St. Olaf* and *Kronprins Olav***: different persons (Olav II Haraldsson, d. 1030; the crown prince born 1903).
- **Hull form vs pool form of one king**: CA *Harald Haarfagre*, BB *St. Olaf* and *Kong Sverre* are the navy's own ship spellings; RULERS keeps the modern forms *Harald Hårfagre*, *Olav den Hellige*, *Sverre Sigurdsson*. Pools sit outside the cross-class set, and the difference follows convention rules 1 and 2.
- **English homonyms kept because an RNoN vessel bore the name**: *Rose*, *Bath* (also *Lincoln*, *Newport*, *Mansfield*, *St. Albans*: British-named ships the navy commissioned in 1940–45), *Blink*, *Brand*, *Storm*, *Jo*, *Nor*, *Tor*, *Vale*, *Viking*.
- **Other English look-alikes kept**: *Moss* (CL, CITIES) is a city and has naval precedent of its own (HNoMS Moss, launched 1840–45); *Frost*, *Kraken* and *Aurora* mean the same in English, so nothing reads as a placeholder.
- ***Ran*** (MYTHOLOGY only): the sea goddess is a naval staple, no qualified Norwegian form exists, and `CLAUDE.md` §3 prefers keeping an authentic entry over dropping it. It stays out of SS.
- ***Tapper*** (DD, VIRTUES): the standard Norwegian adjective for "brave", sitting among similar adjectives; no naval precedent is claimed.
- **Shared names between DD and CA** (*Vidar*, *Uller*, *Vale*, *Brage*, *Heimdal*): legacy overlap of real gunboat and patrol-ship names; DD is outside the exclusive cross-class set.
- **Old Norse or Nynorsk forms kept**: *Hrist* (Norwegian Wikipedia "Valkyrje"), *Skofnung*, *Misteltein*, *Skadi*, *Idun*, *Ægir*, *Fenris* (see the convention); CV *Morgonstjerna*, *Aftanstjerna*, *Polstjerna* are valid Nynorsk.
- ***Magnus Barfot***: the traditional Bokmål form, kept beside SNL's *Berrføtt*. **Epithets** stay capitalised (*den Gode*, *den Hellige*) as the file's ship-name style.
- ***Erkesuden***: verified as a ship's name by Norwegian Wikipedia, which attributes it to Nikolas Kuvung (built before 1175), not to Magnus Erlingsson's fleet as the research source had it.
- **Display name "Norse Mythology"**: "Norse" names the mythology, not the nation; SWE and DEN use the same.
## Role pools
| Role | Verdict | Reason |
|---|---|---|
| Minelayers | considered, skipped | No distinct convention: two rivers (*Glommen*, *Laugen*), a goddess (*Frøya*), a king (*Olav Tryggvason*) and the converted gunboats' own mythic names; all 11 verifiable names collide with existing groups (R2) |
| Minesweepers | created: `NOR_MINESWEEPERS` (18) | River names across four classes in the RNoN ship list: *Otra* / *Rauma* (1939), the NYMS type, the Sauda class, and *Orkla* of the Alta class (1996; added in the review). *Alta* left out (CL collision). Fallback `Minesveiper %d` (R2) |
| Escort carriers, light carriers, seaplane tenders | considered, skipped | Norway never operated or planned one |
| Escort destroyers | considered, skipped: covered by DD | Hunt-class names already in DD |
| Corvettes | considered, skipped: covered by DD | Flower- and Castle-class names already in DD |
| Frigates, sloops, avisos | considered, skipped: covered by CL and DD | Sail and steam frigates sit in CL, post-war escort frigates in DD |
| Patrol vessels | considered, skipped: covered by DD | Fishery-protection ships *Nordkapp*, *Senja*, *Heimdal* already in DD; fewer than 10 distinct names remain |
| Torpedo boats, fast attack craft | considered, skipped: covered by DD | 1st- to 3rd-class torpedo boats and the Tjeld / Storm / Hauk MTB series fill five DD sections |
| Scout cruisers, flotilla leaders | considered, skipped | No such class or designation |
| Coastal defence ships, monitors, gunboats | considered, skipped: covered by CA | Panserskip, monitors and Rendel gunboats already in CA |
| Fast battleships, large cruisers, armoured cruisers | considered, skipped | No precedent |
| Submarine sub-types | considered, skipped: covered by SS | A-, B-, U- and V-class and Kobben-class names already in SS |
| Auxiliary cruisers, training ships, icebreakers, submarine tenders, state yachts | considered, skipped | No distinct naval series reaching the floor of 10 names |
## Review
`isne-code-reviewer`, dispatched by the orchestrator after Phase B. **Verdict: approve after two Important fixes; no Critical findings.**

### Confirmed by the reviewer
- The change table matches `-DiffNames NOR` row for row, moves included.
- Every named person in CA, BB, BC, CL, RULERS and HEROES is on Persons verified; spot-checks held (SNL page title "Ingolv Arnesson"; Norwegian Wikipedia articles for Henrik Bjelke, Thomas Fasting, Skule Storheill, Thore Horve, Leif Welding-Olsen, Odd Isaachsen Willoch, Kristoffer Trondsson Rustung).
- Every new noun-pool entry is a correct Norwegian lemma or species name (ord.uib.no, Norwegian Wikipedia); the FJORDS, FAUNA, BIRDS and FISH conventions are consistent; the four new display names fit.
- The mythic respellings are SNL or Norwegian Wikipedia headwords (*Gungne*, *Skibladner*, *Draupne*, *Kvase*, *Rimfakse*, *Forsete*, *Skinfakse*; *Rådgrid* and *Hild* in the valkyrie verse). No pair of spellings of one name survives across CL/CA/BB/BC/CV.
- The minesweeper block, its class comments, the workshop row and bullet, the wiki role section and the Home count of 19 are consistent. The eleven BC battles are real naval encounters.

### Important findings, fixed
1. **CL *Najaden*** removed: the Dano-Norwegian frigate was built in Copenhagen and destroyed at Lyngør in 1812; it is not in the RNoN list and never served Norway after 1814, the criterion that removed *St. Thomas* and *Gefion*.
2. **`NOR_MINESWEEPERS`**: *Orkla* (Alta class, 1996, same RNoN list) added under its own class header. The pool is now 18, and every statement that 17 was the full verified set is corrected (Rationale, Role pools, kept WARN, wiki).

### Minor findings, fixed
3. BC *Tyrving* reverted to *Tyrfing*, the Norwegian Wikipedia headword.
4. BC single-source saga ships *Reinen*, *Skjoldmøya* and *Krossuden* dropped (the ground on which *Draken* and *Håkonssuda* went); *Gorsuden* and *Raudsuden* added from Norwegian Wikipedia's list of *suder*. The *Erkesuden* attribution is corrected to Nikolas Kuvung.
5. NATURE fallback `Natur %d` → `Naturfenomen %d`, to match "Natural Phenomena".
6. DD *Nidelven* removed: the union-era brig did not pass into Norwegian service.
7. MYTHOLOGY *Ran* restored (MYTHOLOGY only) and recorded under Kept on judgment.
8. Plan wording: the Wikipedia attestation for *Torberg Skavhogg*, the no.wikisource line for *Leggbit*, the saga attestation of *Kvernbit*, the HNoMS Moss precedent and the *Tapper* note are now cited.
9. The 1940–45 HEROES section is no longer described as all-naval in the plan or the wiki (Martin Linge was an army commando, Max Manus a saboteur); its header was already neutral.

### Accepted as they are
- The other homonym removals (*Mist*, *Mode*, *Brim*, *Skate*, *Grip*, *Gram*): none had naval precedent or a natural compound.
- *Leif Welding Olsen* without the hyphen (the SNL headword; Norwegian Wikipedia hyphenates, both are attested). *Magnus Barfot* in the traditional form.

### Re-verification after the fixes
- `AUDIT SUMMARY NOR: FAIL=0 WARN=1 INFO=2` (the WARN is the justified `Depth` MINESWEEPERS 18 of 20).
- `-ValidateOnly`: all 16 ship namelist files passed.
- `-Test`: 275 passed, 0 failed.
- Change table refreshed with `-AuditPlan NOR`; wiki samples re-synced with `-SyncWiki NOR`. The wiki is not pushed (the orchestrator pushes once all three audits are done).

