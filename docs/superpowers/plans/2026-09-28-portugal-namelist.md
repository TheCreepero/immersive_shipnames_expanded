# Portugal (TAG: POR) Ship Namelist Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Overhaul and expand the naval ship namelists for Portugal (`TAG: POR`) in *Immersive Ship Names Expanded*, eliminating a critical vanilla content-integrity bug (the entire file is headed `##### ARGENTINA NAME LISTS #####` and the battleship roster is not Argentine *or* Portuguese but a near-complete list of real Brazilian Navy ship/state names), a verbatim CL/CA clone duplication, missing diacritics, a mistranslated battlecruiser fallback term, and severe depth deficits, while establishing a complete two-category architecture with 7 ship-type specific pools and 7 universal thematic/ideological pools (moderate scope, per author decision).

**Architecture:** Implement clean VFS file replacement at `common/units/names_ships/POR_ship_names.txt` overriding all vanilla groups (`POR_<HULL>_HISTORICAL`), establishing authentic Portuguese naval naming doctrine (*Marinha Portuguesa* / *Navio da República Portuguesa*), and introducing thematic and one ideological pool for the Ship Designer. Synchronize documentation across `README.md`, `WORKSHOP_DESCRIPTION_GUIDELINES.md`, and the GitHub wiki (`wiki/Portugal.md`, `wiki/Home.md`, `wiki/_Sidebar.md`).

**Tech Stack:** Hearts of Iron IV Clausewitz script syntax (namelist blocks, token types, UTF-8 without BOM), PowerShell (ISNE test suite & validation runner `build.ps1`, Pester 6.2.0), Markdown, Steam BBCode.

**Spec:** [SKILL.md](file:///c:/dev/immersive-shipnames-expanded/.claude/skills/hoi4-isne-ship-namelist-authoring/SKILL.md) and the Historical Naval Research Dossier for Portugal (TAG: POR) provided by the `isne-historical-researcher` subagent (2026-09-28).

**Author scope decisions (via AskUserQuestion, 2026-09-28):**
- Thematic pool count: **moderate set (~6–7 pools)**, not the maximal ~10–12 the dossier could support.
- Colonial empire content: **included** — folded into the `CA` (Heavy Cruiser / Coastal Defense) roster as the colonial-port doctrine, rather than a separate dedicated thematic pool, so it reads as authentic naval deployment doctrine (colonial squadrons) instead of a tourism list.

## Vanilla Audit Findings (Step 0 — confirmed against live file)

1. **Header/content integrity bug**: File comment reads `##### ARGENTINA NAME LISTS #####`. Worse than a copy-paste label error — `POR_BB_HISTORICAL`'s 26-name roster is a near-complete Brazilian Navy/state list (`Minas Gerais`, `São Paulo`, `Santa Catarina` [duplicated], `Espirito Santo`, `Rio de Janeiro`, `Maranhão`, `Goiás`, `Rio Grande do Sul`, `Pará`, `Alagoas`, `Pernambuco`, `Roraima`, `Tocantins`, `Rio Grande do Norte`, `Paraná`, `Acre`, `Mato Grosso`, `Amazona`, `Rondonia`, `Amapá`, `Piaui`, `Ceará`, `Sergipe`, `Paraíba`, `Mato Grosso do Sul`). Full purge required — none of this is Portuguese content. (Likely origin: the real 1912 Portuguese Naval Program dreadnoughts were informally called the "Minas Gerais type" after the Brazilian design they were modeled on; someone appears to have copied the wrong nation's roster wholesale.)
2. **Verbatim CL/CA clone**: `POR_CL_HISTORICAL` and `POR_CA_HISTORICAL` share an identical 6-name roster (`Matosinhos`, `Vila Nova de Gaia`, `Mira`, `Figueira da Foz`, `Marinha Granda`, `Nazare`) — a cross-class shadow duplication bug per CLAUDE.md §2/§7.
3. **Missing diacritics / misspellings**: `Tamega`→`Tâmega`, `Nazare`→`Nazaré`, `Marinha Granda`→`Marinha Grande`, `Principe Real`→`Príncipe Real`, `Nautilo`→`Náutilo` (in the 2026 revival lineage), `St Sebastiao`→`São Sebastião` (anglicized form must go).
4. **Mistranslated fallback**: `POR_BC_HISTORICAL` fallback is `"Cuzador Couraçado %d"` — a typo (`Cuzador`) of a term that additionally means *armoured cruiser* (`cruzador couraçado`/`cruzador blindado`), not *battlecruiser*. Correct Portuguese naval term is `Cruzador de Batalha %d`.
5. **Word-order calque**: vanilla `BC` entry `"Novo Estado"` inverts the real regime name **Estado Novo**.
6. **Severe depth deficit across all hulls**: `DD` 13 (target 100–140+), `SS` 11 (target 60–80), `CL`/`CA` 6 each (target 50–70 / 35–45), `BB` 26 — all invalid content (target 30–45), `BC` 3 (target 30–45), `CV` 9 (target 30–40). No universal thematic pools exist.
7. **Prefix**: vanilla correctly uses `prefix = "NRP "` (real-world Portuguese Navy prefix, *Navio da República Portuguesa*) with a trailing space across all groups — **maintain this**, including on new thematic pools.

