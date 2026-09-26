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

---

## Namelist Groups

### Ship-Type Specific Category

| Group Tag | Type | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `TUR_DD_HISTORICAL` | Destroyers & Escorts | `ship_hull_light destroyer` | Kocatepe, Adatepe, Tınaztepe, Zafer, Yücetepe, Savaştepe, Alçıtepe, Anıttepe, Metristepe, Duatepe, Demirhisar, Sultanhisar, Muavenet, Gayret, Yarhisar, Sivrihisar, Peyk, Berk, Alp Arslan, Mareşal Fevzi Çakmak, Kılıç Ali Paşa, Piyale Paşa, Gaziantep, Gelibolu |
| `TUR_SS_HISTORICAL` | Submarines | `ship_hull_submarine submarine ship_hull_midget_submarine` | Birinci İnönü, İkinci İnönü, Sakarya, Dumlupınar, Atılay, Saldıray, Batıray, Yıldıray, Korkutay, Vuray, Pusulay, Gür, Doğanay, Dolunay, Oruç Reis, Murat Reis, Burak Reis, Seydi Ali Reis, Hızır Reis, Piri Reis, Turgut Reis, Uluç Ali Reis, Preveze, Cerbe |
| `TUR_CL_HISTORICAL` | Light Cruisers | `ship_hull_cruiser light_cruiser` | Hamidiye, Mecidiye, Midilli, İzmir, Samsun, Trabzon, Sinop, Mersin, İskenderun, Bandırma, Antalya, Giresun, Rize, Fethiye, Bodrum, Çeşme, Alanya, Mudanya, Ayvalık, Zonguldak, Hopa, Bartın, İnebolu, Marmaris, Keşan, Balıkesir |
| `TUR_CA_HISTORICAL` | Heavy Cruisers & Coastal Defense | `ship_hull_cruiser heavy_cruiser` | Çanakkale, Gelibolu, Edirne, Seddülbahir, Kilitbahir, Kumkale, Boğaziçi, Kafkas, Anadolu, Rumeli, Anadolu Kavağı, Rumeli Kavağı, Dardanel, Gölcük, Tuzla, Yalova, Gebze, Urla, Marmara, Trakya, Ege, Akdeniz, Karadeniz |
| `TUR_BB_HISTORICAL` | Battleships & Capital Ships | `ship_hull_heavy battleship` | Reşadiye, Sultan Osman-ı Evvel, Fatih Sultan Mehmed, Barbaros Hayreddin, Turgut Reis, Mesudiye, Mahmudiye, Asar-ı Tevfik, Âsâr-ı Şevket, Necm-i Şevket, Gazi Mustafa Kemal, Atatürk, Fatih, Kanuni, Yavuz Sultan Selim, Alp Arslan, İstanbul, Bursa, Edirne |
| `TUR_BC_HISTORICAL` | Battlecruisers | `ship_hull_heavy battle_cruiser` | Yavuz, Yavuz Sultan Selim, Yıldırım, Yıldırım Bayezid, Attila, Timur, Subutay, Cengiz Han, Kılıç Arslan, Selim, Gazi Umur Bey, Çaka Bey, Tuğrul Bey, Yıldırım Kemal, Şimşek, Kasırga, Bora, Tayfun, Fırtına, Poyraz |
| `TUR_CV_HISTORICAL` | Aircraft Carriers | `ship_hull_carrier carrier` | Bandırma, Samsun, Cumhuriyet, İstiklal, Kurtuluş, Zafer, Vatan, Millet, Hürriyet, Gazi, Gökdoğan, Bozdoğan, Şahin, Kartal, Sungur, Doğan, Tuğrul, Hüma, Gökler, Gökyüzü |

---

### Universal Thematic Topic Category (Ship Designer)

