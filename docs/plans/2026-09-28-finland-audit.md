# Finland (FIN) Namelist Audit — 2026-09-28

Delta upgrade of `common/units/names_ships/FIN_ship_names.txt` via the `hoi4-isne-namelist-audit` skill. Researcher and reviewer subagents ran on Sonnet.

## Audit report summary (before)
- 20 groups (7 hull + 13 thematic); all hull and thematic pools already at or above depth targets.
- `[FAIL] CrossClass CA/BC`: Pohjolan Isäntä
- `[FAIL] CrossClass CL/CV`: Kotka
- `[INFO] PlanFile` (this file), `[INFO] Prefix`: no prefix in any group; vanilla FIN has none either (no `VanillaPrefix` finding), so FIN stays prefix-free.

## User decisions
None required. The checkpoint's scope-question triggers (`VanillaPrefix`, `Depth`, `ThemeCount`) did not fire.

## Judgment findings (bucket b)
- Display names that did not match their content:
  - `FIN_RULERS` "Monarchs & Rulers" became "Rulers & Heads of State" (the pool includes regents and presidents).
  - `FIN_HEROES` "Heroes & Leaders" became "Heroes & Luminaries" (the pool includes artists, scholars and athletes).
  - `FIN_VIRTUES` "Martial Virtues" became "Virtues & Ideals" (the pool includes Vapaus, Veljeys, Itsenäisyys and Oikeamielisyys).
- Fallback: `FIN_MYTHOLOGY` "Mytologia %d" became "Taru %d" ("myth/legend", a countable noun). All hull fallbacks are correct native indefinite nominative forms.
- English homonyms: "Made" (SS, FISH) collides with English "made"; "Mana" (MYTHOLOGY) with the gaming term; "Into" (DD) with the English preposition.

## Per-group changes
| Group | Removed | Added / Respelled | Count |
|---|---|---|---|
| `FIN_DD_HISTORICAL` | Into | Innokas | 131 |
| `FIN_SS_HISTORICAL` | Made, Vesi-Liisa (unattested), Hallitursas (unattested) | Kolmipiikki | 77 → 75 |
| `FIN_CA_HISTORICAL` | Samson (biblical; Sampsa already covers the Kalevala figure) | — | 45 → 44 |
| `FIN_BC_HISTORICAL` | Pohjolan Isäntä (kept in CA), Kuningas Alavus / Kauppi / Nuolio (uncorroborated), Kuningas Väinö (1918 press nickname, never official), Ruhtinas Kaleva / Ruhtinas Ahti (invented titles for mythic figures), Fennica / Nordica / Botnica / Polaris (post-1990 icebreakers, anachronistic) | Kaarle I → Kuningas Fredrik Kaarle; Kuningas Kustaa → Kustaa Vaasa; Kuningas Eerik → Pyhä Eerik; Kuningas Valdemar → Herttua Valdemar; +12 coastal fortresses (Viapori, Svartholma, Kastelholma, Olavinlinna, Turun linna, Viipurin linna, Käkisalmen linna, Raaseporin linna, Kuusiston linna, Pähkinälinna, Kyminlinna, Korsholma) | 37 → 38 |
| `FIN_CV_HISTORICAL` | Kotka (kept in CL as a major naval port), Kalasaari / Korpisoturi (not birds), Taivaankantaja / Ukkoslintu / Salamatar (unattested coinages) | Tuulitar → Tuuletar; +Kiljukotka, Sinisuohaukka, Ruskosuohaukka, Lapinpöllö, Viirupöllö, Helmipöllö, Varpuspöllö, Piekana | 37 → 39 |
| `FIN_RULERS` | Kuningas Alavus / Kauppi / Nuolio / Väinö, Ruhtinas Kaleva, Ruhtinas Ahti, Pohjolan Isäntä (Kalevala epithet, not a ruler; review minor #1) | Kaarle I → Kuningas Fredrik Kaarle; Kuningas Kustaa → Kustaa Vaasa; Kuningas Eerik → Pyhä Eerik; Kuningas Valdemar → Herttua Valdemar; Kuningas Maunu → Maunu Eerikinpoika; Kuningas Juhana → Kuningas Juhana III; +Kuningas Eerik XIV, Kuningas Kaarle X Kustaa, Kuningas Kaarle XI, Kuningatar Ulriika Eleonoora, Kaarle Knuutinpoika | 38 → 36 |
| `FIN_HEROES` | Klaus Kurki (villain of the Elinan surma ballad), Simuna Hurtta (nickname of a notorious tax collector), Wilhelm von Wendt (uncorroborated) | Simo Häyhä, Hjalmar Siilasvuo, Paavo Talvela, Ilmari Juutilainen | 35 → 36 |
| `FIN_MYTHOLOGY` | Mana | Tuonela; Tuulitar → Tuuletar; Kiputyttö → Kipu-tyttö; fallback → Taru %d | 42 |
| `FIN_FISH` | Made | Vimpa | 42 |

## Kept items (justification)
- **Legendary kings (Fornjot, Norr, Gor, Snær, Thorri, Kári, Frosti, Faravid, Sumble)** are attested in Orkneyinga saga, *Hversu Noregr byggðist*, Egils saga, and Saxo's *Gesta Danorum*. They are kept as legendary figures, as the wiki documents.
- **Lalli and Matti Kurki** are legendary or semi-historical folk heroes. DD "Matti Kurki" and "Klas Horn" were real Finnish Navy gunboats (ex-Russian, acquired 1918).
- **The RULERS pool mixes monarchs and presidents.** It is a chronological roster of heads of state, not an ideological concept pool, so the CLAUDE.md §2 ideology-separation rule does not apply.
- **DD/BC/CV word overlaps (Sisu, Tarmo, Voima, Otso, Kontio, Kokko, Ukko, Korppi, Ilmanlintu)** are allowed: DD is outside the CL/CA/BB/BC/CV exclusivity set.
- **"Ankara", "Tora" and "Aura" (DD)** are proper nouns or native words that don't read as English placeholders, so they stay.
- **FIN_RULERS** holds 36 names, within the 35–60 thematic range.

## Review
`isne-code-reviewer` (Sonnet): APPROVE, with 0 Critical and 0 Important findings. Minor #1 (Pohjolan Isäntä in RULERS) is applied. The other minor items are accepted: Ilmanlintu stays as an attested scholarly epithet of Ilmarinen, the Sääksi/Kalasääski synonyms are harmless, and the legendary framing of the saga kings is documented in the wiki.
