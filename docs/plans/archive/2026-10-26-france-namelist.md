# France (TAG: FRA) Ship Namelist Plan

**Goal:** Bring the vanilla French file (`FRA_ship_names.txt`, 15 groups, about 1,170 names) into ISNE as a delta, following the `USA` approach: keep every vanilla list, repair it, decouple the cruiser, capital and carrier rosters, turn vanilla's two sub-type lists into role pools, and add role, thematic and ideology pools. The user asked for lists far deeper than the usual targets, especially for destroyers, light cruisers and submarines.

**Sources:**
- Two parallel `isne-historical-researcher` dossiers (2026-10-26): A covered hull conventions, fallback terms, collisions and role pools; B covered the vanilla thematic pools and new thematic and ideology pools.
- Scripted rosters from Wikipedia raw wikitext: fr *Liste des sous-marins français*, *Liste des contre-torpilleurs français*, *Liste des torpilleurs français*, *Liste des avisos français*, *Liste des frégates françaises*, *Amiral de France*, *Armorial des maréchaux de France*, class pages (*Bombe*, *Condor*, *Lévrier*, *D'Iberville*, *Dunois*, *Bourrasque*, *L'Adroit*, *Le Fier*, *La Melpomène*, *Le Normand*, *Le Corse*, *Élan*, *Chamois*, *Bougainville*, *Arras*, *Claymore*, *Sirius (dragueur de mines)*); en *List of destroyers of France*, *List of torpedo boats of France*, *List of cruisers of France*, *List of battleships of France*, *List of ships of the line of France*, *List of Flower-class corvettes*, *List of River-class frigates*, *Le Hardi-class destroyer*, *Bougainville-class aviso*, *Battle of Fort Royal*.
- Three parallel `isne-audit-researcher` fact-check passes (A: light-cruiser officers; B: ideology persons and four vessel spellings; C: explorers, aviators and BC battle names).

**Author scope decisions (AskUserQuestion, 2026-10-26):**
- **Role pools, "All four":** torpilleurs under vanilla's `FRA_DE_HISTORICAL`, avisos, mine warfare under vanilla's `FRA_MINELAYERS_HISTORICAL`, corvettes and frigates.
- **Pools, "Full set, regate vanilla":** seven new thematic pools and four ideology pools; vanilla Presidents regated to `democratic` and Kings to `neutrality`, so every government sees at most two ideology pools.

## Vanilla Audit Findings (Step 0)

