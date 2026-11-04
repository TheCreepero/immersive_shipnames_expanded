# Steam Workshop Description Guidelines & Reference

Instructions and reference for maintaining the Steam Workshop description of **Immersive Ship Names Expanded**. Agents: these rules are also summarized in `docs/isne-agent-guide.md` section 4.

---

## Core Rules

1. **No emojis** anywhere.
2. **Length**: Steam caps descriptions at 8,000 characters of raw BBCode (a longer one fails the upload with "Invalid Parameter"); stay under ~7,500 and check the total when adding nations. Name a nation's thematic lists, but give its ideological and role lists as counts.
   - Concise bullets, no long narrative blocks.
   - **Never list individual ship names**: dozens of names per class would hit the limit as nations are added.
   - No author update quote blocks (`[quote=author]...[/quote]`).
3. **Tone**: concise, informative, direct and enthusiastic, matching the author's voice; plain bullets and structured headings; no embellishment or marketing buzzwords.
4. **Preserve author sections**: never rewrite or regenerate the header pitch, companion mod link or Jackhall tribute. The Info section holds standard mod notes and one notice on the vanilla bug, typo, duplicate and fallback-translation fixes. For a newly implemented nation, update **only** the `[h1]Included nations:[/h1]` block and the Repository Cross-Reference table (plus the nation list in the header pitch, per `docs/isne-agent-guide.md` section 4).
5. **Jackhall scope**: ISNE extends @Jackhall's ship namelist mod series; never author or propose namelists for nations it covers: Netherlands (`HOL`), China (`CHI`), Spain (`SPR`), Poland (`POL`), Soviet Union (`SOV`), Greece (`GRE`), Germany (`GER`).
6. **No `[h1]Planned:[/h1]` section.**
7. **Language**: fix typos, misspellings, formatting anomalies and broken English; use proper diacritics in historical ship names (*Väinämöinen*, *Hämeenmaa*, *L'Audacieux*).
8. **Steam BBCode only**: `[h1]Heading[/h1]`, `[b]...[/b]`, `[i]...[/i]` (foreign phrases, short highlights), `[url=https://...]text[/url]`, hyphen bullets (`- Item`); clean line breaks between sections and blocks.

---

## Structure of the Description

1. **Header pitch & companion mod**: the author's own intro (AI-accelerated creation, focus on nations with limited vanilla namelists) and a link to *Immersive Namelists Expanded*.
2. **`[h1]Info:[/h1]`**: Road to 56, Ironman and achievements, and that new name groups show only in a new game (the standard lines of the Modding Manager); namelist override clarification; Man the Guns and non-DLC hull types; one notice on vanilla bug, typo, duplicate and fallback-translation fixes; open permissions ("Feel free to use this mod however you wish.").
3. **Jackhall tribute & scope**: attribution and link to @Jackhall's series; note on the excluded countries.
4. **`[h1]Included nations:[/h1]`**: an intro line saying that every nation has expanded ship-type lists for all hull classes, then one bold `[b]Nation[/b]` entry each, with 1 or 2 bullets:
   - ship-type lists, only where a nation differs from the intro line: the hull codes (DD, SS, CL, CA, BB, BC, CV) when only some were expanded, or what is deeper than elsewhere;
   - universal thematic pools added for the Ship Designer (e.g. Cities, Monarchs, Rivers, Heroes, Fauna).

   Bug and typo fixes stay in Info rather than repeating per nation. Never add exhaustive or repetitive unit name lists (`[i]...[/i]`).

---

## Repository Cross-Reference (`common/units/names_ships/`)

| File | Nation | Tag | Status in Description |
| :--- | :--- | :--- | :--- |
| `ARG_ship_names.txt` | Argentina | `ARG` | Included (DD, SS, CL, CA, BB, BC, CV, 6 Thematic Topics) |
| `AUS_ship_names.txt` | Austria | `AUS` | Included (DD, SS, CL, CA, BB, BC, CV, 11 Thematic Topics) |
| `BRA_ship_names.txt` | Brazil | `BRA` | Included (DD, SS, CL, CA, BB, BC, CV, 7 Thematic Topics) |
| `CAN_ship_names.txt` | Canada | `CAN` | Included (DD, SS, CL, CA, BB, BC, CV, 20 Thematic Topics, 4 Role Pools) |
| `CHL_ship_names.txt` | Chile | `CHL` | Included (DD, SS, CL, CA, BB, BC, CV, 7 Thematic Topics) |
| `CUB_ship_names.txt` | Cuba | `CUB` | Included (DD, SS, CL, CA, BB, BC, CV, 7 Thematic Topics) |
| `DEN_ship_names.txt` | Denmark | `DEN` | Included (DD, SS, CL, CA, BB, BC, CV, 8 Thematic Topics) |
| `ENG_ship_names.txt` | United Kingdom | `ENG` | Included (DD, SS, CL, CA, BB, BC, CV, 30 Thematic Topics, 11 Role Pools, 43 communist WLNS lists mirroring the HMS lists) |
| `FIN_ship_names.txt` | Finland | `FIN` | Included (DD, SS, CL, CA, BB, BC, CV, 13 Thematic Topics) |
| `FRA_ship_names.txt` | France | `FRA` | Included (DD, SS, CL, CA, BB, BC, CV, 17 Thematic Topics, 4 Role Pools) |
| `ITA_ship_names.txt` | Italy | `ITA` | Included (DD, SS, CL, CA, BB, BC, CV, 17 Thematic Topics, 6 Role Pools) |
| `MEX_ship_names.txt` | Mexico | `MEX` | Included (DD, SS, CL, CA, BB, BC, CV, 13 Thematic Topics) |
| `NOR_ship_names.txt` | Norway | `NOR` | Included (DD, SS, CL, CA, BB, BC, CV, 11 Thematic Topics, 1 Role Pool) |
| `PER_ship_names.txt` | Iran | `PER` | Included (DD, SS, CL, CA, BB, BC, CV, 7 Thematic Topics) |
| `PHI_ship_names.txt` | Philippines | `PHI` | Included (DD, SS, CL, CA, BB, BC, CV, 11 Thematic Topics) |
| `POR_ship_names.txt` | Portugal | `POR` | Included (DD, SS, CL, CA, BB, BC, CV, 7 Thematic Topics) |
| `PRU_ship_names.txt` | Peru | `PRU` | Included (DD, SS, CL, CA, BB, BC, CV, 14 Thematic Topics, 1 Role Pool) |
| `ROM_ship_names.txt` | Romania | `ROM` | Included (DD, SS, CL, CA, BB, BC, CV, 15 Thematic Topics, 2 Role Pools) |
| `SWE_ship_names.txt` | Sweden | `SWE` | Included (DD, SS, CL, CA, BB, BC, CV, 10 Thematic Topics, 1 Role Pool) |
| `TUR_ship_names.txt` | Turkey | `TUR` | Included (DD, SS, CL, CA, BB, BC, CV, 11 Thematic Topics) |
| `USA_ship_names.txt` | United States | `USA` | Included (DD, SS, CL, CA, BB, BC, CV, 15 Thematic Topics, 12 Role Pools, 7 Confederate hull lists) |
| `YUG_ship_names.txt` | Yugoslavia | `YUG` | Included (DD, SS, CL, CA, BB, BC, CV, 9 Thematic Topics) |

---

## Current Description Template (BBCode)

```bbcode
<!-- region:image:hero -->
[img]https://i.imgur.com/cumSmZG.png[/img]
<!-- /region -->
More ship namelists! For now I've got Finland, Austria, Brazil, Argentina, Chile, Denmark, Sweden, Norway, Cuba, Turkey, Yugoslavia, Mexico, the Philippines, Iran, Portugal, Italy, Peru, Romania, Canada, the United States, France, and the United Kingdom. Used AI to speed up the creation process and help with translations. In the future I intend to prioritize nations that have at least some potential to have a large navy in game (Tannu Tuva probably won't get a namelist update in a while, sorry :/), but don't have a large enough namelist pool to accommodate that.

Coming soon: [b]Immersive Air Wing Names Expanded[/b]

<!-- region:image:strip-info -->
[img]https://i.imgur.com/xQiM4do.png[/img]
<!-- /region -->
[h1]Info:[/h1]
<!-- region:info:rt56,ironman-namelist-no,new-groups-namelist,overrides-namelist,game-version,use-freely -->
- Compatible with Road to 56 (RT56) and vanilla.
- Not Ironman/Achievement compatible.
- New name groups show only in a new game.
- No hard incompatibilities. Namelists from other mods might override namelists from this mod in some cases.
- Built for game version 1.19.
- Feel free to use this mod however you wish.
<!-- /region -->
- Hull lists carry both the Man the Guns (MtG) Ship Designer hull types and the non-DLC ship types.
- Fixes vanilla bugs, typos, duplicates, and broken fallback translations.

This mod is intended to expand the great series of [url=https://steamcommunity.com/workshop/filedetails/?id=2185806824]ship namelist mods[/url] by @Jackhall. This means that for now I am avoiding editing countries that have already been touched up by their mod series (Netherlands, China, Spain, Poland, Soviet Union, Greece, and Germany).

<!-- region:image:strip-included-nations -->
[img]https://i.imgur.com/zln3pgW.png[/img]
<!-- /region -->
[h1]Included nations:[/h1]
Every nation below has expanded ship-type lists for all hull classes.

[b]Argentina[/b]
- Added 6 universal thematic lists: Cities, Provinces, Heroes, Historic Battles, Rivers, and Fauna.

[b]Austria[/b]
- Added 11 universal thematic lists: Monarchs, Cities, Crown Lands, Rivers & Lakes, Peaks, Battles, Heroes, Folklore, Birds, Wildlife, and Virtues.

[b]Brazil[/b]
- Added 7 universal thematic lists: Cities, States & Territories, Rivers, Heroes & Admirals, Native Peoples & Chiefs, Battles, and Fauna.

[b]Canada[/b]
- Added 20 universal thematic lists: Cities, Provinces & Regions, Rivers & Lakes, Capes, Isles & Straits, Mountains, Indigenous Peoples, Birds, Aquatic Life, Wildlife, Monarchs & Governors, Explorers, Heroes, Battles, Myth & Folklore, Virtues & Elements, Loyalists & Empire, and 4 ideological lists, plus 4 role lists.

[b]Chile[/b]
- Added 7 universal thematic lists: Cities, Provinces, Heroes, Mapuche Heroes, Battles, Waterways, and Fauna.

[b]Cuba[/b]
- Added 7 universal thematic lists: Cities, Provinces & Regions, Heroes, Battles & Dates, Mythology, Fauna, and Rivers & Waterways.

[b]Denmark[/b]
- Added 8 universal thematic lists: Cities, Regions & Islands, Monarchs, Heroes, Norse Mythology, Birds, Aquatic Life, and Waters.

[b]Finland[/b]
- Added 13 universal thematic lists: Rulers, Cities, Provinces, Rivers & Lakes, Landmarks, Battles, Heroes, Kalevala Mythology, Birds, Aquatic Life, Predators, Virtues, and Nature.

[b]France[/b]
- Far deeper destroyer, light cruiser and submarine lists.
- Added 11 universal thematic lists to vanilla's six: Birds, Aquatic Life, Mythology, Rivers & Lakes, Battles, Heroes & Explorers, Wind, Sky & Sea, and 4 ideological lists, plus 4 role lists.

[b]Iran[/b]
- Added 7 universal thematic lists: Mythology, Rulers, Provinces, Rivers & Lakes, Birds, Virtues, and Beasts & Predators.

[b]Italy[/b]
- Added 17 universal thematic lists: Regions, Cities, Colonies, Mythology, Birds, Aquatic Life, Rivers & Lakes, Geography, Rulers, Heroes & Genius, Battles, Virtues, Weather & Skies, and 4 ideological lists, plus 6 role lists.

[b]Mexico[/b]
- Added 13 universal thematic lists: Naval Heroes, Saints, Ports, Bodies of Water, Monarchs & Rulers, Republican Ideals, Socialist Ideals, Nationalist Ideals, Mythology, Birds, States, Cities, and Rivers.

[b]Norway[/b]
- Added 11 universal thematic lists: Cities, Provinces, Fjords, Monarchs, Heroes, Norse Mythology, Birds, Wildlife, Fish, Natural Phenomena, and Virtues, plus a Minesweepers role list.

[b]Peru[/b]
- Added 14 universal thematic lists: Cities & Ports, Departments & Regions, Rivers & Lakes, Mountains, Incas & Rulers, Mythology, Battles, Heroes & Scholars, Birds, Aquatic Life, Virtues, and 3 ideological lists, plus a River Gunboats role list.

[b]Philippines[/b]
- Added 11 universal thematic lists: Birds & Raptors, Marine Life & Fish, Peaks & Volcanoes, Rivers, Datus & Rajahs, Patriots & Heroes, Mythology, Martial Virtues, and 3 ideological lists.

[b]Portugal[/b]
- Added 7 universal thematic lists: Birds, Aquatic Life, Legends, Heroes, Virtues, Monarchs, and Estado Novo.

[b]Romania[/b]
- Added 15 universal thematic lists: Cities & Ports, Provinces & Counties, Rivers & Lakes, Mountains, Rulers, Heroes & Scholars, Battles, Myth & Folklore, Birds, Fish, Virtues & Elements, and 4 ideological lists, plus 2 role lists.

[b]Sweden[/b]
- Added 10 universal thematic lists: Monarchs, Provinces, Cities, Norse Mythology, Birds, Predators, Aquatic Life, Heroes & Commanders, Virtues, and Battles, plus a Minesweepers role list.

[b]Turkey[/b]
- Added 11 universal thematic lists: Sultans & Khans, Admirals, Cities & Ports, Provinces, Rivers, Mountains & Hills, Battles, Birds, Aquatic Life, Predators, and Virtues.

[b]United Kingdom[/b]
- The Royal Navy's lineages traced back to the ships of the line.
- Added 23 universal thematic lists to vanilla's seven: Admirals, Explorers & Navigators, Generals, Poets & Writers, Saints, Ancient Britain, Shakespeare, Valour & Virtues, Wind, Sky & Sea, Birds, Aquatic Life, Wild Beasts, Flowers, Trees, Gems, Castles, Isles, Lochs & Lakes, Hills & Mountains, Dances, and 3 ideological lists, plus 11 role lists. A communist Britain gets a mirrored workers' navy set without royal names.

[b]United States[/b]
- Vanilla's Confederate lists are kept, with deeper cruiser, carrier and capital-ship lists.
- Added 9 universal thematic lists to vanilla's six: Native Nations, Rivers, Peaks, Parks & Regions, Celestial Bodies, Mythology, Virtues, Age of Sail, and 2 ideological lists, plus 12 role lists.

[b]Yugoslavia[/b]
- Added 9 universal thematic lists: Cities, Banovinas, Rivers, Mythology, Rulers, Heroes, Birds, Mountains, and Virtues.

<!-- region:buttons:wiki,github -->
[url=https://github.com/TheCreepero/immersive_shipnames_expanded/wiki][img]https://i.imgur.com/PjdoeCx.png[/img][/url] [url=https://github.com/TheCreepero/immersive_shipnames_expanded][img]https://i.imgur.com/bdkHWVb.png[/img][/url]
<!-- /region -->

<!-- cross-links:begin -->
[url=https://steamcommunity.com/sharedfiles/filedetails/?id=3833590274][img]https://i.imgur.com/qJpjDyO.png[/img][/url]
[b]More from the author[/b], all in the collection [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3833590274]The Immersive Series[/url]
[list]
[*][url=https://steamcommunity.com/sharedfiles/filedetails/?id=2967389401]Immersive Namelists Expanded[/url]
[*][url=https://steamcommunity.com/sharedfiles/filedetails/?id=3807415216]Immersive Ship Names Expanded[/url]
[*][url=https://steamcommunity.com/sharedfiles/filedetails/?id=3830946508]Event Pack: Finland[/url]
[*][url=https://steamcommunity.com/sharedfiles/filedetails/?id=3832953557]Event Pack: France[/url]
[*][url=https://steamcommunity.com/sharedfiles/filedetails/?id=3831847770]Commanders Pack: Finland[/url]
[*][url=https://steamcommunity.com/sharedfiles/filedetails/?id=3832957297]Commanders Pack: France[/url]
[/list]
<!-- cross-links:end -->
```
