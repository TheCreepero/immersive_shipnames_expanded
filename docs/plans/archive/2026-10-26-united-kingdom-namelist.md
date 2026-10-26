# United Kingdom (TAG: ENG) Ship Namelist Plan

**Goal:** Bring the vanilla British file (`ENG_ship_names.txt`, 35 groups, about 3,000 names) into ISNE as a delta, deeper than the `USA` rework: keep every vanilla list, repair it, decouple the cruiser, capital and carrier rosters, turn vanilla's five sub-type lists into role pools, add role, thematic and ideology pools, and mirror all of it into vanilla's communist `WLNS ` set.

**Sources:**
- Two parallel `isne-historical-researcher` dossiers (2026-10-26): A covered hull formulas, role pools, vanilla suspects and decoupling (39 web calls); B covered the vanilla thematic pools, new thematic pools and ideology pools (14 web calls, mostly "well documented" entries).
- Scripted rosters from Wikipedia raw wikitext: the nine *List of ship names of the Royal Navy* pages (a 5,595-name corpus used to check RN precedent; it is incomplete, so a miss is not a verdict), and the class pages linked from *List of destroyer classes of the Royal Navy*, *List of cruiser classes of the Royal Navy*, *List of submarines of the Royal Navy*, *List of battleship classes of the Royal Navy*, *List of pre-dreadnought battleships of the Royal Navy*, *List of ironclads of the Royal Navy*, *List of battlecruisers of the Royal Navy*, *List of aircraft carriers of the Royal Navy*, *List of escort carriers of the Royal Navy*, *List of monitors of the Royal Navy*, *List of corvette and sloop classes of the Royal Navy*, *List of mine countermeasure vessels of the Royal Navy*; and the pages *List of Flower-class corvettes*, *List of River-class frigates* (RN rows only), *Loch-class frigate*, *Bay-class frigate*, *Colony-class frigate*, *Castle-class corvette*, *Hunt-class destroyer*, *Town-class destroyer* (RN rows only), *Isles-class trawler*, *Tree-class trawler*, *Dance-class trawler*, *Shakespearian-class trawler*, *Insect-class gunboat*, *Black Swan-class sloop*, *Egret-class sloop*, *Bittern-class sloop*, *Kingfisher-class sloop*, *Grimsby-class sloop*, *Shoreham-class sloop*, *Bridgewater-class sloop*, *24-class sloop*, *Kil-class sloop*, the five Flower-sloop class pages (*Acacia* to *Anchusa*), *Halcyon-class minesweeper*, *Bangor-class minesweeper* and *Algerine-class minesweeper* (RN rows only), *Hunt-class minesweeper (1916)*, *Racecourse-class minesweeper*, *Abdiel-class minelayer*.
- Seven parallel `isne-audit-researcher` fact-check passes (2026-10-26): 1 armed merchant cruisers (6 web calls), 2 minor vessels (22), 3 Fleet Air Arm air stations and ship-of-the-line adjectives (6), 4 admirals and generals (2), 5 explorers, Commonwealth commanders and Cavaliers (2), 6 radicals, parliamentarians and saints (0), 7 battles and great ships (3). Passes 4 to 7 answered mostly from standard references without fetching; see Verification Notes.

**Author scope decisions (AskUserQuestion, 2026-10-26):**
- **Communist set, "Keep & mirror expansion":** vanilla's `WLNS ` set stays, is repaired, and receives every ISNE addition minus royal names, so communist Britain is as deep as the `HMS ` set. This is an author-approved exception to guide section 2D ("never extend a variant set"); see Tooling Changes.
- **Pool layout, "By subject":** single-subject escort and auxiliary series become thematic pools extended past their classes (Flowers, Castles, Lochs, Isles, Trees, Dances, Shakespeare, Hills, Birds); River-class frigate names join Rivers. Role pools only for mixed or functional series.
- Depth: the user asked for lists deeper than the USA file (DD 642, SS 299, CL 257, CA 101, BB 68, BC 68, CV 113) and many thematic options.

## Vanilla Audit Findings (Step 0)