Universal selection pools available for any ship hull or squadron:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `TUR_RULERS` | Sultans & Khans | Universal | Osman Gazi, Orhan Gazi, Murad Hüdavendigâr, Yıldırım Bayezid, Fatih Sultan Mehmed, Yavuz Sultan Selim, Kanuni Sultan Süleyman, Alp Arslan, Tuğrul Bey, Kılıç Arslan, Alaeddin Keykubad, Attila, Bilge Kağan |
| `TUR_ADMIRALS` | Admirals & Corsairs | Universal | Çaka Bey, Barbaros Hayreddin Paşa, Turgut Reis, Piri Reis, Oruç Reis, Kılıç Ali Paşa, Piyale Paşa, Seydi Ali Reis, Murat Reis, Burak Reis, Salih Reis, Uluç Ali Reis, Cezayirli Gazi Hasan Paşa, Karamürsel Bey, Rauf Orbay |
| `TUR_CITIES` | Cities & Ports | Universal | İstanbul, İzmir, Ankara, Bursa, Adana, Antalya, Trabzon, Samsun, Mersin, Gaziantep, Diyarbakır, Konya, Eskişehir, Kayseri, Edirne, Çanakkale, Sinop, İskenderun, Tekirdağ, Zonguldak, Balıkesir, Kocaeli, Manisa |
| `TUR_PROVINCES` | Provinces & Regions | Universal | Anadolu, Rumeli, Trakya, Ege, Akdeniz, Karadeniz, Marmara, Kapadokya, Kilikya, Hüdavendigâr, Aydın, Saruhan, Karesi, Menteşe, Kastamonu, Sivas, Erzurum, Diyarbekir, Trabzon, Halep, Musul |
| `TUR_RIVERS` | Rivers & Waterways | Universal | Fırat, Dicle, Kızılırmak, Yeşilırmak, Sakarya, Seyhan, Ceyhan, Gediz, Büyük Menderes, Küçük Menderes, Meriç, Aras, Çoruh, Asi, Göksu, Susurluk, Tunca, Ergene, Bakırçay, Dalaman, Manavgat |
| `TUR_MOUNTAINS` | Peaks & Landmarks | Universal | Ağrı, Erciyes, Süphan, Kaçkar, Toros, Uludağ, Palandöken, Hasan Dağı, Ilgaz, Cilo, Munzur, Yıldız, Murat Dağı, Nemrut, Kocatepe, Adatepe, Tınaztepe, Metristepe, Duatepe, Kaz Dağı |
| `TUR_BATTLES` | Historic Battles | Universal | Preveze, Cerbe, Çanakkale, Dumlupınar, Sakarya, İnönü, Malazgirt, Mohaç, Niğbolu, Varna, Kosova, Ridaniye, Mercidabık, Çaldıran, Otlukbeli, Dandanaqan, Büyük Taarruz, Anafartalar |
| `TUR_BIRDS` | Birds of Prey | Universal | Kartal, Şahin, Doğan, Atmaca, Gökdoğan, Bozdoğan, Sungur, Çakır, Kerkenez, Akbaba, Kuzgun, Tuğrul, Balıkkartalı, Kızılşahin, Tavşancıl, Şah Kartal, Kaya Kartalı, Turna |
| `TUR_FISH` | Aquatic Life | Universal | Yunus, Kılıç, Levrek, Orfoz, Lüfer, Palamut, Kefal, Kalkan, Mersin, Torik, Zargana, Çipura, Barbun, Uskumru, Alabalık, Vatoz, Kolyoz, Sardalya, Hamsi, Mercan, Sinarit |
| `TUR_BEASTS` | Fauna & Predators | Universal | Bozkurt, Kurt, Aslan, Kaplan, Pars, Sırtlan, Ayı, Vaşak, Panter, Çakal, Tilki, Anadolu Parsı, Yaban Domuzu, Karaca, Dağ Keçisi, Alageyik, Karakulak, Porsuk |
| `TUR_VIRTUES` | Martial Virtues | Universal | İstiklal, Hürriyet, Cumhuriyet, Vatan, Millet, Zafer, Gayret, Cesaret, Muavenet, Sadakat, Metanet, Kahramanlık, Şeref, Namus, Azim, Fedakarlık, Hakimiyet, Adalet, Birlik |
