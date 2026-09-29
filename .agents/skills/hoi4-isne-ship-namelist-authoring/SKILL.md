---
name: hoi4-isne-ship-namelist-authoring
description: >-
  Runbook for researching historical naval doctrine, class naming traditions, and authoring
  immersive ship namelists for Hearts of Iron IV in the Immersive Ship Names Expanded (ISNE) mod.
  Use when adding a new nation or expanding existing national ship namelists into ship-type specific
  and universal thematic topic categories. For auditing or upgrading an existing namelist to current
  standards, use hoi4-isne-namelist-audit instead.
---

# ISNE Ship Namelist Authoring Runbook

Research, scope, author and validate a nation's namelists. The rules live in `GEMINI.md` §1–7 (already in context); this runbook adds the method and does not restate them.

> **Upgrading an existing namelist?** Use `hoi4-isne-namelist-audit`: a delta audit (`build.ps1 -Audit <TAG>`) at a fraction of this runbook's token cost.
>
> **Mirror**: `.claude/skills/hoi4-isne-ship-namelist-authoring/SKILL.md` (Claude Code). Subagent briefs live in `.claude/agents/`. Apply rule changes to both (`GEMINI.md` §9).

## 1. Plausibility in Practice
Rigid accuracy limits lists to hulls that were actually commissioned (Finland: 2 coastal defense ships, 5 submarines), so a mobilized player or AI fleet (fleet carriers, heavy cruisers, battlecruisers, destroyers) falls back to numbered stubs. Extrapolate how the naval command would name an expanded fleet, drawing on:
- official class traditions (destroyers after fast natural phenomena, martial virtues or naval commanders);
- geographic hierarchies (battleships after provinces/regions, cruisers after major coastal towns/ports, escorts after minor bays or straits);
- peacetime expansion plans, canceled designs, war emergency programs;
- heritage, heroic folklore, mythological deities, fauna (birds of prey for carriers, aquatic predators for submarines);
- alternate-history paths (monarchist dynasties, regional leagues, great-power ambitions).

## 2. Architecture Details
Categories, depth tiers, display-name rules, decoupling and BB/BC doctrine: `GEMINI.md` §2. Tokens: §7.

### A. Default hull themes (adapt to the nation's documented formulas)
| Group | Themes |
|---|---|
| DD | gunboats, torpedo craft, martial descriptors, weather/lightning virtues |
| SS | aquatic animals, sea beasts, mythological water deities/monsters |
| CL | major coastal cities, ports, trade centers |
| CA | epic cultural heroes, mythic figures, national champions |
| BB | historical provinces, regions, legendary monarchs |
| BC | sea kingdoms, historic war vessels and flagships, coastal fortresses, decisive straits and naval encounters |
| CV | sky deities, heavens, weather phenomena, raptors/birds of prey |

### B. Thematic pool tag suffixes
`BIRDS`, `FISH`, `BEASTS` · `CITIES`, `PROVINCES` (historical provinces & counties), `RIVERS` (rivers, lakes, waterways), `GEOGRAPHY` (mountains, landmarks) · `RULERS`, `MYTHOLOGY`, `BATTLES`, `HEROES` · `VIRTUES`, `NATURE` (weather, tempests, celestial bodies) · ideological: `REPUBLICAN_IDEALS` or `REVOLUTION` (republican/constitutional), `SOCIALISM` (socialist/labor/agrarian), `NATIONALISM` or `FASCISM` (nationalist/synarchist/traditionalist), `MONARCHISM` (monarchist/imperial).

Ideological pools are capped at **at most 1–2 pools per ideology** per nation to prevent flooding the Ship Designer dropdown. Gate each pool behind its ideology using `can_use = { has_government = <ideology> }` (`democratic`, `neutrality` [unaligned/monarchist], `fascism`, `communism`). Never gate behind national focuses (`has_completed_focus`), which breaks under mod overhauls and misses peaceful or civil-war regime shifts. Use descriptive thematic display names (e.g. `"Socialist Heroes"`, `"Imperial Dynasties"`, `"Republican Ideals"`), ≤ 25 characters.