1. **Tags vanilla script assigns:** `ENG_BB/BC/CA/CL/CV/DD/SS_HISTORICAL`, `ENG_BM_HISTORICAL`, `ENG_CLAA_HISTORICAL`, `ENG_CVL_HISTORICAL`, `ENG_MINELAYERS_HISTORICAL` (starting variants in `history/countries/ENG - Britain.txt`). All stay defined; the four sub-type lists become role pools under their vanilla tags. `ENG_DE_HISTORICAL` is not assigned but keeps its tag.
2. **Two sets:** every `HMS ` group is gated `NOT = { has_government = communism }`; a `WLNS ` mirror gated `has_government = communism` repeats each list (16 groups, tags mixing `_COMMUNIST` and `_COMMUNISM`). It differs from the `HMS ` set only by dropping royal names (*King George V*, *Prince of Wales*, *Duke of York*, *Conqueror*, *Monarch*, *Iron Duke*, *Marlborough*, *Emperor of India*, *Queen Elizabeth*, *Royal Oak*, *Royal Sovereign*, *Princess Royal*, *Queen Mary*, *Ark Royal*, *Majestic*, *Duke of Edinburgh*), adding *Liberator*, *Worker* (BB) and *Inevitable* (CV), replacing the battles with Civil War and Commonwealth actions, adding a Commonwealth admirals pool, and omitting Colonies, Kings and Mythology. Both gates stay; a government change renames the fleet as in vanilla [NAM-024].
3. **Display key bug:** `ENG_ADMIRALS_COMMUNIST` uses `NAME_THEME_ADMIRALS`, which vanilla localisation does not define; it shows the raw key. Now the literal *Admirals*.
4. **Fallbacks:** vanilla uses `%s` (Roman numerals [NAM-005]) on every hull group, kept; *Miner %s* is not an RN term (now *Minelayer %s*); *Destroyer Escort %s* is the US term (now *Escort Destroyer %s*, the RN designation of the Hunts); the seven thematic pools had no `fallback_name` (now *Ship %d*). New role pools take Arabic numbers (*Sloop %d*); monitors keep vanilla's authentic `M%d`.
5. **Cross-group collisions:** CLAA repeated 58 CL names; BB/BC shared *Anson*, *Howe*, *Jellicoe*, *Beatty*, *Resistance*, *Renown*, *Repulse*, *Rodney*; CL/BB *Superb*, *Bellerophon*, *Lion*, *Neptune*, *Orion*, *Ajax*; CL/BC *Tiger*; CA/CL *Blake*, *Hawke*, *Diadem*, *Euryalus*; CV/BC *Indomitable*, *Indefatigable*, *Glorious*, *Courageous*, *Furious*; CV/BB *Audacious*; CVL/BB *Colossus*, *Hercules*; CA/CVL *Powerful*, *Terrible*; CV/CVL shared ten names; DD and DE both carried the Town class. Resolutions below.
6. **In-list duplicates:** DD 18 (*Gurkha*, *Grenville*, *Hardy*, *Cossack*, *Scorpion*, *Valentine*, *Vimiera*, *Wakeful*, *Whirlwind*, *Wessex*, *Lance*, *Grenade*, and the Daring-class names twice), DE 2 (*Blencathra*, *Brocklesby*), CL 3 (*Tiger*, *Lion*, *Blake*), SS 5 (*Vox*, *Varne*, *Thames*, *Severn*, *Clyde*).
7. **Spellings and identities (dossier A):** *Campbelltown* → *Campbeltown*; *Roxburgh* (Town class) → *Roxborough*; *Narbrough* → *Narborough*; *Blight* → *Bligh*; *Visitan* → *Visitant*; *Sir Thomas  Picton* (double space); *Spencer* → *Spenser* (Thornycroft leader); *St. Clair*, *Columbia* and *Niagara* are Canadian Town-class names and leave; vanilla's "Cancelled/Not completed" Hunt heading covers Hunts transferred to Allied navies (*Tickham* was renamed on the stocks). *Sea Robin* is a real cancelled RN S-class boat, not American. RN style writes *St* without a full stop; every *St.* is normalised.
8. **Thematic pools (dossier B):** *Twyi* → *Towy*; *St. David's* → *St Davids*; *Lot*, *Mark* and *Kay* (Mythology) read as English words and become *King Lot*, *King Mark* and *Sir Kay* (RN precedent: the Round Table trawler *Sir Kay*). The Battles comment "878 - 1916" is gone with the comment line (*Megiddo* is 1918).
9. **Prefix:** `HMS ` and `WLNS `; both kept on their sets.

## Final Architecture (91 groups, 9,106 names)

Royal Navy set (`HMS `, gated `NOT = { has_government = communism }` unless noted), 48 groups, 4,730 names:

| Group | Count | Vanilla | Content |
|---|---|---|---|
| `ENG_DD_HISTORICAL` | 631 | 448 | Vanilla's 1929-1946 classes (Town class moved to DE), then the 1893-1924 classes: leaders of 1914-19, Laforey, M, purchased 1914-15, R, S, V and W, Acasta, Acheron, Acorn, Beagle, Tribal (1905), River (1903), 30- and 27-knotters; expansion: weapons (Weapon-class formula) |
| `ENG_SS_HISTORICAL` | 271 | 256 | Vanilla roster (S, T, U, V, A, Thames, Porpoise, O, P, R classes, cancelled boats); *Graph*; post-war boats no other list uses; older RN fish names; expansion: marine life (S and Porpoise formula) |
| `ENG_CL_HISTORICAL` | 228 | 90 | 1931-37 Leander, Amphion, Arethusa; Town (1936); Colony; *Swiftsure*; C, D, E classes; Arethusa (1913); Town (1909-15); scouts; protected and third-class cruisers 1878-1905; classical names of RN frigates and sloops; expansion: cities and towns (Town formula), cities of the Empire (C and D-class formula), colonies (Colony formula) |
| `ENG_CA_HISTORICAL` | 130 | 50 | County class with *Surrey* and *Northumberland* (cancelled 1929); Hawkins with *Vindictive*; armoured cruisers 1901-08; Cressy class; first-class cruisers 1888-1900; expansion: historic counties (County formula) |
| `ENG_BB_HISTORICAL` | 81 | 45 | KGV (1939) with the planned names *Jellicoe* and *Beatty*, Lion class, *Vanguard*, Nelson; Queen Elizabeth and Revenge with *Resistance*; dreadnoughts of 1906-14 and the 1914 takeovers; pre-dreadnoughts; ironclads and turret ships 1860-92; first and second rates |
| `ENG_BC_HISTORICAL` | 51 | 20 | Battlecruisers 1908-20 (RN-commissioned; HMAS *Australia* left out); *Incomparable*; admirals of the sail navy (Admiral-class formula); great ships of the sail navy; expansion: victories at sea |
| `ENG_CV_HISTORICAL` | 68 | 26 | Fleet carriers 1918-45; Audacious and Malta classes; seaplane carriers 1914-38; expansion: Fleet Air Arm air-station bird names, adjectives of the line (Illustrious formula) |
| `ENG_DE_HISTORICAL` | 129 | 207 | Role pool, vanilla key "Historical Destroyer Escorts": Hunt class, Hunts transferred to Allied navies, RN-manned Town class |
| `ENG_CLAA_HISTORICAL` | 23 | 58 | Role pool: Dido and Bellona classes, C-class AA conversions |
| `ENG_CVL_HISTORICAL` | 21 | 28 | Role pool "Light Carriers" (literal, since its escort carriers left): Colossus, Majestic, Centaur classes, *Unicorn*, *Perseus*, *Pioneer* |
| `ENG_ESCORT_CARRIERS` | 43 | new | Converted escort carriers, Attacker and Ruler classes, British-built escort carriers |
| `ENG_BM_HISTORICAL` | 24 | 21 | Role pool: monitors 1913-42, breastwork monitors 1870-77 |
| `ENG_MINELAYERS_HISTORICAL` | 26 | 11 | Role pool: *Adventure*, Abdiel class, *Plover*, Linnet class, Isles-class minelayers, auxiliary minelayers of both wars |
| `ENG_MINESWEEPERS` | 273 | new | Halcyon, Bangor (RN), Algerine (RN) with four cancelled names, Hunt (1916) Aberdare group, Racecourse class |
| `ENG_SLOOPS` | 141 | new | Black Swan, Egret, Bittern, Kingfisher and Shearwater; Grimsby, Hastings, Shoreham, Bridgewater; cancelled Black Swans; 24 class; Kil class |
| `ENG_FRIGATES` | 119 | new | Captain class (from vanilla DE, checked against *List of Captain-class frigates*), Colony class, Bay class |
| `ENG_GUNBOATS` | 41 | new | Insect, Fly and Dragonfly classes; China gunboats of 1927-31 and 1897-1903 |
| `ENG_AUXILIARY_CRUISERS` | 71 | new | Armed merchant cruisers of both world wars |
| `ENG_COUNTIES` | 91 | 91 | Vanilla, unchanged |
| `ENG_CITIES` | 181 | 70 | Vanilla repaired; cathedral cities, ports, county towns, royal burghs |
| `ENG_COLONIES` | 74 | 17 | Vanilla; dominions and every colony, protectorate and mandate of 1936 |
| `ENG_KINGS` | 79 | 38 | Vanilla; *Queen Mary II*, Anglo-Saxon kings, kings and queens of Scots |
| `ENG_BATTLES` | 93 | 28 | Vanilla; victories from 1298 to 1917 |
| `ENG_RIVERS` | 115 | 29 | Vanilla repaired; River-class frigates; other rivers |
| `ENG_MYTHOLOGY` | 110 | 45 | Vanilla repaired; Arthurian additions, Welsh, Gaelic, English folklore |
| `ENG_ADMIRALS` | 64 | new | Admirals from the Tudor navy to the Great War |
| `ENG_EXPLORERS` | 44 | new | "Explorers & Navigators" |
| `ENG_GENERALS` | 43 | new | Generals from the Civil Wars to the Great War |
| `ENG_WRITERS` | 57 | new | "Poets & Writers" |
| `ENG_SAINTS` | 40 | new | Patron, Anglo-Saxon, Celtic and medieval saints |
| `ENG_ANCIENT_BRITAIN` | 49 | new | Names of the islands, Iron Age tribes, leaders against Rome, Roman Britain |
| `ENG_SHAKESPEARE` | 63 | new | Shakespearian-class trawlers and other characters |
| `ENG_VIRTUES` | 62 | new | "Valour & Virtues": adjectives of the line of battle, steadfastness and duty |
| `ENG_NATURE` | 63 | new | "Wind, Sky & Sea" |
| `ENG_BIRDS` | 101 | new | Birds of prey, seabirds, waders and waterfowl, other British birds |
| `ENG_FISH` | 69 | new | "Aquatic Life" |
| `ENG_BEASTS` | 50 | new | "Wild Beasts": beasts of Britain and the Empire |
| `ENG_FLOWERS` | 183 | new | Flower-class corvettes and sloops |
| `ENG_TREES` | 52 | new | Tree-class trawlers and other trees |
| `ENG_GEMS` | 36 | new | Gems and precious stones |
| `ENG_CASTLES` | 142 | new | Castle-class corvettes, cancelled Castle names, other castles |
| `ENG_ISLES` | 148 | new | Isles-class trawlers (RN), other islands |
| `ENG_LOCHS` | 114 | new | "Lochs & Lakes": Loch-class frigates built and cancelled, lochs, loughs, lakes |
| `ENG_GEOGRAPHY` | 68 | new | "Hills & Mountains": Hill-class trawlers, mountains of Scotland, England, Wales and Ulster |
| `ENG_DANCES` | 46 | new | Dance-class trawlers, British and other dances |
| `ENG_PARLIAMENT` | 45 | new | `democratic`: "Liberty & Parliament" |
| `ENG_MONARCHISM` | 42 | new | `neutrality`: "Crown & Empire" |
| `ENG_CAVALIERS` | 35 | new | `neutrality`: "Cavaliers & Jacobites" |

