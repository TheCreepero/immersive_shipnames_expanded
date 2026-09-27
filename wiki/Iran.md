# Iran / Persia (PER) Ship Namelists

Source file: `common/units/names_ships/PER_ship_names.txt`

---

## Overview

The Imperial Iranian Navy (*Niru-ye Daryayi-e Shahanshahi-e Iran*) was founded on 5 November 1932 under Commodore Gholamali Bayandor as part of Reza Shah's broader modernization program, procuring Italian-built sloops and gunboats to patrol the Persian Gulf and Caspian Sea. Most of this young fleet was destroyed or captured on 25 August 1941 during the Anglo-Soviet invasion of Iran: *Palang* was sunk at Abadan by HMS *Shoreham*, *Babr* was sunk at Khorramshahr by HMAS *Yarra*, and several other vessels were captured at Bandar Shahpur and Khorramshahr. The postwar Imperial Iranian Navy of the Pahlavi era continued to draw on this legacy alongside deep wells of Persian history: the Achaemenid, Parthian, and Sassanid empires, the legendary heroes of Ferdowsi's *Shahnameh*, and the geography of the Persian Gulf, Caspian coast, and Iranian plateau.

In vanilla Hearts of Iron IV, Iranian naval namelists suffered from a severe cross-class collision bug and mistranslated terminology:
- **Cross-Class Collision**: `PER_CL_HISTORICAL`, `PER_CA_HISTORICAL`, `PER_BB_HISTORICAL`, `PER_BC_HISTORICAL`, and `PER_CV_HISTORICAL` all drew from the same tiny pool of 4-8 names ("Palang", "Babr", "Shir", "Paykan", "Ababil", "Simorgh", "Saam", "Zaal", "Rostam", "Faramarz"), leaving light cruisers, heavy cruisers, battleships, battlecruisers, and carriers virtually indistinguishable in the Ship Designer.
- **Literal English Fallback Names**: Fallback names were plain English translations ("Light Cruiser %d", "Battleship %d", "Carrier %d") rather than authentic Farsi naval terminology.
- **Era Mismatches**: Several vanilla ship names (e.g. "Jamaran", "Ghadir", "Yugo") referenced post-1979 Islamic Republic vessel classes or a North Korean midget-submarine class, out of place for Hearts of Iron IV's 1936-1948 setting.

*Immersive Ship Names Expanded* provides complete, historically and linguistically authentic namelists for Iran, featuring 7 expanded ship-type specific groups and 7 universal thematic pools for the Ship Designer, fully decoupled with zero cross-class name collisions. Real, verified Pahlavi-era Imperial Iranian Navy ship names (Babr, Palang, Artemiz, Saam, Zaal, Rostam, Faramarz, and more) anchor the destroyer roster, while cruisers, capital ships, and carriers each draw from distinct doctrines: coastal cities and ports, ancient Persian capitals and monuments, Shahanshahs of the Achaemenid/Parthian/Sassanid empires, Persian Gulf sea kingdoms and fortresses, and mythical flying creatures paired with the great peaks of the Iranian plateau. All ships carry the historical prefix `IIS ` (*Imperial Iranian Ship*), matching vanilla convention.

---

## Namelist Groups

### Ship-Type Specific Category

| Group Tag | Type | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `PER_DD_HISTORICAL` | Destroyers & Escorts | `ship_hull_light destroyer` | Babr, Palang, Artemiz, Saam, Zaal, Rostam, Faramarz, Bayandor, Naghdi, Shahbaz, Karkas, Kaman, Zoubin, Khadang, Paykan, Sohrab, Esfandiyar, Siyavash, Bijan, Giv, Ariabignes, Vahrez |
| `PER_SS_HISTORICAL` | Submarines | `ship_hull_submarine submarine ship_hull_midget_submarine` | Kousseh, Nahang, Dolfin, Arrehmahi, Shamshirmahi, Marmahi, Fok, Gando, Filmahi, Uzunbrun, Tasmahi, Shipmahi, Morvarid, Marjan, Gerdab, Zharfa, Shabgard |
| `PER_CL_HISTORICAL` | Light Cruisers | `ship_hull_cruiser light_cruiser` | Bandar Abbas, Bushehr, Khorramshahr, Abadan, Chabahar, Bandar Pahlavi, Rasht, Sari, Tehran, Tabriz, Esfahan, Shiraz, Mashhad, Kerman, Yazd, Hamadan, Kermanshah, Qazvin |
| `PER_CA_HISTORICAL` | Heavy Cruisers & Coastal Defense | `ship_hull_cruiser heavy_cruiser` | Persepolis, Pasargad, Shush, Anshan, Istakhr, Tisfun, Bishapur, Taq-e Kasra, Bisotun, Naqsh-e Rostam, Azargoshasb, Balkh, Herat, Samarqand, Bukhara |
| `PER_BB_HISTORICAL` | Battleships & Capital Ships | `ship_hull_heavy battleship` | Hakhamanesh, Kourosh, Kambujiyeh, Dariush, Khashayar, Ardeshir, Sasan, Shapour, Anoushirvan, Khosrow Parviz, Nader, Shah Abbas, Pahlavi, Iranshahr, Shahanshah, Shir-o-Khorshid |
| `PER_BC_HISTORICAL` | Battlecruisers | `ship_hull_heavy battle_cruiser` | Khalij-e Fars, Tangeh-ye Hormoz, Hormoz, Kish, Siraf, Kharg, Hengam, Abu Musa, Arg-e Bam, Alamut, Rudkhan, Darband, Lade, Knidos, Artemisium |
| `PER_CV_HISTORICAL` | Aircraft Carriers | `ship_hull_carrier carrier` | Simorgh, Homa, Qoqnus, Chamrosh, Shirdal, Damavand, Alborz, Zagros, Sabalan, Sahand, Alvand, Dena, Taftan, Tochal |

