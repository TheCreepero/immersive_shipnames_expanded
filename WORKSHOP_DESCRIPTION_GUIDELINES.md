# Steam Workshop Description Guidelines & Reference

This document serves as an instruction and reference guide for maintaining and updating the Steam Workshop description for **Immersive Ship Names Expanded**.

---

## Core Rules & Constraints

1. **No Emojis**: Strictly avoid adding any emojis or emoticons to the description.
2. **Character & Length Limits**:
   - Steam Workshop descriptions have a strict character limit (~17,000 characters raw BBCode).
   - Keep bullet points concise and avoid lengthy narrative blocks.
   - **Do NOT list individual ship names in the description.** Listing dozens of individual ship names for every class consumes characters rapidly and will cause the description to hit the limit as more nations are added. Instead, provide a brief, high-level summary of what was added or changed (new lists added, vanilla typos/bugs fixed, etc.).
   - Do NOT include author update quote blocks (`[quote=author]...[/quote]`).
   - Monitor the overall character count of the BBCode text when adding new nations.
3. **Writing Style & Tone**:
   - Keep the tone concise, informative, direct, and enthusiastic, matching the author's original voice.
   - Use straightforward bullet points and structured section headings.
   - Do not over-embellish or use marketing buzzwords.
4. **Preserve Custom Author Sections**:
   - Do NOT overwrite, rewrite, or regenerate the header pitch, companion mod link, Info section, or Jackhall series tribute section.
   - When updating the workshop description for newly implemented nations, **only** update the `[h1]Included nations:[/h1]` block and the Repository Cross-Reference table.
   - Keep each nation's entry in `[h1]Included nations:[/h1]` concise (typically 2–3 brief summary bullet points of added lists and fixes).
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
   - Open permissions note ("Feel free to use this mod however you wish.").
3. **Jackhall Tribute & Project Scope**:
   - Attribution and link to @Jackhall's ship namelist mod series.
   - Note on excluded countries already covered by Jackhall's mods.
4. **[h1]Included nations:[/h1]**:
   - Grouped by nation in bold (`[b]Nation[/b]`).
   - Concise bullet points summarizing what was added, overhauled, or fixed for that nation:
     - **Ship-type specific lists**: What hull categories were added or expanded (DD, SS, CL, CA, BB, BC, CV).
     - **Universal thematic pools**: Summary of thematic topic pools added for the Ship Designer (e.g. Cities, Monarchs, Rivers, Heroes, Fauna).
     - **Fixes & improvements**: Mention any vanilla bugs, typos, mislabeled headers, or duplicate list issues resolved.
   - Strictly omit exhaustive or repetitive unit name lists (`[i]...[/i]`).

---

## Repository Cross-Reference (`common/units/names_ships/`)