### C. Role-specific pools
Rules: `GEMINI.md` §2C. A minelayer is a light hull and an escort carrier a `carrier` hull, so `ship_types` cannot isolate a role; role pools stay universal and `-VerifyShipTypes` rejects `ship_types` on them. Walk every family below for every nation; create a pool only if it passes the precedent test, otherwise record `considered, skipped: <reason>` in the plan (one line per family is enough).

Precedent test (any one suffices):
- The navy operated, ordered or planned a distinct class or designation for the role with its own naming convention. Illustrative, verify per nation: US escort carriers after sounds and bays and destroyer escorts after naval heroes; British Flower-class corvettes after flowers; Italian Navigatori-class scouts after navigators and explorers.
- The role's documented formula differs from its parent hull group's, so a mixed roster would misrepresent both.
- Enough verifiable names exist to reach the floor without padding.

Catalogue (a prompt, not a ceiling; tag = `<TAG>_` + suffix):

| Family | Suffixes | Usually built on |
|---|---|---|
| Mine warfare | `MINELAYERS`, `MINESWEEPERS` | light hull; cruiser hull for fast minelayers |
| Convoy escort & ASW | `ESCORT_CARRIERS`, `ESCORT_DESTROYERS`, `CORVETTES`, `FRIGATES`, `SLOOPS`, `AVISOS`, `PATROL_VESSELS` (coast guard, armed trawlers) | carrier hull; light hull |
| Scouting & torpedo craft | `SCOUT_CRUISERS`, `FLOTILLA_LEADERS`, `TORPEDO_BOATS`, `FAST_ATTACK_CRAFT` | cruiser or light hull |
| Coastal & riverine | `COASTAL_DEFENSE` (only where its formula differs from `CA`), `MONITORS`, `GUNBOATS` | heavy, cruiser or light hull |
| Capital & carrier sub-types | `FAST_BATTLESHIPS`, `LARGE_CRUISERS`, `ARMORED_CRUISERS` (pre-1914 legacy), `LIGHT_CARRIERS` | heavy, cruiser or carrier hull |
| Aviation support | `SEAPLANE_TENDERS` | light, cruiser or carrier hull |
| Submarine sub-types | `CRUISER_SUBMARINES`, `COASTAL_SUBMARINES` (incl. midget), `MINELAYING_SUBMARINES` | submarine hull |
| Auxiliary & converted | `AUXILIARY_CRUISERS` (merchant raiders, armed merchant cruisers), `TRAINING_SHIPS`, `ICEBREAKERS`, `SUBMARINE_TENDERS`, `STATE_YACHTS` | light or cruiser hull |

A role outside the catalogue with its own class series (national river flotilla, colonial station ships, coastal fortress-ship line): use a `<TAG>_<ROLE>` tag and add the suffix to `$RolePoolSuffixes` in `build.ps1`, so `-Audit` grades it as a role pool rather than a thematic pool.

Role-pool specifics beyond §2C: fallback in native indefinite nominative; display name is the role in plain words (`"Minelayers"`, `"Escort Carriers"`), ≤ 25 characters; the pool is justified by its documented series, never by generic filler.

## 3. Research

**Targets**: respect the Jackhall exclusions (`GEMINI.md` §4). Prioritize nations with thin or generic vanilla lists that can build mid-to-large navies (e.g. Sweden, Norway, Denmark, the Baltic states, Turkey, Argentina, Brazil, Chile, Romania, Yugoslavia).

