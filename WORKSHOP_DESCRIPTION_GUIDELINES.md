# Steam Workshop Description Guidelines & Reference

Instructions and reference for maintaining the Steam Workshop description of **Immersive Ship Names Expanded**. Agents: these rules are also summarized in `CLAUDE.md` / `GEMINI.md` §4.

---

## Core Rules

1. **No emojis** anywhere.
2. **Length**: Steam caps descriptions at ~17,000 characters of raw BBCode; monitor the total when adding nations.
   - Concise bullets, no long narrative blocks.
   - **Never list individual ship names**: dozens of names per class would hit the limit as nations are added.
   - No author update quote blocks (`[quote=author]...[/quote]`).
3. **Tone**: concise, informative, direct and enthusiastic, matching the author's voice; plain bullets and structured headings; no embellishment or marketing buzzwords.
4. **Preserve author sections**: never rewrite or regenerate the header pitch, companion mod link or Jackhall tribute. The Info section holds standard mod notes and one global notice on vanilla bug fixes for all nations. For a newly implemented nation, update **only** the `[h1]Included nations:[/h1]` block and the Repository Cross-Reference table (plus the nation list in the header pitch, per `CLAUDE.md` §4).
5. **Jackhall scope**: ISNE extends @Jackhall's ship namelist mod series; never author or propose namelists for nations it covers: Netherlands (`HOL`), China (`CHI`), Spain (`SPR`), Poland (`POL`), Soviet Union (`SOV`), Greece (`GRE`), Germany (`GER`).
6. **No `[h1]Planned:[/h1]` section.**
7. **Language**: fix typos, misspellings, formatting anomalies and broken English; use proper diacritics in historical ship names (*Väinämöinen*, *Hämeenmaa*, *L'Audacieux*).
8. **Steam BBCode only**: `[h1]Heading[/h1]`, `[b]...[/b]`, `[i]...[/i]` (foreign phrases, short highlights), `[url=https://...]text[/url]`, hyphen bullets (`- Item`); clean line breaks between sections and blocks.

---

## Structure of the Description

1. **Header pitch & companion mod**: the author's own intro (AI-accelerated creation, focus on nations with limited vanilla namelists) and a link to *Immersive Namelists Expanded*.
2. **`[h1]Info:[/h1]`**: save-game compatibility; mod compatibility and namelist override clarification; mount / DLC compatibility; global notice on vanilla bug fixes, typos, duplicates, missing classes and broken fallback translations across all nations; open permissions ("Feel free to use this mod however you wish.").
3. **Jackhall tribute & scope**: attribution and link to @Jackhall's series; note on the excluded countries.
4. **`[h1]Included nations:[/h1]`**: one bold `[b]Nation[/b]` entry each, with exactly 2 bullets:
   - ship-type lists: which hull categories were expanded (DD, SS, CL, CA, BB, BC, CV);
   - universal thematic pools added for the Ship Designer (e.g. Cities, Monarchs, Rivers, Heroes, Fauna).

   Bug and typo fixes stay in Info rather than repeating per nation. Never add exhaustive or repetitive unit name lists (`[i]...[/i]`).

---

## Repository Cross-Reference (`common/units/names_ships/`)

| File | Nation | Tag | Status in Description |
| :--- | :--- | :--- | :--- |
| `ARG_ship_names.txt` | Argentina | `ARG` | Included (DD, SS, CL, CA, BB, BC, CV, 6 Thematic Topics) |
| `AUS_ship_names.txt` | Austria | `AUS` | Included (DD, SS, CL, CA, BB, BC, CV, 11 Thematic Topics) |
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
| `SWE_ship_names.txt` | Sweden | `SWE` | Included (DD, SS, CL, CA, BB, BC, CV, 10 Thematic Topics, 1 Role Pool) |
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
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
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
- Added 10 universal thematic lists: Monarchs, Provinces, Cities, Norse Mythology, Birds, Predators, Aquatic Life, Heroes & Commanders, Virtues, and Battles, plus a Minesweepers role list.

[b]Turkey[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 11 universal thematic lists: Sultans & Khans, Admirals, Cities & Ports, Provinces, Rivers, Peaks, Battles, Birds of Prey, Aquatic Life, Predators, and Virtues.

[b]Yugoslavia[/b]
- Expanded ship-type lists for all hull classes (DD, SS, CL, CA, BB, BC, CV).
- Added 9 universal thematic lists: Cities, Banovinas, Rivers, Mythology, Rulers, Heroes, Birds, Mountains, and Virtues.

If you enjoy the mod, please give it a thumbs up and favorite!
```