| File | Nation | Tag | Status in Description |
| :--- | :--- | :--- | :--- |
| `ARG_ship_names.txt` | Argentina | `ARG` | Included (DD, SS, CL, CA, BB, BC, CV, 6 Thematic Topics, Vanilla Fixes) |
| `AUS_ship_names.txt` | Austria | `AUS` | Included (DD, SS, CL, CA, BB, CV, 11 Thematic Topics) |
| `BRA_ship_names.txt` | Brazil | `BRA` | Included (DD, SS, CL, CA, BB, BC, CV, 7 Thematic Topics, Vanilla Fixes) |
| `CHL_ship_names.txt` | Chile | `CHL` | Included (DD, SS, CL, CA, BB, BC, CV, 7 Thematic Topics, Vanilla Fixes) |
| `CUB_ship_names.txt` | Cuba | `CUB` | Included (DD, SS, CL, CA, BB, CV, 7 Thematic Topics, Vanilla Fixes) |
| `DEN_ship_names.txt` | Denmark | `DEN` | Included (DD, SS, CL, CA, BB, BC, CV, 8 Thematic Topics, Vanilla Fixes) |
| `FIN_ship_names.txt` | Finland | `FIN` | Included (DD, SS, CL, CA, BB, BC, CV, 13 Thematic Topics, Vanilla Fixes) |
| `MEX_ship_names.txt` | Mexico | `MEX` | Included (DD, SS, CL, CA, BB, BC, CV, 13 Thematic Topics, Vanilla Fixes) |
| `NOR_ship_names.txt` | Norway | `NOR` | Included (DD, SS, CL, CA, BB, BC, CV, 11 Thematic Topics, Vanilla Fixes) |
| `PER_ship_names.txt` | Iran | `PER` | Included (DD, SS, CL, CA, BB, BC, CV, 7 Thematic Topics, Vanilla Fixes) |
| `PHI_ship_names.txt` | Philippines | `PHI` | Included (DD, SS, CL, CA, BB, BC, CV, 11 Thematic Topics, Vanilla Fixes) |
| `SWE_ship_names.txt` | Sweden | `SWE` | Included (DD, SS, CL, CA, BB, BC, CV, 10 Thematic Topics, Vanilla Fixes) |
| `TUR_ship_names.txt` | Turkey | `TUR` | Included (DD, SS, CL, CA, BB, BC, CV, 11 Thematic Topics, Vanilla Fixes) |
| `YUG_ship_names.txt` | Yugoslavia | `YUG` | Included (DD, SS, CL, CA, BB, CV, 9 Thematic Topics, Vanilla Fixes) |

---

## Current Description Template (BBCode)

