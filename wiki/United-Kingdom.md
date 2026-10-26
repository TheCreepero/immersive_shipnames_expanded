# United Kingdom (ENG) Ship Namelists

Source file: `common/units/names_ships/ENG_ship_names.txt`

---

## Overview

The Royal Navy reused its ship names for centuries, so most British warships carried a name with a battle honour behind it. The Admiralty set a theme per class. Destroyer flotillas took one initial letter (the G, H and I classes and so on) or a family (Tribals, Battles, Weapons). Submarines took marine life and then words of their class letter. Light cruisers took cities, colonies and classical figures, heavy cruisers counties and Elizabethan seamen, battleships monarchs, admirals and the old names of the line of battle, and carriers the great adjectives of the sail navy. Escort and auxiliary classes had their own series: Flowers and Castles for corvettes, Rivers, Lochs and Bays for frigates, birds and towns for sloops, and Isles, Trees, Dances, Shakespeare and Hills for trawlers.

Vanilla Hearts of Iron IV already ships a deep British file of about 3,000 names in two sets: the Royal Navy lists (prefix `HMS `) and a communist workers' navy copy (prefix `WLNS `). *Immersive Ship Names Expanded* keeps both and builds on them:

- **Deeper hull lists:** destroyers 448 → 631, light cruisers 90 → 228, heavy cruisers 50 → 130, battleships 45 → 81, battlecruisers 20 → 51 and carriers 26 → 68. Each hull's lineage is traced back through the Victorian navy (27- and 30-knotters from 1893, protected cruisers from 1878, armoured cruisers, pre-dreadnoughts, the ironclads from 1860 and the first rates of the sail navy) and its documented class formulas are extended. Submarines (271) keep vanilla's wartime depth.
- **Repairs:** misspellings (*Campbelltown*, *Narbrough*, *Blight*, *Visitan*, *Twyi*), the doubled names in the destroyer, light cruiser and submarine lists, the Canadian destroyers *St. Clair*, *Columbia* and *Niagara*, the non-naval fallback *Miner*, missing fallbacks on the thematic pools, and the communist admirals pool whose display key had no translation.
- **One home per name:** vanilla gave the light cruiser and anti-aircraft cruiser lists the same 58 names, copied battleship names into the battlecruiser list and shared names between the cruiser, capital and carrier lists. Each name now sits with one hull or role.
- **Role pools:** vanilla's escort destroyer, anti-aircraft cruiser, light carrier, monitor and minelayer lists become universal role pools under their vanilla tags (the starting variants use them). Escort carriers, minesweepers, sloops, frigates, gunboats and armed merchant cruisers join them.
- **Thematic pools:** vanilla's seven pools are repaired and extended, and 23 new ones follow. Among them are the Royal Navy's own escort and trawler series, grouped by subject, and three ideology-gated pools.
- **Communist set:** every Royal Navy list except Kings, Colonies, Mythology and the ideology pools is copied into the `WLNS ` set without royal names, as vanilla did for its own lists, so a communist Britain is as deep as any other.

**Prefixes.** `HMS ` on every Royal Navy list and `WLNS ` on every communist list, as in vanilla.

---

## Namelist Groups

### Ship-Type Specific Category