Workers' navy set (`WLNS `, gated `has_government = communism`), 43 groups, 4,376 names: one copy of every `HMS ` group except Colonies, Kings, Mythology and the three ideology pools (Communist Mirror below), plus `ENG_SOCIALISM` ("Radicals & Labour", 55, new). Vanilla's tags keep their mixed endings; new copies of hull and role lists end `_COMMUNISM` (like vanilla's `ENG_DE_COMMUNISM`), new copies of thematic pools `_COMMUNIST` (like vanilla's `ENG_COUNTIES_COMMUNIST`).

Lists shorter than vanilla, by design: `ENG_DE_HISTORICAL` (207 → 129: the Captain class went to Frigates, the Canadian Town names left); `ENG_CLAA_HISTORICAL` (58 → 23: the C, D, E and Leander-class names were CL's); `ENG_CVL_HISTORICAL` (28 → 21: *Argus* and *Hermes* to CV, *Europa*, *Andromeda*, *Powerful*, *Terrible* and *Monmouth* to CA).

## Role Pools: considered / created / skipped

- **Escort destroyers, AA cruisers, light carriers, monitors, minelayers:** created under vanilla's tags (the starting variants use four of them); `BM_HISTORICAL` and `CLAA_HISTORICAL` added to `Get-RolePoolSuffixes`.
- **Escort carriers:** created (`ENG_ESCORT_CARRIERS`), separate from the light carriers because the RN named them in their own series (agent nouns, rulers' titles).
- **Minesweepers, sloops, frigates (Captain, Colony, Bay), gunboats, armed merchant cruisers:** created; each holds several documented series.
- **Corvettes, River and Loch frigates, armed trawlers:** considered, folded into thematic pools by the author's "By subject" ruling (Flowers, Castles, Rivers, Lochs & Lakes, Isles, Trees, Dances, Shakespeare, Hills & Mountains).
- **Flotilla leaders:** considered, skipped: the leaders shared the destroyer lists in vanilla and the RN's own alphabetical flotillas; the WWI leaders vanilla lacked are a section of DD.
- **Scout cruisers:** considered, skipped: 15 ships, most names already destroyer or cruiser names; the free ones are a section of CL.
- **Seaplane tenders:** considered, skipped: about ten names; the seaplane carriers are a section of CV and the WWII ones (*Campania*, *Nairana*, *Vindex*) are escort carriers.
- **Minelaying submarines (Grampus class, 6), cruiser and midget submarines (numbered):** considered, skipped; they stay in SS.
- **Torpedo boats, fast attack craft:** considered, skipped: numbered (TB, MTB, MGB, ML).
- **Submarine tenders, training ships, icebreakers:** considered, skipped: too few names. **Royal yachts:** in the non-aligned "Crown & Empire" pool.
- **Coastal defence, fast battleships, large and armoured cruisers:** considered, skipped: in BB (ironclads), BC (Courageous class went to CV) and CA (armoured cruisers).

## Collision Resolutions

Every hull and role group is exclusive of every other (the builder resolves a shared name by an explicit ruling, else by the more recent use, else by hull priority BB > BC > CV > CA > CL > roles > DD > SS). The rulings:
- **BB:** *Anson*, *Howe*, *Rodney* (KGV and Nelson classes, not the cancelled Admiral class), *Superb*, *Bellerophon*, *Temeraire*, *Audacious* (1912 dreadnought; the 1942 carrier was renamed *Eagle*), *Agincourt* (over the Battle-class destroyer).
- **BC:** *Lion*, *Tiger*, *Renown*, *Repulse*, *New Zealand* (the 1911 battlecruiser, a gift commissioned into the RN, over the cancelled carrier), *Mary Rose* (over the M-class destroyer and the Algerine), *Defiance*.
- **CV:** *Indomitable*, *Indefatigable*, *Glorious*, *Courageous*, *Furious* (carriers for most of their lives), *Irresistible* (Audacious class), *Argus*, *Gibraltar* (Malta class), *Pegasus*; the air-station raptors *Kestrel*, *Falcon*, *Vulture*, *Goshawk*, *Sparrowhawk*, *Peregrine*, *Merlin* over the old destroyers and the China gunboat *Falcon*.
- **CL:** *Neptune*, *Orion*, *Ajax* (the 1930s cruisers), *Swiftsure* (Minotaur class over the pre-dreadnought), *Falmouth* and *Lowestoft* (keeping the 1910 Town group whole over the 1930s sloops).
- **CA:** *Blake*, *Hawke* (Edgar class), *Minotaur*, *Defence* (armoured cruisers; the 1943 *Minotaur* went to Canada), *Powerful*, *Terrible*, *Monmouth*, *Europa*, *Andromeda*, *Hogue* (the Cressy trio), *Vindictive*, and the counties *Cheshire*, *Derbyshire*, *Worcestershire* over the AMCs of those names.
- **Roles:** *Diadem*, *Euryalus* → CLAA (Dido class); *Colossus*, *Hercules*, *Leviathan*, *Perseus*, *Pioneer* → CVL; *Apollo* → minelayers (Abdiel class; the 1934 cruiser became HMAS *Hobart*); *Havelock* → monitors (keeping the Abercrombie class whole). *Australia* sits in CA only, with the Orlando-class cruiser of 1886: the 1911 battlecruiser was commissioned as HMAS. *Severn* stays with the Thames-class submarine of 1934 by recency, beside *Thames* and *Clyde*.
- **DD/frigates:** *Hoste* goes to the Captain-class frigate of 1943 by recency (the 1916 leader loses it).
- **DD/SS:** *Undaunted*, *Hunter* (Narvik) stay DD; *Shark* goes to SS (the 1934 S-class boat, sea-creature formula). Other WWI destroyer names reused by WWII submarines stay with the submarine.
- Same honoree or name removed: BB *Royal Alfred* (the same Alfred as CA *King Alfred*); BC *Cape St Vincent* (BB *St Vincent*); CA *Bedfordshire* and *Berwickshire* (CA *Bedford*, *Berwick*); SS *Tunny* and *Thresher* (vanilla *Tuna*, *Thrasher*); DD *Ghurka* (vanilla *Gurkha*); Saints *St Mungo* (*St Kentigern*); Birds *Landrail* (*Corncrake*); Shakespeare *Lear* (vanilla Mythology *Leir*). INFO `CrossClassPerson` pairs left as they are: CL *Adelaide* / BB *Royal Adelaide* (city and queen), CL *Edinburgh* / CA *Duke of Edinburgh*, CA *York* / BB *Duke of York*, CA *St George* / BB *Prince George*, BC *Princess Royal* and *Prince Royal* / CV *Ark Royal* (different names).
- **Thematic pools:** new pools and the additions to vanilla pools share no name with each other (*Viola* in Shakespeare, *Snowflake* in Wind, Sky & Sea, *Acacia* and *Wistaria* in Trees; *Beresford*, *Byron*, *Bede*, *Thomas Hardy* each kept once; after review, *Shrewsbury* and *Montrose* left Cities, *Calder* Rivers, *Cumberland* Generals, *Merlin* Birds, *Westminster* Liberty & Parliament, and *Salisbury*, *Chatham* and *Melbourne* became *Lord Salisbury*, *Lord Chatham*, *Lord Melbourne*). Left as they are: vanilla Counties *Bute* and the Isles-class trawler *Bute*, vanilla Cities *Westminster*; the communist Admirals' commissioner is *William Burton*, apart from the explorer *Burton*; they may share names with hull and role groups when the name is their subject (Admirals has *Nelson*), and an engine name taken by one ship is skipped by the others [NAM-022].

## Communist Mirror

Builder rule: a copy keeps the source's order and sections minus royal names; vanilla's own communist names come first (*Liberator*, *Worker*, *Inevitable*; the Commonwealth head of `ENG_ADMIRALS_COMMUNIST`; the Civil War and Commonwealth head of `ENG_BATTLES_COMMUNIST`). Royal names are names carrying King, Queen, Prince, Princess, Duke, Duchess, Royal, Royalist, Emperor, Empress, Imperial, Monarch, Sovereign, Majestic, Regent, Crown or Viceroy, plus vanilla's own strip list (*Conqueror*, *Iron Duke*, *Marlborough*, *Royal Oak*, *Ark Royal*, *Majestic*, *Monarch*) and royal persons, houses, titles and regalia without a title word (*Victoria*, *Alexandra*, *Atheling*, *Rajah*, *Ranee*, *Shah*, *Sultan*, *Nizam*, *Begum*, *Nabob*, *Khedive*, *Ameer*, *Ruler*, *Tudor*, *Sceptre*, *Cavalier*, *Rupert*, *Wellington*, *Sovereign of the Seas*, *Elizabeth Bonaventure*); per group: DD *Bruce* and *Stuart* (the Scott-class leaders after Robert the Bruce and the royal house), CA *Edgar* (after King Edgar), Generals *Marlborough*, *Wellington*; Saints *St Oswald*, *St Edmund*, *St Edward*, *St Margaret*; Shakespeare *Macbeth* (a King of Scots); Ancient Britain the client rulers *Cartimandua*, *Prasutagus*; Castles *Windsor Castle*. The rule covers British royalty and monarchs' titles, not classical, legendary or foreign figures: *Dido*, *Cleopatra*, *Hermione*, *Oberon*, *Titania*, *Caesar* and *Saladin* stay in every list that has them. Kept although they carry a title word or honour a duke: *King's Lynn*, the merchant ships *Southern Prince* and *Queen of Bermuda*, the sloop *Wellington* (the New Zealand city), and *Albemarle* (George Monck, who heads vanilla's own communist admirals). *Naseby*, the Commonwealth flagship, stays. Battle names are events, not royal names, so the Battles copy keeps *Evesham*, *Dettingen* and *Culloden* as the hull copies keep *Agincourt* and *Trafalgar*.

Effect (names left out of the copy): BB 25, ESCORT_CARRIERS 12, DD 9, BC 8, SS 4, CA 4, SAINTS 4, CLAA 2, BM 2, MINELAYERS 2, GENERALS 2, ANCIENT_BRITAIN 2, and one each in CV, CVL, FRIGATES, SHAKESPEARE, CASTLES. `-Audit` reports the same counts as `VariantMirror` INFO.

Vanilla communist repairs: `ENG_ADMIRALS_COMMUNIST` *Montague* → *Montagu*, *Desborow* → *Desborough*, *Clerk* → *Clerke*, *Gooking* → *Gookin*, *Jones* → *Philip Jones*; added the Commonwealth flag officers *Lawson*, *Badiley*, *Goodson*, *Bourne*, *Stayner*; display name *Admirals & Commissioners* (the vanilla key has no translation, and the pool holds the 1653 Admiralty commissioners beside the generals at sea); *Stone* → *John Stone*, *Burton* → *William Burton*. `ENG_BATTLES_COMMUNIST` *St. Fagans* → *St Fagans*.

**Maintenance:** an edit to an `HMS ` group must be made to its copy as well (`-EditNames` on both tags); `VariantMirror` shows a one-sided edit as a changed count.

## Tooling Changes

- `build.ps1` `Get-NamelistAuditFindings`: a gated `<TAG>_<BASE>_<SET>` group whose set is in the canon's `variantSets` is a variant group; a non-hull base (role or thematic copy) qualifies only in a set listed for the file's nation under the new canon key `mirroredVariantSets` (keyed by TAG after review, so another nation's gated `_COMMUNIST` pools stay ordinary pools). A non-vanilla variant group passes only in a mirrored set and only when its main-set counterpart (`<TAG>_<BASE>_HISTORICAL` or `<TAG>_<BASE>`) exists. New INFO `VariantMirror` per mirrored set; new `RoleOverlap` check inside each variant set. The `VariantSet` INFO now reads "Regime-variant sets".
- `build.ps1` `Get-RolePoolSuffixes`: `BM_HISTORICAL`, `CLAA_HISTORICAL`. `-SyncShipTypeCanon -Write` keeps `mirroredVariantSets`. The `-SyncWiki` sample filter's literal ellipsis became the regex escape `…` (the edit hook refuses non-ASCII string literals).
- `data/ship_types_canon.json`: `variantSets` adds `COMMUNISM`, `COMMUNIST`; new `mirroredVariantSets` = `{ "ENG": ["COMMUNISM", "COMMUNIST"] }`.
- `tests/BuildScript.Tests.ps1`: a test for a mirrored set (the fixture nation given its own canon entry; hull, role and thematic copies accepted; `VariantMirror` counts; a copy without a counterpart fails; a role copy sharing a name with the set's CL fails), and a negative test (a nation the canon does not list: the hull copy fails as newly authored, the thematic copy stays an ordinary pool; a `CONFEDERATE` thematic base is never a variant).
- Docs: guide section 2D (the mirror exception), section 5 (`VariantMirror`), section 7 (copies carry no `ship_types`); `AGENTS.md` line on variant sets; the authoring skill's Step 0 line in both mirrors.

## Linguistic and Verification Notes

**Vessels, scripted:** every name in a hull or role section headed by a class or period came from the scripted class pages above. The Captain class follows *List of Captain-class frigates* (78 names, spelling *Narborough*): vanilla's *Cockburn* and *Mitchell* left (*Mitchell* was *Hoste*'s original name), *Drury*, *Hoste* and *Retalick* joined; the reviewer recalled *Narbrough (K578)*, but the list page and the RN corpus both have *Narborough*. The Kil-class *Kilybegs* is *Killybegs* (RN corpus). Exceptions to the class pages, which the fact-check passes settled: the armed merchant cruisers (pass 1: all 45 WWII names on uboat.net's RN AMC class list; the 28 WWI names on Wikipedia *Northern Patrol* and *List of auxiliary and merchant cruisers*; *Alaunia*, *Antonia*, *Carthage* added; *Champagne* dropped, possibly French); the auxiliary minelayers (*Teviot Bank* respelt *Teviotbank*, uboat.net), Fly, Insect and Dragonfly gunboats, China gunboats (*Robin* and *Sandpiper* placed with the 1897 boats; *Nightingale* added), seaplane carriers (*Albatross* dropped as Australian), Hill-class trawlers, *Rival* and *Arno* (pass 2); the Fleet Air Arm air-station names (pass 3, Wikipedia *List of air stations of the Royal Navy*; *Waxwing* dropped, *Osprey* dropped as the Portland anti-submarine school before 1959; *Nighthawk*, *Flycatcher*, *Hornbill*, *Gamecock*, *Peewit*, *Siskin*, *Saker*, *Spurwing*, *Sea Eagle* added) and the adjectives *Tremendous*, *Foudroyant*, *Impregnable*, *Redoubtable*, *Tonnant*, *Puissant*, *Resolute* (RN names; *Puissant* was a hulk, *Resolute*'s type not looked up). *Saunders* (a Thornycroft leader cancelled in 1918) and the four never-completed Algerines are kept as cancelled names. *Cerberus* left the monitors (built for the Colony of Victoria).

**Formula extensions** (sections headed "Expansion", tier 5 in the builder; no persons): DD weapons; SS marine life; CL cities and towns, cities of the Empire, colonies; CA counties; BC victories at sea (pass 7: *Heligoland* → *Heligoland Bight*; *Narvik* and *Zeebrugge* dropped as a defeat or a strategic failure; *Texel*, *Ushant*, *Calabria*, *Spartivento*, *Orfordness*, *Martinique* dropped before the pass as indecisive or duplicated); CV air stations and adjectives.

**Persons, kept on ship precedent:** every person name in the hull and role groups is a name an RN ship bore (Captain-class captains, leaders, monitors, County and Hawkins classes).

**Persons, checked (death before 1936):**
- Admirals and generals (pass 4): from recall, except *Madden* (Charles Madden, 1st Bt, d. 5 June 1935) and *Byng* (Julian Byng, d. 6 June 1935), checked online. *Milne* is Sir Alexander Milne (d. 1896), not Archibald Berkeley Milne (d. 1938); *Gough* is Hugh Gough (d. 1869); *Seymour* the Victorian admirals (Beauchamp or Edward, both before 1936); *Hotham* William Hotham; *Coote* Sir Eyre Coote (d. 1783).
- Explorers, Commonwealth commanders, Cavaliers (pass 5): the Commonwealth commissioners checked against the Act of 3 Dec 1653 and *General at sea*; the rest from recall. *Digby* → *George Digby*; *Strafford* and *Clifton Moor* dropped.
- Radicals, parliamentarians, saints (pass 6): from recall. *Everard* → *William Everard* (the Digger); *Arthur Henderson* (d. 20 Oct 1935) moved from Radicals & Labour to Liberty & Parliament as a moderate.
- Battles and great ships (pass 7): *Elizabeth Bonaventure*, *White Bear*, *Constant Warwick*, *Dover Strait* checked online; the rest from standard references. Battles dropped as defeats or indecisive: *Lewes*, *Barnet*, *Tewkesbury*, *Quatre Bras*, *Loos*, *Gaza*, *Toulouse*, *Le Cateau*. *Fuentes de Oñoro* and *San Sebastián* take their accents.

**Persons kept without a lookup (canonical figures):** Kings and queens of England, Scotland and Britain; Tudor and Stuart admirals (*Drake*, *Hawkins*, *Blake*, *Monck*), *Nelson*, *Collingwood*, *Rodney*, *Anson*, *Hawke*, *Howe*, *Hood*, *Jervis*, *Duncan*, *Cochrane*, *Codrington*, *Pellew*, *Fisher*, *Jellicoe* (d. 20 Nov 1935); *Cromwell*, *Fairfax*, *Marlborough*, *Wellington*, *Wolfe*, *Clive*, *Moore*, *Kitchener*, *Gordon*, *Roberts*, *Wolseley*, *Haig*, *Raglan*, *Havelock*, *Napier*; *Cook*, *Franklin*, *Scott*, *Shackleton*, *Livingstone*, *Stanley*; the poets and writers; the patron saints; *Wat Tyler*, *John Ball*, *Thomas Paine*, *Cobbett*, *Robert Owen*, *William Morris*, *Keir Hardie*; *Wilberforce*, *Gladstone*, *Disraeli*, *Robert Peel*, *Pitt*, *Burke*, *Simon de Montfort*; *Rupert*, *Montrose*.

**Living in 1936:** none in the new pools (*Beatty*, d. Mar 1936, *Kipling*, *Allenby*, *Keyes*, *Tyrwhitt*, *Bacon*, *Birdwood*, *Lloyd George*, *MacDonald* excluded). Vanilla Kings keeps *King Edward VIII*; BB keeps *Beatty*, the KGV-class name of 1940.

**Homonyms:** dropped or compounded in the new pools: *Hobby*, *Battle* (Minesweepers), *Deal* (Cities), *Grouse* → *Red Grouse*, *Cook* → *James Cook*, *Parry* → *William Edward Parry*, *Wildman* → *John Wildman*, vanilla Cities *Hull* → *Kingston upon Hull*, *Shag*, *Sole*, *Brill*, *Perch*, *Yak*, *Box*, *Elder*, *Lime*, *Plane*, *Jet*, *Rum*, *Reel*, *Jig*, *Brown Willy*, *Bush*, *Hull* (CL), *Halifax* (CL, Canadian); *Martin* → *House Martin*, *Char* → *Arctic Char*, *Back* → *George Back*, *Baker* → *Samuel Baker*, *Peel*, *Locke* → full names. Kept on RN precedent: Tree-class *Bay*, *Ash*, *Fir*, *Pine*; River-class *Test*, *Dart*, *Wear*, *Cam*; *Fox*, *Robin*, *Swift*, *Wager*. *Negro* (M-class destroyer of 1916) left out as offensive today.

**Fonts:** only *é* (*Immortalité*), *ñ* and *á* are outside ASCII; vanilla and FRA already use Latin-1 accents.

## Review Focus

- The mirrored communist set: strip list, kept exceptions, and the new audit classification.
- The tier and ruling-based decoupling (Collision Resolutions), especially where a famous name lost its older or newer use.
- Formula extensions in CL, CA, BC, CV (no persons, but whether each formula is documented).
- Persons kept without a lookup or from recall only (passes 4 to 6).

## Review (2026-10-26)

Fresh `isne-code-reviewer` (Opus): not ready, 0 Critical, 3 Important, 15 Minor.
- **I1** (HMAS *Australia* in BC): fixed; *Australia* sits in CA with the Orlando-class cruiser, and the wiki notes the RN-owned, RAN-manned N and Q-class destroyers kept from vanilla.
- **I2** (strip inconsistencies): fixed as recorded under Communist Mirror (*Sultan*, *Nizam*, *Bruce*, *Stuart*, *Edgar* stripped; *Albemarle* kept; classical and foreign figures kept in every list).
- **I3** (global `mirroredVariantSets`): fixed; the key is per nation, with a negative test.
- **Minor, fixed:** M1 (same names twice, listed under Collision Resolutions), M2 (thematic overlaps), M3 (homonyms), M4 (display *Valour & Virtues*; hounds, horses and *Camel* left Wild Beasts; communist *Admirals & Commissioners*; *Hakluyt* moved to Poets & Writers), M5 (Ancient Britain: *Togodumnus* with the resistance leaders and kept in the copy, client rulers in their own section, *Caerleon* dropped as the same place as *Isca*), M6 (*Capetown* added to CL; *Robin* and *Sandpiper* restored to Gunboats), M7 (*Severn* back to SS), M8 (Captain class checked, above), M12 (Workshop bullets in the past tense; lineage wording), M13 (wiki overview, battle range, copied-lists wording), M15 (negative test).
- **Minor, kept with reason:** M9 (battle names are events and stay in the Battles copy, as hull copies keep battle names); M10 (both non-aligned pools are monarchist and kept apart, so no pool mixes the two causes); M11 (WWII battles in the BC expansion follow the RN's own practice of naming 1943-45 Battle-class destroyers after recent battles; *Zeebrugge* stays in Famous Battles, which is not limited to victories, as vanilla's *Jutland* and *Balaklava* show); M14 (`VariantMirror` stays INFO; the expected counts are recorded above and the plan is the reference).

## Validation (2026-10-26, after review fixes)

- `-ValidateOnly`: Validation succeeded (22 files).
- `-VerifyShipTypes ALL`: ship_types OK: 22 files, 512 groups.
- `-Audit ENG`: FAIL=0 WARN=0 INFO=8. `-Audit USA`: FAIL=0 WARN=0 (Confederate set unchanged).
- `-SyncWiki ENG`: 0 rows updated.
- `-Test`: 432 passed, 0 failed.
