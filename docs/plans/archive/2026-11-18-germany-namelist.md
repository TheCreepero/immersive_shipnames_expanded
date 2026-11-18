# Germany (TAG: GER) Ship Namelist Plan

**Goal:** Author Germany as the mod's largest file by group count: keep every vanilla tag, repair the lists, decouple the cruiser, capital and carrier rosters, turn vanilla's sub-type lists into role pools, add role, thematic and ideology pools, and mirror the role and thematic pools into vanilla's Imperial `SMS ` set.

**File:** `common/units/names_ships/GER_ship_name.txt`. Vanilla's file name is singular, so the mod file carries the same name to shadow it [LOAD-010]; see Tooling Changes.

**Sources:**
- Two parallel `isne-historical-researcher` dossiers (2026-11-18): A covered hull formulas, role pools, naval terms, vanilla suspects and decoupling (20 web calls); B covered vanilla's thematic and communist pools, new thematic pools and ideology pools (about 29 web calls).
- Scripted rosters from German Wikipedia raw wikitext: *Liste der Schiffe der Kaiserlichen Marine* (340 named ships with type and class), *Liste von Schiffen der Kriegsmarine*, *Liste geplanter Schiffe der Kriegsmarine*, *Liste der Namen deutscher Kriegsschiffe (A–M)* and *(N–Z)* (811 names with navy, type and years; incomplete, so a miss is not a verdict), *Liste der Schiffe der Nationalen Volksarmee*, *Liste deutscher Großer Torpedoboote (1898–1919)* (every boat V 1 to S 223 with its yard letter).
- Nine parallel `isne-audit-researcher` fact-check passes (2026-11-18): 1 admirals (6 web calls), 2 seafarers and tender namesakes (25), 3 generals for BC (2), 4 commanders for CA and the destroyer namesakes (24), 5 aviators (14), 6 U-boat commanders (25), 7 revolutionaries and democrats (3), 8 Teutonic Order, tribal leaders and explorers (10), 9 vessels (25). Several passes answered mostly from standard references; see Verification Notes.

**Author scope decisions (AskUserQuestion, 2026-11-18):**
- **Imperial set, "Mirror everything":** every role and thematic list gets an `SMS ` copy for a restored Kaiserreich, and the seven Imperial hull lists carry Imperial-era rosters. This is the author-approved mirror of guide section 2D (as for `ENG`).
- **Fascism pool, "Gated pool, real names":** one pool visible only under a fascist government, holding the Reichsgaue vanilla used for capital ships and names that vessels of 1933-45 carried. No party leaders: *Robert Ley* (a KdF liner, but a living party leader) is left out.
- Size: the user asked for many lists, as big as or bigger than the largest files so far.

## Vanilla Audit Findings (Step 0)

