# Steam Workshop Description Guidelines & Reference

This document serves as an instruction and reference guide for maintaining and updating the Steam Workshop description for **Immersive Ship Names Expanded**.

---

## Core Rules & Constraints

1. **No Emojis**: Strictly avoid adding any emojis or emoticons to the description.
2. **Character & Length Limits**:
   - Steam Workshop descriptions have a strict character limit (~17,000 characters raw BBCode).
   - Keep bullet points concise and avoid lengthy narrative blocks.
   - **Do NOT list individual ship names in the description.** Listing dozens of individual ship names for every class consumes characters rapidly and will cause the description to hit the limit as more nations are added.
   - Do NOT include author update quote blocks (`[quote=author]...[/quote]`).
   - Monitor the overall character count of the BBCode text when adding new nations.
3. **Writing Style & Tone**:
   - Keep the tone concise, informative, direct, and enthusiastic, matching the author's original voice.
   - Use straightforward bullet points and structured section headings.
   - Do not over-embellish or use marketing buzzwords.
4. **Preserve Custom Author Sections**:
   - Do NOT overwrite, rewrite, or regenerate the header pitch, companion mod link, or Jackhall series tribute section.
   - The Info section contains standard mod notes and a general notice regarding vanilla bug fixes across all nations.
   - When updating the workshop description for newly implemented nations, **only** update the `[h1]Included nations:[/h1]` block and the Repository Cross-Reference table.
   - Keep each nation's entry in `[h1]Included nations:[/h1]` concise (strictly 2 brief summary bullet points: expanded ship-type lists and added universal thematic pools). Vanilla bug fixes are covered globally in Info to save character space.
5. **Jackhall Series Scope & Exclusions**:
   - ISNE is intended to expand the great series of ship namelist mods by @Jackhall.
   - **Do NOT author or propose namelists for countries already covered by Jackhall**: Netherlands (`HOL`), China (`CHI`), Spain (`SPR`), Poland (`POL`), Soviet Union (`SOV`), Greece (`GRE`), and Germany (`GER`).
6. **No Planned Section**:
   - Do NOT add a `[h1]Planned:[/h1]` section to the workshop description.
