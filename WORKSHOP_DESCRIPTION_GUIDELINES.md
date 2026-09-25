# Steam Workshop Description Guidelines & Reference

This document serves as an instruction and reference guide for maintaining and updating the Steam Workshop description for **Immersive Ship Names Expanded**.

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
4. **Preserve Custom Author Sections**:
   - Do NOT overwrite, rewrite, or regenerate the header pitch, companion mod link, Info section, or Jackhall series tribute section.
   - When updating the workshop description for newly implemented nations, **only** update the `[h1]Included nations:[/h1]` block and the Repository Cross-Reference table.
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
     - Italics: `[i]...[/i]` (used for foreign language ship names / examples)
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
   - Bulleted ship categories with italicized unit examples (`[i]...[/i]`).
   - Universal thematic topic pools listed as a single summary bullet point.

---

## Repository Cross-Reference (`common/units/names_ships/`)

| File | Nation | Tag | Status in Description |
| :--- | :--- | :--- | :--- |
| `ISNE_AUS_ship_names.txt` | Austria | `AUS` | Included (Destroyers, Submarines, Light Cruisers, Heavy Cruisers, Battleships, Carriers, Thematic Topics) |
| `ISNE_BRA_ship_names.txt` | Brazil | `BRA` | Included (Destroyers, Submarines, Light Cruisers, Heavy Cruisers, Battleships, Battlecruisers, Carriers, Thematic Topics) |
| `ISNE_FIN_ship_names.txt` | Finland | `FIN` | Included (Destroyers, Submarines, Light Cruisers, Heavy Cruisers, Battleships, Carriers, Thematic Topics) |

---

## Current Description Template (BBCode)

```bbcode
More namelists! Used AI to speed up the creation process and help with translations. For now I've only got Finland and Austria, since those two have very poor namelists in vanilla game, but I plan to expand this rapidy, prioritizing nations that have at least some potential to have a large navy in game, but don't have a large enough namelist pool to accomodate that.

Check out my other mod: [url=https://steamcommunity.com/workshop/filedetails/?id=2967389401]Immersive Namelists Expanded [/url]

[h1]Info:[/h1]
- [b]Save Game Compatible:[/b] Can be added or removed from ongoing games without issues.
- No hard incompatibilities. Namelists from other mods might override namelists from this mod in some cases but that's unlikely.
- Feel free to use this mod however you wish.

This mod is intended to expand the great series of [url=https://steamcommunity.com/workshop/filedetails/?id=2185806824] ship namelist mods[/url] by @Jackhall. This means that for now I am avoiding editing countries that have already been touched up by their mod series (Netherlands, China, Spain, Poland, Soviet Union, Greece, and Germany).

[h1]Included nations:[/h1]
[b]Austria[/b]
- Destroyers & Torpedo Craft: [i]Huszár, Ulan, Streiter, Wildfang, Tátra, Balaton, Kaiman, Blitz, Komet, Meteor, Donner, Sturm[/i]
- Submarines: [i]Forelle, Hecht, Karpfen, Stör, Wels, Muräne, Seeteufel, Nautilus, Donaunixe, Otter, Biber, Salamander[/i]
- Light Cruisers: [i]Novara, Saida, Helgoland, Zenta, Aspern, Admiral Spaun, Wien, Linz, Salzburg, Graz, Innsbruck, Bregenz[/i]
- Heavy & Armored Cruisers: [i]Kaiserin und Königin Maria Theresia, Kaiser Karl VI, Sankt Georg, Tegetthoff, Prinz Eugen, Radetzky[/i]
- Battleships & Capital Ships: [i]Viribus Unitis, Tegetthoff, Prinz Eugen, Szent István, Monarch, Habsburg, Erzherzog Karl, Österreich[/i]
- Aircraft Carriers: [i]Igo Etrich, Wilhelm Kress, Walther von der Vogelweide, Kaiseradler, Steinadler, Seeadler, Falke, Phönix[/i]
- Universal Thematic Pools: Monarchs, Cities, Crown Lands, Rivers & Lakes, Alpine Peaks, Historic Battles, Heroes, Folklore, Birds, Beasts, Martial Virtues

[b]Brazil[/b]
- Destroyers & Escorts: [i]Amazonas, Araguari, Ajuricaba, Acre, Marcílio Dias, Greenhalgh, Babitonga, Bertioga, Audaz, Trovão[/i]
- Submarines: [i]Humaitá, Tupi, Timbira, Tamoio, Riachuelo, Guanabara, Tupinambá, Tabajara, Tubarão, Pirarucu, Piranha[/i]
- Light Cruisers: [i]Bahia, Rio Grande do Sul, Recife, Santos, Salvador, Belém, Fortaleza, Vitória, Niterói, Natal, Florianópolis[/i]
- Heavy Cruisers & Coastal Defense: [i]Almirante Barroso, Almirante Tamandaré, Deodoro, Floriano, Almirante Cochrane, Inhaúma, Belmonte[/i]
- Battleships & Dreadnoughts: [i]Minas Gerais, São Paulo, Rio de Janeiro, Bahia, Pará, Pernambuco, Dom Pedro I, Dom Pedro II, Riachuelo[/i]
- Battlecruisers: [i]Riachuelo, Guararapes, Passo da Pátria, Humaitá, Tuiutí, Itororó, Avaí, Campo Grande, Monte Castelo[/i]
- Aircraft Carriers: [i]Minas Gerais, São Paulo, Guanabara, Todos os Santos, Paranaguá, Harpia, Gavião, Carcará, Condor, Urubu-Rei[/i]
- Universal Thematic Pools: Cities, States, Rivers, Heroes & Admirals, Indigenous Tribes & Warriors, Historic Battles, Fauna & Raptors

[b]Finland[/b]
- Destroyers & Fast Escorts: [i]Hämeenmaa, Uusimaa, Karjala, Turunmaa, Matti Kurki, Klas Horn, Sisu, Hurja, Isku, Louhi, Ruotsinsalmi[/i]
- Submarines: [i]Vetehinen, Vesihiisi, Iku-Turso, Saukko, Vesikko, Näkki, Vellamo, Meritursas, Ahven, Hauki, Kuha, Norppa[/i]
- Light Cruisers: [i]Helsinki, Turku, Viipuri, Kotka, Oulu, Vaasa, Pori, Rauma, Tammisaari, Hanko, Porvoo, Hamina, Sortavala[/i]
- Coastal Defense & Heavy Cruisers: [i]Väinämöinen, Ilmarinen, Lemminkäinen, Joukahainen, Kullervo, Tapio, Ahti, Ukko, Pellervo[/i]
- Battleships & Capital Ships: [i]Suomi, Suur-Suomi, Pohjanmaa, Karjala, Uusimaa, Häme, Satakunta, Savo, Kuningas Fornjot, Kuningas Norr[/i]
- Aircraft Carriers: [i]Kokko, Ilmatar, Ukko, Ilmarinen, Vaakalintu, Taivaankantaja, Merikotka, Maakotka, Kotka, Haukka, Sääksi[/i]
- Universal Thematic Pools: Legendary Kings, Cities, Provinces, Rivers & Lakes, Geography & Fells, Historic Battles, Heroes, Kalevala Folklore, Birds, Fish, Beasts, Martial Virtues, Natural Phenomena
```