1. **File name:** `GER_ship_name.txt`, the only vanilla ship namelist without the plural. 33 groups, plus a commented-out copy of an older file from line 2222 (dropped).
2. **Tags vanilla script assigns:** `GER_BB/CA/CL/CV/DD/SS_HISTORICAL`, `GER_PZ_HISTORICAL`, `GER_TB_HISTORICAL` (starting variants in `history/countries/GER - Germany.txt`, also used by `DDR`, a focus of Argentina and a scripted effect), `GER_MR_HISTORICAL` (a decision in `common/decisions/GER.txt`). All stay defined. `GER_BC`, `GER_MS`, `GER_CS` and `GER_CVL_HISTORICAL` are not assigned but keep their tags for saves that hold them [NAM-019].
3. **Gates:** vanilla gated nearly every group by national focuses (`has_completed_focus`): the unprefixed lists disappear when the Kaiser returns (four focuses) or the proletarian revolution starts, the `SMS ` lists appear with the Kaiser, the communist pools need a focus as well as the government, and the merchant raiders need `GER_cruiser_warfare`. Focus gates are forbidden here (guide section 7), and by [NAM-024] vanilla's switch strips the group from every variant and renames the fleet from `common/units/names`. See Gating below.
4. **Ship types:** BB and BC both `battleship battle_cruiser`; PZ and CA both `heavy_cruiser light_cruiser`; TB `destroyer`; MS `destroyer light_cruiser`; CS `light_cruiser destroyer`; CVL `carrier`; MR `ship_hull_cruiser light_cruiser`; no MtG hull tokens anywhere else.
5. **Shadow duplication:** `GER_PZ_HISTORICAL` repeats all 32 names of `GER_BC_HISTORICAL` after two of its own; `GER_CVL_HISTORICAL` is the rivers pool; `GER_TB_HISTORICAL` repeats twelve names of the animals pool (vanilla linked the numbering of those pairs). *Lützow* sits in PZ and CA, *Flemming* in CA and CV, *Paderborn* and *Siegen* in CL and CS, *Sachsen* twice in BC, *Deutschland* and *Lützow* (one ship) both in PZ.
6. **Unverifiable or wrong names:** BB filled 24 of 30 places with surnames of obscure knights and officials (*Alxinger*, *Geizkofler*, *Mussinan* ...; *Rosenberg* reads as the Nazi ideologue); BC and PZ named capital ships after Nazi Reichsgaue of 1938-41 (*Moselland*, *Wartheland*, *Oberdonau* ...); CA held Austro-Hungarian admirals and commanders of Frederick's enemies (*Daun*, *Schwarzenberg*), persons alive in 1936 (*Mackensen*, *Lettow-Vorbeck*, *Souchon*, *Behncke*, *Schmidt*, *Müller*) and unidentifiable surnames (*Heyde*, *Krockow*); CV held airship men by surname, several alive in 1936 (*Eckener*, *Parseval*, *Schütte*, *Lehmann*, *Schiller*, *Treusch*, *Schirlitz*).
7. **Anachronisms:** CL *Wolfsburg* (1938, named 1945) and *Salzgitter* (1942); CS towns founded or merged after 1936 (*Eisenhüttenstadt*, *Norderstedt*, *Villingen-Schwenningen*, *Rheda-Wiedenbrück*, *Bergkamen*, *Erftstadt*, *Meerbusch*, *Sankt Augustin*, *Nettetal*, *Lennestadt* and others); communist slogans *Die Linke* (2007), *Unsere Zeit* (1969), *Neues Deutschland* (1946), *Frieden und Sozialismus* (1958).
8. **Spellings:** *York* → *Yorck*; *Herta* → *Hertha*; *Skaggerak* → *Skagerrak*; *Garmisch-Patenkirchen* → *Garmisch-Partenkirchen*; destroyer namesakes *Friedrich Eckholdt* → *Eckoldt*, *Hermann Kühne* → *Künne*, *Anton Schmidt* → *Schmitt*; *Orbotrit* → *Obotrit*; *Max Immelman* → *Max Immelmann*; *Weissenburg*, *Preussen* → *Weißenburg*, *Preußen*; *Ueckermuende* → *Ueckermünde*; *Berlin-Haupstadt der DDR* → *Berlin*; *Die Kieler Matrosenaufstand* → *Kieler Matrosenaufstand*; *Lang Lebe Spartakus* → *Es lebe Spartakus*.
9. **Odd lists:** `GER_SS_HISTORICAL` held the single entry `U-27` (a deliberate step past the starting boats, see Numbered Lists) and `GER_SS_IMPERIAL` 26 entries of the pattern `U-%d` (valid: an entry's text takes its number [NAM-021]); `GER_THEME_RIVERS_IMPERIAL` had no fallback; `GER_BB_IMPERIAL` split *Schleswig-Holstein* into two ships and listed the cruiser *Pillau*; `GER_BC_IMPERIAL` held cruiser and battleship names; `GER_DD_IMPERIAL` held 100 invented designations *G 200* to *T 299*.
10. **Fallbacks:** *Träger %d* (colloquial) → *Flugzeugträger %d*; *SP %d* → *Spähkreuzer %d*; *Z %d* beside list entries without the space (now *Z%d*); Imperial lists used Kriegsmarine terms.
11. **Prefix:** none on the main set (correct: neither Reichsmarine nor Kriegsmarine used one); `SMS ` and, for submarines, `SM ` on the Imperial set. Both kept.

## Gating

- **Main set: no `can_use`.** The Reichsmarine and Kriegsmarine lists are open to every government, so no change of government strips a group and renames the starting fleet [NAM-024].
- **Imperial set: `OR = { has_government = neutrality has_government = democratic }`.** The Kaiser reigns under a non-aligned government (*Return of the Kaiser*) and under a democratic one (*The Monarchy Compromise*), and the second follows the first; a gate on `neutrality` alone would rename an Imperial fleet at that step. A democratic republic sees the `SMS ` lists as well; they are opt-in.
- Because both sets are visible together under those two governments, the copies carry their own display names: `SMS <name>` for role and thematic copies (the prefix survives the selector's cut at about 22 characters [NAM-013]), vanilla's "Imperial ..." keys for the hull lists.
- **Ideology pools:** communism (vanilla's three pools, without the focus), democratic (2), fascism (1). The two monarchist pools carry `SMS ` and the Imperial set's gate for the reason above.
- Vanilla's three communist pools exceed the cap of two per ideology; they are vanilla's own tags and are kept.

## Numbered Lists

German navies numbered destroyers (from Z23), torpedo boats, minesweepers, escorts and submarines. Those lists hold `ordered` entries equal to their fallback (`Z%d`, `U-%d`, `T%d`, `M%d`, `F%d`, vanilla's typography; Imperial `V 25`, `S 31`, `U-%d`). What the history files do decides their shape (read from `history/units/GER_*naval*.txt`, 2026-11-18, after the review):
- **The 1939 start with Man the Guns names ships by entry number** (`ordered_name`): destroyers 1 to 21 in `GER_DD_HISTORICAL`, the Type 24 boats 201 to 211 in `GER_TB_HISTORICAL`, submarines 1 to 61 in `GER_SS_HISTORICAL`. A number with an entry shows that entry's text, a number without one the fallback [NAM-021]. So vanilla's entry numbers and texts stay: `1 = Z1 Leberecht Maass` to `22 = Z22 Anton Schmitt` (three spellings corrected), `201 = Möwe` to `212 = Leopard`.
- **The 1936 start and the 1939 start without the DLC give fixed names** (`name = "U-1"`): *U-1* to *U-13* and *U-17*, the twelve torpedo boats, the cruisers, *Deutschland*, *Schlesien*, *Schleswig-Holstein*; no destroyer exists in 1936. Whether a fixed name blocks a list entry of the same text has not been seen in game (for divisions a typed name holds nothing [NAM-021]), so the lists are laid out to be right either way: the submarine entries begin at `18 = U-18` (vanilla began at 27), the torpedo boat list offers `T1` to `T200` before the twelve names, and the names of starting ships stand last in their lists (*Emden* to *Nürnberg* in CL, *Schlesien* and *Schleswig-Holstein* in BB, *Deutschland* in PZ), as vanilla ordered them.
- Destroyers continue `Z23` to `Z100` as entries and by the fallback after that. The 22 namesakes also form the first section of the pool Naval Heroes.
- `GER_DD_IMPERIAL` holds the real boats and orders of 1911-1918, V 1 to S 223, each with its yard letter (V Vulcan, G Germania, S Schichau, B Blohm & Voss, H Howaldt, Ww Wilhelmshaven design), scripted from the list page.

The first build of this file numbered every destroyer `Z-1` onward and keyed the torpedo boat names as `unique`, on a wrong reading of the history files (the `Z-1` names belong to the 1939 start without the DLC); the review caught it (C1, C2, I1).

## Final Architecture (102 groups, 6,990 names)

Main set (no prefix, no gate), 53 groups with the ideology pools, 3,502 names:

| Group | Count | Vanilla | Content |
|---|---|---|---|
| `GER_DD_HISTORICAL` | 100 | 22 | *Z1 Leberecht Maass* to *Z22 Anton Schmitt*, `Z23` to `Z100` |
| `GER_SS_HISTORICAL` | 133 | 1 | `U-18` to `U-150` |
| `GER_CL_HISTORICAL` | 114 | 101 | Reichsmarine cruisers; cities of the Kleine Kreuzer; large cities; cities of the eastern provinces; cities lost in 1919 or joined after 1936 (vanilla's Austrian cities; *Prag*, *Brünn*, *Pilsen* left) |
| `GER_CA_HISTORICAL` | 38 | 53 | Admiral Hipper class; armoured and first-class cruiser names; commanders of the Frederician and Liberation wars |
| `GER_BB_HISTORICAL` | 69 | 30 | Kriegsmarine battleships; names in circulation for the H class; Linienschiffe kept by the Reichsmarine; states and provinces of the battle line; expansion: states, provinces, founders of the old Reich |
| `GER_BC_HISTORICAL` | 45 | 32 | Große Kreuzer names the Kriegsmarine left free; field marshals and chiefs of staff; historic flagships |
| `GER_CV_HISTORICAL` | 51 | 22 | Graf Zeppelin class; names of the Luftwaffe's air-sea rescue tenders; pioneers, airship commanders, airmen dead by 1936 |
| `GER_PZ_HISTORICAL` | 33 | 36 | Role pool: Deutschland class; admirals dead by 1936 |
| `GER_TB_HISTORICAL` | 212 | 96 | Role pool: `T1` to `T200`, then the Torpedoboote 1923/24 on vanilla's entries 201 to 212 |
| `GER_MS_HISTORICAL` | 80 | 3 | Role pool: `M1` to `M80` |
| `GER_ESCORT_DESTROYERS` | 30 | new | Role pool "Fleet Escorts": `F1` to `F30` |
| `GER_MR_HISTORICAL` | 20 | 11 | Role pool: Hilfskreuzer of both wars |
| `GER_CVL_HISTORICAL` | 29 | 28 | Role pool "Auxiliary Carriers": conversion projects, catapult ships, seaplane carriers, rivers and bays of the coasts |
| `GER_MINELAYERS` | 30 | new | Minenschiffe of 1939-45, minelayers of 1906-18 |
| `GER_GUNBOATS` | 36 | new | "Gunboats & Avisos": gunboats of 1860-1903, Wespe class, avisos, China river gunboats |
| `GER_TENDERS` | 42 | new | Schnellboot, U-boat and Räumboot tenders, trials vessels, fleet tenders |
| `GER_CS_HISTORICAL` | 260 | 245 | Role pool "Scout Cruisers": vanilla's towns without the post-1936 ones, old towns of the provinces |
| `GER_THEME_ANIMALS` | 57 | 49 | Vanilla tag; beasts only |
| `GER_BIRDS` | 84 | new | |
| `GER_THEME_FISH` | 90 | 24 | Vanilla tag, "Fish & Sea Life" |
| `GER_INSECTS` | 47 | new | "Insects & Reptiles" (Wespe class) |
| `GER_NATURE` | 45 | new | "Wind & Weather" |
| `GER_STARS` | 55 | new | "Stars & Planets" |
| `GER_THEME_RIVERS` | 108 | 28 | Vanilla tag, "Rivers & Lakes" |
| `GER_PROVINCES` | 69 | new | "States & Provinces" |
| `GER_HANSE` | 67 | new | "Hanseatic Towns" |
| `GER_ISLANDS` | 71 | new | "Islands & Coasts" |
| `GER_GEOGRAPHY` | 70 | new | "Mountains & Ranges" |
| `GER_CASTLES` | 74 | new | "Castles & Forts" |
| `GER_COLONIES` | 62 | new | "Colonies" |
| `GER_RULERS` | 58 | new | "Emperors & Kings" |
| `GER_GENERALS` | 64 | new | |
| `GER_ADMIRALS` | 45 | new | "Seafarers" |
| `GER_HEROES` | 57 | new | "Naval Heroes": destroyer namesakes, U-boat commanders, cruiser captains |
| `GER_EXPLORERS` | 42 | new | |
| `GER_SCIENTISTS` | 52 | new | Scientists and inventors |
| `GER_WRITERS` | 61 | new | "Poets & Thinkers", with painters and builders |
| `GER_COMPOSERS` | 39 | new | |
| `GER_KNIGHTS` | 41 | new | "Knights & Orders" |
| `GER_TRIBES` | 57 | new | "Germanic Tribes" |
| `GER_THEME_GERMANIC` | 83 | 28 | Vanilla tag |
| `GER_SAGAS` | 63 | new | "Heroic Sagas" |
| `GER_LEGENDS` | 53 | new | "Legends & Tales" |
| `GER_CLASSICAL` | 87 | new | "Classical Myth" |
| `GER_THEME_BATTLE` | 85 | 21 | Vanilla tag |
| `GER_HISTORIC_SHIPS` | 41 | new | |
| `GER_VIRTUES` | 59 | new | |
| `GER_PEOPLE_COMMUNIST` | 37 | 58 | `communism`, vanilla key "Revolutionary Minds" |
| `GER_THEME_COMMUNIST_SLOGANS` | 41 | 32 | `communism` |
| `GER_THEME_COMMUNIST_DDR` | 98 | 41 | `communism`, "Volksmarine Vessels" |
| `GER_REPUBLICAN_IDEALS` | 42 | new | `democratic`, "Republic & Liberty" |
| `GER_DEMOCRATS` | 41 | new | `democratic`, "1848 & Weimar" |
| `GER_FASCISM` | 35 | new | `fascism`, "Third Reich" |

Imperial set (`SMS `, gated non-aligned or democratic), 49 groups, 3,488 names: seven hull lists with their own rosters (`GER_DD_IMPERIAL` 223, `GER_SS_IMPERIAL` 150 with `SM `, `GER_CL_IMPERIAL` 132, `GER_CA_IMPERIAL` 52, `GER_BB_IMPERIAL` 84, `GER_BC_IMPERIAL` 50, `GER_CV_IMPERIAL` 51), one copy of each of the ten role pools and thirty thematic pools (`GER_<BASE>_IMPERIAL`), and the monarchist pools `GER_MONARCHISM` ("Crown & Empire", 56) and `GER_DYNASTIES` ("Princely Houses", 43).

Lists shorter than vanilla, by design: `GER_CA_HISTORICAL` (53 → 38: living persons, foreign and unidentifiable names left, admirals went to PZ, the Große Kreuzer names to BC); `GER_PZ_HISTORICAL` (36 → 33: the copied BC list left); `GER_PEOPLE_COMMUNIST` (58 → 37: persons alive in 1936 and opponents of the revolution left).

## Role Pools: considered / created / skipped

- **Panzerschiffe, torpedo boats, minesweepers, scout cruisers, auxiliary carriers, merchant raiders:** created under vanilla's tags; `PZ_HISTORICAL`, `TB_HISTORICAL`, `MR_HISTORICAL`, `MS_HISTORICAL`, `CS_HISTORICAL` added to `Get-RolePoolSuffixes` (`CVL_HISTORICAL` was there).
- **Fleet escorts** (`GER_ESCORT_DESTROYERS`): created; Flottenbegleiter F 1 to F 10 were a numbered class of their own.
- **Minelayers, gunboats and avisos, tenders** (`TENDERS` is a new suffix): created from the scripted lists.
- **Corvettes:** considered, skipped as a role pool: the classical names are shared with the Gazelle-class cruisers of `GER_CL_IMPERIAL`; they form the thematic pool Classical Myth, the princess names the pool Crown & Empire.
- **Coastal defence:** considered, skipped: 8 names (Siegfried class); they open the pool Heroic Sagas and sit in `GER_CA_IMPERIAL`.
- **Seaplane tenders:** considered, skipped: the Luftwaffe tender names are the carrier formula and sit in CV; catapult ships are in Auxiliary Carriers.
- **Cruiser, coastal and minelaying submarines:** considered, skipped: one numbered series in the Kriegsmarine; the U-cruiser names of 1918 are commanders in Naval Heroes.
- **Fast attack craft, Räumboote, Sperrbrecher, submarine chasers:** considered, skipped: numbered, and not hulls the designer builds.
- **Training ships, icebreakers, weather ships, state yachts, monitors:** considered, skipped: too few free names; *Gorch Fock* is in Poets & Thinkers, the yachts in Crown & Empire.
- **Fast battleships, large and armoured cruisers, light carriers, AA cruisers, flotilla leaders, frigates, sloops, patrol vessels:** considered, skipped: no German class or formula.

## Collision Resolutions

Within each set CL, CA, BB, BC and CV share no name and no role pool shares one with them (the builder fails on a collision in the main set and drops the name from a role copy in the Imperial set).
- **Main set:** *Scharnhorst*, *Gneisenau* → BB; *Blücher*, *Seydlitz*, *Lützow*, *Prinz Eugen* → CA (Hipper class); *Von der Tann*, *Moltke*, *Goeben*, *Derfflinger*, *Hindenburg*, *Roon*, *Yorck* → BC; *Deutschland* → PZ only; *Hannover*, *Braunschweig*, *Oldenburg*, *Posen* → BB (Linienschiffe), not CL; *Hansa* → MR (HSK 11); *Potsdam* → CL (the carrier project was renamed *Jade*); *Westfalen* → BB, not the catapult ship; *Vineta*, *Hertha*, *Freya* → CA; *Nettelbeck* → Tenders; *Schwerin* the city in CL, the field marshal as *Graf Schwerin* in CA; *Brummer*, *Bremse* → Minelayers; *Ostmark* → Minelayers; *Doggerbank* → Merchant Raiders; the minelayers named like battleships or cruisers (*Brandenburg*, *Pommern*, *Preußen*, *Elsaß*, *Lothringen*, *Oldenburg*, *Schwerin*, *Stralsund*, *Ulm*, *Linz*) stay with BB and CL.
- **Imperial set:** *Scharnhorst*, *Gneisenau* → BC (Ersatz Yorck class; vanilla had them in BB); *Seydlitz*, *Lützow*, *Hindenburg*, *Mackensen*, *Graf Spee*, *Prinz Eitel Friedrich* → BC; *Blücher*, *Roon*, *Yorck*, *Fürst Bismarck*, *Prinz Heinrich*, *Hansa* and the Siegfried class → CA; *Deutschland* → BB; *Cöln* in the period spelling; the city *Hagen* left CL for the coastal defence ship; the Bussard-class bird names stay out of CL so that the torpedo boat copy keeps them. Left out of role copies: *Deutschland* (PZ), *Hansa*, *Kaiser Wilhelm der Große*, *Prinz Eitel Friedrich* (MR), *Kaiser*, *Brummer*, *Bremse* (Minelayers), *Vaterland* (Gunboats), *Frauenlob*, *Gazelle* (Tenders), *Kolmar* (Scout Cruisers).
- **INFO left as it is:** CL *Hamburg*, *Lübeck*, *Danzig* / BC *Wappen von Hamburg*, *Adler von Lübeck*, *Peter von Danzig* (city and ship); BB *Brandenburg* / BC *Markgraf von Brandenburg*; CL *Schwerin* / CA *Graf Schwerin*.
- **The thirty thematic pools of the main set** share no name with each other except where two things carry one name: *Stör* (fish, river), *Lippe* (river, state), *Braunschweig* and *Hannover* (states, Hanse towns), *Kulm* (Hanse town, battle of 1813), *Helgoland* (island, battle). The ideology pools were not deduplicated against them: the monarchist pools share ship and house names with Emperors & Kings, States & Provinces, Stars & Planets and Historic Ships (*Königin Luise*, *König Albert*, *Württemberg*, *Meteor*, *Großherzogin Elisabeth*), the Volksmarine pool shares towns, coasts and birds with several pools, *Florian Geyer* is in Knights & Orders and in Revolutionary Minds, *Aurora* in Classical Myth and in the slogans. Thematic pools may share names with hull and role lists when the name is their subject (Generals, Birds, Hanseatic Towns), also under two forms of one person's name (*Admiral Knorr* in Panzerschiffe, *Eduard von Knorr* in Seafarers; *Raule*, *Brommy*, *Alders*, *Jungingen* in Tenders beside the full names). A name one ship has taken is skipped by the others [NAM-022].

## Imperial Mirror

Builder rule: a copy keeps the source's order and sections; nothing is stripped (the unprefixed pools hold no republican or Third Reich names). The seven hull lists are authored: each opens with the Imperial roster from the scripted list, keeps vanilla's alternate-history names in a marked section (*Tirpitz*, *Ulrich von Hutten*, *Götz von Berlichingen*, *Vaterland*, *Franken*, *Holstein*; *Holtzendorff*; *Admiral Hipper*, *Prinz Eugen*; *Graf Zeppelin*, *Peter Strasser*), and reuses the main list's expansion sections. `-Audit` reports the differences as `VariantMirror` INFO: DD -100/+223, SS +17, CL -2/+20, CA -2/+16, BB -18/+33, BC -3/+8, PZ -1, MR -3, MINELAYERS -3, GUNBOATS -1, TENDERS -2, CS -1 (the Imperial carrier list now uses the same short forms *Richthofen*, *Boelcke*, *Immelmann* as the main one, and *Barbarossa* left the Imperial battlecruisers for the battleship *Kaiser Barbarossa*).

Left out of vanilla's Imperial lists: *Ludendorff* (alive in 1936), *Von Lettow-Vorbeck* (alive), *Pillau* (a cruiser), *Schleswig* and *Holstein* as two ships (*Holstein* kept as a land), *Friedrich Barbarossa* and *Karl der Große* (the battleships *Kaiser Barbarossa* and *Kaiser Karl der Große*), *Seydlitz*, *Europa*, *Potsdam*, *Aurora* (CV: a battlecruiser, two liners that are Auxiliary Carrier names, one unidentified), *Obotrit* and *Strelitz* (moved to Princely Houses), the invented destroyer designations.

**Maintenance:** the file is generated by a session-scratch builder; later edits go through `build.ps1 -EditNames` on the main tag and on its `_IMPERIAL` copy, and `VariantMirror` shows a one-sided edit as a changed count.

## Tooling Changes

- `build.ps1` `Get-NamelistFileName` (new): a nation's namelist file name, with vanilla's irregular names in one table (`GER` → `GER_ship_name.txt`); used by `-Audit`, `-EditNames`, `-DiffNames`, `-AuditPlan`, `-SyncWiki`, `-VerifyShipTypes` and `-InspectVanilla`. `tests/Shipnames.Tests.ps1` and `tests/Documentation.Tests.ps1` now pick up `*_ship_name*.txt`.
- `build.ps1` `Get-NamelistGroups`: a group with both a `unique` and an `ordered` block is counted with both (unique names first, as the engine uses them [NAM-022]). The final file has no such group; the count is right for one all the same.
- `build.ps1` prefix parity: when vanilla prefixes only a variant set, a group without a prefix fails only where vanilla's own group has one, or where it is a new copy in the variant set.
- `build.ps1` `DocsWorkshopFormat`: the check asked for the old two-bullet "Expanded / Added" block and warned on every nation; it now follows guide section 4 (one or two bullets, the last one "Added ...").
- `build.ps1` `Get-RolePoolSuffixes`: `TENDERS`, `PZ_HISTORICAL`, `TB_HISTORICAL`, `MR_HISTORICAL`, `MS_HISTORICAL`, `CS_HISTORICAL`.
- `data/ship_types_canon.json`: `variantSets` adds `IMPERIAL`; `mirroredVariantSets` adds `"GER": ["IMPERIAL"]`.
- `tests/BuildScript.Tests.ps1`: tests for the file name resolver, the unprefixed main set beside a prefixed variant set, and the combined count.

## Linguistic and Verification Notes

**Terms:** Imperial fallbacks follow the navy's own classes: *Linienschiff*, *Großer Kreuzer*, *Panzerkreuzer*, *Kleiner Kreuzer*; Kriegsmarine: *Schlachtschiff*, *Schlachtkreuzer*, *Schwerer Kreuzer*, *Leichter Kreuzer*, *Flugzeugträger*, *Panzerschiff*, *Spähkreuzer*, *Hilfsflugzeugträger*, *Hilfskreuzer*, *Minenschiff*, *Kanonenboot*, *Begleitschiff*. ß is kept (*Preußen*, *Weißenburg*, *Großer Kurfürst*, *Elsaß*). Ship names keep the spelling the ship carried (*Camaeleon*, *Crocodill*, *Scorpion*, *Cöln*, *Hermann von Wißmann*, *Erwin Waßner*, *Gunther Plüschow*).

**Vessels, scripted:** every name in a section headed by a class, a period or a kind of vessel comes from the scripted lists above. Pass 9 added: *Bunte Kuh*, *Adler von Lübeck*, *Peter von Danzig*, *Leopoldus Primus*, *Admiralität von Hamburg*, *Wappen von Hamburg* (also spelled *Wapen*); the Brandenburg ships from *Kurbrandenburgische Marine* (*Rummelpot* in the page's spelling; *Roter Löwe* modernised from *Rother Löwe*; *Carolus Secundus* dropped for its Brandenburg name *Markgraf von Brandenburg*, *Wappen von Brandenburg* dropped as an alias); the Reichsflotte from the English fleet list (*Franklin* dropped: never accepted); the catapult ships from *Katapultschiff*; *Tsingtau* and *Vaterland* from Navypedia; *Herbert Norkus* (launched 1939, never completed). Dropped as unverified or not period names: *Mariendrache*, *Bremer Kogge*, *Royal Victoria*, *Seute Deern* (German under that name only from 1939), *Oderbank*. Kept without a lookup in that pass: *Jesus von Lübeck*, the Flying P-Liners, *Herzogin Cecilie*, *Großherzogin Elisabeth*, *Rickmer Rickmers*, the lightship and lighthouse names of Islands & Coasts; *Answald*, *Santa Elena*, *Oswald*, *Ausonia*, *Libau*, *Ayesha*, *Geier*, *Victoria Luise*, *Otter*, *Schamien*, *Vorwärts* are in the scripted Imperial list.
**Volksmarine pool:** every name is in *Liste der Schiffe der Nationalen Volksarmee* or the names list; vanilla's *Warnemünde*, *Moskit*, *Wustrow*, *Triton* and *Orkan* were not found and left. The resistance names there are ship names of the 1950s-80s, most of persons alive in 1936; the pool's subject is the later navy.

**Persons, kept on ship precedent** (a German vessel carried the name): the destroyer namesakes (pass 4: not all fell in the war: *Wilhelm Heidkamp* died in 1931, *Hans Lody* was executed as a spy in 1914, *Hans Lüdemann* is honoured for 1913; several biographies not found; all dead before 1936); the Luftwaffe tender names *Karl Meyer*, *Max Stinsky*, *Bernhard von Tschirschky*, *Hans Albrecht Wedel* (namesakes not identified in pass 5), *Hans Rolshoven* (d. 1918), *Gunther Plüschow* (d. 1931); the tender and trials-vessel names *Carl Peters*, *Adolf Lüderitz*, *Hermann von Wißmann*, *Gustav Nachtigal*, *Wilhelm Bauer*, *Waldemar Kophamel* (d. 1934), *Otto Wünsche* (d. 1919), *Erwin Waßner* (d. 1937, alive in 1936; the tender is in the scripted list), *Von der Groeben*, *Raule*, *Brommy*, *Nettelbeck*, *Von der Lippe* (Nikolaus von der Lippe, mayor of Stralsund, d. 1433), *Alders*, *Jungingen* (Konrad von Jungingen), *Störtebeker*, *Claus von Bevern*, *Paul Beneke*, *Johann Wittenborg*, *Hugo Zeye* (Vizeadmiral, d. 1909), and *Hille*, *Sundevall*, *Eduard Jungmann* (namesakes not identified); *Ernst Thälmann* (Volksmarine; alive in 1936); *Horst Wessel*, *Albert Leo Schlageter*, *Herbert Norkus*, *Wilhelm Gustloff*.

**Persons, checked (dead before 1936):**
- Admirals (pass 1, *Liste deutscher Admirale*): all 28 confirmed; *Admiral Schröder* → *Admiral Ludwig von Schröder*, *Admiral Paschen* → *Admiral Karl Paschen* (other admirals of those names); *Fischel* d. 1929; *Truppel* (d. 1931) and *Mauve* (d. 1931) added. *Pohl*, *Jachmann*, *Batsch*, *Henk*, *Livonius*, *Werner*, *Monts*, *Valois*, *Deinhard* were vice admirals; the title follows the class formula.
- Seafarers (pass 2): *Karsten Rode*, *Klaus Kniphof* and *Cornelis Reers* dropped as unverified or thin; the rest confirmed, mostly from standard references.
- Generals (passes 3 and 4): *Manteuffel* → *Edwin von Manteuffel*, *Alvensleben* → *Constantin von Alvensleben*, *Marwitz* → *Georg von der Marwitz*, *Tauentzien* → *Tauentzien von Wittenberg* (namesakes); *Hartmann* (wrong date, ambiguous), *Schulenburg*, *Dörnberg* (Hessian), *Pirch* (two generals), *Katzler* (spelling), *Rauch* and *Horn* (read as words) dropped; *Karl von Bülow* (d. 1921) and *Max von Hausen* (d. 1922) added. Most dates from standard references.
- Aviators (pass 5): confirmed; *Georg Baumgarten* (year uncertain) and *David Schwarz* (Hungarian-born) dropped. *Viktor Schütze* died aboard L 48 as leader of airships, *Ludwig Bockholt* with L 59.
- U-boat commanders (pass 6, uboat.net): confirmed; *Thorwald von Bothmer* dropped (d. 1947); *Kurt Beitzen* → *Curt Beitzen*; eleven commanders killed in 1916-18 added. *Claus Hansen* is spelled *Klaus* on uboat.net; kept as the German form.
- Revolutionaries and democrats (pass 7): confirmed; *Kurt Eisner* (USPD), *Julian Marchlewski* (Polish) and *Friedrich Ludwig Jahn* (nationalist) dropped for fit. *Joß Fritz* is last attested about 1525.
- Teutonic Order, knights, tribal leaders, explorers (pass 8, *Liste der Hochmeister des Deutschen Ordens*): *Hermann Balk* → *Hermann von Balk*, *Albrecht von Brandenburg* → *Albrecht von Brandenburg-Ansbach*, *Sebastian Schertlin* → *Schertlin von Burtenbach*; *Wichmann*, *Hengist*, *Horsa* dropped. *Ludwig Leichhardt* vanished in 1848. *Krusenstern*, *Bellingshausen*, *Kotzebue* and *Wrangel* were Baltic Germans in Russian service.

**Persons kept without a lookup (canonical figures):** the emperors, kings and princes of Emperors & Kings and of the Imperial battle line; *Bismarck*, *Tirpitz*, *Scharnhorst*, *Gneisenau*, *Blücher*, *Seydlitz*, *Lützow*, *Prinz Eugen*, *Hipper* (d. 1932), *Scheer* (d. 1928), *Graf Spee* (d. 1914), *Moltke*, *Roon*, *Yorck*, *Goeben*, *Derfflinger*, *Von der Tann*, *Hindenburg* (d. 1934), *Clausewitz*, *Schlieffen*; *Graf Zeppelin*, *Peter Strasser* (d. 1918), *Richthofen*, *Boelcke*, *Immelmann*, *Otto Lilienthal*; the scientists, inventors, poets, thinkers, painters and composers (the latest: *Carl von Linde* 1934, *Stefan George* 1933, *Max Reger* 1916, *Humperdinck* 1921); *Marx*, *Engels*, *Luxemburg*, *Liebknecht*, *Ebert*, *Rathenau*, *Stresemann*; *Ulrich von Hutten*, *Götz von Berlichingen*, *Franz von Sickingen*, *Georg von Frundsberg*; the shipowners *Ballin*, *Woermann*, *Laeisz*, *Meier*, *Godeffroy*, *Schichau*, *Blohm*, *Voss*, *Howaldt*.

**Living in 1936:** none in the new lists except the ship names above (*Erwin Waßner*, *Ernst Thälmann* and the Volksmarine's resistance names). Ship names of persons alive in 1936, all in the Imperial set or the monarchist pools: *Kaiser Wilhelm II.* (Linienschiff of 1897; d. 1941), *Victoria Louise* (cruiser of 1897), *Mackensen* (Großer Kreuzer of 1917; d. 1945), *Prinz Eitel Friedrich* (Großer Kreuzer and liner; d. 1942, also in Merchant Raiders), and the liners *Kronprinz Wilhelm* (also in Merchant Raiders), *Kronprinzessin Cecilie*, *Prinz Oskar*, *Prinz Sigismund*, *Prinz Waldemar*.

**Formula extensions** (sections headed "Expansion"): CL cities; CA commanders; BB states, provinces and founders of the old Reich (the "Hutten and Berlichingen" remark is informal, the H class had no official names); BC field marshals and historic flagships; CV airmen; PZ admirals; Auxiliary Carriers rivers and bays; Virtues beyond the fourteen ship names; Republic & Liberty (German practice has no such ship names; an extrapolation).

**Standing of names in circulation:** *Friedrich der Große* for the H class is rumour; *Ulrich von Hutten* and *Götz von Berlichingen* rest on a reported remark of Hitler's; *Peter Strasser* for Flugzeugträger B was never official; *Großdeutschland* is rumour and sits only in the fascism pool.

**Homonyms and sensitive names:** dropped or changed: *Jap* (the island Yap; a slur in English), *Dachau*, *Kap Arkona*, *Zyklon*, *Hof*, *Burg*, *Lage*, *Wetter*, *Langen*, *Marl* (towns that read as words), *Rauch*, *Horn*, *Star*, and after the review *Swine* (the river), *Butt*, *National* (the research steamer), *Leer*, *Elm*; *Rosenberg* became *Festung Rosenberg*, *Mönchengladbach* the 1936 form *München-Gladbach*, and the trials boat *Otto Braun* left (namesake not identified; reads as the Prussian premier). Kept as German words on precedent or as vanilla names: *Aal*, *Hai*, *Wal*, *Alk*, *Inn*, *Main*, *Saar*, *Jade*, *Max*, *Moritz* (torpedo transports), *Hay* (gunboat), *Ran*, *Hel*, *Thor*, *Mars*. Colonial names (*Carl Peters*, *Kamerun*, *Deutsch-Südwestafrika*) are real ship and station names and sit in Tenders and Colonies. The fascism pool holds four names of the regime's dead that vessels carried; the Reichsgaue are vanilla's.

**Fonts:** German umlauts, ß and é only; all in Latin-1, which vanilla's German file already uses.

## Review Focus

- The gating design (ungated main set, Imperial set under two governments) and its display names.
- The numbered lists against the history files of both start dates.
- The two-set decoupling (Collision Resolutions) and the Imperial hull rosters.
- Persons confirmed from standard references only (passes 3, 4A, 5C, 7).
- The fascism and Volksmarine pools.

## Review (2026-11-18)

Fresh `isne-code-reviewer`: not ready, 2 Critical, 4 Important, 11 Minor.
- **C1** (the 1939 start's torpedo boats would show `T-201` to `T-211`): fixed; the twelve names are back on vanilla's entries 201 to 212, after `T1` to `T200`.
- **C2** (new U-boats could repeat the 1936 start's U-1 to U-17): fixed by beginning the entries at 18. The engine question behind it (does a fixed starting name block an entry?) stays open; the layout no longer depends on it.
- **I1** (wrong claim about the starting fleet; the 1939 destroyers lost their names): fixed; entries 1 to 22 carry the namesakes again, and plan, wiki and Workshop text are corrected.
- **I2** (the guide stated an engine fact the register does not hold): fixed; guide section 2 and the authoring skill now give the two rules from the history files and cite [NAM-021] [NAM-022] only for the file order.
- **I3** (*Großherzog Ernst Ludwig*, d. 1937; *Herzog Albrecht* ambiguous): both dropped.
- **I4** (*Swine*, *Butt*, *National*): dropped, with *Leer* and *Elm*.
- **Minor, fixed:** M1 (vanilla's `U-%d` entries were valid), M2 in part (*Hermann von Wissmann* left Explorers, *Ludwig Uhland*, *Hoffmann von Fallersleben* and *Rudolf Virchow* left 1848 & Weimar, the Imperial carriers use the short forms, *Barbarossa* left the Imperial battlecruisers), M3 (the sentence on shared names), M4 (*Plötze*, *Köhler*, *Salm*, *Felchen*, *Polyp*, *Fischreiher* dropped as second names of one species), M5 (*Lindwurm* and *Hydra* left Insects & Reptiles, *Kolkrabe* moved, the Grand Master heading names the Landmeister), M6 (*Kurmark* and *Saarpfalz* left the fascism pool as older names of *Mark Brandenburg* and *Westmark*; *Franken* and *Schwaben* joined), M7 (living persons listed), M8, M11.
- **Minor, kept with reason:** M2 for the rest (a role pool keeps the ship's form of a name, the thematic pool the person's full name; the two sets keep the historical ship names *Stein* and *Fürst Bismarck*); M5 *Drache* and *Basilisk* (gunboat names of the classes that head the pool); M9 (see Open for the Author); M10 (the Imperial copies of the numbered role pools follow the mirror decision; the fallback letter after S 223 is arbitrary).
- **Not re-reviewed:** the fixes were checked with `-Audit`, `-ValidateOnly` and `-Test` only. The 1939 start (Type 24 boats and destroyers keep their names) and the 1936 start (first new submarine is *U-18*, first new torpedo boat *T1*) still need a look in game.

## Validation (2026-11-18, after review fixes)

- `-ValidateOnly`: Validation succeeded (24 files).
- `-VerifyShipTypes ALL`: ship_types OK: 24 files, 644 groups.
- `-Audit GER`: FAIL=0 WARN=0 INFO=7. `-Audit ENG`, `-Audit USA`: FAIL=0 WARN=0.
- `-SyncWiki GER`: 0 rows updated.
- `-Test`: 436 passed, 0 failed, 1 skipped.

## Open for the Author

- **Gating:** the main set has no gate, and the Imperial set and the monarchist pools are open under non-aligned and democratic governments, so a democratic republic sees the `SMS ` lists and the monarchist pools beside Republic & Liberty and 1848 & Weimar.
- **In-game check pending:** the 1939 and 1936 starts, as listed under Review.
- **Other mods:** Jackhall's *German Ship Names*, Vanilla Navy Rework, Road to 56, Kaiserreich and The New Order ship a German ship namelist under the same file name, so load order decides which file names Germany's ships [LOAD-014]. The Manager's *VNR - Ship Names Merge* still carries `GER`.