| Group Tag | Type | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `ENG_DD_HISTORICAL` | Destroyers | `ship_hull_light destroyer` | Gallant, Garland, Gipsy, Glowworm, Grafton, Grenade, Grenville, Greyhound, Griffin, Hardy, Hasty, Havock |
| `ENG_SS_HISTORICAL` | Submarines | `ship_hull_submarine submarine` | Swordfish, Sturgeon, Seahorse, Starfish, Thames, Severn, Clyde, Sealion, Shark, Snapper, Salmon, Seawolf |
| `ENG_CL_HISTORICAL` | Light Cruisers | `ship_hull_cruiser light_cruiser` | Amphion, Penelope, Aurora, Arethusa, Galatea, Leander, Achilles, Ajax, Neptune, Orion, Southampton, Birmingham |
| `ENG_CA_HISTORICAL` | Heavy Cruisers | `ship_hull_cruiser heavy_cruiser` | Kent, Berwick, Cornwall, Cumberland, Suffolk, London, Devonshire, Shropshire, Sussex, Norfolk, Dorsetshire, York |
| `ENG_BB_HISTORICAL` | Battleships | `ship_hull_heavy battleship` | King George V, Prince of Wales, Duke of York, Anson, Howe, Jellicoe, Beatty, Temeraire, Conqueror, Thunderer, Vanguard, Nelson |
| `ENG_BC_HISTORICAL` | Battlecruisers | `ship_hull_heavy battle_cruiser` | Invincible, Inflexible, New Zealand, Lion, Princess Royal, Queen Mary, Tiger, Renown, Repulse, Hood, Incomparable, Boscawen |
| `ENG_CV_HISTORICAL` | Aircraft Carriers | `ship_hull_carrier carrier` | Ark Royal, Illustrious, Formidable, Victorious, Indomitable, Implacable, Indefatigable, Eagle, Hermes, Argus, Furious, Courageous |

Notes on the hull lists:
- **Destroyers** keep vanilla's classes of 1929-1945 and add those of 1893-1924: the 27- and 30-knotters, the River, Tribal, Beagle, Acorn, Acheron, Acasta and Laforey classes, and the M, R, S, V and W classes with their flotilla leaders. Weapons follow under the Weapon-class formula. The Town class moved to the escort destroyers.
- **Submarines** keep vanilla's list, with *Visitant* and *Sea Robin* (a cancelled S-class boat) checked. They add the captured *Graph*, post-war boats that no other list uses, and marine life under the formula of the S and Porpoise classes.
- **Light cruisers** add the C, D and E classes, the Town class of 1909-1915, the scout cruisers and the protected cruisers of 1878-1905. Classical names borne by RN frigates and sloops follow, then cities of Britain and the Empire under the Town and C-class formulas.
- **Heavy cruisers** combine the County and Hawkins classes, the armoured and first-class cruisers of 1888-1908, and every remaining historic county under the County formula.
- **Battleships** add the dreadnoughts vanilla lacked, the pre-dreadnoughts, the ironclads and turret ships of 1860-1892, and first rates of the sail navy.
- **Battlecruisers** keep the real battlecruisers and Fisher's *Incomparable*. They add admirals of the sail navy (the Admiral-class formula), great ships of the Tudor and Stuart navies, and victories at sea from Damme to North Cape.
- **Carriers** keep the fleet carriers, the Audacious and Malta classes and the seaplane carriers. They add the bird names under which the Fleet Air Arm commissioned its air stations, and adjectives of the line of battle (the *Illustrious* formula).

---

### Role-Specific Pools (Ship Designer)

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `ENG_DE_HISTORICAL` | Historical Destroyer Escorts | Universal | Atherstone, Berkeley, Blencathra, Brocklesby, Cattistock, Cleveland, Eglinton, Exmoor, Fernie, Garth, Hambledon, Holderness |
| `ENG_CLAA_HISTORICAL` | Historical Anti-Aircraft Cruisers | Universal | Dido, Naiad, Phoebe, Hermione, Euryalus, Charybdis, Bonaventure, Sirius, Cleopatra, Scylla, Argonaut, Bellona |
| `ENG_CVL_HISTORICAL` | Light Carriers | Universal | Colossus, Glory, Ocean, Venerable, Vengeance, Theseus, Triumph, Warrior, Perseus, Pioneer, Unicorn, Majestic |
| `ENG_ESCORT_CARRIERS` | Escort Carriers | Universal | Audacity, Activity, Archer, Avenger, Biter, Dasher, Attacker, Battler, Chaser, Fencer, Pursuer, Ravager |
| `ENG_BM_HISTORICAL` | Historical Monitors | Universal | Erebus, Terror, Abercrombie, Gorgon, Glatton, Havelock, Raglan, Humber, Mersey, Roberts, Lord Clive, General Craufurd |
| `ENG_MINELAYERS_HISTORICAL` | Historical Minelayers | Universal | Adventure, Abdiel, Latona, Manxman, Welshman, Apollo, Ariadne, Plover, Linnet, Redstart, Ringdove, Blackbird |
| `ENG_MINESWEEPERS` | Minesweepers | Universal | Halcyon, Skipjack, Harrier, Hussar, Speedwell, Niger, Salamander, Franklin, Gleaner, Gossamer, Hazard, Hebe |
| `ENG_SLOOPS` | Sloops | Universal | Black Swan, Flamingo, Erne, Ibis, Whimbrel, Wild Goose, Woodpecker, Chanticleer, Crane, Cygnet, Kite, Lapwing |
| `ENG_FRIGATES` | Frigates | Universal | Bayntun, Bazely, Berry, Blackwood, Burges, Capel, Cooke, Dacres, Domett, Drury, Foley, Garlies |
| `ENG_GUNBOATS` | Gunboats | Universal | Aphis, Bee, Cicala, Cockchafer, Cricket, Ladybird, Mantis, Moth, Scarab, Tarantula, Gnat, Blackfly |
| `ENG_AUXILIARY_CRUISERS` | Armed Merchant Cruisers | Universal | Rawalpindi, Jervis Bay, Voltaire, Comorin, Dunvegan Castle, Forfar, Laurentic, Patroclus, Salopian, Andania, Transylvania, Scotstoun |