1. **Tags vanilla script assigns:** `FRA_BB/BC/CA/CL/CV/DD/SS_HISTORICAL` and `FRA_DE_HISTORICAL` (starting variants *Bourrasque Class* and *Le Hardi Class* in `history/countries/FRA - France.txt`). All stay defined.
2. **Hull-bound sub-type lists:** `FRA_DE_HISTORICAL` (destroyer-bound "Light Destroyers") and `FRA_MINELAYERS_HISTORICAL` (bound to cruiser and light hulls). Both are now universal role pools under their vanilla tags; `DE_HISTORICAL` is added to `Get-RolePoolSuffixes`.
3. **Fallbacks:** number-first order (`"%d Contre-Torpilleur"`), wrong gender (`"%d Légère Contre-Torpilleur"`), wrong term for the battlecruiser (`"%d Croiseur Cuirassé"` = armoured cruiser) and `"%d Navire de Ligne"` for the battleship. Now `Contre-torpilleur %d`, `Torpilleur %d`, `Croiseur léger %d`, `Croiseur lourd %d`, `Cuirassé %d`, `Croiseur de bataille %d`, `Porte-avions %d`, `Sous-marin %d`; role pools `Aviso %d`, `Mouilleur de mines %d`, `Corvette %d`; thematic pools `Navire %d` (vanilla's six had none).
4. **Typos and doubled spellings:** `Algerié` → `Algérie`; `Céres` → `Cérès`; `Eurydicé` → `Eurydice`; `Nereide` → `Néréide`; `Sane` → `Sané`; `Ventose` → `Ventôse`; `Helbronn` → `Halbronn`; `Trinité Schillemans` → `Trinité-Schillemans`; `Victor Reveille` → `Victor Réveille`; `Vercingetorix` → `Vercingétorix`; `Maillé Brézé` → `Maillé-Brézé`; `Epée`, `Epernay`, `Epinal`, `Les Eparges` take `É`; `Le Filibustier` → `Le Flibustier`; `Sirocco` → `Siroco` (the torpilleur's name); `Mimose` → `Mimosa`; `La Bastiase` → `La Bastiaise`; `L'Infernet` → `Infernet`; `Marseilles` → `Marseille`. `Meduse`, `Artemis` and `Cornelei` doubled *Méduse*, *Artémis* and *Cornélie* and are removed. `Montdement` and `Revigny` are correct (fr *Classe Arras*).
5. **Cross-group collisions (30 pairs):** the six ideals mirrored between BB and BC; CL/CA *Colbert*, *Gloire*, *Marseillaise*, *Montcalm*; CA/BB *Charlemagne*, *Charles Martel*, *Saint-Louis*; CL/BC *Metz*, *Strasbourg*; BB/CV *Clemenceau*, *Océan*; CA/CV *Foch*; CL/CV *Jeanne d'Arc*; DD/DE/CV *Verdun*; DE/BC *Arras*, *Dunkerque*; CL/minelayers *Châteaurenault*, *Guichen*, *Pluton*, *D'Entrecasteaux*; CA/minelayers *Amiral Charner*; DD/minelayers *Annamite*, *Bambara*, *Commandant Bory*, *Commandant Rivière*; DD/SS *Volta*; DD/DE *Bouclier*, *Casque*, *Lansquenet*, *Mameluk*. Resolutions below.
6. **Role mismatches:** CL held the *Danton*-class battleships and four pre-dreadnoughts (*Bouvet*, *Carnot*, *Jauréguiberry*, *Masséna*); the minelayer list held colonial and minesweeping avisos, star names, two cruisers and the 1868 ironclad ram *Cerbère*; DE held Arras-class avisos and Flower-class corvettes.
7. **Thematic pools:** `FRA_REGIONS` held the city *Mulhouse* and *Catalogne*; `FRA_CITIES` was a modern population ranking with the 1960s new town *Évry* and Réunion and Guadeloupe communes; `FRA_COLONIES` held *Nigéria* and *Niévès* (never French) and the English-era *Maurice*; `FRA_PRESIDENTS` (15 names) holds three persons alive in 1936 (Doumergue, Millerand, Lebrun); `FRA_KINGS` had *François d'Orléans*, which matches no king.
8. **Prefix:** none in vanilla; the Marine nationale used none. Kept prefix-free.
9. **Fonts:** `œ` (*Victor Schœlcher*, *Edmond Le Bœuf*, vanilla's *Crèvecœur*) is present in the main UI fonts (`hoi_16mbs`, `hoi_18mbs`, `hoi_20b` and others) and missing only from the Garamond and newsfeed fonts; vanilla already uses it, so it stays.

## Final Architecture (28 groups, 2,227 names)

| Group | Count | Vanilla | Content |
|---|---|---|---|
| `FRA_DD_HISTORICAL` | 255 | 81 | Contre-torpilleurs 1885-1955: 1922-40 classes, 1899-1917 classes, 1920 war prizes, *La Combattante*, *Hoche*, *Marceau*, T 53 names; expansion by ship-of-the-line adjectives (Le Fantasque formula), beasts (Chacal), weapons (Arquebuse/Claymore) and arms of service (Spahi) |
| `FRA_SS_HISTORICAL` | 276 | 188 | Vanilla roster repaired; further boats from the fr list; *Émeraude* class of 1937-40; expansion by heroines of tragedy and opera (Aurore formula), scientists (Pluviôse/Redoutable), Nereids, gems (Saphir) |
| `FRA_CL_HISTORICAL` | 118 | 36 | Light cruisers 1922-40 and the 1937-39 programme, ex-German cruisers, protected and unprotected cruisers 1862-1904, Amiraux de France (Jean de Vienne formula), admirals of the Marine royale, Republic and Empire |
| `FRA_CA_HISTORICAL` | 37 | 44 | Heavy cruisers, armoured cruisers, colonies (Algérie formula), vanilla's *Vercingétorix* |
| `FRA_BB_HISTORICAL` | 53 | 37 | Vanilla roster plus the *Danton* class, six pre-dreadnoughts (two from CA) and four provinces |
| `FRA_BC_HISTORICAL` | 40 | 22 | Dunkerque formula (cities of national memory), five of vanilla's captains of the Hundred Years War, flagships of the Marine royale, naval victories |
| `FRA_CV_HISTORICAL` | 39 | 24 | Vanilla carriers and presidents, marshals of the Great War, aviation pioneers, battles of the Great War |
| `FRA_DE_HISTORICAL` | 92 | 113 | Role pool "Torpedo Boats": torpilleurs d'escadre, légers and de haute mer; *Le Normand*-class escorteurs |
| `FRA_AVISOS` | 117 | new | Avisos of 1st and 2nd class, colonial avisos, minesweeping avisos with 1939-programme names, two avisos-escorteurs |
| `FRA_MINELAYERS_HISTORICAL` | 31 | 60 | Role pool "Mine Warfare": *Pluton* and its 1939 name *La Tour d'Auvergne*, *Le Gladiateur*, Sirius-class minesweepers |
| `FRA_CORVETTES` | 17 | new | Flower-class corvettes (French order of 1940 and FNFL) and FNFL River-class frigates |
| `FRA_REGIONS` | 74 | 46 | Vanilla repaired, 30 provinces and pays added |
| `FRA_CITIES` | 172 | 158 | Vanilla repaired, 22 ports and historic towns added |
| `FRA_COLONIES` | 82 | 64 | Vanilla repaired, 21 holdings and former colonies added |
| `FRA_MARSHALS` | 298 | 245 | Vanilla plus 53 marshals of 1804-1870 |
| `FRA_PRESIDENTS` | 15 | 15 | Vanilla; regated to `democratic` |
| `FRA_KINGS` | 57 | 38 | Vanilla plus 19 kings; regated to `neutrality` |
| `FRA_BIRDS` | 53 | new | Raptors and owls, seabirds and waders, other birds |
| `FRA_FISH` | 40 | new | "Aquatic Life": fish, sea mammals, shellfish |
| `FRA_MYTHOLOGY` | 45 | new | Gods, heroes and figures of antiquity borne by French ships of the line; Breton, Gaulish and medieval legend |
| `FRA_RIVERS` | 52 | new | Rivers and lakes |
| `FRA_BATTLES` | 35 | new | Royal and colonial land victories (naval victories are in BC, Napoleonic in Empire, Revolutionary in Republic) |
| `FRA_HEROES` | 38 | new | "Heroes & Explorers": explorers, builders and scholars, writers, artists and composers |
| `FRA_NATURE` | 35 | new | "Wind, Sky & Sea": winds and weather, sky and sea |
| `FRA_REPUBLIC` | 35 | new | `democratic`: Revolutionary ships, ideals, republicans |
| `FRA_SOCIALISM` | 45 | new | `communism`: "Commune & Labour" |
| `FRA_NATIONALISM` | 36 | new | `fascism`: "National Glory" |
| `FRA_EMPIRE` | 40 | new | `neutrality`: "Imperial Glory" |

Lists shorter than vanilla, by design: `FRA_CA_HISTORICAL` (44 → 37: *Gloire*, *Marseillaise* and *Montcalm* go to the 1930s light cruisers, the pre-dreadnoughts *Saint-Louis*, *Charlemagne*, *Charles Martel*, *Brennus* and *Henri IV* to BB, *Amiral Charner* to the colonial avisos; the armoured cruiser *Sully* and the colony *Madagascar* added), `FRA_DE_HISTORICAL` (113 → 92: avisos, corvettes and the 1930s reuses of WWI destroyer names left, torpilleurs of 1884-1960 joined) and `FRA_MINELAYERS_HISTORICAL` (60 → 31: its avisos, cruisers and *Cerbère* left). Names that left the file: the doubled spellings; the non-French colonies *Nigéria* and *Niévès*; *Mali* (a 1959 name; *Soudan* stays); *Évry* and the four overseas communes; *Mulhouse* and *Catalogne* from Regions (both still elsewhere); *Cerbère*; the BB/BC duplicates; BC *Jean de Grouchy* (no such captain could be traced); DE *L'Arquebuse* and *L'Hallebarde* (article forms of the DD names *Arquebuse* and *Hallebarde*); DE *Mameluk*; the avisos *Amiral Duperré*, *Enseigne Bisson* and *Enseigne de vaisseau Henry* (the same men as DD *Duperré*, *Bisson* and *Enseigne Henry*). CL *La Tour d'Auvergne* (Pluton's 1939 name) moved to Mine Warfare. Renamed: *La Gambie* → *Albreda*, *Maurice* → *Isle de France*, *Île-de-Shamian* → *Shamian*, *Charleville-Mézières* → *Charleville*, *Corbeil-Essonnes* → *Corbeil*, *François d'Orléans* → *François Ier*, *Pierre Marast* → *Pierre Marrast* (en *French submarine Pierre Marrast*; the fr list spells *Marast*).

Display names: vanilla's hull groups and six pools keep their localisation keys (translated into every game language). The two converted role pools trade `NAME_THEME_HISTORICAL_LIGHT_DDS` and `NAME_THEME_HISTORICAL_MINELAYERS` for literals (*Torpedo Boats*, *Mine Warfare*), because their content changed.

## Role Pools: considered / created / skipped

- **Torpilleurs:** created under `FRA_DE_HISTORICAL` (the starting variants use it).
- **Avisos (all four series):** created (`FRA_AVISOS`); colonial avisos, avisos-dragueurs and avisos de 1re/2e classe folded into one pool, since each series is real and they share the *aviso* designation.
- **Mine warfare:** created under `FRA_MINELAYERS_HISTORICAL`; minelayers alone (*Pluton*, *Le Gladiateur*) fall below the floor, so the star-named Sirius-class minesweepers join them in one pool instead of a separate `MINESWEEPERS` pool.
- **Corvettes and frigates:** created (`FRA_CORVETTES`, 17 names: every French Flower and FNFL River; WARN below target 20 accepted).
- **Escort carriers, light carriers, seaplane tenders:** considered, skipped: *Dixmude*, *Arromanches*, *Bois Belleau*, *La Fayette*, *Commandant Teste* stay in CV; too few names.
- **Escort destroyers, sloops, patrol vessels:** considered, skipped: covered by the aviso pool or numbered (WWI chasseurs).
- **Scout cruisers, flotilla leaders:** considered, skipped: the contre-torpilleurs were France's flotilla leaders and share the DD list.
- **Fast attack craft, monitors, coastal defense:** considered, skipped: no named series in the era (coastal ironclads are in BB/CA formulas).
- **Gunboats (Far East and river):** considered, skipped: about ten names, several already destroyer or torpedo-boat names (*Balny*, *Doudart de Lagrée*, *Francis Garnier*).
- **Fast battleships, large cruisers, armored cruisers, AA cruisers:** considered, skipped: Dunkerque class is BC, armoured cruisers are CA, *De Grasse* is CL.
- **Cruiser, coastal and minelaying submarines:** considered, skipped: *Surcouf* and the gem-named minelayers stay in SS, which the user wanted deep.
- **Auxiliary cruisers, training ships, icebreakers, submarine tenders, state yachts:** considered, skipped: requisitioned liners without a naming series, or too few names.

## Collision Resolutions

- **BB/BC ideals:** the six stay in BB (*Liberté* and *République* classes); BC builds on the Dunkerque formula instead.
- **CL/CA:** *Gloire*, *Marseillaise*, *Montcalm* go to the 1930s light cruisers; *Colbert* to the 1928 heavy cruiser. *Metz* stays CL (ex-German cruiser), *Strasbourg* goes to BC with *Dunkerque*.
- **CA/BB:** *Charlemagne*, *Charles Martel*, *Saint-Louis*, *Brennus* and *Henri IV* are pre-dreadnoughts or coast-defence battleships and go to BB.
- **CV:** *Clemenceau* and *Océan* stay BB, *Foch* CA, *Jeanne d'Arc* CL, *Verdun* DD; *Sans Souci* and *Ville d'Ys* go to the avisos (a 1916 aviso and the Bougainville-class aviso).
- **DD/DE:** a name borne by a destroyer before 1918 and by a torpilleur in the 1930s stays with the destroyer (*Bouclier*, *Branlebas*, *Bombarde*, *Baliste*, *Épée*, *Fleuret*, *Casque*, *Lansquenet*); *Mameluck* (1908) is the destroyer and the 1938 *Mameluk* spelling is dropped. The *Aventurier*-class names go to DE in their *Le Hardi*-class article forms (*L'Intrépide*, *Le Téméraire*, *L'Aventurier*, *L'Opiniâtre*).
- **DD/avisos:** *Annamite*, *Commandant Bory*, *Commandant Rivière* go to the 1939 avisos-dragueurs; *Bambara*, *Bisson*, *Enseigne Henry*, *Duperré*, *Protet*, *Francis Garnier* stay with the destroyers, and the aviso forms of the same men (*Enseigne Bisson*, *Enseigne de vaisseau Henry*, *Amiral Duperré*) are dropped; *Amiral Sénès*, *Matelot Leblanc*, *Rageot de la Touche* stay with the 1920 war prizes.
- **CL/role pools:** *D'Entrecasteaux*, *Amiral Charner*, *Rigault de Genouilly*, *Beautemps-Beaupré*, *Lapérouse* (as *La Pérouse*), *Dubourdieu*, *Duchaffault* (as *Du Chaffault*), *Ducouëdic* (as *Du Couëdic*) go to the avisos; *Forbin* to DE; *Pluton* to mine warfare.
- **CL/SS:** *Surcouf*, *Pascal*, *Sfax*, *Casabianca*, *Naïade*, *Aréthuse*, *Sané* stay with the 1930s submarines (or the older submarine of that name). *Volta* and *Lynx* stay with the contre-torpilleurs, *Algérien* with the destroyer.
- **SS/mine warfare:** *Castor*, *Pégase*, *Persée*, *Phénix*, *Orion*, *Centaure* stay in SS; the other Sirius-class stars form the mine warfare pool.
- **INFO pairs left as they are:** BB *Paris* / BC *Ville de Paris*, BB *Marseille* / BC *Commerce de Marseille*, BB *Toulouse* / CL *Comte de Toulouse* are different names (a city and a flagship, a city and an admiral).
- **DE escorteurs:** the *Le Normand*-class escorteurs rapides of 1955-60 were fast frigates by French designation; they sit in the torpilleur pool as a continuation of the *Le Fier* demonym formula, not by designation.
- **Same name, two men:** BC *Jean Le Maingre* (Boucicaut, the marshal of Agincourt) and vanilla MARSHALS *Jean Le Meingre* (his father) keep their vanilla spellings. The new marshals *Louis Gabriel Suchet*, *Louis Nicolas Davout*, *Thomas Bugeaud* and *André Masséna* honour the same men as CL *Suchet*, *Davout*, *Bugeaud* and BB *Masséna*; hull versus thematic overlap is allowed. *Claude d'Annebault* was dropped from CL because vanilla MARSHALS has him.
- **New pools:** no name shared with a hull or role group or another new pool (*Ys* left Mythology because of the aviso *Ville d'Ys*); vanilla pools keep their overlap with the hull lists (Regions with BB, Cities with BC, Presidents with CV), as in vanilla.

## Tooling Changes

- `build.ps1`: `DE_HISTORICAL` added to `Get-RolePoolSuffixes` (vanilla tag kept for the starting Bourrasque and Le Hardi classes, like `CVL_HISTORICAL`).

## Linguistic and Verification Notes

**Vessels.** Every hull and role-pool name that the section headers present as a ship comes from the scripted list pages above; the scratch check confirmed the Revolutionary names of `FRA_REPUBLIC` (*Droits de l'Homme*, *Républicain*, *Tricolore*, *Quatorze Juillet*, *Constitution*, *Révolution*, *Ça Ira*, *Barra*, *Viala*, *Jemmapes*, *Indivisible*, *Patriote*) and the BC flagships on en *List of ships of the line of France*. Fact-check B confirmed *Lamotte-Picquet* (the 1924 cruiser; *La Motte-Picquet* was a cancelled earlier class), *Commandant Détroyat* and *Le Gladiateur* (a net-layer, kept in mine warfare as vanilla had it). *Pierrier* is the destroyer's name on fr *Classe Claymore* and in the body of en *French destroyer Pierrer* (the English title is a misspelling). *Barra* is the 1794 ship's period spelling of Joseph Bara.

**Persons, sourced from list pages:** the Amiraux de France in CL (fr *Amiral de France*), the 53 marshals of 1804-1870 (fr *Armorial des maréchaux de France*, with life years), vanilla's ship eponyms in DD, SS and CL (each a commissioned ship on the list pages).

**Persons, fact-checked (audit researcher, 2026-10-26):**
- CL officers: *Villaret de Joyeuse* (d. 1812), *Ganteaume* (1818; corrected from *Gantheaume*), *Missiessy* (1837), *Allemand* (1826), *Émeriau* (1845), *D'Orvilliers* (1792), *Ternay* (1780), *Cloué* (1889), *Krantz* (Jules Krantz, Navy minister 1888-89, identity sourced; death year not looked up, born 1821), *Peyron* (1892), *Boué de Lapeyrère* (1924), *Darrieus* (1931), *Rieunier* (1918), *Bienaimé* (1930), *Du Casse* (1715; corrected from *Ducasse*), *Pointis* (1707), *Nesmond* (1702), *Villette-Mursay* (1707), *Destouches* (1794), *Barras de Saint-Laurent* (1793; the bare *Barras* would read as the Director), *Sercey* (1836), *Rosily* (1832). Death years other than Peyron, Cloué, Krantz, Rieunier, Darrieus and Du Casse rest on the researcher's knowledge, not a fetched page.
- Republic: *Abbé Grégoire* (1831), *Ledru-Rollin* (1874), *Benjamin Constant* (1830), *Jules Favre* (1880), *Jules Simon* (1896), *Jean Macé* (1894), *Ferdinand Buisson* (1932), *Viala* (1793).
- Commune & Labour: *Couthon* (1794), *Buonarroti* (1837), *Delescluze*, *Varlin*, *Rossel*, *Flourens*, *Ferré* (all 1871), *Jean-Baptiste Clément* (1903), *Eugène Pottier* (1887), *Nathalie Lemel* (1921), *André Léo* (1900), *Pierre Leroux* (1871), *Victor Considerant* (1893), *Jean Allemane* (6 Jan 1935), *Fernand Pelloutier* (1901), *Marcel Sembat* (1922), *Henri Barbusse* (Aug 1935), *Édouard Vaillant* (1915).
- National Glory: *Jeanne Hachette* (15th century), *Colonel Driant* (1916), *Maurice Barrès* (1923), *Paul Déroulède* (1914), *Godefroy de Bouillon* (1100). Imperial Glory: *Hortense* (1837), *Eugénie* (1920).
- Heroes: *Marion-Dufresne* (1772), *Surville* (1770), *Freycinet* (Louis, 1842), *Duperrey* (1865), *Bellot* (1853), *René Caillié* (1838), *Auguste Pavie* (1925), *Jean-Baptiste Marchand* (1934), *Fernand Foureau* (1914), *Paul Flatters* (1881), *Émile Gentil* (1914), *Charles de Foucauld* (1916), *Paul Crampel* (1891), *Parfait-Louis Monteil* (1925), *Champollion* (1832).
- CV aviators: *Clément Ader* (1925), *Guynemer* (1917), *Roland Garros* (1918), *Nungesser* (1927), *Coli* (1927), *Latham* (1912), *Pégoud* (1915), *Védrines* (1919), *Capitaine Ferber* (1909), *Delagrange* (1910), *Pilâtre de Rozier* (1785).

**Persons kept without a lookup (canonical figures):** Republic *Jean-Jacques Rousseau*, *Lamartine*, *Aristide Briand* (1932); Commune & Labour *Jules Vallès* (1885), *Robespierre*, *Saint-Just*, *Babeuf*, *Gustave Courbet*, *Louise Michel*, *Élisée Reclus*, *Saint-Simon*, *Charles Fourier*, *Étienne Cabet*, *Proudhon*, *Blanqui*, *Barbès*, *Louis Blanc*, *Flora Tristan*, *Jean Jaurès*, *Jules Guesde*, *Paul Lafargue*; National Glory *Bayard*, *Turenne*; Heroes *Jacques Cartier*, *Gustave Eiffel*, *Ferdinand de Lesseps*, *Marie Curie* (1934), and the writers, artists and composers; CV marshals *Gallieni*, *Lyautey*, *Fayolle*, *Maunoury* (life years on fr *Armorial des maréchaux de France*); SS scientists (Lamarck to Fourcroy; Fermat is 17th century, the rest 18th-19th); Kings (Merovingians and later kings).

**Dropped after fact-check:** CL *Brueys*, *La Clue*, *Bompart* (remembered for Aboukir, Lagos 1759 and Tory Island), *Gabaret* (father and son both admirals), *Germinet*, *Relingue*, *D'Amfreville*, *Bergeret*, *Gervais* (unconfirmed); Republic *Sieyès* (the Brumaire plotter); DE *Déroulède* (the 1880s torpilleur's eponym could not be confirmed and may be Paul Déroulède of National Glory); BATTLES *Kong* (Monteil's 1895 column failed); *Sidi-Brahim* (a last stand) moved from Battles to National Glory; BC *Barfleur* (the campaign ended at La Hougue) and *Porto Novo* (a land battle). *Vélez-Malaga* corrected to *Vélez-Málaga*; *Fort-Royal* (1781) added from en *Battle of Fort Royal* ("French victory").

**Living in 1936:** none in the new pools (Charcot, Binger, Blériot, Pétain, Franchet d'Espèrey and others excluded by dossier B). Vanilla `FRA_PRESIDENTS` and the vanilla CV presidents keep Doumergue, Millerand and Lebrun, as vanilla wrote them.

**Homonyms:** English homonyms avoided in the new pools (no *Pie*, *Bar*, *Sole*, *Colin*, *Marlin*); the review removed DD *Once* and *Ours*, Rivers *Lot*, *Ill*, *Dives*, *Cher* and *Var*, Wind, Sky & Sea *Grain* and Aquatic Life *Vive*; *Ibis* and *Eider* mean the same bird in English. *Allemand* (an admiral) also means "German"; kept, as a CL name in an admiral section.

## Review Focus

- The DD/DE split by French designation and the DD/DE/avisos collision rulings.
- The regated Presidents and Kings pools (behaviour change from vanilla).
- Persons kept without a lookup.

## Review (2026-10-26)

Fresh `isne-code-reviewer`: not ready, 4 Important (English homonyms; unsourced BC *Jean de Grouchy*; three same-person duplicates between DD and the avisos; the Nature pool's display name), 17 Minor. All Important fixed; Minor M1, M4-M17 fixed or recorded above; M2 (*Montbéliard* in Regions and Cities) is vanilla's own overlap and stays.

## Validation (2026-10-26, after review fixes)

See the final run in the task report: `-ValidateOnly`, `-VerifyShipTypes FRA`, `-Audit FRA`, `-Test`.
