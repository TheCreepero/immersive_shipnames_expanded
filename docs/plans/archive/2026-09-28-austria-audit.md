# Austria (AUS) Namelist Audit — 2026-09-28

Delta upgrade of `common/units/names_ships/AUS_ship_names.txt` via the `hoi4-isne-namelist-audit` skill.

## Audit report (before)
`AUDIT SUMMARY AUS: FAIL=3 WARN=12 INFO=2`
- FAIL CrossClass CL/BB: Triest, Wien, Salzburg, Budapest
- FAIL CrossClass CA/BB: Kaiser Franz Joseph I, Tegetthoff, Prinz Eugen, Erzherzog Karl, Erzherzog Ferdinand Max
- FAIL MissingHull: no `AUS_BC_HISTORICAL`; BB carried `battle_cruiser`
- WARN Depth ×10 (thematic pools 20–32 vs 35), WARN DisplayName BEASTS (27 chars), WARN VanillaPrefix (`SMS ` vs none)

## User decisions
1. **Prefix**: restore vanilla `SMS ` on all 18 groups (vanilla parity, CLAUDE.md §3).
2. **Depth**: deepen only the four thinnest pools (Wildlife, Folklore & Legends, Virtues & Mottos, Heroes) to 35; accept the others.

## Research
Delegated to `isne-historical-researcher` (Sonnet). Its verdicts were adopted with these deviations: Graf von Clam-Gallas was kept (Eduard Clam-Gallas, 1866 corps commander, documented). "Kaiser Max" was not added to BC (it duplicates the person in BB's "Kaiser Maximilian I"). Premuda was not added to BC (the site where Szent István was lost). Only verified mottos were added to VIRTUES.

## Per-group changes

| Group | Before → After | Removed | Added / respelled |
|---|---|---|---|
| All 18 groups | — | — | `prefix = "SMS "` |
| DD_HISTORICAL | 120 → 120 | — | — |
| SS_HISTORICAL | 76 → 76 | Kallichthys (scientific genus, not a German vernacular name); Donaunixe (in-group near-duplicate of Donauweibchen) | Barsch, Zingel |
| CL_HISTORICAL | 64 → 64 | Wien, Budapest (kept in BB as Monarch-class ships); Salzburg (kept in BB as crown land) | Panther, Leopard, Tiger (k.u.k. torpedo cruisers, reclassified as small cruisers in 1909) |
| CA_HISTORICAL | 41 → 35 | Feldmarschall Radetzky, Feldmarschall Schwarzenberg (review: near-duplicates of BB Radetzky / BC Schwarzenberg; both remain in HEROES); Tegetthoff, Prinz Eugen, Erzherzog Karl (to BB only); Erzherzog Ferdinand Max, Don Juan de Austria, Kaiser, Custozza (to BC); Maximilian von Daun (conflation); Franz von Mercy (Bavarian service); Admiral Keil, Admiral Rijavec (unsourced); Erzherzog Ferdinand Karl (ambiguous, no ship) | Admiral Wüllerstorf-Urbair, Admiral Dahlerup, Admiral von Pöck, Admiral Montecuccoli, Karl von Lothringen, Feldmarschall Hadik, Josias von Coburg, Feldmarschall Kövess; respelled Montecuccoli → Raimondo Montecuccoli, Feldzeugmeister Wurmser → Feldmarschall Wurmser |
| BB_HISTORICAL | 50 → 47 | Triest (stays in CL; Küstenland covers the crown land); Kaiser Franz Joseph I (stays in CA); Erzherzog Ferdinand Max (to BC); Kaiserin Maria Theresia (consort, not empress regnant; near-duplicate of the CA cruiser); Kaiser Rudolf I (never crowned emperor) | Kaiser Rudolf II, Vorderösterreich; `battle_cruiser` removed from ship_types |
| **BC_HISTORICAL (new)** | 0 → 31 | — | Historic k.k./k.u.k. warships (Lissa-era ironclads and frigates), Danube monitors, Adriatic naval encounters and waters, fortresses and citadels. `ship_types = { ship_hull_heavy battle_cruiser }`, fallback `Schlachtkreuzer %d` |
| CV_HISTORICAL | 39 → 39 | Walther von der Vogelweide (a poet, not an aviator; stays in HEROES); Milan (English homonym: the Italian city) | Godwin Brumowski (top Austro-Hungarian fighter ace), Schwarzmilan |
| BIRDS | 29 → 29 | Milan (English homonym) | Rotmilan |
| RULERS | 30 → 30 | Otto von Habsburg (pretender, never reigned) | Leopold III der Heilige |
| RIVERS | 32 → 32 | March, Ill (English homonyms) | Mürz, Möll; respelled Weissensee → Weißensee |
| GEOGRAPHY | 30 → 30 | — | respelled Grosser Priel → Großer Priel |
| BATTLES | 27 → 28 | Cattaro, Pola, Triest (not battles); Curzola (1298 Venice–Genoa, no Austrian role); Schwarzenberg (a person) | Kahlenberg, Slankamen, Hochkirch, Kunersdorf, Limanowa, Karfreit; respelled Custoza → Custozza, Petrovaradin → Peterwardein |
| HEROES | 24 → 35 | Maximilian von Daun | Leopold Joseph von Daun, Josef Ressel, Karl Weyprecht, Julius von Payer, Ludwig von Höhnel, Georg von Trapp, Gregor Mendel, Christian Doppler, Ludwig Boltzmann, Johann Strauss, Gustav Mahler, Peter Rosegger |
| MYTHOLOGY | 20 → 35 | Gambrinus (Flemish), Wieland der Schmied (pan-Germanic) | respelled Donaunixe → Donauweibchen, Untersbergkaiser → Kaiser im Untersberg; added Lieber Augustin, Stock-im-Eisen, Frau Hitt, Riese Haymon, König Laurin, Wilde Jagd, Nörggele, Wildmandl, Habergeiß, Venedigermandl, Kasermandl, Drude, Brünhild, Gunther, Giselher, Volker von Alzey, Tannhäuser |
| BEASTS | 20 → 35 | — | Display name "Predators & Alpine Wildlife" → "Wildlife"; fallback `Raubtier %d` → `Wildtier %d`; added Murmeltier, Wildkatze, Steinmarder, Hermelin, Mauswiesel, Schneehase, Feldhase, Wisent, Elch, Mufflon, Damhirsch, Hirschkäfer, Kreuzotter, Alpensalamander, Siebenschläfer |
| VIRTUES | 22 → 35 | — | respelled Constantia et Virtute → Constantia et Fortitudine (motto of Karl VI); added AEIOU, Consilio et Industria, Amore et Timore, Virtute et Exemplo, Justitia et Clementia, Fortitudini, Integritati et Merito, Avita et Aucta, Pretium Laborum Non Vile, Pflichttreue, Ritterlichkeit, Tatkraft, Opfermut |
| CITIES, PROVINCES | unchanged | — | — |

## Kept WARNs (justification)
- **Depth** for PROVINCES (28), BIRDS (29), BATTLES (28), RULERS (30), GEOGRAPHY (30), RIVERS (32): the user chose to deepen only the four thinnest pools. All six are above the floor of 20. RULERS is bounded by the actual Babenberg/Habsburg line.

## Flags for author
- CA and HEROES keep figures with a controversial record (Benedek, Conrad von Hötzendorf, Gyulay, Clam-Gallas). All are documented historical persons.
- HEROES: Paracelsus (born in Einsiedeln, died in Salzburg) and Walther von der Vogelweide (active at the Babenberg court) have Austrian ties but were not born in Austria.
- RIVERS: Inn and Lech are kept despite English homonyms. Both are major rivers, and SMS Inn was a real Danube monitor.

## Review outcome (isne-code-reviewer, Sonnet)
Verdict: APPROVE WITH MINOR FIXES; no Critical findings.

Important findings:
- **Adria and Bellona (BC), kept.** Both were verified by web search: SMS Adria was a Radetzky-class screw frigate (1856) that fought at Lissa; SMS Bellona was an Austrian sailing frigate (1842).
- **Schwarzenberg and Radetzky, fixed.** The near-duplicate persons were removed from CA (see the CA row above).
- **Spielberg, replaced by Przemyśl.** "Spielberg" reads as an English-language name to English-speaking players; Przemyśl was a k.u.k. fortress besieged in 1914–15.

Minor findings applied:
- Wurmser's rank corrected to Feldmarschall.
- Milan replaced (English homonym).
- CL and SS comments made accurate.
- Workshop row made consistent with other nations.
- Wiki Monarchs scope reworded; Lech added to the homonym note.

Minor findings not applied:
- **Erzherzog Ferdinand Max stays in BC.** It fits BC doctrine as Tegetthoff's flagship at Lissa, and BB still has its class sisters Erzherzog Karl and Erzherzog Friedrich.
- **Bare "Graf von …" forms and the Montecuccoli pair stay.** Each form resolves to one documented person in Austrian service.
- **"Lieber Augustin" stays** as the common name of the figure.