Every role pool follows a documented Royal Navy series:
- **Escort destroyers:** the Hunt class (Types I to IV) with the Hunts transferred to Allied navies, and the RN-manned Town class of the 1940 destroyers-for-bases deal.
- **Anti-aircraft cruisers:** the Dido and Bellona classes and the C-class cruisers rebuilt for air defence.
- **Light carriers:** the Colossus, Majestic and Centaur light fleet carriers, with *Unicorn*.
- **Escort carriers:** the converted escort carriers, the Attacker and Ruler classes and the British-built escort carriers.
- **Monitors:** the monitors of 1913-1942 and the breastwork monitors of the 1870s. Unnamed monitors take the RN's own `M` numbers.
- **Minelayers:** *Adventure*, the Abdiel class, *Plover* and the Linnet class, the Isles-class trawlers completed as minelayers, and the auxiliary minelayers of both wars.
- **Minesweepers:** the Halcyon, Bangor and Algerine classes, the Hunt class of 1916 (Aberdare group) and the Racecourse-class paddle minesweepers.
- **Sloops:** the Black Swan, Egret, Bittern, Kingfisher and Shearwater classes, the Grimsby, Hastings, Shoreham and Bridgewater classes, the 24 class (Derby winners) and the Kil-class patrol sloops.
- **Frigates:** the Captain, Colony and Bay classes. The River and Loch classes sit in the Rivers and Lochs & Lakes pools.
- **Gunboats:** the Insect, Fly and Dragonfly classes and the China gunboats.
- **Armed merchant cruisers:** the liners commissioned as armed merchant cruisers in both world wars.

---

