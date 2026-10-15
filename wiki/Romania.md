# Romania (ROM) Ship Namelists

Source file: `common/units/names_ships/ROM_ship_names.txt`

---

## Overview

The Romanian Navy grew out of the Danube flotilla that Alexandru Ioan Cuza founded in 1860, with Colonel Nicolae Steriade as its first commander. In the War of Independence of 1877 the spar-torpedo boat *Rândunica* sank the Ottoman monitor *Seyfi* on the Danube. The protected cruiser *Elisabeta* (1888) was the first sea-going warship. On the river, the four Brătianu-class monitors (1907-08) and eight Thames-built torpedo boats (1906-07) formed the core of the flotilla.

Four destroyers ordered from Pattison of Naples in 1913 (*Vifor*, *Vijelie*, *Vârtej*, *Viscol*) were requisitioned by Italy in 1915; two came back in 1920 as *Mărăști* and *Mărășești*. The interwar navy added the destroyers *Regele Ferdinand* and *Regina Maria* (1930-31), the submarine *Delfinul* (1936) and the tender *Constanța*. During the war the Galați yard completed the submarines *Rechinul* and *Marsuinul* and the minelayer *Amiral Murgescu*.

The navy's own naming formulas run through these classes: battles and royals for destroyers, storm words for torpedo boats and motor torpedo boats, fallen officers for river torpedo boats and gunboats, statesmen for monitors, and marine animals with the definite article for submarines.

In vanilla Hearts of Iron IV, Romania's ship namelist file (`ROM_ship_names.txt`) had these problems:
- **Cloned rosters:** light and heavy cruisers were the same 10-name list; battleships and battlecruisers were the same 3 cities.
- **Calqued fallbacks:** `Crucisator Lumina` (light as in illumination) for light cruisers and `Vas de Razboi` ("warship") for battleships.
- **No diacritics** in the hull lists, and a mix in the pools.
- **Post-war names:** the destroyer list held the corvettes of the 1980s and 1990s, named for admirals who were alive in 1936.
- **Foreign and duplicate entries:** a Mexican city (`Puebla`) and `Piatra Neamt` twice in the cities list; English exonyms (`Dobruja`, `Bukovina`) in the regions list.
- **Anachronisms:** `Cluj Napoca` (a name from 1974) and `Navodari` (a village until 1968).
- **Invented submarine names** next to the three real boats.

**ISNE** rebuilds the Romanian namelists as 24 groups:
- **Hull lists follow the navy's formulas.** Destroyers carry the real destroyers and the 1913 order, storm words, battles of 1877 and 1916-17, commanders of the flotilla and the navy, rivers with the article, and the old troops and weapons. Submarines carry Black Sea and Danube fish and sea creatures with the article. Light cruisers carry *Elisabeta* and the cities of Greater Romania. Heavy cruisers carry warrior princes, the captains of Mihai Viteazul, the leaders of 1784, 1821 and 1848, and the generals of 1877 and 1916-19.
- **Battleships and battlecruisers are split by doctrine.** Battleships carry sovereignty symbols, the historical provinces and the founding rulers. Battlecruisers carry historic vessels, medieval and Dacian fortresses, the Danube mouths and the battles of the voivodes. No name is shared between them.
- **Carriers** carry Carpathian peaks, raptors, aviation pioneers and the sky figures of folklore.
- **Two role pools** hold the river and coastal craft: Torpedo Boats (from *Rândunica* to the motor torpedo boats of 1944) and Monitors & Gunboats (the Danube flotilla).
- **Four ideological pools are gated by government through `can_use`.** Royal House is available under every government except a communist one, since Romania stays a kingdom under the others. Union & Liberty requires a democratic government, Labour Movement communism, and Nationalist Ideals fascism.
- **Authenticity over padding:** only eight senior naval commanders who were dead by 1936 could be sourced, so the destroyer list holds those eight and no invented officers. The ideological pools hold 20 to 30 names each.
- Romanian `ș` and `ț` are written with the cedilla forms `ş` and `ţ` in the file, which the map and main UI fonts can display (see [Engine Mechanics](Engine-Mechanics)).
- The vanilla prefix `NMS ` is kept on every group.

