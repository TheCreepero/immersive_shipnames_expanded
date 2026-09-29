# Italy (ITA) Ship Namelists

Source file: `common/units/names_ships/ITA_ship_names.txt`

---

## Overview

The *Regia Marina* was the largest navy in the Mediterranean between the wars. It fielded the *Littorio*-class fast battleships, the *Zara*-class heavy cruisers, the *Condottieri* and *Capitani Romani* light cruisers, more than a hundred destroyers and torpedo boats, and one of the world's largest submarine fleets. Its naming traditions were unusually systematic. Destroyer classes were named after winds, soldiers, virtues, writers and gold-medal commanders. Torpedo boats took stars, nymphs, storms and Garibaldi's Thousand, and scouts were named after navigators. Light cruisers honoured condottieri and Roman generals, heavy cruisers the cities "redeemed" in 1918, and submarines gems, metals, colonial battles and heroes.

Vanilla Hearts of Iron IV already carried a large Italian file. Its flaws:
- **Mixed DD group:** torpedo boats and scouts were folded into the destroyer list.
- **Mislabelled "fictional" ships:** several real older ships were marked fictional (the *Regioni* cruisers, *Carlo Alberto Racchia*, *Irrequieto*).
- **Typos:** *Impetouso*, *Ruthenio*, *Lucio Cornelio Silla*, *Giovanni dalle Bande Nere*, *Dalmatia* and *Kismaayo*.
- **Duplicate:** *Astore* appeared in both the destroyer and carrier lists.
- **Thin capital-ship and carrier lists.**

*Immersive Ship Names Expanded* separates these roles, restores the class lineages and extends every documented naming formula. It adds 13 thematic pools, four ideology-gated pools and six role pools for the Ship Designer.

**Prefixes.** Italy keeps vanilla's hull-specific prefixes: `RCT ` (*Regio Cacciatorpediniere*) for destroyers, `RI ` (*Regio Incrociatore*) for cruisers and battlecruisers, `RN ` (*Regia Nave*) for battleships, carriers and pools, and `RSmg ` (*Regio Sommergibile*) for submarines. The torpedo-boat pool uses the historical `RT ` (*Regia Torpediniera*).

---

## Namelist Groups

### Ship-Type Specific Category

| Group Tag | Type | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `ITA_DD_HISTORICAL` | Destroyers | `ship_hull_light destroyer` | Lampo, Folgore, Maestrale, Libeccio, Alpino, Bersagliere, Granatiere, Audace, Ardito, Impetuoso, Alfredo Oriani, Nazario Sauro, Premuda, Comandante Margottini, Comandante Moccagatta, Luigi Rizzo, Carlo Bergamini, Luigi Durand de la Penne, Teseo Tesei, Guglielmo Oberdan, Ugo Foscolo, Paracadutista, Invitto, Tramontana |
| `ITA_SS_HISTORICAL` | Submarines | `ship_hull_submarine submarine ship_hull_midget_submarine ship_hull_cruiser_submarine` | Pietro Calvi, Enrico Tazzoli, Perla, Ambra, Scirè, Adua, Barbarigo, Comandante Cappellini, Leonardo da Vinci, Guglielmo Marconi, Platino, Tritone, Flutto, Murena, Rutenio, Pietro Micca, Balilla, Enrico Toti, Salvatore Todaro, Primo Longobardo, Agata, Titanio |
| `ITA_CL_HISTORICAL` | Light Cruisers | `ship_hull_cruiser light_cruiser` | Alberto di Giussano, Bartolomeo Colleoni, Giovanni delle Bande Nere, Luigi Cadorna, Raimondo Montecuccoli, Eugenio di Savoia, Giuseppe Garibaldi, Attilio Regolo, Scipione Africano, Cornelio Silla, Venezia, Etna, Bari, Taranto, Libia, Francesco Sforza, Gattamelata, Fabio Massimo, Enrico Caviglia |
| `ITA_CA_HISTORICAL` | Heavy Cruisers | `ship_hull_cruiser heavy_cruiser` | Trento, Trieste, Zara, Fiume, Gorizia, Pola, Bolzano, San Giorgio, San Marco, Pisa, Amalfi, Varese, Vettor Pisani, Marco Polo, Rovereto, Merano, Capodistria, Parenzo, Cherso, Lussino, Spalato, Traù |
| `ITA_BB_HISTORICAL` | Battleships | `ship_hull_heavy battleship` | Conte di Cavour, Giulio Cesare, Caio Duilio, Andrea Doria, Dante Alighieri, Vittorio Veneto, Roma, Italia, Regina Elena, Regina Margherita, Benedetto Brin, Re d'Italia, Formidabile, Patria, Risorgimento, Michelangelo Buonarroti, Francesco Petrarca, Giuseppe Verdi, Alessandro Volta |
| `ITA_BC_HISTORICAL` | Battlecruisers | `ship_hull_heavy battle_cruiser` | Francesco Caracciolo, Cristoforo Colombo, Marcantonio Colonna, Francesco Morosini, Ruggiero di Lauria, Affondatore, Serenissima, La Superba, Stato da Mar, Repubblica di Amalfi, Bucintoro, Lanterna, Meloria, Lepanto, Punta Stilo, Carlo Zeno, Lamba Doria, Paolo Thaon di Revel |
| `ITA_CV_HISTORICAL` | Aircraft Carriers | `ship_hull_carrier carrier` | Aquila, Sparviero, Giuseppe Miraglia, Europa, Grifone, Gheppio, Pellegrino, Falco della Regina, Aquila Reale, Gufo Reale, Icaro, Dedalo, Francesco De Pinedo, Arturo Ferrarin, Umberto Maddalena, Francesco Agello, Pier Ruggero Piccio, Carlo Emanuele Buscaglia |