### Universal Thematic Topic Category (Ship Designer)

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `ENG_COUNTIES` | Counties | Universal | Yorkshire, Lincolnshire, Devon, Norfolk, Northumberland, Lancashire, Somerset, Hampshire, Kent, Essex, Cumberland, Suffolk |
| `ENG_CITIES` | Cities | Universal | London, Birmingham, Leeds, Glasgow, Sheffield, Bradford, Manchester, Edinburgh, Liverpool, Bristol, Cardiff, Belfast |
| `ENG_COLONIES` | Colonies | Universal | Fiji, Kenya, Nigeria, Mauritius, Trinidad, Gambia, Jamaica, Bermuda, Ceylon, Newfoundland, Uganda, Gibraltar |
| `ENG_KINGS` | Kings | Universal | King Edward VIII, King George V, King Edward VII, Queen Victoria, King William IV, King George IV, King George III, King George II, King George I, Queen Anne, King William III, King James II |
| `ENG_BATTLES` | Famous Battles | Universal | Waterloo, Agincourt, Cressy, Poitiers, Vitoria, Salamanca, Ramillies, Blenheim, Elixheim, Oudenarde, Lille, Malplaquet |
| `ENG_RIVERS` | Rivers | Universal | Severn, Thames, Trent, Great Ouse, Wye, Ure, Tay, Clyde, Spey, Nene, Bann, Tweed |
| `ENG_MYTHOLOGY` | Mythology | Universal | King Arthur, Guinevere, Uther Pendragon, Mordred, Agravain, Bedivere, Bors, Caradoc, Gaheris, Galahad, Galehaut, Gareth |
| `ENG_ADMIRALS` | Admirals | Universal | Hawkins, Drake, Howard, Grenville, Blake, Monck, Penn, Myngs, Spragge, Harman, Narborough, Herbert |
| `ENG_EXPLORERS` | Explorers & Navigators | Universal | Cabot, Frobisher, Raleigh, Cavendish, Humphrey Gilbert, John Davis, Willoughby, Richard Chancellor, Hudson, Baffin, Dampier, James Cook |
| `ENG_GENERALS` | Generals | Universal | Cromwell, Fairfax, Ireton, Lambert, Marlborough, Stanhope, Ligonier, Wolfe, Amherst, Clive, Coote, Eliott |
| `ENG_WRITERS` | Poets & Writers | Universal | Caedmon, Chaucer, Langland, Gower, Malory, Spenser, Philip Sidney, Marlowe, Shakespeare, Jonson, Hakluyt, Donne |
| `ENG_SAINTS` | Saints | Universal | St George, St Andrew, St David, St Patrick, St Alban, St Augustine, St Aidan, St Cuthbert, St Bede, St Hilda, St Chad, St Cedd |
| `ENG_ANCIENT_BRITAIN` | Ancient Britain | Universal | Albion, Britannia, Caledonia, Cambria, Hibernia, Dalriada, Iceni, Brigantes, Trinovantes, Catuvellauni, Silures, Ordovices |
| `ENG_SHAKESPEARE` | Shakespeare | Universal | Celia, Coriolanus, Fluellen, Hamlet, Horatio, Juliet, Laertes, Macbeth, Ophelia, Othello, Romeo, Rosalind |
| `ENG_VIRTUES` | Valour & Virtues | Universal | Courageous, Glorious, Illustrious, Formidable, Victorious, Indomitable, Implacable, Invincible, Inflexible, Indefatigable, Irresistible, Impregnable |
| `ENG_NATURE` | Wind, Sky & Sea | Universal | Tempest, Typhoon, Cyclone, Hurricane, Tornado, Whirlwind, Zephyr, Sirocco, Mistral, Monsoon, Squall, Thunderbolt |
| `ENG_BIRDS` | Birds | Universal | Eagle, Golden Eagle, Sea Eagle, Osprey, Peregrine, Falcon, Kestrel, Goshawk, Sparrowhawk, Buzzard, Harrier, Red Kite |
| `ENG_FISH` | Aquatic Life | Universal | Whale, Narwhal, Grampus, Cachalot, Rorqual, Finwhale, Orca, Porpoise, Dolphin, Seal, Sealion, Walrus |
| `ENG_BEASTS` | Wild Beasts | Universal | Red Deer, Stag, Hart, Hind, Roebuck, Badger, Fox, Otter, Wolf, Wild Boar, Wildcat, Pine Marten |
| `ENG_FLOWERS` | Flowers | Universal | Godetia, Buttercup, Clover, Anemone, Arbutus, Asphodel, Aubrietia, Auricula, Azalea, Begonia, Bluebell, Campanula |
| `ENG_TREES` | Trees | Universal | Acacia, Almond, Ash, Bay, Birch, Blackthorn, Chestnut, Deodar, Elm, Fir, Hazel, Hickory |
| `ENG_GEMS` | Gems | Universal | Diamond, Ruby, Sapphire, Emerald, Amethyst, Topaz, Opal, Pearl, Garnet, Jasper, Agate, Onyx |
| `ENG_CASTLES` | Castles | Universal | Rising Castle, Nunney Castle, Hever Castle, Guildford Castle, Norham Castle, Wolvesey Castle, Tamworth Castle, Walmer Castle, Hedingham Castle, Sherborne Castle, Sandgate Castle, Pembroke Castle |
| `ENG_ISLES` | Isles | Universal | Ailsa Craig, Annet, Arran, Balta, Bardsey, Benbecula, Biggal, Bressay, Brora, Bruray, Bryher, Burra |
| `ENG_LOCHS` | Lochs & Lakes | Universal | Loch Achanalt, Loch Fada, Loch Dunvegan, Loch Eck, Loch Achray, Loch Alvie, Loch Ard, Loch Arkaig, Loch Assynt, Loch Boisdale, Loch Craggie, Loch Cree |
| `ENG_GEOGRAPHY` | Hills & Mountains | Universal | Birdlip, Bredon, Butser, Duncton, Dunkery, Inkpen, Portsdown, Yestor, Ben Nevis, Ben Macdui, Ben Lomond, Ben Lawers |
| `ENG_DANCES` | Dances | Universal | Cotillion, Coverley, Fandango, Foxtrot, Gavotte, Hornpipe, Mazurka, Minuet, Morris Dance, Pirouette, Polka, Quadrille |

