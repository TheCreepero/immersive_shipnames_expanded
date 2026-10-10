# Denmark (DEN) Namelist Audit - 2026-10-10

File: `common/units/names_ships/DEN_ship_names.txt`

## Initial report (`-Audit DEN`)
- AUDIT SUMMARY DEN: FAIL=7 WARN=2 INFO=2
- [FAIL] CrossClass CL/CV : Heimdal, Valkyrien, Thor, Dannebrog
- [FAIL] CrossClass CA/CV : Odin
- [FAIL] CrossClass CA/BC : Lindormen, Holger Danske, Rolf Krake, Roar, Helge, Palnatoke, Starkad
- [FAIL] CrossClass CL/BC : Valkyrien
- [FAIL] CrossClass CA/BB : Niels Juel, Peder Skram, Herluf Trolle, Olfert Fischer, Iver Hvitfeldt, Cort Adeler, Ulrik Gyldenløve
- [FAIL] CrossClass BC/CV : Valkyrien
- [FAIL] CrossClass CL/CA : Absalon, Esbern Snare
- [WARN] Depth STRAITS : 31 names; target 35 (floor 20 met)
- [WARN] Depth HEROES : 34 names; target 35 (floor 20 met)
- [INFO] CrossClassPerson CA/BB : Peder Tordenskiold ~ Tordenskiold
- [INFO] PlanFile - : No docs/plans/*-denmark-*.md (create one with -AuditPlan DEN before review)
- Found on manual review:
  - **Double prefix in fallbacks**: all 8 thematic pools use `"KDM <noun> %d"` under `prefix = "HDMS "`, rendering "HDMS KDM By 1". Vanilla DEN has no `KDM` anywhere (`-InspectVanilla DEN`: `HDMS ` in all 7 groups), and FIN / SWE / NOR use the bare native noun (`Kaupunki %d`, `Stad %d`, `By %d`). Legacy noise.
  - **Display name**: `"National Heroes"` labels a pool that is half scientists, writers and composers.
  - **One eponym under two forms across capital hulls** (not seen by `CrossClass`): CA *Gorm* ~ BB *Gorm den Gamle*; CA *Frode* ~ BC *Frotho*; CA *Uffe* ~ BC *Uffe Hin Spage*; BB *Dannebroge* ~ CL / CV *Dannebrog*.
  - **One eponym twice inside a group**: CA *Ulrik Gyldenløve* ~ *Ulrik Christian Gyldenløve*; BC *Bjarke* ~ *Bødvar Bjarke*; DD *Huitfeldt* ~ *Iver Hvitfeldt*, *Bille* ~ *Steen Bille*, *Wessel* ~ *Peder Tordenskiold*.
  - **Foreign figures and non-Danish forms**: BC *Harald Hårderåde* (king of Norway, enemy of Svend Estridsen), *Sigurd Fafnesbane* (Swedish form), *Ragnar Lodbrok* (Swedish / English form), *Frotho* (Saxo's Latin); DD *Blixten* (Swedish for "the lightning"; *Lynet* is already present), *Moltke* (reads as the German capital ship); SS *Kvalen* (Norwegian for "the whale", Danish "the agony"; *Hvalen* is present), *Draugen* (Norwegian folklore and ship name), *Marmennill* (Icelandic; *Havmanden* is present); HEROES *Nicolas Steno* (English form), *Peder Tordenskiold*; STRAITS *Fehmarn Bælt* (German spelling); MYTHOLOGY *Gungnir*, *Kvasir* (Old Norse beside Danish *Mjølner*, *Sleipner*).
  - **Unattested coinages and misspellings**: CV *Solvinden*, *Stormbrisen*; DD / BIRDS *Svarten* (no such Danish bird); BC *Gryffen*; BIRDS *Ederfuglen*; BC *Uffe Hin Spage* (capitalised *hin*).
  - **English homonyms and bare first names**: CL / PROVINCES *Island* ("HDMS Island"); CV *Mist*; BB / RULERS *Niels*, RULERS *Hans*.
  - **Miscategorised**: PROVINCES *Kronborg* (a castle in a regions pool).
  - **Valkyrie names with stripped diacritics** (CV): *Gondul*, *Skogul*, *Geirskogul*, *Herfjotur*, *Hlokk*, *Gunnr*, *Kára*, *Hildur*, *Sigrdrifa*.
  - **Persons the read-through could not place** (researcher): DD *Schiønning*, *Lous*, *Peder Marsvin*, *Krag*, *Rothe*, *Tuxen*, *Peder Vibe*, *Jost van Hoogenhuysen*, *Buhl*; CA *Johan Peter Suenson*.
  - RULERS and MYTHOLOGY read clean: no invented kings, titles or deities.

## User decisions
No AskUserQuestion in this run: the audit ran unattended (three nations in parallel), and the orchestrator answered the checkpoint on the user's behalf.
- **Depth** (STRAITS 31, HEROES 34): top up to 35+; HEROES only with individually verifiable persons.
- `VanillaPrefix` and `ThemeCount` did not fire: nothing else was open.

Orchestrator decisions made on the user's behalf (no user was asked):
- **Unverified persons are dropped, not parked**: DD *Lous*, *Peder Marsvin*, *Rothe*, *Jost van Hoogenhuysen*, *Peder Vibe* (a diplomat, no naval role) and CA *Johan Peter Suenson*. The CA candidate Christian Carl Gabel (only partly verified) was not used.
- **Kept as verified persons** on per-individual traceability, although no ship carried the name: DD *Schiønning*, *Krag*, *Tuxen*.
- **Kept as historic ship names, not persons**: DD *Buhl* and *Marstrand* (gunboats of the 1864 squadron).
- **CL *Heimdal* → *Hejmdal*** (the 1894 cruiser's form); CV loses *Heimdal*.
- **Valkyries (CV)**: only forms attested in Danish stay (*Brynhild*, *Sigrun*, *Gøndul*, *Skøgul*, *Geirskøgul*); the rest go, and *Rota* stays in DD and SS as the historic vessel name.
- **BB is not topped up** after losing its naval heroes: 39 names is inside the 30–45+ target and the roster now matches BB doctrine.
- **Display name `"National Heroes"` → `"Heroes & Luminaries"`**: the name must describe the final list (`CLAUDE.md` §2).
- **Fallback `"KDM Land %d"` → `"Landsdel %d"`** rather than a bare `"Land %d"`, which reads as "country".
- **Bare regnal first names qualified**: *Hans* → *Kong Hans*, *Niels* → *Kong Niels*, the usual Danish forms for both kings.
- **Dropped without research** where the group had spare depth: DD *Moltke*, *Wessel*, *Blixten*; SS *Kvalen*, *Draugen*, *Marmennill*; BC *Harald Hårderåde*; CV *Mist*, *Solvinden*, *Stormbrisen*; BB *Danske Løve*, *Prindse Barken*.
- **Living-in-1936 figures stay in HEROES** (*Niels Bohr*, *Karen Blixen*): real and documented, and no rule excludes them.

## Research
One budgeted dispatch of `isne-audit-researcher` (24 of 25 web calls): 15 suspects, 7 low-confidence CA candidates, 2 role families. navalhistory.dk answered 503 throughout, so the ship-list checks rest on search snippets of its pages, Wikipedia and naval-encyclopedia.

Main sources: lex.dk (Peter Schiønning; Peder Vibe); en.wikipedia (Peter Schiønning; Rasmus Krag (1680–1755); the Tuxen officers; HDMS Hauch; List of ships of the line of Denmark; List of Danish full admirals; Admiral of the Realm; Mogens Ulfeldt; Otte Rud; Hans Peter Holm; Lindormen-class minelayer); naval-encyclopedia (Danish Navy WW1; HDMS Iver Hvitfeldt (1886)); navalhistory.dk via snippets (cruiser list; 1864 index; Kampen ved Sjællands Odde 1808; Lougen class); da.wikipedia (Valkyrie); tekster.kb.dk (Grundtvig 1808); Navypedia.

Results: 21 entries verified, 9 left unverified. Of the unverified, five DD persons and one CA person were dropped; the eponyms of *Buhl* and *Marstrand* stay open because the ship names themselves are verified; *Kára* was dropped; *Lagertha* was left untouched (see Kept on judgment); Gabel was not used. Hull depth and the HEROES and STRAITS top-ups needed no research: every candidate was drafted from well-documented names.

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| DD_HISTORICAL | 141 -> 131 | Peter Tordenskiold, Svartbagen | Steen Bille, Lous, Peder Marsvin, Wessel, Rothe, Moltke, Iver Hvitfeldt, Peder Tordenskiold, Peder Vibe, Jost van Hoogenhuysen, Svarten, Blixten | - |
| SS_HISTORICAL | 76 -> 72 | - | Kronborg, Draugen, Marmennill, Kvalen | - |
| CL_HISTORICAL | 63 -> 59 | Islands Falk, Danmarkshavn, Hejmdal | Island, Danmarks Havn, Heimdal, Thor, Absalon, Esbern Snare, Dannebrog | - |
| CA_HISTORICAL | 39 -> 39 | Tordenskjold, Niels Ebbesen, Henrik Bielke, Pros Mund, Peder Munk, Albret Skeel, Mogens Ulfeldt, Otte Rud, Hans Peter Holm, Carl Wilhelm Jessen | Johan Peter Suenson, Peder Tordenskiold, Ulrik Gyldenløve, Holger Danske, Frode, Roar, Helge, Uffe, Palnatoke, Starkad | - |
| BB_HISTORICAL | 50 -> 39 | Kong Niels | Tordenskiold, Cort Adeler, Niels Juel, Iver Hvitfeldt, Olfert Fischer, Peder Skram, Herluf Trolle, Ulrik Gyldenløve, Gorm den Gamle, Niels, Danske Løve, Prindse Barken | - |
| BC_HISTORICAL | 38 -> 33 | Sigurd Fafnersbane, Regnar Lodbrog, Frode Fredegod, Uffe hin Spage, Griffen | Rolf Krake, Sigurd Fafnesbane, Ragnar Lodbrok, Harald Hårderåde, Bjarke, Frotho, Uffe Hin Spage, Lindormen, Gryffen, Valkyrien | - |
| CV_HISTORICAL | 41 -> 37 | Gøndul, Skøgul, Geirskøgul, Skinfaxe, Rimfaxe, Breidablik, Gladsheim, Folkvang, Trudvang, Bilskirner, Lidskjalv, Karlsvognen, Syvstjernen, Morgenrøden | Odin, Heimdal, Valkyrien, Hildur, Sigrdrifa, Gondul, Skogul, Randgrid, Geirskogul, Herfjotur, Mist, Rota, Gunnr, Hlokk, Kára, Dannebrog, Solvinden, Stormbrisen | - |
| CITIES | 52 -> 52 | - | - | Fallback 'KDM By %d' -> 'By %d' |
| PROVINCES | 35 -> 35 | Christiansø, Tåsinge | Island, Kronborg | Fallback 'KDM Land %d' -> 'Landsdel %d' |
| RULERS | 45 -> 45 | Kong Hans, Kong Niels | Hans, Niels | Fallback 'KDM Konge %d' -> 'Konge %d' |
| HEROES | 34 -> 40 | Peter Tordenskiold, Ivar Huitfeldt, Niels Steensen, Niels Ebbesen, Knud Rasmussen, Ludvig Mylius-Erichsen, Niels Finsen, Johannes Ewald, Adam Oehlenschläger | Peder Tordenskiold, Iver Hvitfeldt, Nicolas Steno | ThemeName 'National Heroes' -> 'Heroes & Luminaries'; Fallback 'KDM Helt %d' -> 'Helt %d' |
| MYTHOLOGY | 37 -> 37 | Gungner, Kvaser | Gungnir, Kvasir | Fallback 'KDM Mytologi %d' -> 'Mytologi %d' |
| BIRDS | 36 -> 36 | Glenten, Edderfuglen, Svartbagen | Røde Glente, Ederfuglen, Svarten | Fallback 'KDM Fugl %d' -> 'Fugl %d' |
| FISH | 40 -> 40 | - | - | Fallback 'KDM Havdyr %d' -> 'Havdyr %d' |
| STRAITS | 31 -> 40 | Aarhus Bugt, Femern Bælt, Svendborgsund, Storstrømmen, Smålandsfarvandet, Sallingsund, Oddesund, Kongedybet, Horsens Fjord, Odense Fjord, Kolding Fjord | Århus Bugt, Fehmarn Bælt | Fallback 'KDM Farvand %d' -> 'Farvand %d' |
<!-- END CHANGE TABLE -->

## Rationale
**Cross-class decoupling** (7 `CrossClass` FAILs, 21 names, plus the pairs found by eye). Each name stays in the class where its historical ship or its doctrine sits:
- **CA** is the coastal-defence and armoured-ship roster (`CLAUDE.md` §2: "heavy cruisers & coastal defense"; vanilla CA also opens with *Niels Juel*, *Peder Skram*). It keeps the panserskib names *Niels Juel*, *Peder Skram*, *Herluf Trolle*, *Olfert Fischer*, *Iver Hvitfeldt*, *Tordenskjold*, *Skjold*, *Odin*, *Gorm*, *Lindormen*, *Rolf Krake*, the 1862 armoured schooners *Absalon* and *Esbern Snare*, and the admirals (*Cort Adeler*, *Ulrik Christian Gyldenløve*).
- **BB** (monarchs, sovereignty symbols, ships of the line) loses those names, the Tordenskiold duplicate and *Gorm den Gamle* (same king as CA *Gorm*). It keeps *Dannebroge*, so *Dannebrog* leaves CL and CV.
- **BC** (saga heroes, legendary kings, mythical beasts) keeps *Holger Danske*, *Roar*, *Helge*, *Palnatoke*, *Starkad*, Frode and Uffe; CA loses them. BC loses the historic armoured ships *Rolf Krake* and *Lindormen*.
- **CL** keeps the historic cruisers *Valkyrien* (1888) and *Hejmdal* (1894); BC and CV lose them. **CV** keeps *Thor* (gods theme) and loses *Odin* to CA.

**Respellings** (each shows as removed + added in the table):
- *Peder Tordenskiold* → *Tordenskjold* in CA (the 1880 ship's spelling, naval-encyclopedia) and → *Peter Tordenskiold* in DD and HEROES (the form of the corvette F356).
- *Heimdal* → *Hejmdal* in CL (navalhistory.dk cruiser list; naval-encyclopedia gives both forms).
- BC: *Sigurd Fafnesbane* → *Sigurd Fafnersbane* and *Ragnar Lodbrok* → *Regnar Lodbrog* (Danish forms; the old ones are Swedish); *Frotho* → *Frode Fredegod* (Saxo's Latin to the Danish name of that king, which also separates him from the other Frodes); *Uffe Hin Spage* → *Uffe hin Spage*; *Gryffen* → *Griffen* (Danish *grif*).
- CV: *Gondul*, *Skogul*, *Geirskogul* → *Gøndul*, *Skøgul*, *Geirskøgul* (Grundtvig 1808 and Danish usage).
- MYTHOLOGY: *Gungnir* → *Gungner*, *Kvasir* → *Kvaser* (Danish forms, in line with *Mjølner*, *Sleipner*, *Fafner*).
- HEROES: *Nicolas Steno* → *Niels Steensen* (his Danish name); *Iver Hvitfeldt* → *Ivar Huitfeldt* (the pool names the man, as it does *Arild Huitfeldt*; the 1886 ship's spelling stays in CA).
- STRAITS: *Fehmarn Bælt* → *Femern Bælt* (Danish spelling); *Århus Bugt* → *Aarhus Bugt* (matches *Aarhus* in CL and CITIES).
- BIRDS: *Ederfuglen* → *Edderfuglen*; *Røde Glente* → *Glenten* (the red kite in the pool's definite form, and a historic torpedo-boat name already in DD). DD and BIRDS: *Svarten* → *Svartbagen* (great black-backed gull; *Svarten* is not a Danish bird name).
- RULERS and BB: *Niels* → *Kong Niels*; RULERS: *Hans* → *Kong Hans*.
- CL: *Island* → *Islands Falk* (the 1906 fishery-inspection ship; "HDMS Island" reads as the English word); *Danmarks Havn* → *Danmarkshavn* (the Greenland station is one word). PROVINCES: *Island* → *Christiansø*, *Kronborg* (a castle) → *Tåsinge*.

**Removals**:
- One eponym twice in a group: DD *Iver Hvitfeldt* (beside *Huitfeldt*), *Steen Bille* (beside *Bille*), *Wessel* (Tordenskiold's birth name); CA *Ulrik Gyldenløve*; BC *Bjarke* (beside *Bødvar Bjarke*).
- Foreign figures and forms: BC *Harald Hårderåde* (king of Norway, at war with Svend Estridsen); DD *Blixten* (Swedish; *Lynet* is present), *Moltke* (reads as the German capital ship); SS *Kvalen* (Norwegian; *Hvalen* is present), *Draugen* (Norwegian folklore and ship name), *Marmennill* (Icelandic; *Havmanden* is present).
- Unattested coinages: CV *Solvinden*, *Stormbrisen*.
- English homonym with no qualified form: CV *Mist*.
- Valkyries with no attested Danish form: CV *Hildur*, *Sigrdrifa*, *Randgrid*, *Herfjotur*, *Gunnr*, *Hlokk*, *Kára*. CV *Rota* is the historic vessel name and stays in DD and SS.
- BB *Danske Løve* (could not be placed) and *Prindse Barken* (the only sourced form, "Prindse-Bark", comes from a single list).
- SS *Kronborg*: not a vanilla SS name, no submarine of that name is documented, and the same castle name left PROVINCES.
- Unverified persons: see User decisions.

**Additions**:
- CA (30 → 39 after removals): nine admirals and naval heroes, matching the group's convention. See Persons verified.
- CV (26 → 37): from the Eddas, the horses of day and night (*Skinfaxe*, *Rimfaxe*) and dwellings and seats of the gods (*Breidablik*, *Gladsheim*, *Folkvang*, *Trudvang*, *Bilskirner*, *Lidskjalv*); sky names (*Karlsvognen*, *Syvstjernen*, *Morgenrøden*), continuing the existing *Nordlyset* / *Morgenstjernen* series.
- HEROES (34 → 40) and STRAITS (31 → 40): depth top-ups agreed at the checkpoint. STRAITS adds sounds, a channel and fjords of the inner Danish waters.

**Fallbacks and display name**: the eight thematic fallbacks lose the stray `KDM ` (see Initial report); `"National Heroes"` → `"Heroes & Luminaries"`.

## Persons verified
"Well documented" marks figures with standard biographies (Dansk Biografisk Leksikon / lex.dk).

**DD**
- Willemoes-class (1976–78) ship names and their eponyms, well documented: *Huitfeldt* (Ivar Huitfeldt, 1665–1710), *Willemoes* (Peter Willemoes, 1783–1808), *Bille* (Steen Andersen Bille, 1751–1833), *Bredal* (Peter Bredal, d. 1658), *Hammer* (Otto Christian Hammer, 1822–1892), *Krieger* (Johan Cornelius Krieger, 1756–1824), *Norby* (Søren Norby, d. 1530), *Rodsteen* (Markor Rodsteen, 1625–1681), *Sehested* (Christen Thomesen Sehested, 1664–1736), *Suenson* (Edouard Suenson, 1805–1887).
- Well documented: *Dahlerup* (Hans Birch Dahlerup, 1790–1872), *Jens Munk* (1579–1628), *Ove Gjedde* (1594–1660), *Just Juel* (1664–1715), *Cort Adeler* (1622–1675), *Niels Juel* (1629–1697), *Peder Skram* (d. 1581), *Herluf Trolle* (1516–1565), *Olfert Fischer* (1747–1829), *Peter Tordenskiold* (1690–1720), *Vitus Bering* (1681–1741), *Hans Egede* (1686–1758), *Mogens Gyldenstierne* (1485–1569), *Jørgen Vind* (1593–1644), *Niels Trolle* (1599–1667), *Frantz Hohlenberg* (naval constructor, d. 1804), *Henrik Gerner* (naval constructor, d. 1787), *Christian Christopher Zahrtmann* (1793–1853), *Lorentz Fisker* (1753–1819).
- *Schiønning*: Peter Christian Schiønning (1732–1813), naval officer and diarist, commanded *Hvide Ørn* and the frigates *Søeridderen* and *Bornholm* (lex.dk: Peter Schiønning; en.wikipedia: Peter Schiønning).
- *Krag*: Rasmus Krag (1680–1755), vice admiral 1736 (en.wikipedia: Rasmus Krag (1680–1755)).
- *Tuxen*: the naval officers Nicolai Elias Tuxen (technical director of the Orlogsværft), Georg Emil Tuxen and Johan Cornelius Tuxen (en.wikipedia pages of each).
- **Ship names, not persons**: *Buhl* (gunboat, 1861–1874; navalhistory.dk 1864 index) and *Marstrand* (gunboat of the 1864 squadron; en.wikipedia: HDMS Hauch). Their eponyms are not claimed.

**CA**
- Well documented: *Niels Juel*, *Peder Skram*, *Herluf Trolle*, *Olfert Fischer*, *Iver Hvitfeldt* (Ivar Huitfeldt in the spelling of the 1886 ship; naval-encyclopedia: HDMS Iver Hvitfeldt (1886)), *Tordenskjold* (Peter Wessel Tordenskiold; 1880 ship), *Cort Adeler*, *Absalon* (c. 1128–1201), *Esbern Snare* (1127–1204), *Vitus Bering*, *Peter Willemoes*, *Steen Bille*, *Edouard Suenson*, *Hans Birch Dahlerup*, *Jens Munk*, *Ove Gjedde*, *Markor Rodsteen*, *Just Juel*, *Jørgen Vind*, *Henrik Gerner*, *Christian Christopher Zahrtmann*, *Ulrik Christian Gyldenløve* (1678–1719, admiral, son of Christian V), *Niels Ebbesen* (d. 1340; frigate *Niels Ebbesen*, 1945), *Pros Mund* (d. 1644 at Femern).
- Sourced by the researcher: *Henrik Bielke* (1615–1683; en.wikipedia: List of Danish full admirals), *Peder Munk* (1534–1623) and *Albret Skeel* (1572–1639) (en.wikipedia: Admiral of the Realm), *Mogens Ulfeldt* (1569–1616; en.wikipedia: Mogens Ulfeldt), *Otte Rud* (1520–1565; en.wikipedia: Otte Rud), *Hans Peter Holm* (commanded *Najaden* at Lyngør, d. 1812; en.wikipedia: Hans Peter Holm), *Carl Wilhelm Jessen* (1764–1823; navalhistory.dk: Kampen ved Sjællands Odde 1808).
- Legendary kings carried by historic ships or by Saxo: *Gorm* (Gorm den Gamle; monitor 1870), *Rolf Krake* (turret ship 1863), *Skjold* (coastal-defence ship 1896), *Dan* (Saxo's eponymous first king). *Odin*, *Lindormen*, *Helgoland* and *Danmark* are historic armoured-ship names.

**BB**
- Monarchs, all well documented: *Harald Blåtand*, *Svend Tveskæg*, *Knud den Store*, *Knud den Hellige*, *Erik Ejegod*, *Kong Niels* (r. 1104–1134), *Valdemar den Store*, *Valdemar Sejr*, *Erik Klipping*, *Erik Menved*, *Valdemar Atterdag*, *Margrete I*, *Frederik I–VIII*, *Christian III–X*.
- Ships of the line named after royalty: *Store Sophia*, *Sophia Amalia*, *Christianus Quintus*, *Fredericus Quartus* (en.wikipedia: List of ships of the line of Denmark).

**BC**
- Historical: *Svend Estridsen* (king 1047–1076), *Knud Lavard* (d. 1131). Well documented.
- Legendary, attested in Saxo's *Gesta Danorum*: *Starkad*, *Amled*, *Hagbard*, *Signe*, *Harald Hildetand*, *Sigurd Ring*, *Lagertha*, *Frode Fredegod*, *Uffe hin Spage*, *Roar*, *Helge*, *Regnar Lodbrog*.
- Legendary, attested in the sagas: *Bødvar Bjarke* and *Hjalte* (Hrólfs saga kraka; Bjarkemål), *Angantyr* and *Hervør* (Hervarar saga), *Sigurd Fafnersbane* (Völsunga saga), *Palnatoke* (Jómsvíkinga saga), *Bjørn Jernside*, *Ivar Benløs*, *Sigurd Orm-i-Øje* (Ragnarssona þáttr).
- *Holger Danske*: Ogier the Dane of the chansons de geste and the Danish chapbook of 1534.

**CL**: *Ingolf* (Ingólfr Arnarson; schooner 1876, inspection ship 1933) and *Dagmar* (Queen Dagmar, d. 1212; corvette 1861), well documented. *Freja* is the goddess and the 1938 inspection ship.

**HEROES** (40), all well documented: the naval heroes listed under CA and DD (*Niels Juel*, *Peter Tordenskiold*, *Cort Adeler*, *Herluf Trolle*, *Peder Skram*, *Ivar Huitfeldt*, *Olfert Fischer*, *Peter Willemoes*, *Steen Bille*, *Vitus Bering*, *Absalon*, *Esbern Snare*, *Jens Munk*, *Ove Gjedde*, *Edouard Suenson*, *Hans Egede*, *Niels Ebbesen*); *Tycho Brahe*, *Ole Rømer*, *Bertel Thorvaldsen*, *H.C. Andersen*, *Niels Bohr*, *Hans Christian Ørsted*, *N.F.S. Grundtvig*, *Ludvig Holberg*, *Carl Nielsen*, *Søren Kierkegaard*, *Rasmus Rask*, *Ole Worm*, *Thomas Bartholin*, *Niels Steensen*, *Saxo Grammaticus*, *Arild Huitfeldt* (1546–1609, historian and chancellor), *Karen Blixen*, *Knud Rasmussen* (1879–1933), *Ludvig Mylius-Erichsen* (1872–1907), *Niels Finsen* (1860–1904), *Johannes Ewald* (1743–1781), *Adam Oehlenschläger* (1779–1850); *Holger Danske* (legendary, as under BC).

**RULERS** (45): the kings of Denmark from *Gorm den Gamle* to *Christian X*, all well documented, including the less familiar *Harald II* (r. 1014–1018), *Oluf I Hunger*, *Erik Emune*, *Erik Lam*, *Svend Grathe*, *Knud V*, *Knud VI*, *Erik af Pommern*, *Christoffer af Bayern*, *Kong Hans* and *Kong Niels*. *Harald Klak*, *Horik I* and *Horik II* are 9th-century kings known from the Frankish annals. *Sigurd Orm-i-Øje* is legendary (Ragnarssona þáttr), as under BC.

**MYTHOLOGY, CV, SS**: no historical persons. The gods, valkyries, beasts and places are those of the Poetic and Prose Edda in their Danish forms; SS adds classical sea deities continuing the navy's nymph and sea-god series (*Najaden*, *Nymfen*, *Triton*, *Neptun*, *Ægir*, *Ran*).

## Author confirmation
None.

## Kept on judgment
- **WARNs**: none remain.
- **English homonyms kept**: *Ran* (SS, MYTHOLOGY) is the 1915 submarine and the sea goddess; *Hammer* (DD) is a real RDN ship name; *Rota* (DD, SS) is the historic submarine; *Dan* (CA) and *Hel* (MYTHOLOGY) are the standard Danish forms with no qualified alternative.
- **BC *Lagertha*** stays as it is. The form is attested in Danish culture: Claus Schall's music of 1801 and Galeotti's ballet *Lagertha* (staged 1801 and 1813). *Ladgerda* is the form of the Saxo translations.
- **BB *Fides*** stays: a 28-gun ship of Christian IV's fleet, captured at Femern in 1644 by Dutch ships of the Swedish-hired fleet (en.wikipedia: Battle of Fehmarn (1644), "Fides 28 – Captured"). It was only absent from the one (incomplete) list the researcher fetched.
- **One eponym in DD and in CA** (*Suenson* / *Edouard Suenson*, *Huitfeldt* / *Iver Hvitfeldt*, *Rodsteen* / *Markor Rodsteen*, and the full names both carry) is legacy and allowed: the zero-overlap rule covers CL / CA / BB / BC / CV only. The same holds for *Nordstjernen* (DD and BB) and *Dragen* (DD and BC).
- **Hull names repeated in thematic pools** (HEROES, RULERS, MYTHOLOGY, STRAITS, PROVINCES) are by design: pools are universal.
- **Pure noun pools** (CITIES, FISH, BIRDS, PROVINCES) were skimmed for the display-name check only; the handful of fixes above are what the skim surfaced.

## Role pools
| Role | Verdict | Reason |
|---|---|---|
| Minesweepers | considered, skipped: covered by DD and STRAITS | Søløven class (1938–42: *Søløven*, *Søbjørnen*, *Søulven*, *Søridderen*, *Søhesten*, *Søhunden*) sits in DD; the Sund class (*Alssund*, *Grønsund*, *Guldborgsund*, *Ulvsund*, *Vilsund*, *Aarøsund*) sits in the STRAITS pool |
| Torpedo boats, fast attack craft | considered, skipped: covered by DD | Denmark built no destroyers; the torpedo-boat series (sea creatures, birds of prey, Willemoes-class officers) is the DD group |
| Coastal defense, monitors, armored cruisers | considered, skipped: covered by CA | *Niels Juel*, *Peder Skram*, *Herluf Trolle*, *Olfert Fischer*, *Iver Hvitfeldt*, *Skjold*, *Rolf Krake*, *Lindormen*, *Gorm*, *Odin*, *Helgoland*, *Danmark* follow CA's own formula |
| Corvettes, frigates, sloops, avisos, patrol vessels, escort destroyers | considered, skipped: covered by CL / CA / DD | Fishery-inspection ships (*Beskytteren*, *Hvidbjørnen*, *Ingolf*, *Fylla*, *Freja*, *Hejmdal*) sit in CL; post-war frigate and corvette names repeat CA and DD names; the three Hunt-class loans are too few |
| Coastal, cruiser and minelaying submarines | considered, skipped: covered by SS | Every Danish boat was coastal; no cruiser or minelaying class |
| Icebreakers | considered, skipped: below floor | Civilian state service in the period; about 8 distinct names (*Bryderen*, *Mjølner*, *Isbjørn*, *Lillebjørn*, *Storebjørn*, *Elbjørn*, *Danbjørn*, *Thorbjørn*), and *Holger Danske* is a BC name |
| Training ships, state yachts, submarine tenders, seaplane tenders | considered, skipped: no series | Single ships (*Dannebrog*, *Henrik Gerner*) or civilian sail trainers (*Danmark*, *Georg Stage*) |
| Escort and light carriers, fast battleships, large cruisers, scout cruisers, flotilla leaders, auxiliary cruisers | considered, skipped: no precedent | Never operated, ordered or planned |
| Minelayers | considered, skipped: no convention, below floor | Researched. An assortment with no naming formula (*Hjælperen*, *Lossen*, *Kvintus*, *Sixtus*, *Lougen*, *Laaland*); about 8 distinct names, and *Henrik Gerner*, *Lindormen*, *Falster*, *Fyen*, *Sjælland* are CA or CL names |
| Gunboats | considered, skipped: below floor | Researched. The 1860s screw-gunboat series exists, but only 5 names are verifiable (*Buhl*, *Krieger*, *Hauch*, *Marstrand*, *Willemoes*) and four of them already sit in DD; the class roster and naming convention could not be confirmed |

## Review
**Verdict**: `isne-code-reviewer`, APPROVE. No Critical or Important findings.

**Confirmed by the reviewer**:
- The change table matched `-DiffNames DEN` row for row; the README and workshop rows needed no change; wiki sample cells and Scope Notes matched the namelist.
- No named person was missing from Persons verified, and the whole-file homonym scan found nothing placeholder-like.
- The eleven CV refill names are correct Danish forms (da.wikipedia articles for *Skinfaxe*, *Breidablik*, *Gladsheim*, *Folkvang*, *Trudvang*, *Bilskirner*, *Lidskjalv*, *Karlsvognen*, *Syvstjernen*, *Morgenrøde*; *Rimfaxe* is given alongside *Hrymfaxe*). The valkyrie forms, all eight fallbacks and the `"Heroes & Luminaries"` display name are fine.
- BB *Fides* and BC *Lagertha* are corroborated (sources under Kept on judgment).

**Minor findings, all fixed**:
1. CV wording in the Rationale and the wiki Scope Notes: "halls of the gods and the night sky" was inexact; now "the horses of day and night, dwellings and seats of the gods, and sky names".
2. Kept on judgment now carries the *Fides* and *Lagertha* sources.
3. SS *Kronborg* removed (SS 73 → 72).
4. CL *Danmarks Havn* → *Danmarkshavn*.
5. HEROES *Iver Hvitfeldt* → *Ivar Huitfeldt*.
6. BIRDS *Røde Glente* → *Glenten*.

**Accepted as they are**:
- DD *Buhl* and *Marstrand* as ship names with no eponym claimed, and *Tuxen* with its three named officers; Author confirmation stays "None".
- FISH's mixed definite and indefinite forms (authentic words either way; a pure noun pool).
- DD *Laxen* as the historic ship spelling (Dragen-class torpedo boat).
- CV *Nordlyset* beside *Polarlyset* (two distinct Danish words).
- CA *Tordenskjold* beside DD and HEROES *Peter Tordenskiold* (DD and thematic pools are outside the zero-overlap set).

**Re-verification after the fixes**: `-Audit DEN`, `-ValidateOnly` and `-Test` re-run; results in the completion report.