---

### Universal Thematic Topic Category (Ship Designer)

Universal selection pools available for any ship hull or squadron:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `ITA_REGIONS` | Regions | Universal | Piemonte, Lucania, Toscana, Venezia Giulia, Dalmazia, Istria, Friuli, Magna Grecia, Monferrato, Granducato di Toscana, Regno delle Due Sicilie, Maremma, Salento, Gallura, Valtellina |
| `ITA_CITIES` | Cities | Universal | Milano, Torino, Palermo, Firenze, Genova, Messina, Livorno, Cagliari, Siracusa, La Spezia, Portofino, Civitavecchia, Gaeta, Taormina, Alghero, Urbino |
| `ITA_COLONIES` | Colonies | Universal | Tripoli, Bengasi, Tobruk, Leptis Magna, Massaua, Asmara, Assab, Mogadiscio, Chisimaio, Addis Abeba, Harar, Rodi, Castelrosso, Valona, Tientsin |
| `ITA_MYTHOLOGY` | Mythology | Universal | Giove, Nettuno, Marte, Giano, Bellona, Tinia, Menrva, Nethuns, Enea, Turno, Palinuro, Romolo, Scilla, Cariddi, Colapesce, Orlando, Bradamante |
| `ITA_BIRDS` | Birds | Universal | Sterna, Albatro, Fenicottero, Martin Pescatore, Cavaliere d'Italia, Rondine, Usignolo, Pettirosso, Upupa, Gruccione, Corvo Imperiale, Civetta, Allocco |
| `ITA_FISH` | Aquatic Life | Universal | Tonno, Pesce Spada, Verdesca, Storione, Orata, Branzino, Triglia, Scorfano, Trota, Luccio, Capodoglio, Tursiope, Polpo, Aragosta, Cavalluccio Marino |
| `ITA_RIVERS` | Rivers & Lakes | Universal | Po, Adige, Ticino, Tagliamento, Brenta, Arno, Tevere, Volturno, Garigliano, Simeto, Tirso, Verbano, Lario, Benaco, Trasimeno, Bolsena |
| `ITA_GEOGRAPHY` | Geography | Universal | Monte Bianco, Cervino, Marmolada, Tre Cime, Gran Sasso, Maiella, Campi Flegrei, Capri, Ischia, Lampedusa, Pantelleria, Brennero, Stelvio, Stretto di Messina, Capo Passero |
| `ITA_RULERS` | Rulers | Universal | Numa Pompilio, Marco Aurelio, Costantino, Teodorico, Alboino, Liutprando, Federico II, Matilde di Canossa, Lorenzo il Magnifico, Francesco Foscari |
| `ITA_HEROES` | Heroes & Genius | Universal | Giordano Bruno, Cesare Beccaria, Sandro Botticelli, Gian Lorenzo Bernini, Caravaggio, Giacomo Puccini, Antonio Vivaldi, Enrico Fermi, Amedeo Avogadro, Vittorio Bottego, Carlo Pisacane, Anita Garibaldi |
| `ITA_BATTLES` | Battles | Universal | Zama, Campi Raudii, Metauro, Campaldino, Anghiari, Magenta, Bezzecca, Porta Pia, Cinque Giornate, Piave, Solstizio, Bainsizza, Beffa di Buccari, Nikolajewka |
| `ITA_VIRTUES` | Virtues | Universal | Ardire, Audacia, Valore, Coraggio, Fedeltà, Onore, Vittoria, Tenacia, Slancio, Abnegazione, Ardimento |
| `ITA_NATURE` | Weather & Skies | Universal | Burrasca, Tempesta, Procella, Tuono, Alba, Cometa, Via Lattea, Betelgeuse, Fomalhaut, Merope, Croce del Sud, Corona Boreale |