Notes on the thematic pools:
- **Vanilla pools:** Cities adds cathedral cities, ports, county towns and royal burghs. Colonies adds the dominions and every colony, protectorate and mandate of 1936. Kings adds *Queen Mary II*, the Anglo-Saxon kings and the kings and queens of Scots. Battles adds victories from Falkirk (1298) to the Great War, beside vanilla's from Edington (878) to Megiddo (1918). Rivers adds the River-class frigates and other rivers. Mythology adds the Mabinogion, Gaelic and Ossianic legend and English folklore.
- **Escort and trawler series by subject:** Flowers (the Flower-class corvettes and sloops), Castles and Lochs & Lakes (the Castle-class corvettes and Loch-class frigates, built and cancelled), Isles, Trees, Dances, Shakespeare and Hills & Mountains each begin with their RN class and go on with more of the same subject.
- **People:** every admiral, explorer, general, writer and saint died before 1936.

---

### Ideology-Gated Pools (Ship Designer)

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `ENG_PARLIAMENT` | Liberty & Parliament | Universal | Magna Carta, Runnymede, Witenagemot, Model Parliament, Petition of Right, Habeas Corpus, Bill of Rights, Reform Act, Emancipation, Hansard, Simon de Montfort, Hampden |
| `ENG_MONARCHISM` | Crown & Empire | Universal | Crown, Imperial Crown, Sceptre, Orb, Regalia, Coronation, Jubilee, Royal Standard, Dieu et mon Droit, Defender of the Faith, Rule Britannia, Garter |
| `ENG_CAVALIERS` | Cavaliers & Jacobites | Universal | Rupert, Montrose, Hopton, Astley, Ormonde, Langdale, Goring, George Digby, Capel, Falkland, Wilmot, Bevil Grenville |

`ENG_PARLIAMENT` is open to a democratic Britain, `ENG_MONARCHISM` and `ENG_CAVALIERS` to a non-aligned one. No fascist pool was added: the British Union of Fascists was led by people alive in 1936, and the other nationalist themes are already in the universal pools.

---

### Communist Workers' Navy Lists (vanilla set, mirrored)

Vanilla gives a communist Britain its own copy of the Royal Navy lists under the `WLNS ` prefix and hides every `HMS ` list from it. This file keeps that split. Every `HMS ` list is copied into the communist set without royal names (monarchs, princes, royal titles and regalia, and ducal names such as *Marlborough* and *Iron Duke*, as vanilla did), so the two sets stay equally deep. Vanilla's own communist names come first: *Liberator* and *Worker* in the battleship list, *Inevitable* in the carrier list, the Commonwealth's generals at sea and Admiralty commissioners in the admirals pool, and the Parliamentarian and Commonwealth victories in the battles pool. Kings, Colonies and Mythology have no communist copy, as in vanilla, and neither do the democratic and non-aligned pools.