```bbcode
More namelists! Used AI to speed up the creation process and help with translations. For now I've got Finland, Austria, Brazil, Argentina, Chile, Denmark, Sweden, Norway, Cuba, Turkey, Yugoslavia, Mexico, the Philippines, and Iran. In the future I intend to prioritize nations that have at least some potential to have a large navy in game (Tannu Tuva probably won't get a namelist update in a while, sorry :/), but don't have a large enough namelist pool to accommodate that.

Check out my other mods:
- [url=https://steamcommunity.com/workshop/filedetails/?id=2967389401]Immersive Namelists Expanded[/url]
- [b]Immersive Air Wing Names Expanded[/b] (Coming soon!)

[h1]Info:[/h1]
- [b]Save Game Compatible:[/b] Can be added or removed from ongoing games without issues.
- [b]Compatible with Road to 56 (RT56) and vanilla.[/b]
- Fully compatible with the Man the Guns (MtG) Ship Designer as well as non-DLC naval systems.
- No hard incompatibilities. Namelists from other mods might override namelists from this mod in some cases but that's unlikely.
- Feel free to use this mod however you wish.

This mod is intended to expand the great series of [url=https://steamcommunity.com/workshop/filedetails/?id=2185806824]ship namelist mods[/url] by @Jackhall. This means that for now I am avoiding editing countries that have already been touched up by their mod series (Netherlands, China, Spain, Poland, Soviet Union, Greece, and Germany).

[h1]Included nations:[/h1]
[b]Argentina[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 6 universal thematic lists: Cities, Provinces, Heroes, Historic Battles, Rivers, and Fauna.
- Resolved vanilla duplicates ("Rosales", "La Rioja"), separated modern corvettes from cruisers, and expanded capital ship rosters.

[b]Austria[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, CV).
- Added 11 universal thematic lists: Monarchs, Cities, Crown Lands, Rivers & Lakes, Peaks, Battles, Heroes, Folklore, Birds, Wildlife, and Virtues.
- Restored Austro-Hungarian K.u.K. Kriegsmarine traditions and interwar Danube flotilla conventions.

[b]Brazil[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 7 universal thematic lists: Cities, States, Rivers, Heroes & Admirals, Indigenous Tribes, Battles, and Fauna.
- Corrected mislabeled header, fixed typos ("Cuzador Couraçado", "Marnhão", "Amazona"), and replaced repetitive state lists with authentic naval traditions.

[b]Chile[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 7 universal thematic lists: Cities, Provinces, Heroes, Mapuche Warriors, Battles, Waterways, and Fauna.
- Removed pontoon hulks and peacetime shipwrecks from capital ships, eliminated duplicate entries, and restored proper diacritics.

[b]Cuba[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, CV).
- Added 7 universal thematic lists: Cities, Provinces, Heroes, Battles & Dates, Mythology, Fauna, and Rivers.
- Removed erroneous Colombian prefix ("ARC "), corrected typos ("Marinao"), eliminated cross-class duplicates, and introduced authentic Cuban naval traditions.

[b]Denmark[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 8 universal thematic lists: Cities, Regions & Islands, Monarchs, Heroes, Norse Mythology, Birds, Aquatic Life, and Waters.
- Repaired damaged character encodings, fixed pseudo-English fallbacks ("Lys Cruiseren"), purged patrol craft from cruisers, and expanded capital ship rosters.

[b]Finland[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 13 universal thematic lists: Monarchs, Cities, Provinces, Rivers & Lakes, Landmarks, Battles, Heroes, Kalevala Mythology, Birds, Aquatic Life, Predators, Virtues, and Nature.
- Removed duplicate carrier blocks and cruiser entries, restored dedicated battlecruiser list, and purged coastal defense ships from light cruisers.

[b]Iran[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 7 universal thematic lists: Mythology, Rulers, Provinces, Rivers & Lakes, Birds, Virtues, and Beasts & Predators.
- Resolved a severe vanilla bug where cruisers, capital ships, and carriers all shared the same handful of names, replaced literal English fallback translations with authentic Farsi naval terminology, and restored genuine Imperial Iranian Navy traditions.

[b]Mexico[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 13 universal thematic lists: Admirals, Saints, Ports, Bodies of Water, Monarchs & Rulers, Republican Ideals, Socialist Ideals, Nationalist Ideals, Mythology, Birds, States, Cities, and Rivers.
- Eliminated cross-hull cloning (CL/CA, BB/BC, SS/DD), corrected misspellings ("Chuela", "Zacatacas"), fixed the erroneous "18 de Mayo" date, standardized Nahuatl diacritics, and separated conflicting ideologies into distinct pools.

[b]Norway[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 11 universal thematic lists: Cities, Provinces, Fjords, Monarchs, Heroes, Norse Mythology, Birds of Prey, Predators, Aquatic Life, Nature, and Virtues.
- Purged submarine entries from carrier rosters, eliminated duplicate cruiser entries, corrected broken translations ("Lys Krysseren"), and expanded Sjøforsvaret traditions.

[b]Philippines[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 11 universal thematic lists: Birds & Raptors, Marine Life & Fish, Peaks & Volcanoes, Rivers, Datus & Rajahs, Patriots & Heroes, Mythology, Martial Virtues, and separate Republican, Socialist, and Nationalist ideological pools.
- Purged 18 foreign RNZN/RAN frigates from submarines, removed fictional "General Manchatas", decoupled duplicate cruiser/capital rosters, and standardized "RPS " prefixing.

[b]Sweden[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 10 universal thematic lists: Monarchs, Provinces, Cities, Norse Mythology, Birds of Prey, Predators, Aquatic Life, Naval Heroes, Virtues, and Battles.
- Corrected typos ("Plisander", "Aborren"), eliminated cross-list duplicates between destroyers and cruisers, and fixed battlecruiser fallback translations.

[b]Turkey[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 11 universal thematic lists: Sultans & Khans, Admirals, Cities & Ports, Provinces, Rivers, Peaks, Battles, Birds of Prey, Aquatic Life, Predators, and Virtues.
- Replaced machine-translated fallbacks ("Yok Edici" to Muhrip), restored misplaced historical classes, purged fictional names, and restored proper Turkish diacritics.

[b]Yugoslavia[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 9 universal thematic lists: Cities, Banovinas, Rivers, Mythology, Rulers, Heroes, Birds, Mountains, and Virtues.
- Corrected fallback translation ("Svetlo Krstarica" to Laka krstarica), restored missing diacritics, repaired regional misspellings, and eliminated verbatim cross-hull duplication.

If you enjoy the mod, please give it a thumbs up and favorite!
```
