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
| `DEN_ship_names.txt` | Denmark | `DEN` | Included (DD, SS, CL, CA, BB, BC, CV, 8 Thematic Topics, Vanilla Fixes) |
| `FIN_ship_names.txt` | Finland | `FIN` | Included (DD, SS, CL, CA, BB, CV, 13 Thematic Topics) |
| `NOR_ship_names.txt` | Norway | `NOR` | Included (DD, SS, CL, CA, BB, BC, CV, 11 Thematic Topics, Vanilla Fixes) |
| `SWE_ship_names.txt` | Sweden | `SWE` | Included (DD, SS, CL, CA, BB, BC, CV, 10 Thematic Topics, Vanilla Fixes) |

---

## Current Description Template (BBCode)

```bbcode
More namelists! Used AI to speed up the creation process and help with translations. For now I've got Finland, Austria, Brazil, Argentina, Chile, Sweden, Norway, and Denmark. In the future I intend to prioritize nations that have at least some potential to have a large navy in game (Tannu Tuva probably won't get a namelist update in a while, sorry :/), but don't have a large enough namelist pool to accommodate that.

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
- Expanded ship-type lists for Destroyers & Escorts, Submarines, Light Cruisers, Heavy Cruisers & Coastal Defense, Battleships, Battlecruisers, and Aircraft Carriers.
- Added 6 universal thematic lists selectable for any hull in the Ship Designer (Cities, Provinces, Heroes & Statesmen, Historic Battles, Rivers & Waterways, and Native Fauna).
- Fixed vanilla file issues: eliminated duplicate entries ("Rosales" and "La Rioja"), separated modern 1970s corvettes from cruisers, removed patrol boats from heavy cruisers, and expanded sparse capital ship stubs with authentic Armada de la República Argentina traditions.

[b]Austria[/b]
- Expanded ship-type lists for Destroyers, Submarines, Light Cruisers, Heavy Cruisers, Battleships, and Aircraft Carriers.
- Added 11 universal thematic lists selectable for any hull in the Ship Designer (Monarchs, Cities, Crown Lands, Rivers & Lakes, Alpine Peaks, Historic Battles, Heroes, Folklore, Birds, Wildlife, and Virtues).
- Restored and expanded historical Austro-Hungarian K.u.K. Kriegsmarine traditions and interwar Danube flotilla naming conventions.

[b]Brazil[/b]
- Expanded ship-type lists for Destroyers & Escorts, Submarines, Light Cruisers, Heavy Cruisers & Coastal Defense, Battleships, Battlecruisers, and Aircraft Carriers.
- Added 7 universal thematic lists selectable for any hull in the Ship Designer (Cities, States, Rivers, Heroes & Admirals, Indigenous Tribes, Historic Battles, and Native Fauna).
- Fixed vanilla file issues: corrected the mislabeled Argentina header, resolved the "Cuzador Couraçado" battlecruiser typo, fixed state typos ("Marnhão", "Amazona"), and replaced the monotonous single-state list with authentic Marinha do Brasil class traditions.

[b]Chile[/b]
- Expanded ship-type lists for Destroyers & Escorts, Submarines, Light Cruisers, Heavy Cruisers & Coastal Defense, Battleships, Battlecruisers, and Aircraft Carriers.
- Added 7 universal thematic lists selectable for any hull in the Ship Designer (Cities, Provinces, Heroes, Mapuche Warriors, Historic Battles, Waterways & Fjords, and Native Fauna).
- Fixed vanilla file issues: purged pontoon hulks ("County of Peebles") and peacetime disaster shipwrecks ("Cazador") from capital ship lists, eliminated duplicate entries ("Orella" and "Araucano"), restored missing diacritics, and expanded historical Armada de Chile traditions.

[b]Denmark[/b]
- Expanded ship-type lists for Destroyers & Escorts, Submarines, Light Cruisers, Heavy Cruisers & Coastal Defense, Battleships, Battlecruisers, and Aircraft Carriers.
- Added 8 universal thematic lists selectable for any hull in the Ship Designer (Cities, Regions & Islands, Monarchs, National Heroes, Norse Mythology, Birds, Aquatic Life, and Sounds & Waters).
- Fixed vanilla file issues: repaired damaged character encodings ("Sridderen", "gir"), corrected pseudo-English fallback translations ("Lys Cruiseren", "Tung Cruiseren"), purged patrol craft from cruisers, removed duplicate submarine entries, and expanded sparse capital ship lists.

[b]Finland[/b]
- Expanded ship-type lists for Destroyers & Fast Escorts, Submarines, Light Cruisers, Coastal Defense / Heavy Cruisers, Battleships, and Aircraft Carriers.
- Added 13 universal thematic lists selectable for any hull in the Ship Designer (Legendary Kings, Cities, Provinces, Rivers & Lakes, Fells & Capes, Historic Battles, Heroes, Kalevala Folklore, Birds, Fish, Wildlife, Virtues, and Weather Phenomena).
- Replaced sparse vanilla pools with authentic Finnish naming traditions, native diacritics, and numbered fallbacks for large Baltic fleets.

[b]Norway[/b]
- Expanded ship-type lists for Destroyers & Escorts, Submarines, Light Cruisers, Heavy Cruisers (Panserskip), Battleships, Battlecruisers, and Aircraft Carriers.
- Added 11 universal thematic lists selectable for any hull in the Ship Designer (Cities, Provinces, Fjords, Monarchs, Heroes & Explorers, Norse Mythology, Birds of Prey, Predators, Aquatic Life, Nature & Tempests, and Martial Virtues).
- Fixed vanilla file issues: purged submarine entries from carrier rosters, removed duplicate entries in submarines and cruisers, corrected broken translations ("Lys Krysseren", "deleggeren"), and expanded historical Sjøforsvaret naming traditions.

[b]Sweden[/b]
- Expanded ship-type lists for Destroyers & Escorts, Submarines, Light Cruisers, Heavy Cruisers (Pansarskepp), Battleships, Battlecruisers, and Aircraft Carriers.
- Added 10 universal thematic lists selectable for any hull in the Ship Designer (Monarchs, Provinces, Cities, Norse Mythology, Birds of Prey, Predators, Aquatic Life, Naval Heroes, Martial Virtues, and Historic Battles).
- Fixed vanilla file issues: corrected typos ("Plisander", "Aborren", "Karl XIV Johann"), eliminated cross-list duplicates between destroyers and light cruisers, corrected battlecruiser fallback translation, and expanded the carrier roster.

If you enjoy the mod, please give it a thumbs up and favorite!
```