Each communist list copies the Royal Navy list of the same base tag (`ENG_CL_COMMUNISM` copies `ENG_CL_HISTORICAL`, `ENG_BIRDS_COMMUNIST` copies `ENG_BIRDS`); vanilla's own tags keep their mixed `_COMMUNIST` and `_COMMUNISM` endings, and the new copies follow the same split (hull and role lists `_COMMUNISM`, thematic pools `_COMMUNIST`).

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `ENG_DD_COMMUNIST` | Destroyers | `ship_hull_light destroyer` | Gallant, Garland, Gipsy, Glowworm, Grafton, Grenade, Grenville, Greyhound, Griffin, Hardy, Hasty, Havock |
| `ENG_SS_COMMUNISM` | Submarines | `ship_hull_submarine submarine` | Swordfish, Sturgeon, Seahorse, Starfish, Thames, Severn, Clyde, Sealion, Shark, Snapper, Salmon, Seawolf |
| `ENG_CL_COMMUNISM` | Light Cruisers | `ship_hull_cruiser light_cruiser` | Amphion, Penelope, Aurora, Arethusa, Galatea, Leander, Achilles, Ajax, Neptune, Orion, Southampton, Birmingham |
| `ENG_CA_COMMUNISM` | Heavy Cruisers | `ship_hull_cruiser heavy_cruiser` | Kent, Berwick, Cornwall, Cumberland, Suffolk, London, Devonshire, Shropshire, Sussex, Norfolk, Dorsetshire, York |
| `ENG_BB_COMMUNISM` | Battleships | `ship_hull_heavy battleship` | Liberator, Worker, Anson, Howe, Jellicoe, Beatty, Temeraire, Thunderer, Vanguard, Nelson, Rodney, Warspite |
| `ENG_BC_COMMUNISM` | Battlecruisers | `ship_hull_heavy battle_cruiser` | Invincible, Inflexible, New Zealand, Lion, Tiger, Renown, Repulse, Hood, Incomparable, Boscawen, Rooke, Vernon |
| `ENG_CV_COMMUNISM` | Aircraft Carriers | `ship_hull_carrier carrier` | Inevitable, Illustrious, Formidable, Victorious, Indomitable, Implacable, Indefatigable, Eagle, Hermes, Argus, Furious, Courageous |
| `ENG_DE_COMMUNISM` | Historical Destroyer Escorts | Universal | Atherstone, Berkeley, Blencathra, Brocklesby, Cattistock, Cleveland, Eglinton, Exmoor, Fernie, Garth, Hambledon, Holderness |
| `ENG_CLAA_COMMUNISM` | Historical Anti-Aircraft Cruisers | Universal | Dido, Naiad, Phoebe, Hermione, Euryalus, Charybdis, Bonaventure, Sirius, Cleopatra, Scylla, Argonaut, Bellona |
| `ENG_CVL_COMMUNISM` | Light Carriers | Universal | Colossus, Glory, Ocean, Venerable, Vengeance, Theseus, Triumph, Warrior, Perseus, Pioneer, Unicorn, Magnificent |
| `ENG_ESCORT_CARRIERS_COMMUNISM` | Escort Carriers | Universal | Audacity, Activity, Archer, Avenger, Biter, Dasher, Attacker, Battler, Chaser, Fencer, Pursuer, Ravager |
| `ENG_BM_COMMUNISM` | Historical Monitors | Universal | Erebus, Terror, Abercrombie, Gorgon, Glatton, Havelock, Raglan, Humber, Mersey, Roberts, Lord Clive, General Craufurd |
| `ENG_MINELAYERS_COMMUNISM` | Historical Minelayers | Universal | Adventure, Abdiel, Latona, Manxman, Welshman, Apollo, Ariadne, Plover, Linnet, Redstart, Ringdove, Blackbird |
| `ENG_MINESWEEPERS_COMMUNISM` | Minesweepers | Universal | Halcyon, Skipjack, Harrier, Hussar, Speedwell, Niger, Salamander, Franklin, Gleaner, Gossamer, Hazard, Hebe |
| `ENG_SLOOPS_COMMUNISM` | Sloops | Universal | Black Swan, Flamingo, Erne, Ibis, Whimbrel, Wild Goose, Woodpecker, Chanticleer, Crane, Cygnet, Kite, Lapwing |
| `ENG_FRIGATES_COMMUNISM` | Frigates | Universal | Bayntun, Bazely, Berry, Blackwood, Burges, Capel, Cooke, Dacres, Domett, Drury, Foley, Garlies |
| `ENG_GUNBOATS_COMMUNISM` | Gunboats | Universal | Aphis, Bee, Cicala, Cockchafer, Cricket, Ladybird, Mantis, Moth, Scarab, Tarantula, Gnat, Blackfly |
| `ENG_AUXILIARY_CRUISERS_COMMUNISM` | Armed Merchant Cruisers | Universal | Rawalpindi, Jervis Bay, Voltaire, Comorin, Dunvegan Castle, Forfar, Laurentic, Patroclus, Salopian, Andania, Transylvania, Scotstoun |
| `ENG_COUNTIES_COMMUNIST` | Counties | Universal | Yorkshire, Lincolnshire, Devon, Norfolk, Northumberland, Lancashire, Somerset, Hampshire, Kent, Essex, Cumberland, Suffolk |
| `ENG_CITIES_COMMUNIST` | Cities | Universal | London, Birmingham, Leeds, Glasgow, Sheffield, Bradford, Manchester, Edinburgh, Liverpool, Bristol, Cardiff, Belfast |
| `ENG_BATTLES_COMMUNIST` | Famous Battles | Universal | Edgehill, Aylesbury, Leeds, Hopton Heath, Sourton Down, Gainsborough, Newbury, Heptonstall, Winceby, Olney Bridge, Alton, Nantwich |
| `ENG_RIVERS_COMMUNIST` | Rivers | Universal | Severn, Thames, Trent, Great Ouse, Wye, Ure, Tay, Clyde, Spey, Nene, Bann, Tweed |
| `ENG_ADMIRALS_COMMUNIST` | Admirals & Commissioners | Universal | Blake, Deane, Popham, Monck, Penn, Montagu, Desborough, Philip Jones, Clerke, John Stone, William Burton, Gookin |
| `ENG_EXPLORERS_COMMUNIST` | Explorers & Navigators | Universal | Cabot, Frobisher, Raleigh, Cavendish, Humphrey Gilbert, John Davis, Willoughby, Richard Chancellor, Hudson, Baffin, Dampier, James Cook |
| `ENG_GENERALS_COMMUNIST` | Generals | Universal | Cromwell, Fairfax, Ireton, Lambert, Stanhope, Ligonier, Wolfe, Amherst, Clive, Coote, Eliott, Abercromby |
| `ENG_WRITERS_COMMUNIST` | Poets & Writers | Universal | Caedmon, Chaucer, Langland, Gower, Malory, Spenser, Philip Sidney, Marlowe, Shakespeare, Jonson, Hakluyt, Donne |
| `ENG_SAINTS_COMMUNIST` | Saints | Universal | St George, St Andrew, St David, St Patrick, St Alban, St Augustine, St Aidan, St Cuthbert, St Bede, St Hilda, St Chad, St Cedd |
| `ENG_ANCIENT_BRITAIN_COMMUNIST` | Ancient Britain | Universal | Albion, Britannia, Caledonia, Cambria, Hibernia, Dalriada, Iceni, Brigantes, Trinovantes, Catuvellauni, Silures, Ordovices |
| `ENG_SHAKESPEARE_COMMUNIST` | Shakespeare | Universal | Celia, Coriolanus, Fluellen, Hamlet, Horatio, Juliet, Laertes, Ophelia, Othello, Romeo, Rosalind, Falstaff |
| `ENG_VIRTUES_COMMUNIST` | Valour & Virtues | Universal | Courageous, Glorious, Illustrious, Formidable, Victorious, Indomitable, Implacable, Invincible, Inflexible, Indefatigable, Irresistible, Impregnable |
| `ENG_NATURE_COMMUNIST` | Wind, Sky & Sea | Universal | Tempest, Typhoon, Cyclone, Hurricane, Tornado, Whirlwind, Zephyr, Sirocco, Mistral, Monsoon, Squall, Thunderbolt |
| `ENG_BIRDS_COMMUNIST` | Birds | Universal | Eagle, Golden Eagle, Sea Eagle, Osprey, Peregrine, Falcon, Kestrel, Goshawk, Sparrowhawk, Buzzard, Harrier, Red Kite |
| `ENG_FISH_COMMUNIST` | Aquatic Life | Universal | Whale, Narwhal, Grampus, Cachalot, Rorqual, Finwhale, Orca, Porpoise, Dolphin, Seal, Sealion, Walrus |
| `ENG_BEASTS_COMMUNIST` | Wild Beasts | Universal | Red Deer, Stag, Hart, Hind, Roebuck, Badger, Fox, Otter, Wolf, Wild Boar, Wildcat, Pine Marten |
| `ENG_FLOWERS_COMMUNIST` | Flowers | Universal | Godetia, Buttercup, Clover, Anemone, Arbutus, Asphodel, Aubrietia, Auricula, Azalea, Begonia, Bluebell, Campanula |
| `ENG_TREES_COMMUNIST` | Trees | Universal | Acacia, Almond, Ash, Bay, Birch, Blackthorn, Chestnut, Deodar, Elm, Fir, Hazel, Hickory |
| `ENG_GEMS_COMMUNIST` | Gems | Universal | Diamond, Ruby, Sapphire, Emerald, Amethyst, Topaz, Opal, Pearl, Garnet, Jasper, Agate, Onyx |
| `ENG_CASTLES_COMMUNIST` | Castles | Universal | Rising Castle, Nunney Castle, Hever Castle, Guildford Castle, Norham Castle, Wolvesey Castle, Tamworth Castle, Walmer Castle, Hedingham Castle, Sherborne Castle, Sandgate Castle, Pembroke Castle |
| `ENG_ISLES_COMMUNIST` | Isles | Universal | Ailsa Craig, Annet, Arran, Balta, Bardsey, Benbecula, Biggal, Bressay, Brora, Bruray, Bryher, Burra |
| `ENG_LOCHS_COMMUNIST` | Lochs & Lakes | Universal | Loch Achanalt, Loch Fada, Loch Dunvegan, Loch Eck, Loch Achray, Loch Alvie, Loch Ard, Loch Arkaig, Loch Assynt, Loch Boisdale, Loch Craggie, Loch Cree |
| `ENG_GEOGRAPHY_COMMUNIST` | Hills & Mountains | Universal | Birdlip, Bredon, Butser, Duncton, Dunkery, Inkpen, Portsdown, Yestor, Ben Nevis, Ben Macdui, Ben Lomond, Ben Lawers |
| `ENG_DANCES_COMMUNIST` | Dances | Universal | Cotillion, Coverley, Fandango, Foxtrot, Gavotte, Hornpipe, Mazurka, Minuet, Morris Dance, Pirouette, Polka, Quadrille |

The communist set's own pool:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `ENG_SOCIALISM` | Radicals & Labour | Universal | Wat Tyler, John Ball, Jack Straw, Jack Cade, Robert Kett, Peasants' Revolt, Lilburne, Overton, Walwyn, Winstanley, William Everard, Rainsborough |

---

## Scope Notes

- Every added vessel name was borne by a Royal Navy ship or follows a documented class formula. The formula sections are headed "Expansion" in the file.
- Canadian, Australian, New Zealand and Indian ships of the same classes are left to their own navies. Two exceptions sit in vanilla's own lists and stay: the N and Q-class destroyers that the Royal Australian Navy manned but the Royal Navy owned (*Napier*, *Nestor*, *Nizam*, *Norman*, *Nepal*, *Quiberon*, *Quickmatch*), and the battlecruiser *New Zealand*, a gift commissioned into the Royal Navy. The Australian battlecruiser *Australia* is not in the battlecruiser list; the name sits with the Orlando-class cruiser of 1886 in the heavy cruisers.
- Vanilla's lists keep their localisation keys, which are translated into every game language. Only the light carrier list takes a literal name, because its escort carriers moved to their own pool.