7. **Language & Grammar**:
   - Fix typos, misspellings, formatting anomalies, or broken English.
   - Use proper diacritics/accents for historical ship names (e.g., *Väinämöinen*, *Hämeenmaa*, *L'Audacieux*).
8. **Steam Formatting (BBCode)**:
   - Always format the description using Steam's supported BBCode tags:
     - Section headings: `[h1]Heading Text[/h1]`
     - Bold text: `[b]...[/b]`
     - Italics: `[i]...[/i]` (used for foreign language phrases or short highlights)
     - URLs: `[url=https://...]link text[/url]`
     - Lists: Standard hyphen bullets (`- Item`).
   - Ensure clean line breaks between sections and blocks.

---

## Structure of the Description

1. **Header Pitch & Companion Mod**:
   - Concise authentic author intro noting AI acceleration, focus on nations with limited vanilla namelists, and a link to *Immersive Namelists Expanded*.
2. **[h1]Info:[/h1]**:
   - Save game compatibility bullet point.
   - Mod compatibility and namelist override clarification.
   - Mount / DLC compatibility note.
   - General notice covering vanilla bug fixes, typos, duplicates, missing classes, and broken fallback translations across all included nations.
   - Open permissions note ("Feel free to use this mod however you wish.").
3. **Jackhall Tribute & Project Scope**:
   - Attribution and link to @Jackhall's ship namelist mod series.
   - Note on excluded countries already covered by Jackhall's mods.
4. **[h1]Included nations:[/h1]**:
   - Grouped by nation in bold (`[b]Nation[/b]`).
   - Concise 2-bullet format summarizing what was added or overhauled for that nation:
     - **Ship-type specific lists**: What hull categories were added or expanded (DD, SS, CL, CA, BB, BC, CV).
     - **Universal thematic pools**: Summary of thematic topic pools added for the Ship Designer (e.g. Cities, Monarchs, Rivers, Heroes, Fauna).
   - Bug fixes and typo corrections are handled globally in the Info section rather than repeated per nation to prevent exceeding Steam character limits.
   - Strictly omit exhaustive or repetitive unit name lists (`[i]...[/i]`).

---

## Repository Cross-Reference (`common/units/names_ships/`)

| File | Nation | Tag | Status in Description |
| :--- | :--- | :--- | :--- |
| `ARG_ship_names.txt` | Argentina | `ARG` | Included (DD, SS, CL, CA, BB, BC, CV, 6 Thematic Topics) |
| `AUS_ship_names.txt` | Austria | `AUS` | Included (DD, SS, CL, CA, BB, CV, 11 Thematic Topics) |
| `BRA_ship_names.txt` | Brazil | `BRA` | Included (DD, SS, CL, CA, BB, BC, CV, 7 Thematic Topics) |
| `CHL_ship_names.txt` | Chile | `CHL` | Included (DD, SS, CL, CA, BB, BC, CV, 7 Thematic Topics) |
| `CUB_ship_names.txt` | Cuba | `CUB` | Included (DD, SS, CL, CA, BB, CV, 7 Thematic Topics) |
| `DEN_ship_names.txt` | Denmark | `DEN` | Included (DD, SS, CL, CA, BB, BC, CV, 8 Thematic Topics) |
| `FIN_ship_names.txt` | Finland | `FIN` | Included (DD, SS, CL, CA, BB, BC, CV, 13 Thematic Topics) |
| `MEX_ship_names.txt` | Mexico | `MEX` | Included (DD, SS, CL, CA, BB, BC, CV, 13 Thematic Topics) |
| `NOR_ship_names.txt` | Norway | `NOR` | Included (DD, SS, CL, CA, BB, BC, CV, 11 Thematic Topics) |
| `PER_ship_names.txt` | Iran | `PER` | Included (DD, SS, CL, CA, BB, BC, CV, 7 Thematic Topics) |
| `PHI_ship_names.txt` | Philippines | `PHI` | Included (DD, SS, CL, CA, BB, BC, CV, 11 Thematic Topics) |
| `POR_ship_names.txt` | Portugal | `POR` | Included (DD, SS, CL, CA, BB, BC, CV, 7 Thematic Topics) |
| `SWE_ship_names.txt` | Sweden | `SWE` | Included (DD, SS, CL, CA, BB, BC, CV, 10 Thematic Topics) |
| `TUR_ship_names.txt` | Turkey | `TUR` | Included (DD, SS, CL, CA, BB, BC, CV, 11 Thematic Topics) |
| `YUG_ship_names.txt` | Yugoslavia | `YUG` | Included (DD, SS, CL, CA, BB, CV, 9 Thematic Topics) |

---

## Current Description Template (BBCode)

```bbcode
More namelists! Used AI to speed up the creation process and help with translations. For now I've got Finland, Austria, Brazil, Argentina, Chile, Denmark, Sweden, Norway, Cuba, Turkey, Yugoslavia, Mexico, the Philippines, Iran, and Portugal. In the future I intend to prioritize nations that have at least some potential to have a large navy in game (Tannu Tuva probably won't get a namelist update in a while, sorry :/), but don't have a large enough namelist pool to accommodate that.

Check out my other mods:
- [url=https://steamcommunity.com/workshop/filedetails/?id=2967389401]Immersive Namelists Expanded[/url]
- [b]Immersive Air Wing Names Expanded[/b] (Coming soon!)

[h1]Info:[/h1]
- [b]Save Game Compatible:[/b] Can be added or removed from ongoing games without issues.
- [b]Compatible with Road to 56 (RT56) and vanilla.[/b]
- Fully compatible with the Man the Guns (MtG) Ship Designer as well as non-DLC naval systems.
- Fixes vanilla bugs, typos, duplicates, missing classes, and broken fallback translations across all included nations.
- No hard incompatibilities. Namelists from other mods might override namelists from this mod in some cases but that's unlikely.
- Feel free to use this mod however you wish.

This mod is intended to expand the great series of [url=https://steamcommunity.com/workshop/filedetails/?id=2185806824]ship namelist mods[/url] by @Jackhall. This means that for now I am avoiding editing countries that have already been touched up by their mod series (Netherlands, China, Spain, Poland, Soviet Union, Greece, and Germany).

[h1]Included nations:[/h1]
[b]Argentina[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 6 universal thematic lists: Cities, Provinces, Heroes, Historic Battles, Rivers, and Fauna.

[b]Austria[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, CV).
- Added 11 universal thematic lists: Monarchs, Cities, Crown Lands, Rivers & Lakes, Peaks, Battles, Heroes, Folklore, Birds, Wildlife, and Virtues.

[b]Brazil[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 7 universal thematic lists: Cities, States, Rivers, Heroes & Admirals, Indigenous Tribes, Battles, and Fauna.

[b]Chile[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 7 universal thematic lists: Cities, Provinces, Heroes, Mapuche Warriors, Battles, Waterways, and Fauna.

[b]Cuba[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, CV).
- Added 7 universal thematic lists: Cities, Provinces, Heroes, Battles & Dates, Mythology, Fauna, and Rivers.

[b]Denmark[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 8 universal thematic lists: Cities, Regions & Islands, Monarchs, Heroes, Norse Mythology, Birds, Aquatic Life, and Waters.

[b]Finland[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 13 universal thematic lists: Rulers, Cities, Provinces, Rivers & Lakes, Landmarks, Battles, Heroes, Kalevala Mythology, Birds, Aquatic Life, Predators, Virtues, and Nature.

[b]Iran[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 7 universal thematic lists: Mythology, Rulers, Provinces, Rivers & Lakes, Birds, Virtues, and Beasts & Predators.

[b]Mexico[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 13 universal thematic lists: Admirals, Saints, Ports, Bodies of Water, Monarchs & Rulers, Republican Ideals, Socialist Ideals, Nationalist Ideals, Mythology, Birds, States, Cities, and Rivers.

[b]Norway[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 11 universal thematic lists: Cities, Provinces, Fjords, Monarchs, Heroes, Norse Mythology, Birds of Prey, Predators, Aquatic Life, Nature, and Virtues.

[b]Philippines[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 11 universal thematic lists: Birds & Raptors, Marine Life & Fish, Peaks & Volcanoes, Rivers, Datus & Rajahs, Patriots & Heroes, Mythology, Martial Virtues, and separate Republican, Socialist, and Nationalist ideological pools.

[b]Portugal[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 7 universal thematic lists: Birds, Aquatic Life, Legends, Heroes, Virtues, Monarchs, and Estado Novo.

[b]Sweden[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 10 universal thematic lists: Monarchs, Provinces, Cities, Norse Mythology, Birds of Prey, Predators, Aquatic Life, Naval Heroes, Virtues, and Battles.

[b]Turkey[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 11 universal thematic lists: Sultans & Khans, Admirals, Cities & Ports, Provinces, Rivers, Peaks, Battles, Birds of Prey, Aquatic Life, Predators, and Virtues.

[b]Yugoslavia[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 9 universal thematic lists: Cities, Banovinas, Rivers, Mythology, Rulers, Heroes, Birds, Mountains, and Virtues.

If you enjoy the mod, please give it a thumbs up and favorite!
```