---

### Ideology-Gated Pools (Ship Designer)

Each pool is available only while Italy has the matching government (`can_use = { has_government = ... }`); none is tied to a national focus.

| Group Tag | Topic Name | Ideology | Sample Names |
| :--- | :--- | :--- | :--- |
| `ITA_FASCISM` | Fascist Regime | `fascism` | Littorio, Impero, Camicia Nera, Squadrista, Costanzo Ciano, Italo Balbo, Marcia su Roma, Mare Nostrum, Reggenza del Carnaro, Legione, Nizza, Malta |
| `ITA_MONARCHISM` | House of Savoy | `neutrality` | Umberto Biancamano, Conte Verde, Conte Rosso, Carlo Emanuele I, Vittorio Amedeo II, Carlo Felice, Principe di Piemonte, Croce Sabauda, Corona Ferrea, Re Galantuomo |
| `ITA_REPUBLICAN_IDEALS` | Republican Ideals | `democratic` | Repubblica Romana, Giovine Italia, Dio e Popolo, Libertà, Giuseppe Mazzini, Carlo Cattaneo, Giacomo Matteotti, Piero Gobetti, Carlo Rosselli, Alcide De Gasperi |
| `ITA_SOCIALISM` | Socialist Heroes | `communism` | Antonio Gramsci, Antonio Labriola, Andrea Costa, Filippo Turati, Anna Kuliscioff, Giuseppe Di Vittorio, Biennio Rosso, Ordine Nuovo, Primo Maggio, Bandiera Rossa |

---

### Role-Specific Pools (Ship Designer)

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `ITA_TORPEDO_BOATS` | Torpedo Boats | Universal | Spica, Sirio, Vega, Circe, Lupo, Ciclone, Ghibli, Ariete, Alabarda, Orsa, Pegaso, Rosolino Pilo, Giuseppe Sirtori, Giuseppe La Masa, Generale Antonio Cantore, Palestro, Curtatone, Stefano Türr |
| `ITA_SCOUT_CRUISERS` | Scout Cruisers | Universal | Alvise Da Mosto, Antonio Pigafetta, Nicolò Zeno, Leone, Tigre, Carlo Mirabello, Alessandro Poerio, Falco, Nibbio, Quarto, Nino Bixio, Amerigo Vespucci, Giovanni Caboto |
| `ITA_CORVETTES` | Corvettes | Universal | Gabbiano, Procellaria, Cormorano, Ape, Lucciola, Antilope, Camoscio, Artemide, Chimera, Minerva, Urania, Scimitarra, Baionetta, Colubrina |
| `ITA_MINELAYERS` | Minelayers | Universal | Azio, Ostia, Legnano, Milazzo, Dardanelli, Fasana, Buccari, Durazzo, Pelagosa, Barletta, Brioni, Lero, Monte Gargano |
| `ITA_MONITORS` | Monitors | Universal | Faà di Bruno, Alfredo Cappellini, Monte Santo, Sabotino, Monte Grappa, Monte Cengio, Montello, Carso, Pasubio |
| `ITA_AUXILIARY_CRUISERS` | Auxiliary Cruisers | Universal | RAMB I, RAMB II, Città di Napoli, Città di Palermo, Città di Tunisi, Arborea, Caralis, Lago Tana, Attilio Deffenu, Filippo Grimani |