---

## Namelist Groups

### Ship-Type Specific Category

Dedicated namelists tied to specific ship hulls and naval classifications:

| Group Tag | Type | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `ROM_DD_HISTORICAL` | Destroyers & Escorts | `ship_hull_light destroyer` | Mărăşti, Mărăşeşti, Regele Ferdinand, Regina Maria, Amiral Murgescu, Vifor, Vijelie, Vârtej, Viscol, Crivăţ, Plevna, Oituz, Emanoil Koslinski, Prutul, Dorobanţul |
| `ROM_SS_HISTORICAL` | Submarines | `ship_hull_submarine submarine` | Delfinul, Rechinul, Marsuinul, Narvalul, Calcanul, Morunul, Nisetrul, Păstruga, Cega, Şipul, Chefalul, Ştiuca, Foca, Caracatiţa, Vulpea-de-mare |
| `ROM_CL_HISTORICAL` | Light Cruisers | `ship_hull_cruiser light_cruiser` | Elisabeta, Constanţa, Mangalia, Sulina, Galaţi, Brăila, Tulcea, Balcic, Ismail, Bucureşti, Iaşi, Craiova, Cluj, Timişoara, Cernăuţi, Chişinău |
| `ROM_CA_HISTORICAL` | Heavy Cruisers | `ship_hull_cruiser heavy_cruiser` | Vlad Ţepeş, Iancu de Hunedoara, Petru Rareş, Ioan Vodă cel Cumplit, Dromichete, Baba Novac, Horea, Cloşca, Crişan, Tudor Vladimirescu, Avram Iancu, General Dragalina, Ecaterina Teodoroiu |
| `ROM_BB_HISTORICAL` | Battleships | `ship_hull_heavy battleship` | România, România Mare, Unirea, Independenţa, Moldova, Muntenia, Transilvania, Ardeal, Basarabia, Bucovina, Burebista, Decebal, Ştefan cel Mare, Mihai Viteazul, Regele Carol I |
| `ROM_BC_HISTORICAL` | Battlecruisers | `ship_hull_heavy battle_cruiser` | Mircea, Dacia, Cetatea Albă, Cetatea Neamţului, Cetatea Sucevei, Poenari, Sarmizegetusa, Histria, Tomis, Gurile Dunării, Posada, Rovine, Podul Înalt, Războieni, Călugăreni |
| `ROM_CV_HISTORICAL` | Aircraft Carriers | `ship_hull_carrier carrier` | Moldoveanu, Negoiu, Omu, Ceahlău, Retezat, Bucegi, Pietrosul Rodnei, Acvila, Uliul, Zăganul, Aurel Vlaicu, Traian Vuia, Zburătorul, Pasărea Măiastră |

---

### Role-Specific Category

Universal pools for ship roles that have no hull token of their own:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `ROM_TORPEDO_BOATS` | Torpedo Boats | Universal | Rândunica, Şoimul, Vulturul, Năluca, Sborul, Smeul, Vedea, Trotuşul, Căpitan Nicolae Lascăr Bogdan, Căpitan Valter Mărăcineanu, Viforul, Vijelia, Viscolul, Vedenia |
| `ROM_GUNBOATS` | Monitors & Gunboats | Universal | Ion C. Brătianu, Lascăr Catargiu, Mihail Kogălniceanu, Alexandru Lahovari, Fulgerul, Griviţa, Rahova, Smârdan, Oltul, Siretul, Locotenent Lepri Remus |

---

### Universal Thematic Topic Category (Ship Designer)