### Step 0: Vanilla audit
`powershell -File .\build.ps1 -InspectVanilla <TAG>` (coverage, tags, counts, prefix, without loading the file); add `-Group <GROUP_TAG>` for one group. Record fixes for these typical Paradox anomalies:
- **Copy-paste headers** (Brazil's file headed "Argentina").
- **Fallback errors**: definite suffixes (Danish `"Slagkrydseren %d"`, Norwegian `"Lys Krysseren %d"` → `"Slagkrydser %d"`, `"Let krydser %d"`, `"Jager %d"`); homonym calques (`"Lys"` for light cruiser instead of `"Let"`/`"Lett"`/`"Lätt"`); pseudo-English or corrupted terms (`"Cruiseren"`, `"Destroyer %d"` in non-English lists, `"Cuzador"`, `"Ltt Kryssare"`); dictionary calques (Swedish `"Stridsskepp %d"` for `"Slagkryssare %d"`).
- **Misspellings / missing diacritics** (`"Marnhão"`, `"Amazona"`, `"Aborren"` → `"Abborren"`); **archaic/modern spelling mixes** (`Santa Catharina` with `Santa Catarina`).
- **In-list duplicates and article variants** (`"Rosales"` twice in CL; `"Mjölner"`/`"Munin"` twice in DD; `"La Rioja"` with `"Rioja"`).
- **Cross-hull geographic collisions** (same cities in DD and CL: give historical destroyer-class cities / naval stations to DD, regional trade ports / maritime hubs to CL).
- **Fauna and auxiliary craft in major combatants** (Danish CL with torpedo boats *Flynderen*, *Ulken*, *Mågen*; CA repeating the flounder beside icebreaker *Isbjørn*): move fauna to DD, SS, or `BIRDS`/`FISH` pools.
- **Role mismatches** (1970s corvettes/frigates or patrol gunboats listed as cruisers).
- **Shadow duplication** (CA or BC a verbatim copy of CL or BB plus 1–2 names); **mirrored capital stubs** (the same 5 ships reversed between BB and BC, sloops as dreadnoughts); **excessive class duplication** (one list of states copied across CL, CA, BB, BC, CV).
- **Doctrinal formulas** worth keeping (Argentina: submarines after provinces starting with "S").
- **Anachronisms** (divisions or cities created after 1945).
- **Prefix usage** (e.g. `NRB `, or none).

### Step 1: Researcher dispatch
Web research floods the context, so delegate it. Invoke a subagent via `invoke_subagent` (`Role: "Historical Researcher"`, `TypeName: "research"` or `"self"`, `Model: "pro"` or `"inherit"`) and have it read and follow the brief in `.claude/agents/isne-historical-researcher.md` (body below the frontmatter); do not paste the brief into your own context. Prompt: country and TAG; the Step 0 findings (anomalies, prefix, existing tags and counts); any focus (canceled programs, an ideological path, regional folklore); nation-specific role hints (e.g. a known minelayer or escort program). It returns a structured dossier; never paste raw web research into the main context.

**Scope checkpoint**: fold the dossier's role-pool recommendations into the scope questions (e.g. create all recommended role pools / only those at target depth / none). At most 2 questions in total.

### Step 2: Anchor the lists in the dossier
Use it for historical and canceled programs (peacetime fleets, interwar naval acts, emergency wartime construction) and for geographic and cultural grounding (coastal cities, trade ports, provinces, islands, waters, folklore such as the Kalevala or Norse sagas, native fauna). Write into the vanilla filename (`GEMINI.md` §6).

## 4. Pre-Finalization Checklist
Beyond the `GEMINI.md` §2–3 and §7 rules:
- [ ] Names in the proper grammatical form (typically nominative singular); diacritics preserved (*ä, ö, å, é, è, ü, ł, ś*); articles, prepositions and apostrophes in native orthography (*L'Audacieux*, *De Zeven Provinciën*).
- [ ] Every group has a numbered fallback (e.g. `fallback_name = "Hävittäjä %d"`).
- [ ] Every standard hull has a doctrine-aligned group; several rich thematic pools exist.
- [ ] Every role family in §2C was considered; each role pool has precedent or a skip line in the plan.
- [ ] Prefix: vanilla parity checked, and any omission of a vanilla prefix is documented.
- [ ] `-Audit <TAG>` shows no `CrossClass`, `BBBCMirror` or `RoleOverlap` FAIL.
- [ ] Every named person individually sourced; English-homonym and display-name-accuracy checks done.

## 5. Homonym Resolution Examples
Rules: `GEMINI.md` §2. Players field several cruiser and capital classes at once, so collisions surface in play.
- **City vs province (CL vs CA)**, common in the Philippines, Mexico, Brazil, Argentina (*Cebu*, *Iloilo*, *Davao*, *Zamboanga*, *Batangas*, *Cavite*, *Puebla*, *Oaxaca*): the plain name goes to the CA province (*Batangas*, *Cavite*, *Cebu*); CL gets the formal city title (*"Cebu City"*, *"Cavite City"*, *"Batangas City"*, *"Ciudad de Puebla"*) or a renowned secondary port.
- **Compacts/kingdoms vs cities/provinces (BB/BC vs CL/CA)** (*Malolos*, *Butuan*, *Sulu*): native realm titles (Tausūg *"Lupah Sug"* for the Sultanate vs province *"Sulu"*); keep *"Malolos"* for BB and use *"Meycauayan"* or *"Aparri"* in CL.
- **Regions/confederations vs summits (BB/BC vs CV)** (Panay's Confederation of *Madja-as* vs *Mount Madja-as*): *"Mount ..."* or another prominent volcanic summit/range for CV.

## 6. File Template
```pdx
##### <COUNTRY> NAVAL NAME LISTS (ISNE) #####

### SHIP-TYPE SPECIFIC: DESTROYERS & ESCORTS ###
<TAG>_DD_HISTORICAL = {
	name = NAME_THEME_HISTORICAL_DESTROYERS

	for_countries = { <TAG> }

	type = ship
	ship_types = { ship_hull_light destroyer }

	fallback_name = "<Fallback> %d"

	unique = {
		"Name1" "Name2" "Name3"
	}
}

### UNIVERSAL TOPIC: BIRDS ###
<TAG>_BIRDS = {
	name = "Birds"

	for_countries = { <TAG> }

	type = ship
	# Omit ship_types for universal hull availability

	fallback_name = "<Bird> %d"

	unique = {
		"Eagle" "Falcon" "Hawk" "Osprey"
	}
}

### IDEOLOGY-GATED UNIVERSAL TOPIC: SOCIALISM ###
<TAG>_SOCIALISM = {
	name = "Socialist Ideals"

	for_countries = { <TAG> }

	can_use = {
		has_government = communism
	}

	type = ship
	# Omit ship_types for universal hull availability

	fallback_name = "<Fallback> %d"

	unique = {
		"Name1" "Name2" "Name3"
	}
}
```

## 7. Review & Docs
- **Review**: invoke a fresh subagent via `invoke_subagent` (`Role: "Code Reviewer"`, `Model: "pro"`) that reads and follows the brief in `.claude/agents/isne-code-reviewer.md`, with country, TAG, plan file (`docs/superpowers/plans/<PLAN_FILE>.md`) and implementation files (`common/units/names_ships/<TAG>_ship_names.txt`, `README.md`, `WORKSHOP_DESCRIPTION_GUIDELINES.md`, `wiki/<Country>.md`, `wiki/Home.md`, `wiki/_Sidebar.md`). Fix every Critical and Important finding before reporting completion.
- **Reviewer input**: run `-Audit <TAG>`, `-ValidateOnly` and `-Test` before the review and paste their summary lines into the prompt, so the reviewer trusts them instead of re-running them; it reads the namelist through `-Audit <TAG> -NamesOnly` (and `-DiffNames <TAG>` when expanding an existing file).
- **Docs** (`GEMINI.md` §4):
  - Cross-reference row: `| <TAG>_ship_names.txt | <Country> | <TAG> | Included (<Summary of highlights>) |`
  - Included-nations block (role pools count toward `<N>` and may be named generically among the topics, e.g. minelayers, escort carriers):
    ```bbcode
    [b]<Country>[/b]
    - Expanded ship-type lists for <Hulls>.
    - Added <N> universal thematic lists for the Ship Designer (<Topics>).
    ```
  - Wiki page: tables of group tags, types and sample names. Push: `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Document <TAG> ship namelists"`.
- **Validate**: `-ValidateOnly`, `-Test`, `-VerifyShipTypes <TAG>`, `-Audit <TAG>`; `-Package` for release checks (`GEMINI.md` §5).
