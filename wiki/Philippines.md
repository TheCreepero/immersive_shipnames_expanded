# Philippines (PHI) Ship Namelists

Source file: `common/units/names_ships/PHI_ship_names.txt`

---

## Overview

The naval history of the Philippines during the Hearts of Iron IV timeframe centers on the establishment and heroic wartime service of the **Offshore Patrol (OSP)** and the post-war evolution of the **Philippine Navy**.

Under Commonwealth Act No. 1 (The National Defense Act of 1935), President Manuel L. Quezon and military advisor General Douglas MacArthur envisioned an agile, asymmetric naval defense force tailored to the Philippine archipelago. On February 9, 1939, the Offshore Patrol was formally activated under US Naval Academy graduates **Major Jose V. Andrada** and **Captain Enrique L. Jurado**. Headquartered at Muelle del Codo in Manila's Port Area, the OSP planned a fleet of 36 fast Motor Torpedo Boats (MTBs), popularly known as the **"Mosquito Fleet"**:
- **Q-111 *Luzon***: 65-foot Thornycroft flagship.
- **Q-112 *Abra***: 55-foot Thornycroft craft, commanded by Lieutenant (later Commodore) Ramon A. Alcaraz.
- **Q-113 *Agusan***: Built locally at Engineer Island, Navotas, by naval architect Bernardo Abrera—the first military vessel built in the modern Philippines. Commanded by Lieutenant Heraclio Alano.
- **Q-114 *Dandii*** and **Q-115 *Baler***.

During the defense of Bataan in 1941–1942, operating from Sisiman Cove, the Mosquito Fleet performed courier runs, coastal reconnaissance, and anti-aircraft combat. On January 17, 1942, Q-111 and Q-112 engaged a flight of nine Japanese dive-bombers in Manila Bay, downing at least one aircraft, earning their skippers the Silver Star. 

Following liberation, the OSP was reorganized as the Philippine Naval Patrol in 1947 and formally designated the **Philippine Navy (PN)** in 1951. Ships carried the prefix **RPS** (*Republic of the Philippines Ship*) from 1946 until 1980, when the modern prefix **BRP** (*Barko ng Republika ng Pilipinas*) was adopted. Transferred vessels established enduring class naming traditions: Cannon-class destroyer escorts became the *Datu* class (*RPS Datu Kalantiaw*, *RPS Datu Sikatuna*, *RPS Rajah Humabon*), Casco-class cutters became the *Andres Bonifacio* class, and patrol escorts formed the *Miguel Malvar* class.

### Vanilla Curiosities & Anomalies Resolved
In base-game Hearts of Iron IV, `PHI_ship_names.txt` suffered from extraordinary errors:
- **Foreign Commonwealth Frigates in Submarines:** Base-game `PHI_SS_HISTORICAL` contained 18 ship names—*every single one* was a Royal New Zealand Navy (RNZN) Loch-class frigate (*Hawea*, *Pukaki*, *Rotoiti*, *Taupo*, *Tutira*, *Otago*, *Taranaki*, *Waikato*) or Royal Australian Navy (RAN) Bathurst-class corvette (*Echuca*, *Kiama*, *Inverell*, *Stawell*). There was zero Philippine content in vanilla submarines.
- **The "General Manchatas" Fiction:** Capital ship lists featured "General Manchatas", a garbled transcription or OCR artifact completely nonexistent in Philippine military history or NHCP records.
- **100% Verbatim Cross-Class Duplication:** `PHI_CA_HISTORICAL` was a 100% duplicate of `PHI_CL_HISTORICAL`, while `PHI_BB_HISTORICAL`, `PHI_BC_HISTORICAL`, and `PHI_CV_HISTORICAL` were identical 11-ship stubs. Furthermore, cities (*Manila*, *Cabanatuan*, *Batangas*, *Cadiz*, *Davao*) and *Luzon* were duplicated across all five groups.
- **Crude Hybrid Calque:** "Pilipinas Republic" was a clumsy half-Tagalog, half-English hybrid.
- **Extremely Shallow Destroyer Roster:** Only 13 names mixing pre-colonial datus, 1896 revolution figures, and provinces.
- **Absence of Thematic Pools:** Zero universal thematic pools were provided for the Ship Designer.

