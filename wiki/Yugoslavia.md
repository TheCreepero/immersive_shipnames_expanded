# Yugoslavia (YUG) Ship Namelists

Source file: `common/units/names_ships/YUG_ship_names.txt`

---

## Overview

The *Kraljevska mornarica Kraljevine Jugoslavije* (Royal Navy of the Kingdom of Yugoslavia, KJRM) was an interwar coastal defense force built from inherited Austro-Hungarian torpedo boats and river monitors, augmented by purpose-built warships in the 1930s. The fleet's pride was the large destroyer leader *Dubrovnik* (commissioned 1932, built in the UK), followed by the three French-designed *Beograd*-class destroyers (*Beograd*, *Zagreb*, *Ljubljana*), and the incomplete *Split* laid down in 1939. The submarine arm comprised the British-built *Hrabri*-class (*Hrabri* [Brave] and *Nebojša* [Fearless]) and the French-built *Smeli*-class (*Smeli* [Bold] and *Osvetnik* [Avenger]). Auxiliary forces included the seaplane tender/minelayer *Zmaj* (Dragon), and minelayers named after birds of prey (*Galeb* [Seagull], *Jastreb* [Hawk], *Kobac* [Sparrowhawk], *Sokol* [Falcon]). Four river monitors — *Sava*, *Drava*, *Morava*, and *Vardar* — patrolled the Danube basin, establishing the river-naming tradition later extended to submarines.

In vanilla Hearts of Iron IV, Yugoslavia's ship namelist file (`YUG_ship_names.txt`) suffered from significant structural issues:
- **Homonym Calque in Light Cruiser Fallback**: `"Svetlo Krstarica"` used "svetlo" (light as in illumination/brightness) instead of "laka" (light as in weight/displacement class), mirroring the same type of calque error found in Scandinavian vanilla files.
- **Massive Cross-Hull Verbatim Duplication**: The CA roster was a near-verbatim copy of CL; CV recycled CL city names with no aviation identity; BC was a trimmed subset of BB. Nearly every major city appeared across 3–5 hull classes simultaneously.
- **Missing Diacritics Throughout**: Razarac→Razarač, Nosac→Nosač, Teska→Teška, Vrsac→Vršac, Snazhni→Snažni (transliteration artifact).
- **Misspellings**: "Pizren"→Prizren (missing letter), "Smederovo"→Smederevo (wrong vowel), "KruSevac"→Kruševac, "NikSic"→Nikšić (uppercase ASCII substitutions for háčeks).
- **Anachronistic Romanian Regions**: YUG_REGIONS erroneously included Basarabia, Bukovina, Herta, and Budjak — Romanian/Bessarabian territories never part of Yugoslavia.
- **No Doctrinal Hull Identity**: DD mixed cities with mountains with no consistent theme; CV had no sky/aviation identity; CA was indistinguishable from CL.

**ISNE** completely overhauls Yugoslavia's ship namelists: fixing all fallback calques and diacritics, eliminating cross-hull duplication by assigning distinct doctrinal identities (CA→national heroes and medieval rulers, CV→storms/aviation/raptors), removing anachronistic Romanian regions, merging the redundant BC stub into BB, and providing 9 expansive universal thematic pools.

---

## Namelist Groups

### Ship-Type Specific Category

Dedicated namelists tied to specific ship hulls and naval classifications:

| Group Tag | Type | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `YUG_DD_HISTORICAL` | Destroyers & Escorts | `ship_hull_light destroyer` | Dubrovnik, Beograd, Zagreb, Ljubljana, Split, Triglav, Durmitor, Biokovo, Učka, Velebit, Lovćen, Galeb, Jastreb, Nada, Odvažni |
| `YUG_SS_HISTORICAL` | Submarines | `ship_hull_submarine submarine` | Hrabri, Nebojša, Smeli, Osvetnik, Snažni, Neustrašivi, Heroj, Junak, Tara, Sava, Neretva, Drava, Tisa, Drina, Una, Zeta |
| `YUG_CL_HISTORICAL` | Light Cruisers | `ship_hull_cruiser light_cruiser` | Kotor, Split, Dubrovnik, Šibenik, Zadar, Pula, Rijeka, Sušak, Trogir, Bar, Dalmacija, Sarajevo, Niš, Smederevo |
| `YUG_CA_HISTORICAL` | Heavy Cruisers | `ship_hull_cruiser heavy_cruiser` | Stefan Nemanja, Stefan Dušan, Knez Lazar, Miloš Obilić, Kraljević Marko, Tomislav, Petar Krešimir, Ban Jelačić, Tvrtko I, Karađorđe |
| `YUG_BB_HISTORICAL` | Battleships & Capital Ships | `ship_hull_heavy battleship battle_cruiser` | Srbija, Hrvatska, Slovenija, Crna Gora, Bosna, Hercegovina, Makedonija, Vojvodina, Jugoslavija, Dalmacija, Slavonija |
| `YUG_CV_HISTORICAL` | Aircraft Carriers | `ship_hull_carrier carrier` | Zmaj, Ikarus, Rogožarski, Vihor, Grom, Munja, Oluja, Bura, Nevera, Orao, Soko, Jastreb, Sup, Kobac |

---

### Universal Thematic Topic Category (Ship Designer)

Universal selection pools available for any ship hull or squadron in the Ship Designer:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `YUG_CITIES` | Cities | Universal | Beograd, Zagreb, Ljubljana, Sarajevo, Skopje, Podgorica, Novi Sad, Niš, Split, Dubrovnik, Kragujevac, Kruševac, Subotica, Rijeka, Zadar, Šibenik |
| `YUG_PROVINCES` | Regions & Banovinas | Universal | Srbija, Hrvatska, Slovenija, Crna Gora, Bosna, Hercegovina, Makedonija, Vojvodina, Dravska, Savska, Vrbaska, Primorska, Drinska, Dunavska, Moravska, Vardarska, Zetska |
| `YUG_RIVERS` | Rivers & Waterways | Universal | Dunav, Sava, Drava, Tisa, Morava, Neretva, Vardar, Drina, Una, Bosna, Vrbas, Kupa, Tara, Lim, Piva, Krka, Cetina, Ohrid, Skadar, Bled |
| `YUG_MYTHOLOGY` | Mythology & Folklore | Universal | Perun, Veles, Svarog, Dažbog, Stribog, Morana, Vesna, Živa, Lada, Svetovid, Triglav, Vila, Zduhać, Aždaja, Kraljević Marko, Miloš Obilić |
| `YUG_RULERS` | Rulers & Dynasties | Universal | Aleksandar I, Petar I, Petar II, Stefan Nemanja, Stefan Dušan, Knez Lazar, Tomislav, Petar Krešimir, Dmitar Zvonimir, Tvrtko I, Nikola I |
| `YUG_HEROES` | Heroes & Commanders | Universal | Karađorđe, Hajduk Veljko, Stepa Stepanović, Živojin Mišić, Radomir Putnik, Petar Bojović, Matija Gubec, Ljudevit Posavski, Petar Zrinski, Husein Gradaščević |
| `YUG_BIRDS` | Birds | Universal | Orao, Soko, Jastreb, Sup, Kobac, Galeb, Gavran, Sova, Roda, Labud, Pelikan, Kormoran, Ždral, Čaplja, Fazan |
| `YUG_MOUNTAINS` | Mountains & Peaks | Universal | Triglav, Durmitor, Lovćen, Biokovo, Učka, Velebit, Kopaonik, Šar-planina, Rtanj, Zlatibor, Tara, Prokletije, Dinara, Fruška Gora |
| `YUG_VIRTUES` | Virtues & Tempests | Universal | Hrabri, Smeli, Snažni, Neustrašivi, Pobednik, Osvetnik, Junački, Vihor, Grom, Munja, Oluja, Bura, Nevera, Ciklon, Uragan |
