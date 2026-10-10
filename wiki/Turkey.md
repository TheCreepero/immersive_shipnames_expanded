# Turkey (TUR) Ship Namelists

Source file: `common/units/names_ships/TUR_ship_names.txt`

---

## Overview

The Republic of Turkey (*Türkiye Cumhuriyeti*) maintained an ambitious naval modernization program across the interwar and World War II eras, grounded in the proud maritime heritage of the Ottoman Navy (*Osmanlı Donanması*) and the lessons of the Turkish War of Independence. Led by the iconic battlecruiser *TCG Yavuz* (the fleet's flagship and strategic anchor), modern destroyers built in Italy and Britain, and an indigenous submarine expansion program initiated by Mustafa Kemal Atatürk, the Turkish Naval Forces (*Türk Deniz Kuvvetleri*) guarded the vital Turkish Straits (*Boğazlar*), the Aegean, the Black Sea, and the Mediterranean.

In vanilla Hearts of Iron IV, Turkish naval namelists suffered from severe inaccuracies and machine-translation calques:
- **Calqued Fallback Names**: Destroyers used `"%d. Yok Edici"` (a comic Google-translated calque translating "Destroyer" as terminator/annihilator) rather than authentic Turkish naval terminology `Muhrip` (`"Muhrip %d"`), while light cruisers used `"%d. Isik Kruvazör"` (translating "Light" as illumination/sunlight rather than displacement).
- **Misallocated Ship Hulls**: Atatürk's *Ay*-class submarines (*Batıray*, *Yıldıray*, *Saldıray*) were misplaced into Battlecruisers and Battleships alongside a fictional hybrid invention (`"Yavuzay"`), while the super-dreadnought *Reşadiye* (HMS *Erin*) was assigned to Light Cruisers and cruiser *Midilli* (SMS *Breslau*) to Battleships.
- **Diacritic & Typographical Errors**: Complete absence of Turkish diacritics (*ç, ğ, ı, ö, ş, ü, İ*), duplicate listings with and without spaces, and garbled names like `"Alp Arslam"` and `"Maresal Fevzi cakmak"`.

*Immersive Ship Names Expanded* provides complete, historically and linguistically authentic namelists for Turkey, featuring 7 expanded ship-type specific groups and 11 universal thematic pools for the Ship Designer. All Turkish ships carry the historical prefix `TCG ` (*Türkiye Cumhuriyeti Gemisi*).

**Scope notes**:
- **Submarines**: the vessel names and the corsair captains (*Reisler*) are attested: the battle names of the first Republican boats, the *Ay*-class names (*Atılay*, *Saldıray*, *Batıray*, *Yıldıray*) with their successors *Doğanay* and *Dolunay*, and the three Ottoman submarines (*Abdülhamid*, *Abdülmecid*, *Müstecip Onbaşı*). The marine-fauna section and the descriptors *Hilal*, *Yeniay*, *Derin*, *Dalgıç* and *Sualtı* are plausible extrapolation from real Turkish words for a large wartime fleet. Invented extensions of the *-ay* pattern are not listed.
- **Admirals & Corsairs**: every entry is an individually verified kapudan pasha, corsair or naval officer. Names that could not be traced to a specific person were removed rather than kept as filler.
- **One personal form per class**: each sultan, founder or admiral appears under one personal form in a hull group (the battlecruisers carry *Yavuz*, the battleships *Atatürk* and *Sultan Osman-ı Evvel*). The navy's historic *-iye* ship names derived from sultans (*Reşadiye*, *Orhaniye*, *Osmaniye*) are kept beside them. City names stay with the light cruisers, while the battleships take sovereigns, historic ironclads and realm-level names.

---

## Namelist Groups

### Ship-Type Specific Category

| Group Tag | Type | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `TUR_DD_HISTORICAL` | Destroyers & Escorts | `ship_hull_light destroyer` | Kocatepe, Adatepe, Tınaztepe, Zafer, Yücetepe, Savaştepe, Alçıtepe, Anıttepe, Metristepe, Duatepe, Demirhisar, Sultanhisar, Muavenet, Gayret, Yarhisar, Sivrihisar, Peyk, Berk, Alp Arslan, Mareşal Fevzi Çakmak, Kılıç Ali Paşa, Piyale Paşa, Gaziantep, Gelibolu |
| `TUR_SS_HISTORICAL` | Submarines | `ship_hull_submarine submarine ship_hull_midget_submarine` | Birinci İnönü, İkinci İnönü, Sakarya, Dumlupınar, Atılay, Saldıray, Batıray, Yıldıray, Gür, Doğanay, Dolunay, Oruç Reis, Murat Reis, Burak Reis, Seydi Ali Reis, Hızır Reis, Piri Reis, Turgut Reis, Uluç Ali Reis, Preveze, Cerbe, Hilal, Yeniay, Derin |
| `TUR_CL_HISTORICAL` | Light Cruisers | `ship_hull_cruiser light_cruiser` | Hamidiye, Mecidiye, Midilli, İzmir, Samsun, Trabzon, Sinop, Mersin, İskenderun, Antalya, Giresun, Rize, Fethiye, Bodrum, Çeşme, Alanya, Mudanya, Ayvalık, Zonguldak, Hopa, Bartın, İnebolu, Marmaris, Keşan, Balıkesir, Peyk-i Şevket |
| `TUR_CA_HISTORICAL` | Heavy Cruisers & Coastal Defense | `ship_hull_cruiser heavy_cruiser` | Çanakkale, Gelibolu, Seddülbahir, Kilitbahir, Kumkale, Boğaziçi, Kafkas, Anadolu, Rumeli, Anadolu Kavağı, Rumeli Kavağı, Gölcük, Tuzla, Gebze, Marmara, Trakya, Ege, Akdeniz, Karadeniz, Anafartalar, Conkbayırı, Arıburnu, Kanlısırt |
| `TUR_BB_HISTORICAL` | Battleships & Capital Ships | `ship_hull_heavy battleship` | Reşadiye, Sultan Osman-ı Evvel, Fatih Sultan Mehmed, Barbaros Hayreddin, Turgut Reis, Mesudiye, Mahmudiye, Âsâr-ı Şevket, Necm-i Şevket, Atatürk, Kanuni Sultan Süleyman, Alp Arslan, Âsâr-ı Tevfik, Orhaniye, Osmaniye, Aziziye, Feth-i Bülend, Mukaddeme-i Hayır, Avnillah |
| `TUR_BC_HISTORICAL` | Battlecruisers | `ship_hull_heavy battle_cruiser` | Yavuz, Yıldırım Bayezid, Attila, Timur, Subutay, Cengiz Han, Kılıç Arslan, Gazi Umur Bey, Çaka Bey, Tuğrul Bey, Şimşek, Kasırga, Bora, Tayfun, Fırtına, Poyraz, Çağrı Bey, Babür Şah, Baybars, Battal Gazi |
| `TUR_CV_HISTORICAL` | Aircraft Carriers | `ship_hull_carrier carrier` | Bandırma, Cumhuriyet, İstiklal, Kurtuluş, Zafer, Vatan, Hürriyet, Gökdoğan, Bozdoğan, Şahin, Kartal, Sungur, Doğan, Tuğrul Kuşu, Hüma, Gökler, Gökyüzü, Anka, Karakuş, Hâkimiyet-i Milliye |

---

### Universal Thematic Topic Category (Ship Designer)

Universal selection pools available for any ship hull or squadron:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `TUR_RULERS` | Sultans & Khans | Universal | Osman Gazi, Orhan Gazi, Murad Hüdavendigâr, Yıldırım Bayezid, Fatih Sultan Mehmed, Yavuz Sultan Selim, Kanuni Sultan Süleyman, Alp Arslan, Tuğrul Bey, Kılıç Arslan, Alaeddin Keykubad, Attila, Bilge Kağan |
| `TUR_ADMIRALS` | Admirals & Corsairs | Universal | Çaka Bey, Barbaros Hayreddin Paşa, Turgut Reis, Piri Reis, Oruç Reis, Kılıç Ali Paşa, Piyale Paşa, Seydi Ali Reis, Murat Reis, Burak Reis, Salih Reis, Cezayirli Gazi Hasan Paşa, Karamürsel Bey, Rauf Orbay, Kemal Reis |
| `TUR_CITIES` | Cities & Ports | Universal | İstanbul, İzmir, Ankara, Bursa, Adana, Antalya, Trabzon, Samsun, Mersin, Gaziantep, Diyarbakır, Konya, Eskişehir, Kayseri, Edirne, Çanakkale, Sinop, İskenderun, Tekirdağ, Zonguldak, Balıkesir, Kocaeli, Manisa |
| `TUR_PROVINCES` | Provinces & Regions | Universal | Anadolu, Rumeli, Trakya, Ege, Akdeniz, Karadeniz, Marmara, Kapadokya, Kilikya, Hüdavendigâr, Aydın, Saruhan, Karesi, Menteşe, Kastamonu, Sivas, Erzurum, Diyarbekir, Trabzon, Halep, Musul |
| `TUR_RIVERS` | Rivers | Universal | Fırat, Dicle, Kızılırmak, Yeşilırmak, Sakarya, Seyhan, Ceyhan, Gediz, Büyük Menderes, Küçük Menderes, Meriç, Aras, Çoruh, Asi, Göksu, Susurluk, Tunca, Ergene, Bakırçay, Dalaman, Manavgat |
| `TUR_MOUNTAINS` | Mountains & Hills | Universal | Ağrı, Erciyes, Süphan, Kaçkar, Toros, Uludağ, Palandöken, Hasan Dağı, Ilgaz, Cilo, Munzur, Yıldız, Murat Dağı, Nemrut, Kocatepe, Adatepe, Tınaztepe, Metristepe, Duatepe, Kaz Dağı |
| `TUR_BATTLES` | Historic Battles | Universal | Preveze, Cerbe, Çanakkale, Dumlupınar, Sakarya, İnönü, Malazgirt, Mohaç, Niğbolu, Varna, Kosova, Ridaniye, Mercidabık, Çaldıran, Otlukbeli, Büyük Taarruz, Anafartalar, Sırpsındığı |
| `TUR_BIRDS` | Birds | Universal | Kartal, Şahin, Doğan, Atmaca, Gökdoğan, Bozdoğan, Sungur, Çakır, Kerkenez, Akbaba, Kuzgun, Tuğrul, Balıkkartalı, Kızılşahin, Tavşancıl, Şah Kartal, Kaya Kartalı, Turna |
| `TUR_FISH` | Aquatic Life | Universal | Yunus, Levrek, Orfoz, Lüfer, Palamut, Kefal, Kalkan, Torik, Zargana, Çipura, Barbun, Uskumru, Alabalık, Vatoz, Kolyoz, Sardalya, Hamsi, Mercan, Sinarit, Lagos, Trança |
| `TUR_BEASTS` | Fauna & Predators | Universal | Bozkurt, Kurt, Aslan, Kaplan, Pars, Sırtlan, Ayı, Vaşak, Panter, Çakal, Tilki, Anadolu Parsı, Yaban Domuzu, Karaca, Dağ Keçisi, Alageyik, Karakulak, Porsuk |
| `TUR_VIRTUES` | Virtues & Ideals | Universal | İstiklal, Hürriyet, Cumhuriyet, Vatan, Zafer, Gayret, Cesaret, Muavenet, Sadakat, Metanet, Kahramanlık, Şeref, Namus, Azim, Adalet, Birlik, Fedakârlık, Hâkimiyet, Millî İrade |