Universal selection pools available for any ship hull or squadron in the Ship Designer:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `ROM_CITIES` | Cities & Ports | Universal | Constanţa, Mangalia, Balcic, Sulina, Galaţi, Brăila, Bucureşti, Ploieşti, Iaşi, Cluj, Sibiu, Braşov, Timişoara, Cernăuţi, Chişinău |
| `ROM_PROVINCES` | Provinces & Counties | Universal | Ţara Românească, Moldova, Transilvania, Dobrogea, Basarabia, Ţara Bârsei, Ţara Haţegului, Ţara Moţilor, Covurlui, Vlaşca, Romanaţi, Muscel, Caliacra, Durostor |
| `ROM_RIVERS` | Rivers & Lakes | Universal | Dunărea, Braţul Chilia, Braţul Sulina, Prut, Siret, Nistru, Olt, Mureş, Someş, Razim, Siutghiol, Snagov, Capul Midia |
| `ROM_GEOGRAPHY` | Mountains | Universal | Bucegi, Făgăraş, Retezat, Ceahlău, Rarău, Piatra Craiului, Moldoveanu, Negoiu, Omu, Caraiman, Predeal, Tihuţa |
| `ROM_RULERS` | Rulers | Universal | Burebista, Decebal, Litovoi, Basarab I, Mircea cel Bătrân, Vlad Ţepeş, Neagoe Basarab, Mihai Viteazul, Dragoş, Alexandru cel Bun, Ştefan cel Mare, Petru Rareş, Vasile Lupu, Alexandru Ioan Cuza |
| `ROM_HEROES` | Heroes & Scholars | Universal | Horea, Tudor Vladimirescu, Avram Iancu, Nicolae Bălcescu, Gheorghe Şincai, Ecaterina Teodoroiu, Mihai Eminescu, Ion Creangă, Nicolae Grigorescu, Anghel Saligny, Aurel Vlaicu |
| `ROM_BATTLES` | Battles | Universal | Posada, Rovine, Podul Înalt, Războieni, Călugăreni, Şelimbăr, Plevna, Griviţa, Smârdan, Oituz, Mărăşti, Mărăşeşti, Prunaru |
| `ROM_MYTHOLOGY` | Myth & Folklore | Universal | Zamolxe, Gebeleizis, Făt-Frumos, Ileana Cosânzeana, Harap-Alb, Meşterul Manole, Mioriţa, Zmeu, Balaur, Pasărea Măiastră, Iele, Sânziene, Baba Dochia |
| `ROM_BIRDS` | Birds | Universal | Pelican, Pelican Creţ, Egretă, Lebădă, Cormoran, Acvilă, Şoim, Zăgan, Cocoş de Munte, Dropie, Ciocârlie, Privighetoare, Stârc |
| `ROM_FISH` | Fish | Universal | Morun, Nisetru, Cegă, Păstrugă, Scrumbie de Dunăre, Hamsie, Calcan, Lufar, Zărgan, Lostriţă, Şalău, Ştiucă, Somn, Păstrăv |
| `ROM_VIRTUES` | Virtues & Elements | Universal | Vitejia, Credinţa, Onoarea, Datoria, Biruinţa, Izbânda, Neatârnarea, Furtuna, Crivăţul, Luceafărul, Steaua Polară, Zorile |
| `ROM_MONARCHISM` | Royal House | Universal (every government except communism) | Regele Carol I, Regina Elisabeta, Regele Ferdinand, Regina Maria, Mare Voievod de Alba Iulia, Nihil Sine Deo, Coroana de Oţel, Trăiască Regele, Steaua României, Peleş |
| `ROM_REVOLUTION` | Union & Liberty | Universal (democratic) | Proclamaţia de la Islaz, Câmpia Libertăţii, Mica Unire, Marea Unire, Memorandul, Constituţia din 1866, Ion C. Brătianu, Mihail Kogălniceanu, C. A. Rosetti, Take Ionescu |
| `ROM_SOCIALISM` | Labour Movement | Universal (communism) | Constantin Dobrogeanu-Gherea, I. C. Frimu, Ştefan Gheorghiu, Vasile Roaită, Răscoala din 1907, Greva de la Griviţa, România Muncitoare, Întâi Mai |
| `ROM_NATIONALISM` | Nationalist Ideals | Universal (fascism) | România Mare, Columna lui Traian, Ginta Latină, Dacia Felix, Neamul, Glia, Garda de Fier, Arhanghelul Mihail, Totul pentru Ţară |