**ISNE** completely overhauls the Philippine naval roster: purging all foreign RNZN/RAN vessels, removing fictional names, doctrinally decoupling cruiser and capital ship classes, standardizing the `RPS ` prefix, and introducing 11 expansive universal thematic and politically segregated ideological pools.

---

## Namelist Groups

### Ship-Type Specific Category

Dedicated namelists tied to specific ship hulls and naval classifications:

| Group Tag | Type | Ship Types | Count | Sample Names |
| :--- | :--- | :--- | :--- | :--- |
| `PHI_DD_HISTORICAL` | Destroyers & Escorts | `ship_hull_light destroyer` | 128 | Rajah Soliman, Rajah Lakandula, Datu Sikatuna, Datu Kalantiaw, Sultan Kudarat, Andres Bonifacio, Gregorio del Pilar, Diego Silang, Miguel Malvar, Jose V. Andrada, Ramon Alcaraz, Heraclio Alano, Abra, Agusan, Pasig, San Juanico |
| `PHI_SS_HISTORICAL` | Submarines | `ship_hull_submarine submarine` | 62 | Pating, Paging Pari, Butanding, Tanigi, Malasugi, Tambakol, Lapu-Lapu, Espada, Galunggong, Bangus, Pugita, Balyena, Dugong, Bakunawa, Minokawa, Kurita, Tarabusaw, Santelmo |
| `PHI_CL_HISTORICAL` | Light Cruisers | `ship_hull_cruiser light_cruiser` | 74 | Manila, Quezon City, Baguio, Cavite City, Batangas City, Legazpi, Vigan, Cabanatuan, Olongapo, Cebu City, Iloilo City, Bacolod, Tacloban, Dumaguete, Cadiz, Davao City, Zamboanga City, Cagayan de Oro, General Santos |
| `PHI_CA_HISTORICAL` | Heavy Cruisers & Coastal Defense | `ship_hull_cruiser heavy_cruiser` | 47 | Pangasinan, Pampanga, Bulacan, Batangas, Laguna, Cavite, Tayabas, Ilocos Norte, Cagayan, Isabela, Bataan, Rizal, Albay, Palawan, Mindoro, Cebu, Iloilo, Leyte, Samar, Bohol, Davao, Zamboanga, Sulu |
| `PHI_BB_HISTORICAL` | Battleships & Capital Ships | `ship_hull_heavy battleship` | 35 | Luzon, Visayas, Mindanao, Republika Filipina, Malolos, Katipunan, Biak-na-Bato, Kakarong, Balintawak, Jose Rizal, Andres Bonifacio, Emilio Aguinaldo, Apolinario Mabini, Kasarinlan, Bansang Pilipinas |
| `PHI_BC_HISTORICAL` | Battlecruisers | `ship_hull_heavy battle_cruiser` | 35 | Maynila, Tondo, Madja-as, Butuan, Sugbu, Lupah Sug, Maguindanao, Karakoa, Balangay, Fort Santiago, Fort San Pedro, Fort Pilar, Corregidor, La Naval de Manila, Bangkusay, Mactan, Surigao Strait |
| `PHI_CV_HISTORICAL` | Aircraft Carriers | `ship_hull_carrier carrier` | 45 | Apo, Mayon, Taal, Pulag, Kanlaon, Banahaw, Pinatubo, Halcon, Ragang, Malindang, Kalatungan, Haribon, Agila, Lawin, Manaol, Banog, Minokawa, Bathala, Apolaki, Mayari, Tala, Kidlat, Gugurang, Sidapa |

---

### Universal Thematic Topic Category (Ship Designer)

Universal selection pools available for any ship hull or squadron in the Ship Designer:

| Group Tag | Topic Name | Ship Types | Count | Sample Names |
| :--- | :--- | :--- | :--- | :--- |
| `PHI_BIRDS` | Birds & Raptors | Universal | 36 | Haribon, Agila, Lawin, Kalaw, Manaol, Banog, Minokawa, Tarictic, Maya, Kulasisi, Tikling, Labuyo, Kanduro, Katala, Kuwago, Bahaw |
| `PHI_FISH` | Marine Life & Fish | Universal | 45 | Pating, Pagi, Tanigi, Malasugi, Butanding, Tambakol, Galunggong, Bangus, Lapu-Lapu, Espada, Dalagang Bukid, Pugita, Balyena, Dugong, Dorado |
| `PHI_GEOGRAPHY` | Peaks & Volcanoes | Universal | 35 | Apo, Mayon, Taal, Pulag, Kanlaon, Banahaw, Pinatubo, Makiling, Halcon, Madja-as, Ragang, Matutum, Bulusan, Isarog, Arayat, Kitanglad |
| `PHI_RIVERS` | Rivers & Waterways | Universal | 40 | Pasig, Cagayan, Agusan, Pampanga, Abra, Bicol, Marikina, Pulangi, Rio Grande de Mindanao, Chico, Agno, Jalaur, Sibuyan, San Juanico, Guimaras |
| `PHI_RULERS` | Datus & Rajahs | Universal | 35 | Lapulapu, Rajah Soliman, Rajah Lakandula, Rajah Humabon, Datu Sikatuna, Datu Kalantiaw, Sultan Kudarat, Rajah Matanda, Datu Piang, Lakan Dula, Datu Puti, Dayang Kalangitan |
| `PHI_HEROES` | Patriots & Heroes | Universal | 38 | Jose Rizal, Andres Bonifacio, Emilio Aguinaldo, Apolinario Mabini, Antonio Luna, Marcelo H. del Pilar, Melchora Aquino, Gabriela Silang, Diego Silang, Miguel Malvar, Jose V. Andrada, Ramon Alcaraz |
| `PHI_MYTHOLOGY` | Mythology & Deities | Universal | 35 | Bathala, Apolaki, Mayari, Tala, Hanan, Kidlat, Kulog, Bakunawa, Minokawa, Manaol, Gugurang, Kaptan, Magwayen, Sidapa, Kan-Laon, Lakapati |
| `PHI_VIRTUES` | Martial Virtues | Universal | 35 | Kagitingan, Katapangan, Tagumpay, Karangalan, Katapatan, Kalayaan, Kasarinlan, Kadakilaan, Kabayanihan, Magiting, Maharlika, Sandigan, Tanggulan, Daluyong, Sigwa |

---

### Dedicated Ideological Categories (Ship Designer)

Dedicated political concept pools segregated to prevent conflicting or contradictory doctrines from mixing:

| Group Tag | Topic Name | Ship Types | Count | Sample Names |
| :--- | :--- | :--- | :--- | :--- |
| `PHI_REPUBLICAN_IDEALS` | Republican Ideals | Universal | 35 | Republika, Konstitusyon, Demokrasya, Kasarinlan, Kalayaan, Katarungan, Soberanya, Komonwelt, Nasyonalismo, Bayanihan, Tatlong Bituin, Saligang Batas, Tanggulang Bansa |
| `PHI_SOCIALISM` | Socialist Ideals | Universal | 35 | Manggagawa, Magsasaka, Anakpawis, Hukbalahap, Sosyalismo, Komunismo, Pulang Bandila, Rebolusyon, Hukbo ng Bayan, Katarungang Panlipunan, Crisanto Evangelista, Pedro Abad Santos, Luis Taruc |
| `PHI_NATIONALISM` | Nationalist Ideals | Universal | 35 | Sakdal, Ganap, Makapili, Bagong Pilipinas, Lahi, Dugong Bughaw, Bayan Muna, Disiplina, Dakilang Lahi, Kalibapi, Tindig Pilipinas, Benigno Ramos, Artemio Ricarte, Jose P. Laurel |