## Global Constraints

- File location must be `common/units/names_ships/POR_ship_names.txt` to cleanly shadow and replace the vanilla file via HoI4 Virtual File System.
- File encoding must be UTF-8 without BOM, with strictly balanced curly braces `{}` and balanced double quotes.
- Ship type tokens in `ship_types = { ... }` must only use recognized engine tokens (`ship_hull_light`, `destroyer`, `ship_hull_submarine`, `submarine`, `ship_hull_cruiser`, `light_cruiser`, `heavy_cruiser`, `ship_hull_heavy`, `battleship`, `battle_cruiser`, `ship_hull_carrier`, `carrier`).
- Prefix string must be `prefix = "NRP "` with a mandatory trailing whitespace, applied consistently across every ship-type specific and universal thematic pool.
- Fallback templates must be authentic European Portuguese indefinite nominative singular: `"Contratorpedeiro %d"` (DD), `"Submarino %d"` (SS), `"Cruzador Ligeiro %d"` (CL), `"Cruzador Pesado %d"` (CA), `"Couraçado %d"` (BB, European Portuguese form — deliberately distinct from ISNE_BRA's Brazilian `Encouraçado`), `"Cruzador de Batalha %d"` (BC, fixes the vanilla typo/mistranslation), `"Porta-Aviões %d"` (CV).
- Display names (`name = "..."`) must be <= 25–30 characters (strict maximum 32) and omit redundant national adjectives.
- Universal thematic pools must omit `ship_types` for universal availability across all hulls.
- No fabricated names: every named historical individual (navigator, naval officer, aviator, monarch, cultural figure) must be individually traceable to a source. Entries the dossier flagged `[UNV]` (unconfirmed) are dropped from this plan's target rosters; entries flagged `[AT]` (attested, not deeply verified) are kept but should get a final confirmation pass during authoring.
- English-homonym check applied: `Ave` → `Rio Ave`, `Save` → `Rio Save` (both real river names but bare English-word collisions); `Coca` → `Coca de Monção` if used. `Sines`, `Alcatraz` (means "gannet"), `Bonito`, `Agulha`, `Raio`, `Fortaleza` are kept bare as low-risk/defensible per dossier.
- Ideological cohesion: only one ideological pool (`POR_ESTADO_NOVO`) is in scope for this moderate pass, reflecting Portugal's actual historical Estado Novo-era government; it excludes naming a ship directly after the sitting dictator (Salazar) and any contentious repression-site names (e.g. Tarrafal), using regime concepts, events, and non-contentious figures instead. Republican (1910–26), Monarchist-restoration, and Socialist/PCP pools from the dossier are **deferred**, not authored in this pass (see Deferred Scope below).
- Cross-class decoupling: `CL`, `CA`, `BB`, `BC`, `CV` rosters must be mutually exclusive. Key resolved collisions: `Mira` → CL only; `Cacheu` → DD only; `Mazagão` → BC only (removed from CA); `Diu`/`Goa`/`Ormuz`/`Malaca`/`Cochim`/`Cananor` → BC only (historical naval actions); `Beira` (bare) → CA only, BB uses `Beira Alta`/`Beira Baixa`/`Beira Litoral`; `Lusitânia` → BB only (CV's 1922 aircraft of the same name is dropped in favor of the sovereignty use); `Pátria` & `Santa Cruz` → CV only; `Infante Dom Pedro` → BB only; `Príncipe Real`, `Rainha de Portugal`, `Medusa`, `Maria Primeira` → BC only (all real 18th-century naus, not the Brazilian entries they might be confused for).
- Zero-copy single-root workspace layout: all files maintained directly at repository root.

## Review Focus

1. **Total content-integrity purge**: Verify zero remaining Brazilian names anywhere in the file and that the header reads as Portuguese, not Argentine.
2. **Decoupling of clone classes**: Verify `CL` and `CA` have fully independent rosters (CL = metropolitan/island ports; CA = colonial/imperial ports), and that `BB`/`BC` follow distinct doctrines (BB = sovereignty/provinces/founders; BC = historic flagships/naval battles/fortresses) per CLAUDE.md §2's Capital Ship Doctrine Specialization.
3. **Diacritic and fallback-term restoration**: Confirm all vanilla misspellings are fixed and the `BC` fallback now reads `"Cruzador de Batalha %d"` instead of the vanilla typo/mistranslation.
4. **Cross-hull collision resolution**: Confirm the resolved-collision list above holds with zero overlaps (run the automated set-intersection script from CLAUDE.md §5).
5. **Per-individual and homonym verification**: Confirm no `[UNV]`-flagged names from the dossier made it into the final rosters, and that the `Ave`/`Save` compounding was applied.
6. **Prefix trailing whitespace**: Verify every `prefix = "NRP "` declaration has a trailing space.
7. **Documentation and test synchronization**: Verify `tests/Shipnames.Tests.ps1`, `tests/Documentation.Tests.ps1`, and `tests/BuildScript.Tests.ps1` all pass.

---

## Tasks

### Task 1: Author Portuguese Ship Namelists (`common/units/names_ships/POR_ship_names.txt`)

**Files:**
- Create: `common/units/names_ships/POR_ship_names.txt`

**Interfaces:**
- Consumes: Historical Naval Research Dossier for POR (isne-historical-researcher, 2026-09-28).
- Produces: 7 Ship-Type Specific namelists and 7 Universal Thematic/Ideological namelists for country tag `POR`.

- [ ] **Step 1: Draft header and ship-type specific groups in `common/units/names_ships/POR_ship_names.txt`**
  - Header: `##### PORTUGAL NAVAL NAME LISTS (ISNE) #####` (replaces the erroneous Argentina header).
  - Group `POR_DD_HISTORICAL` (~135 names, `fallback_name = "Contratorpedeiro %d"`): metropolitan river names (the historical *contratorpedeiro* tradition — `Douro`, `Tâmega`, `Vouga`, `Lima`, `Dão`, `Tejo`, `Liz`, `Guadiana`, `Mondego`, `Cávado`, `Sado`, `Zêzere`, plus ~45 more verified Portuguese rivers, applying `Rio Ave`/`Rio Save` compounds for the overseas set); overseas colonial river names (`Zaire`, `Cuanza`, `Cunene`, `Zambeze`, `Limpopo`, `Geba`, `Cacheu`, `Mandovi`); Age-of-Discovery navigators, viceroys and captains (`Nuno Tristão`, `Diogo Gomes`, `Diogo Cão`, `Corte-Real`, `Pêro Escobar`, `Bartolomeu Dias`, `Afonso de Albuquerque`, `Vasco da Gama`-lineage names, ~55 more verified figures); 19th–20th c. naval officers and explorers (`Carvalho Araújo`, `Hermenegildo Capelo`, `Roberto Ivens`, `João Belo`, `Ferreira do Amaral`, `Magalhães Correia`). Drops dossier `[UNV]` entries (`Diogo de Silves`, `Soeiro da Costa`).
  - Group `POR_SS_HISTORICAL` (~70 names, `fallback_name = "Submarino %d"`): confirmed historical PT submarine names (`Delfim`, `Espadarte`, `Golfinho`, `Narval`, `Náutilo`, `Neptuno`, `Albacora`, `Barracuda`, `Cachalote`, `Foca`, `Hidra`, `Tridente`, `Arpão`); 1941–42 fish-named patrol boats (`Azevia`, `Bicuda`, `Corvina`, `Dourada`, `Fataça`, `Espadilha`); sharks, rays, large marine predators, and demersal/pelagic fish drawn from the dossier's master list.
  - Group `POR_CL_HISTORICAL` (~62 names, `fallback_name = "Cruzador Ligeiro %d"`): metropolitan mainland ports (north to Algarve: `Matosinhos`, `Vila Nova de Gaia`, `Figueira da Foz`, `Marinha Grande`, `Nazaré`, `Aveiro`, `Peniche`, `Setúbal`, `Sesimbra`, `Faro`, `Lagos`, `Portimão`, etc.) plus Madeira and Azores island ports (`Funchal`, `Ponta Delgada`, `Angra do Heroísmo`, `Horta`). Fixes the vanilla diacritics (`Tâmega`→N/A here, `Nazaré`, `Marinha Grande`).
  - Group `POR_CA_HISTORICAL` (~44 names, `fallback_name = "Cruzador Pesado %d"`): **colonial/imperial port doctrine** (per author scope decision) — Angola (`Luanda`, `Lobito`, `Benguela`, `Moçâmedes`, `Cabinda`), Mozambique (`Lourenço Marques`, `Beira`, `Quelimane`, `Ilha de Moçambique`, `Sofala`), Guinea/Cape Verde (`Bissau`, `Mindelo`, `Cidade Velha`), São Tomé (`Cidade de São Tomé`), India/Macau/Timor (`Nova Goa`, `Mormugão`, `Damão`, `Macau`, `Díli`), and historical Portuguese-held Indian Ocean/Morocco forts (`Ceuta`, `Mazagão` removed — see BC — `Mombaça`, `Melinde`, `Ternate`). Zero overlap with CL.
  - Group `POR_BB_HISTORICAL` (~36 names, `fallback_name = "Couraçado %d"`): sovereignty symbols (`Portugal`, `Lusitânia`, `Portucale`, `Restauração`), 1936 administrative provinces with river-clash-avoiding forms (`Entre-Douro-e-Minho`, `Trás-os-Montes`, `Beira Alta`, `Beira Baixa`, `Beira Litoral`, `Estremadura`, `Ribatejo`, `Alto Alentejo`, `Baixo Alentejo`, `Algarve`), island groups (`Açores`, `Madeira`), overseas territories (`Angola`, `Moçambique`, `Guiné`, `Cabo Verde`, `São Tomé e Príncipe`, `Estado da Índia`, `Timor`), the two national capitals (`Lisboa`, `Porto`), and founding monarchs/national figures (`Afonso Henriques`, `Dom Dinis`, `Dom João I`, `Dom Manuel I`, `Infante Dom Henrique`, `Infante Dom Pedro`, `Nuno Álvares Pereira`, `Viriato`).
  - Group `POR_BC_HISTORICAL` (~40 names, `fallback_name = "Cruzador de Batalha %d"` — **fixes the vanilla typo/mistranslation**): Age-of-Discovery flagships and naus (`São Gabriel`, `São Rafael`, `Bérrio`, `Flor de la Mar`, `Príncipe Real`, `Rainha de Portugal`, `Medusa`, `Botafogo`, `Cinco Chagas`), decisive naval battles/sieges (`Diu`, `Cochim`, `Cananor`, `Ormuz`, `Goa`, `Malaca`, `Cabo de São Vicente`), and colonial fortresses (`São Jorge da Mina`, `Sagres`, `Mazagão`, `São Julião da Barra`). Vanilla's `"Lisboa"`/`"Porto"` move to `BB`; `"Novo Estado"` corrected and moved to the `Estado Novo` thematic pool.
  - Group `POR_CV_HISTORICAL` (~36 names, `fallback_name = "Porta-Aviões %d"`): naval aviation pioneers (`Gago Coutinho`, `Sacadura Cabral`, `Sarmento de Beires`, `Bartolomeu de Gusmão`), historic Portuguese aircraft (`Pátria`, `Santa Cruz`, `Argos`, `Dilly`, `Passarola`), naval air stations (`Alverca`, `Amadora`, `São Jacinto`), and celestial-navigation/sky terms (`Cruzeiro do Sul`, `Estrela Polar`, `Astrolábio`, `Rosa dos Ventos`, `Aurora`, `Sírio`). Keeps the anglicized vanilla `"St Sebastiao"` out entirely (moved/corrected as `São Sebastião` if used, or dropped — no confirmed CV-relevant nau of that name).

- [ ] **Step 2: Add universal thematic pools to `common/units/names_ships/POR_ship_names.txt`** (moderate 6-pool set, per author decision)
  - `POR_BIRDS`: Birds (~45 names, `name = "Birds"`). Raptors (`Águia-Real`, `Falcão-Peregrino`, `Milhafre`, `Grifo`), owls, seabirds (`Gaivota`, `Albatroz`, `Cagarra`), waders (`Garça`, `Cegonha`, `Flamingo`), and songbirds — verified as a mixed pool, name kept broad per the content-accurate naming rule.
  - `POR_AQUATIC`: Aquatic Life (~35 names, `name = "Aquatic Life"`). Fish, shellfish and marine invertebrates distinct from the `SS` roster where practical (`Faneca`, `Abrótea`, `Boga`, `Salema`, `Estrela-do-Mar`, `Búzio`, `Caranguejo`, plus additional pelagic/demersal fish not already used in `SS`).
  - `POR_LEGENDS`: Legends (~30 names, `name = "Legends"`). Lusitanian deities (`Endovélico`, `Ataegina`, `Bandua`), founding myths (`Luso`, `Ulisses`, `Olisipo`), *Os Lusíadas* figures (`Adamastor`, `Tágides`, `Velho do Restelo`), and Sebastianism/Fifth Empire symbolism (`Encoberto`, `Desejado`, `Quinto Império`, `Bandarra`).
  - `POR_HEROES`: Heroes (~38 names, `name = "Heroes"`). Writers and chroniclers (`Camões`, `Fernão Lopes`, `Gil Vicente`), scientists (`Garcia de Orta`), medieval heroes (`Egas Moniz`, `Martim Moniz`, `Geraldo Sem Pavor`), queens (`Inês de Castro`, `Filipa de Lencastre`), and explorers/soldiers (`Mouzinho de Albuquerque`, `Serpa Pinto`). No overlap with names already used in `DD` or `CV`.
  - `POR_VIRTUES`: Virtues (~35 names, `name = "Virtues"`). Martial/character virtues (`Honra`, `Glória`, `Lealdade`, `Coragem`, `Fé`, `Vitória`, `Fortaleza`, `Perseverança`) plus a handful of verified 1807 royal-squadron ship names that double as virtue words (`Vingança`, `Minerva`).
  - `POR_MONARCHS`: Monarchs (~30 names, `name = "Monarchs"`). Houses of Burgundy, Aviz and Braganza (`Dom Sancho I`, `Dom Afonso IV`, `Dom João I`, `Dom Sebastião`, `Dom João IV`, `Dom José I`, `Dona Maria I`, `Dom Pedro IV`, `Dom Luís I`) plus queens/princes not already used in `BB` (`Condessa Dona Teresa`, `Dona Leonor`). Excludes the contentious `Dom Miguel I` (absolutist usurper) per dossier flag.
  - `POR_ESTADO_NOVO`: Estado Novo (~22 names, `name = "Estado Novo"`). Regime concepts and events (`Estado Novo`, `Revolução Nacional`, `Vinte e Oito de Maio`, `Império`, `Ultramar`, `Acto Colonial`, `Mundo Português`, `Mocidade Portuguesa`, `Legião Portuguesa`) and non-contentious historical figures (`Gomes da Costa`, `Marechal Carmona`, `Ortins de Bettencourt`, `Américo Tomás`). Deliberately excludes the sitting dictator's personal name (Salazar) and the Tarrafal camp name per the dossier's sensitivity flag; documented as an intentionally shorter, authenticity-first pool rather than padded to the general 35–60 thematic target.

- [ ] **Step 3: Run syntax and engine validation**
  - Run: `powershell -File .\build.ps1 -ValidateOnly`
  - Expected: PASS with 0 syntax errors, 0 unbalanced braces, valid prefix spacing.

- [ ] **Step 4: Run automated cross-class set-intersection check**
  - Run the CLAUDE.md §5 PowerShell collision script against `CL`, `CA`, `BB`, `BC`, `CV` for `POR`.
  - Expected: `SUCCESS: Zero cross-class collisions among CL, CA, BB, BC, CV!`

---

### Task 2: Synchronize Repository Documentation (`README.md` & `WORKSHOP_DESCRIPTION_GUIDELINES.md`)

**Files:**
- Modify: `README.md`
- Modify: `WORKSHOP_DESCRIPTION_GUIDELINES.md`

**Interfaces:**
- Consumes: Implemented `POR` tag and group summary.
- Produces: Updated cross-reference table and workshop description bullets complying with Steam length guidelines.

- [ ] **Step 1: Update `README.md` Included Nations table**
  - Add Portugal (`POR`) entry to the Included Nations Summary table with link to `wiki/Portugal.md`.

- [ ] **Step 2: Update `WORKSHOP_DESCRIPTION_GUIDELINES.md` Cross-Reference table**
  - Add `POR_ship_names.txt` row summarizing: purged Brazilian/Argentine-mislabeled content, decoupled CL/CA clone, restored diacritics, fixed BC fallback term, and 7 universal thematic/ideological pools.

- [ ] **Step 3: Update `WORKSHOP_DESCRIPTION_GUIDELINES.md` Included nations section**
  - Add `[b]Portugal[/b]` entry under `[h1]Included nations:[/h1]` using the standard 3-bullet BBCode format (Expanded ship-type lists; Added universal thematic pools; Vanilla fixes and historical traditions restored) without individual ship names.

- [ ] **Step 4: Verify documentation test passes**
  - Run: `powershell -Command "Invoke-Pester -Path tests/Documentation.Tests.ps1 -Output Detailed"`
  - Note: Will fail wiki checks until Task 3 is completed. Verify README and Workshop Guide assertions pass.

---

### Task 3: Author Wiki Documentation (`wiki/Portugal.md`, `wiki/Home.md`, `wiki/_Sidebar.md`)

**Files:**
- Create: `wiki/Portugal.md`
- Modify: `wiki/Home.md`
- Modify: `wiki/_Sidebar.md`

**Interfaces:**
- Consumes: Complete namelist rosters and historical dossier for POR.
- Produces: Detailed wiki documentation page and indexed sidebar links.

- [ ] **Step 1: Create `wiki/Portugal.md`**
  - Document Portuguese naval doctrine: *Marinha Portuguesa* history, the 1912 and 1930 Naval Programs, the 1910 Republic's prefix/renaming policy (`NRP`), WWI river-class destroyers, interwar submarine/aviso programs, the colonial squadron doctrine, and the vanilla content-integrity bug this file fixes (mislabeled Argentina header + wholesale Brazilian BB roster).
  - Include summary tables for all 14 ship namelist groups (Group Tag, UI Name, Target Ship Types, Entry Count, Sample Names, Description).
  - Note the scope of the `Estado Novo` pool's authenticity-first, intentionally-shorter roster and the deferred pools (Cities, Islands, Landmarks, Battles, Elements, Republic, Monarchism, Socialism) as candidates for a future expansion pass.

- [ ] **Step 2: Update `wiki/Home.md`**
  - Add Portugal (`POR`) row to the Nations Overview table.

- [ ] **Step 3: Update `wiki/_Sidebar.md`**
  - Add `[[Portugal|Portugal]]` to the sidebar list in alphabetical order.

- [ ] **Step 4: Push wiki changes**
  - Run: `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Document POR ship namelists"`

---

### Task 4: Independent Code Review & Final Validation

**Files:**
- Test: `tests/Shipnames.Tests.ps1`
- Test: `tests/Documentation.Tests.ps1`
- Test: `tests/BuildScript.Tests.ps1`

- [ ] **Step 1: Dispatch `isne-code-reviewer` agent**
  - Provide: country name (Portugal), TAG (`POR`), this plan file path (`docs/superpowers/plans/2026-09-28-portugal-namelist.md`), and implementation files (`common/units/names_ships/POR_ship_names.txt`, `README.md`, `WORKSHOP_DESCRIPTION_GUIDELINES.md`, `wiki/Portugal.md`, `wiki/Home.md`, `wiki/_Sidebar.md`).
  - Address all Critical and Important findings before proceeding.

- [ ] **Step 2: Run full Pester test suite**
  - Run: `powershell -File .\build.ps1 -Test`
  - Expected: PASS on all tests across all 3 test files (0 failures).

- [ ] **Step 3: Run release packaging verification**
  - Run: `powershell -File .\build.ps1 -Package`
  - Expected: Clean distribution ZIP built in `release/` excluding dev artifacts, tests, and documentation.

- [ ] **Step 4: Check Git status**
  - Run: `git status`
  - Expected: Clean working directory tracking all created and modified files.

---

## Deferred Scope (out of scope for this moderate-set pass)

Per the author's "moderate ~6–7 pools" scope decision, the following dossier-supported pools are documented but **not** authored in this plan; a future expansion pass can add them without touching the ship-type specific groups:
- `POR_CITIES` (inland/non-port cities — Coimbra, Braga, Évora, Guimarães, etc.)
- `POR_ISLANDS` (Azores/Madeira/Cape Verde archipelago, beyond the CL port entries)
- `POR_LANDMARKS` (mountains and capes, incl. Cabo Bojador/Boa Esperança discovery-era capes)
- `POR_BATTLES` (land/colonial battles — naval battles are already covered inside `BC`)
- `POR_ELEMENTS` (weather/celestial terms beyond what's used in `CV`)
- `POR_REPUBLIC`, `POR_MONARCHISM`, `POR_SOCIALISM` (additional ideological pools for the First Republic, a restoration-monarchist path, and the PCP/CGT labor movement — deferred to keep this pass to a single, uncontroversial ideological pool tied to Portugal's actual historical government form)
