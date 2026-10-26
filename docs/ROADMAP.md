# ISNE Roadmap: Candidate Nations

Ranking of vanilla nations not yet covered by the mod (assessed 2026-10-10). Internal planning only: do not copy into the Steam description (`WORKSHOP_DESCRIPTION_GUIDELINES.md` forbids a "Planned" section).

## Method

- Source: vanilla `common/units/names_ships/` (65 files), compared with the nations already in `common/units/names_ships/`.
- Excluded: nations covered by Jackhall's series (`HOL`, `CHI`, `SPR`, `POL`, `SOV`, `GRE`, `GER`; `docs/isne-agent-guide.md` section 4, item 5).
- Signals: vanilla list depth, cross-class duplicates (names shared between `CL`/`CA`/`BB`/`BC`/`CV`, which the mod's decoupling rule forbids), obvious bugs (mojibake, clone rosters, anachronisms), gameplay traffic, and how much verifiable naval history exists.
- Counts are raw quoted-string counts per vanilla file. The historical claims below are a first impression, not a researched dossier: every nation still needs an `isne-historical-researcher` dossier before authoring.

## Tier 1: Biggest Gain

| Tag | Nation | Vanilla state | Why now |
|---|---|---|---|
| `BUL` | Bulgaria | SS reuses the DD list; curly quotes (`“Shipka”`); inconsistent transliteration (Levski/Levsky) | Small but well-documented navy (Drazki, torpedo boats). |
| `EGY` | Egypt | DD, CL and SS are the same five names; BB, BC and CV empty | Worst structural defect. Real navy is tiny, so depth comes from thematic pools (pharaohs, Nile, Muhammad Ali dynasty, cities). |

## Tier 2: Solid, More Work or Less Urgent

| Tag | Nation | Vanilla state | Notes |
|---|---|---|---|
| `AST` | Australia | 20 of 56 capital-ship names duplicated; filler CV list; every group cloned for a communist variant | Bathurst corvettes are a strong role-pool precedent. The cloned communist groups add complexity. |
| `NZL`, `SAF`, `RAJ` | New Zealand, South Africa, India | 49/84, 51/83 and 21/52 capital-ship names duplicated | Best done as a Commonwealth batch. |
| `SIA` | Thailand | CL and BB lists are provinces and cities; SS has 4 names | Real names exist (Thonburi, Sri Ayudhya, Phra Ruang). |
| `INS` | Indonesia | Anachronisms (Usman Harun 2014, Nanggala 1981); BB has 5 names | Hero, kingdom and weapon naming conventions are well documented. |
| `IRE` | Ireland | DD and SS are 17 names each | Irish Naval Service and Gaelic mythology naming; needs careful diacritics. |
| `BEL` | Belgium | DD and SS are the same 11 names | Tiny navy: an authentic list will be short (guide section 3, no fabricated names). |
| `PAK` | Pakistan | 24 of 42 capital-ship names duplicated | Conquerors and Mughal rulers are well documented. |

## Tier 3: Lower Priority

- **Baltics (`EST`, `LAT`, `LIT`)**: tiny inter-war navies; depth would depend on thematic pools.
- **`VEN`, `COL`, `URG`**: natural follow-ons to the Latin American work already done.
- **`HUN`**: Danube flotilla precedent; check overlap with `AUS`.
- **`MAL`**: SS has only 2 names.
- **`JAP`**: 79 of 269 capital-ship names duplicated, but lists are already deep.
- **`ICE`, `ETH`, `CZE`**: no real navy to anchor names (`CZE` has one city pool and no hull groups).
- **`ENG`**: deep enough already. If done, follow the `USA` and `FRA` approach (keep every vanilla list, repair, decouple, add pools) and check `-InspectVanilla` for tags vanilla script assigns by `name_group`.
- **Central American tail (`DOM`, `HON`, `PAN`, `HAI`, `ELS`, `NIC`, `COS`, `GUA`, `ECU`)**: 26-40 names each, little verifiable naval history.

## Audit Queue

Legacy namelists waiting for the `hoi4-isne-namelist-audit` skill. The six legacy namelists assessed on 2026-10-10 (`DEN`, `TUR`, `NOR`, `YUG`, `CUB`, `MEX`) have been audited and removed; `PER` was audited on 2026-10-14. The queue is currently empty.

Add a row when a legacy namelist without a passing audit is found (rank, tag, hard fails, warnings, main problems). Remove it when the audit passes.

## Status Tracking

Update this file in the same task as any change it covers (`docs/isne-agent-guide.md` section 4, item 7):

- Implemented nation: delete its candidate row, then follow guide section 4 (README, Steam description guidelines, wiki).
- Vanilla state, plan or Jackhall exclusion changes: update the affected row.
- Legacy namelist without a passing audit: add it to the Audit Queue; delete it when the audit passes.
