# Steam Workshop Description Guidelines & Reference

This document serves as an instruction and reference guide for maintaining and updating the Steam Workshop description for **Immersive Shipnames Expanded**.

---

## Core Rules & Constraints

1. **No Emojis**: Strictly avoid adding any emojis or emoticons to the description.
2. **Character & Length Limits**:
   - Steam Workshop descriptions have a strict character limit (~17,000 characters raw BBCode).
   - Keep bullet points concise and avoid lengthy narrative blocks.
   - Do NOT include author update quote blocks (`[quote=author]...[/quote]`).
   - Monitor the overall character count of the BBCode text when adding new nations.
3. **Writing Style & Tone**:
   - Keep the tone concise, informative, direct, and enthusiastic, matching the author's original voice.
   - Use straightforward bullet points and structured section headings.
   - Do not over-embellish or use marketing buzzwords.
4. **Language & Grammar**:
   - Fix typos, misspellings, formatting anomalies, or broken English.
   - Use proper diacritics/accents for historical ship names (e.g., *Väinämöinen*, *Hämeenmaa*, *L'Audacieux*).
5. **Steam Formatting (BBCode)**:
   - Always format the description using Steam's supported BBCode tags:
     - Section headings: `[h1]Heading Text[/h1]`
     - Bold text: `[b]...[/b]`
     - Italics: `[i]...[/i]` (used for foreign language ship names / examples)
     - URLs: `[url=https://...]link text[/url]`
     - Lists: Standard hyphen bullets (`- Item`).
   - Ensure clean line breaks between sections and blocks.

---

## Structure of the Description

1. **Header / Introduction**:
   - Short introductory pitch for the mod.
   - Call to action pointing to the discussion thread for suggestions/feedback.
2. **[h1]Info:[/h1]**:
   - Compatibility notes (Ironman/Achievements compatible, save game compatible).
   - Works with all major overhaul mods that do not alter core naval subunit tags.
3. **[h1]Included nations:[/h1]**:
   - Highlights and examples of expanded ship classes.
   - Grouped by nation in bold (`[b]Nation[/b]`).
   - Bulleted ship categories with italicized examples (`[i]...[/i]`).
4. **[h1]Planned:[/h1]**:
   - Bulleted list of nations planned for expansion.

---

## Repository Cross-Reference (`common/units/names_ships/`)

| File | Nation | Tag | Status in Description |
| :--- | :--- | :--- | :--- |
| `ISNE_FIN_ship_names.txt` | Finland | `FIN` | Included (Destroyers, Submarines, Coastal Defense, Light Cruisers, Carriers) |

---

## Current Description Template (BBCode)

```bbcode
Immersive Shipnames Expanded expands Hearts of Iron IV ship namelists with historically plausible, linguistically accurate, and immersive names across all naval hull classes.

Never run dry on ship names during extended campaigns or alternate-history naval buildups!

[h1]Info:[/h1]
- [b]Ironman Compatible:[/b] Yes, achieves achievement compatibility (modifies only cosmetic ship namelists).
- [b]Save Game Compatible:[/b] Can be added or removed from ongoing games without issues.
- [b]Language Accuracy:[/b] Authentic native spelling and diacritics.

[h1]Included nations:[/h1]
[b]Finland[/b]
- Destroyers & Torpedo Boats: [i]Hämeenmaa, Uusimaa, Karjala, Turunmaa, Matti Kurki, Sisu, Hurja, Isku, Syöksy, Nuoli[/i]
- Submarines: [i]Vetehinen, Vesihiisi, Iku-Turso, Saukko, Vesikko, Näkki, Vellamo[/i]
- Light Cruisers: Coastal cities and trade hubs ([i]Helsinki, Turku, Viipuri, Kotka, Oulu, Vaasa, Pori[/i])
- Coastal Defense Ships & Heavy Cruisers: Kalevala heroes & mythological figures ([i]Väinämöinen, Ilmarinen, Lemminkäinen, Joukahainen, Kullervo[/i])
- Battleships: Historic provinces & ancient kings ([i]Suomi, Pohjanmaa, Karjala, Kuningas Norr[/i])
- Aircraft Carriers: Birds of prey & mythical flyers ([i]Kokko, Kotka, Haukka, Merikotka[/i])

[h1]Planned:[/h1]
- Sweden
- Estonia
- Latvia
- Lithuania
- Poland
- Germany
- United Kingdom
- United States
- Japan
- Italy
- France
- Soviet Union
```
