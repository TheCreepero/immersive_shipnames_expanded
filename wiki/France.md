# France (FRA) Ship Namelists

Source file: `common/units/names_ships/FRA_ship_names.txt`

---

## Overview

The Marine nationale named its ships by type, with a strong sense of its own history. Battleships took provinces and great statesmen, cruisers took the admirals and corsairs of the old navy, contre-torpilleurs took beasts of prey, raptors, captains of the Marine royale and the martial adjectives of the ships of the line (*Le Fantasque*, *L'Audacieux*, *Le Terrible*), torpilleurs took winds and storms, and submarines took nymphs, heroines, sea creatures, gems, scientists and the months of the revolutionary calendar.

Vanilla Hearts of Iron IV already ships a deep French file of about 1,170 names. *Immersive Ship Names Expanded* keeps that depth and builds on it:

- **Deeper hull lists:** destroyers 81 → 255, submarines 188 → 276 and light cruisers 36 → 118, enough for a full wartime building programme. Every added vessel name was borne by a French warship or follows a documented class formula.
- **Repairs:** typos (*Algerié*, *Eurydicé*, *Céres*, *Helbronn* for *Halbronn*), doubled spellings (*Méduse* and *Meduse*, *Artémis* and *Artemis*, *Cornélie* and *Cornelei*), fallback names in the wrong order or the wrong term (the battlecruiser fallback read *Croiseur cuirassé*, which means armoured cruiser), and the English *Marseilles* in the city list.
- **One home per name:** vanilla gave the battleship and battlecruiser lists the same six ideals, and shared names between the light cruiser, heavy cruiser, battleship and carrier lists. Each name now sits with the ship that carried it in 1936-45.
- **Role pools:** vanilla's light-destroyer and minelayer lists become universal role pools for torpilleurs and mine warfare, joined by avisos and Free French corvettes and frigates.
- **Thematic pools:** vanilla's six pools are repaired and extended, and eleven new ones follow, four of them ideology-gated.

**Prefixes.** The Marine nationale used no ship prefix, and neither does vanilla, so no group has one.

---

## Namelist Groups

### Ship-Type Specific Category

| Group Tag | Type | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `FRA_DD_HISTORICAL` | Destroyers | `ship_hull_light destroyer` | Le Fantasque, L'Audacieux, Mogador, Volta, Vauquelin, Maillé-Brézé, Guépard, Aigle, Jaguar, Durandal, Arquebuse, Spahi, Bisson, Enseigne Roux, Le Formidable, L'Invincible |
| `FRA_SS_HISTORICAL` | Submarines | `ship_hull_submarine submarine` | Surcouf, Casabianca, Le Glorieux, Redoutable, Rubis, Saphir, Minerve, Junon, Aurore, Requin, Pluviôse, Gustave Zédé, Phèdre, Lamarck, Panope |
| `FRA_CL_HISTORICAL` | Light Cruisers | `ship_hull_cruiser light_cruiser` | La Galissonnière, Jean de Vienne, Gloire, Montcalm, Georges Leygues, Duguay-Trouin, Émile Bertin, De Grasse, Colmar, Lavoisier, Catinat, Florent de Varennes, Villaret de Joyeuse |
| `FRA_CA_HISTORICAL` | Heavy Cruisers | `ship_hull_cruiser heavy_cruiser` | Algérie, Duquesne, Tourville, Suffren, Colbert, Foch, Dupleix, Léon Gambetta, Victor Hugo, Indochine, Madagascar |
| `FRA_BB_HISTORICAL` | Battleships | `ship_hull_heavy battleship` | Richelieu, Jean Bart, Clemenceau, Gascogne, Alsace, Normandie, Bretagne, Provence, Courbet, République, Liberté, Danton, Guyenne |
| `FRA_BC_HISTORICAL` | Battlecruisers | `ship_hull_heavy battle_cruiser` | Dunkerque, Strasbourg, Brest, Cherbourg, Bertrand du Guesclin, La Hire, Soleil Royal, Bucentaure, Chesapeake, Trinquemalay, Grand-Port |
| `FRA_CV_HISTORICAL` | Aircraft Carriers | `ship_hull_carrier carrier` | Joffre, Painlevé, Béarn, Commandant Teste, Dixmude, Arromanches, Gallieni, Lyautey, Clément Ader, Guynemer, Roland Garros, Douaumont |

Notes on the hull lists:
- **Destroyers** are the contre-torpilleurs, the French designation for destroyers from 1899 to 1955, with their forerunners, the torpilleurs-avisos and croiseurs-torpilleurs of 1885-1899: the six classes of 1922-1940, the weapon-, soldier- and officer-named classes of 1899-1917, the war prizes of 1920 and the post-war escorteurs. The extension follows the *Le Fantasque* formula with adjectives borne by French ships of the line, the *Chacal* formula with beasts of prey, and the older formulas with weapons and arms of service.
- **Submarines** keep vanilla's list and add the boats it lacked, the *Émeraude* class of the 1937-40 programmes, and four formulas the navy used: heroines of tragedy and opera (the *Aurore* class had *Créole*, *Bayadère* and *Favorite*), scientists, Nereids and gems.
- **Light cruisers** add the protected and unprotected cruisers of 1862-1904, the Admirals of France (the source of *Jean de Vienne*) and admirals of the Marine royale, the Republic and the Empire.
- **Heavy cruisers** combine the heavy cruisers, the armoured cruisers and vanilla's colony names (the *Algérie* formula).
- **Battleships** add the *Danton* class and the pre-dreadnoughts that vanilla had listed as light or heavy cruisers.
- **Battlecruisers** follow the *Dunkerque* formula (cities of national memory), keep vanilla's captains of the Hundred Years War, and add flagships of the Marine royale and French naval victories.
- **Carriers** keep vanilla's carriers and presidents and add marshals of the Great War, pioneers of aviation and battles of the Great War.

---

### Role-Specific Pools (Ship Designer)

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `FRA_DE_HISTORICAL` | Torpedo Boats | Universal | Bourrasque, Mistral, Siroco, L'Adroit, Le Hardi, Le Fier, L'Alsacien, La Melpomène, Le Picard, Balny, Zouave, Libellule |
| `FRA_AVISOS` | Avisos | Universal | Marne, Somme, Arras, Calais, Vauquois, Ardent, Friponne, Bougainville, Savorgnan de Brazza, Élan, Chamois, La Batailleuse |
| `FRA_MINELAYERS_HISTORICAL` | Mine Warfare | Universal | Pluton, Le Gladiateur, Sirius, Rigel, Antarès, Aldébaran, Véga, Croix du Sud, Bételgeuse, Canopus |
| `FRA_CORVETTES` | Corvettes & Frigates | Universal | La Malouine, La Bastiaise, Aconit, Alysse, Lobelia, Mimosa, Commandant Détroyat, Croix de Lorraine, L'Escarmouche, La Découverte |

Every role pool follows a documented French series:
- **Torpedo boats:** the torpilleurs d'escadre of the *Bourrasque*, *L'Adroit*, *Le Hardi* and *Le Fier* classes (winds, adjectives and provincial demonyms), the torpilleurs légers of the *La Melpomène* class, the *Le Normand*-class escorteurs that continued the demonym formula, and the torpilleurs de haute mer of 1884-1900.
- **Avisos:** the avisos of 1916-1922 (rivers and battle towns of the Great War), the second-class avisos with their feminine adjectives, the *Bougainville*-class colonial avisos named for explorers, and the *Élan* and *Chamois*-class minesweeping avisos with the names of the 1939 programme.
- **Mine warfare:** the minelaying cruiser *Pluton* (renamed *La Tour d'Auvergne* in 1939), the net-layer *Le Gladiateur*, and the star-named *Sirius*-class minesweepers.
- **Corvettes and frigates:** the four Flower-class corvettes France ordered in 1940, the nine Flowers of the Free French Naval Forces and the Free French River-class frigates. At 17 names the pool is below the usual 20. The two other Free French Rivers, *La Surprise* and *Tonkinois*, are left out because the aviso *Surprise* and the destroyer *Tonkinois* already carry those names.

Vanilla history assigns `FRA_DE_HISTORICAL` to the starting *Bourrasque* and *Le Hardi* classes, so the pool keeps its vanilla tag. `FRA_MINELAYERS_HISTORICAL` also keeps its vanilla tag.

Roles considered and skipped:
- **Escort and light carriers, seaplane tenders:** too few names; *Commandant Teste* and *Béarn* stay with the carriers.
- **Cruiser and minelaying submarines:** *Surcouf* and the gem-named minelayers stay with the submarines.
- **Armoured and scout cruisers, flotilla leaders:** they share the heavy cruiser, light cruiser and destroyer formulas.
- **Gunboats, monitors, auxiliary cruisers, training ships, submarine tenders:** too few names, or no naming series.

---

### Universal Thematic Topic Category (Ship Designer)

Universal selection pools available for any ship hull or squadron:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `FRA_REGIONS` | Regions | Universal | Île-de-France, Bretagne, Normandie, Provence, Auvergne, Périgord, Quercy, Comté de Nice, Comtat Venaissin |
| `FRA_CITIES` | Cities | Universal | Paris, Marseille, Lyon, Toulouse, Bordeaux, Nantes, Port-Vendres, Fécamp, Bastia, Saint-Tropez |
| `FRA_COLONIES` | Colonies | Universal | Algérie, Indochine, Madagascar, Sénégal, Pondichéry, Nouvelle-Calédonie, Tahiti, Louisiane, Acadie |
| `FRA_MARSHALS` | Marshals | Universal | Gaspard de Coligny, Maurice de Saxe, Claude-Louis-Hector de Villars, Michel Ney, Louis Nicolas Davout, Thomas Bugeaud |
| `FRA_BIRDS` | Birds | Universal | Autour, Busard, Gypaète, Balbuzard, Grand-Duc, Goéland, Cormoran, Fou de Bassan, Martin-Pêcheur, Coq Gaulois |
| `FRA_FISH` | Aquatic Life | Universal | Maquereau, Turbot, Murène, Barracuda, Mérou, Cachalot, Orque, Langouste, Hippocampe |
| `FRA_MYTHOLOGY` | Mythology | Universal | Jupiter, Hercule, Thésée, Ulysse, Mélusine, Morgane, Merlin, Ankou, Taranis, Gargantua |
| `FRA_RIVERS` | Rivers & Lakes | Universal | Loire, Seine, Garonne, Rhône, Dordogne, Vilaine, Adour, Léman, Étang de Berre |
| `FRA_BATTLES` | Battles | Universal | Tolbiac, Castillon, Marignan, Fontenoy, Denain, Yorktown, Carillon, Seneffe, Coulmiers |
| `FRA_HEROES` | Heroes & Explorers | Universal | Jacques Cartier, René Caillié, Auguste Pavie, Gustave Eiffel, Marie Curie, Molière, Jules Verne, Claude Debussy |
| `FRA_NATURE` | Wind, Sky & Sea | Universal | Rafale, Mousson, Harmattan, Zéphyr, Galerne, Tonnerre, Comète, Équinoxe, Mascaret |

The first four are vanilla's pools, repaired and extended. They keep vanilla's display names, which the game translates into every language:
- **Regions:** *Mulhouse* (a city) and *Catalogne* (France held only Roussillon) leave; *Nice* and *Venaissin* take their provincial forms; 30 further provinces and pays join.
- **Cities:** *Marseilles* becomes *Marseille*; *Évry* (a new town of the 1960s) and four ambiguous overseas communes leave; the post-war mergers *Charleville-Mézières* and *Corbeil-Essonnes* take their 1936 names *Charleville* and *Corbeil*; *Fort-de-France* and *Cayenne* move to the colonies; 22 ports and historic towns join.
- **Colonies:** *Nigéria* and *Niévès* (never French possessions) and *Mali* (a 1959 name; *Soudan* is already in the pool) leave, *Maurice* takes its French name *Isle de France*, *La Gambie* becomes the trading post *Albreda*; 21 holdings of 1936 and earlier colonies join.
- **Marshals:** vanilla's marshals of 1180-1789 are joined by 53 marshals of the Empire and of France up to 1870. Marshals remembered for desertion or treason (*Bourmont*, *Marmont*, *Bazaine*) and foreign princes are left out; the marshals of the Great War are in the carrier list.

---

### Ideology-Gated Pools (Ship Designer)

Each pool is available only while France has the matching government (`can_use = { has_government = ... }`); none is tied to a national focus. Every government sees at most two of them.

| Group Tag | Topic Name | Ideology | Sample Names |
| :--- | :--- | :--- | :--- |
| `FRA_PRESIDENTS` | Presidents | `democratic` | Adolphe Thiers, Jules Grévy, Sadi Carnot, Félix Faure, Raymond Poincaré, Paul Doumer |
| `FRA_REPUBLIC` | Republican Ideals | `democratic` | Droits de l'Homme, Tricolore, Quatorze Juillet, Ça Ira, Fraternité, Marianne, Abbé Grégoire, Ledru-Rollin, Aristide Briand |
| `FRA_SOCIALISM` | Commune & Labour | `communism` | Commune de Paris, Mur des Fédérés, Robespierre, Babeuf, Louise Michel, Varlin, Jean Jaurès, Internationale |
| `FRA_NATIONALISM` | National Glory | `fascism` | Honneur, Revanche, Montjoie, Bayard, Turenne, Jeanne Hachette, Colonel Driant, Camerone, Bazeilles |
| `FRA_KINGS` | Kings | `neutrality` | Charlemagne, Hugues Capet, Philippe Auguste, Saint-Louis, Louis le Roi-Soleil, Clovis, Dagobert, Louis-Philippe |
| `FRA_EMPIRE` | Imperial Glory | `neutrality` | Austerlitz, Iéna, Wagram, Marengo, Malakoff, Solférino, Grande Armée, Aiglon, Joséphine |

- **Gates:** vanilla opened Presidents to every government except the non-aligned, and Kings to every government except the communist. With four new ideology pools that would have shown democratic and fascist France three pools each, so Presidents now opens for `democratic` and Kings for `neutrality`.
- **Revolutionary ships:** the first names of Republican Ideals (*Droits de l'Homme*, *Républicain*, *Tricolore*, *Quatorze Juillet*, *Ça Ira*, *Barra*, *Viala*, *Indivisible*, *Patriote*) were all borne by ships of the line of the Revolution.
- **Kings:** vanilla's 38 kings, named by epithet, are joined by the Merovingians and the kings vanilla left out (*Henri II*, *Charles IX*, *Louis XVI*, *Charles X*, *Louis-Philippe*). *François d'Orléans*, which matches no king, becomes *François Ier*.
- **Living persons:** every person in the new pools died before 1936. Vanilla's Presidents still holds three who were alive in 1936 (*Gaston Doumergue*, *Alexandre Millerand*, *Albert Lebrun*); the pool is kept as vanilla wrote it.

---

## Scope Notes

- **Depth:** vanilla's lists were kept whole. The user asked for far deeper destroyer, light cruiser and submarine lists than the mod's usual targets, so those three lists were extended from list pages of French Wikipedia and English Wikipedia (destroyers, torpedo boats, submarines, cruisers, avisos, ships of the line, Admirals of France and Marshals of France).
- **Light and heavy cruisers:** *Gloire*, *Marseillaise* and *Montcalm* were both armoured cruisers of 1900 and light cruisers of the 1930s; the light cruisers keep them. *Colbert* stays with the heavy cruiser of 1928. *Jeanne d'Arc* stays with the training cruiser, *Foch* with the heavy cruiser, and *Clemenceau* and *Océan* with the battleships.
- **Battleships and battlecruisers:** the six ideals (*Liberté*, *Justice*, *Vérité*, *Démocratie*, *République*, *Patrie*) belong to the *Liberté* and *République* classes and stay with the battleships. *Strasbourg* joins *Dunkerque* in the battlecruisers; *Metz* stays with the ex-German light cruiser.
- **Destroyers and torpedo boats:** the French designations decide the split. The contre-torpilleurs are destroyers; every torpilleur class, including those the starting game assigns to `FRA_DE_HISTORICAL`, is a torpedo boat. A name borne by a destroyer before 1918 and reused for a torpedo boat in the 1930s (*Bouclier*, *Branlebas*, *Épée*, *Fleuret*) stays with the destroyer.
- **Role mismatches:** vanilla's minelayer list held colonial and minesweeping avisos, the ironclad ram *Cerbère* and two cruisers. The avisos moved to the aviso pool, the cruisers to the light cruisers, and *Cerbère* left the file.
- **Fallbacks:** the fallback names put the type first, as French does (`Contre-torpilleur %d`, `Croiseur léger %d`, `Sous-marin %d`), and correct vanilla's battlecruiser term to `Croiseur de bataille %d`.