Every role pool follows a documented Regia Marina series:
- **Torpedo boats** (*torpediniere*): the *Spica*, *Ciclone*, *Ariete* and *Orsa* classes, plus the destroyers of the *Pilo*, *Sirtori*, *La Masa*, *Generali*, *Palestro* and *Curtatone* classes, reclassified as torpedo boats in 1929. The Garibaldini formula is extended with further members of the Thousand.
- **Scout cruisers** (*esploratori*): the *Navigatori*, *Leone*, *Mirabello*, *Poerio* and *Aquila* classes and the *Quarto*/*Bixio* scouts. The navigators formula is extended.
- **Corvettes:** the 60 planned *Gabbiano* class, named after seabirds, insects, mountain game, myth and ancient weapons.
- **Minelayers:** the *Azio* and *Fasana* classes and requisitioned motor ships.
- **Monitors:** WWI *pontoni armati*.
- **Auxiliary cruisers:** the RAMB ships and the *Città di* ferries.

The virtue-named *Ciclone*-class boats (*Animoso*, *Ardito*, *Impavido* and others) stay with the destroyers that first carried those names.

Roles considered and skipped:
- **Minesweepers and MAS boats:** numbered only.
- **Seaplane tenders:** only four names; *Giuseppe Miraglia* and *Europa* are in the carrier list.
- **Training ships, state yachts and colonial avisos:** too few names.
- **Gunboats:** no single naming formula.
- **Midget, cruiser and minelaying submarine sub-types:** numbered, or too few to reach the floor; the minelayers stay in the submarine list.

---

## Scope Notes

- **Ideological names:** names that are overtly tied to the Fascist regime left the historical hull lists and moved into `ITA_FASCISM`, alongside the irredentist claims of the 1930s. These are *Littorio* and *Impero*, the destroyers *Camicia Nera* and *Squadrista*, the submarines *Michele Bianchi*, *Reginaldo Giuliani* and *Console Generale Liuzzi*, and the canceled cruiser *Costanzo Ciano* (named in 1939 for the regime minister, though he was also a WWI gold-medal MAS commander). The battleship list keeps *Italia*, the name *Littorio* received in 1943.
- **`ITA_BB_HISTORICAL`:** follows the *Dante Alighieri* / *Leonardo da Vinci* formula of great Italians alongside the royal and state names of the ironclad and pre-dreadnought era. *Leonardo da Vinci* itself stays with the famous submarine.
- **`ITA_BC_HISTORICAL`:**
  - It holds the canceled *Caracciolo* class and the maritime republics under their realm titles (*Serenissima*, *La Superba*, *Repubblica di Amalfi*), so they do not collide with cruiser city names.
  - It also holds historic war vessels and fortresses, naval victories, and the admirals of Venice, Genoa and the Regia Marina.
- **`ITA_CA_HISTORICAL`:** extends the "redeemed cities" formula of the *Trento* and *Zara* classes across Trentino, Venezia Giulia, Istria and the Quarnero–Dalmatian coast. The fascist-era claims (*Nizza*, *Corsica*, *Malta*, *Tunisi*) are kept to the gated pool.
- **Fallbacks:** fallback names use the native terms in the indefinite nominative (*Cacciatorpediniere*, *Incrociatore leggero*, *Corazzata*, *Torpediniera*, *Esploratore*, *Posamine*).