---

### Universal Thematic Topic Category (Ship Designer)

Universal selection pools available for any ship hull or squadron:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `PER_MYTHOLOGY` | Mythology | Universal | Kiumars, Hushang, Jamshid, Fereydun, Kay Khosrow, Goshtasp, Mehr, Anahita, Tishtar, Sorush, Gordafarid, Rudabeh, Rakhsh, Shabdiz, Derafsh-e Kaviani, Jam-e Jam |
| `PER_RULERS` | Rulers | Universal | Diyako, Taher, Esmail-e Samani, Alp Arslan, Shah Tahmasb, Lotf Ali Khan, Agha Mohammad Khan, Fath-Ali Shah, Naser od-Din Shah, Reza Shah, Mohammad Reza, Atoosa, Azarmidokht |
| `PER_PROVINCES` | Provinces | Universal | Azarbaijan, Gilan, Mazandaran, Khorasan, Fars, Khuzestan, Kurdestan, Lorestan, Sistan, Baluchestan, Bakhtiari, Mad, Parthav, Hirkan, Arran, Shirvan, Soghd |
| `PER_RIVERS` | Rivers & Lakes | Universal | Sefid Rud, Karun, Karkheh, Dez, Zayandeh Rud, Aras, Atrak, Hirmand, Zab, Chichast, Hamun, Bakhtegan, Gavkhuni, Jazmurian |
| `PER_BIRDS` | Birds | Universal | Oqab, Oqab-e Talaei, Baz, Qarqi, Tarlan, Balaban, Sonqor, Joghd, Bum, Hodhod, Tavus, Bolbol, Chakavak, Kabk, Kabutar |
| `PER_VIRTUES` | Virtues | Universal | Daliri, Delavar, Shoja'at, Piruzi, Zafar, Nosrat, Sharaf, Gheyrat, Esteqlal, Niru, Kherad, Edalat, Pendar-e Nik, Goftar-e Nik, Kerdar-e Nik |
| `PER_BEASTS` | Beasts & Predators | Universal | Shir, Yuzpalang, Siyahgush, Gorg, Khers, Goraz, Gur, Ahu, Gavazn, Maral, Fil, Kargadan, Ezhdeha |

---

## Historical Notes & Vanilla Fixes

- **Era Scope**: The rewrite focuses on the Pahlavi-era (1925-1979) Imperial Iranian Navy and earlier Persian history, matching Hearts of Iron IV's 1936-1948 setting. Vanilla names tied specifically to post-1979 Islamic Republic naval classes (e.g. "Jamaran", "Ghadir", "Besat", "Fateh", "Nooh", "Yunes", "Tareq") were removed; real vanilla names with a pre-1979 Imperial Iranian Navy pedigree (Artemiz, Babr, Palang) were retained and expanded upon, and "Nahang" was kept as a planned (rather than commissioned) Pahlavi-era Tang-class submarine name.
- **"Yugo" Anomaly**: Vanilla's `PER_SS_HISTORICAL` listed "Yugo", which is actually a North Korean midget-submarine class with no connection to Iran. Removed.
- **Cross-Class Decoupling**: The vanilla roster shared between `CL`/`CA`/`BB`/`BC`/`CV` was fully split into five mutually exclusive doctrines (ports/cities, ancient capitals & monuments, Shahanshahs, sea kingdoms & fortresses, and mythical flyers & peaks), verified with zero overlapping names via an automated set-intersection check. Vanilla's destroyer names "Damavand", "Alborz", "Sabalan", "Sahand", and "Alvand" — post-1979 renames of Pahlavi-era hulls after mountains — were moved to the carrier list (`PER_CV_HISTORICAL`) alongside other Iranian peaks.
- **Fallback Terminology**: Replaced literal English fallback names with authentic Farsi naval terminology in the indefinite nominative singular (e.g. `Navshekan %d` for destroyer, `Razmnav-e Sabok %d` for light cruiser, `Nabardnav %d` for battleship), avoiding common homonym-calque traps (e.g. "light" as *sabok*/weight, never *roshan*/brightness).
- **Prefix**: Retained vanilla's `IIS ` (*Imperial Iranian Ship*) prefix for parity across all groups.
