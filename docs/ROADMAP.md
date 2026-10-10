# ISNE Roadmap: Candidate Nations

Ranking of vanilla nations not yet covered by the mod (assessed 2026-10-10). Internal planning only: do not copy into the Steam description (`WORKSHOP_DESCRIPTION_GUIDELINES.md` forbids a "Planned" section).

## Method

- Source: vanilla `common/units/names_ships/` (65 files), compared with the nations already in `common/units/names_ships/`.
- Excluded: nations covered by Jackhall's series (`HOL`, `CHI`, `SPR`, `POL`, `SOV`, `GRE`, `GER`; CLAUDE.md §4.5).
- Signals: vanilla list depth, cross-class duplicates (names shared between `CL`/`CA`/`BB`/`BC`/`CV`, which the mod's decoupling rule forbids), obvious bugs (mojibake, clone rosters, anachronisms), gameplay traffic, and how much verifiable naval history exists.
- Counts are raw quoted-string counts per vanilla file. The historical claims below are a first impression, not a researched dossier: every nation still needs an `isne-historical-researcher` dossier before authoring.

## Tier 1: Biggest Gain

| Tag | Nation | Vanilla state | Why now |
|---|---|---|---|
| `PRU` | Peru | Mojibake; CL and CA identical; BB and BC identical | Plan exists (`docs/plans/2026-09-27-peru-namelist.md`), no namelist, docs or wiki page yet. Cheapest win. Re-validate the plan against current standards before implementing. |
| `CAN` | Canada | 272 names; 56 of 109 capital-ship names duplicated; BB repeats the provinces from CL | Heavily played. Deep RCN history (Tribals, River-class frigates, Flower corvettes, Bangor and Algerine minesweepers) supports role pools. |
| `ROM` | Romania | DD 13, SS 8; BB list is only cities | Black Sea navy and Danube monitors and gunboats give real precedent for role pools. |
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
| `BEL` | Belgium | DD and SS are the same 11 names | Tiny navy: an authentic list will be short (CLAUDE.md §3, no fabricated names). |
| `PAK` | Pakistan | 24 of 42 capital-ship names duplicated | Conquerors and Mughal rulers are well documented. |

## Tier 3: Lower Priority

- **Baltics (`EST`, `LAT`, `LIT`)**: tiny inter-war navies; depth would depend on thematic pools.
- **`VEN`, `COL`, `URG`**: natural follow-ons to the Latin American work already done.
- **`HUN`**: Danube flotilla precedent; check overlap with `AUS`.
- **`MAL`**: SS has only 2 names.
- **`JAP`**: 79 of 269 capital-ship names duplicated, but lists are already deep.
- **`ICE`, `ETH`, `CZE`**: no real navy to anchor names (`CZE` has one city pool and no hull groups).
- **`ENG`, `USA`, `FRA`**: deep enough already.
- **Central American tail (`DOM`, `HON`, `PAN`, `HAI`, `ELS`, `NIC`, `COS`, `GUA`, `ECU`)**: 26-40 names each, little verifiable naval history.

## Status Tracking

When a nation moves from this list to implementation, delete its row here and follow CLAUDE.md §4 (README, Steam description guidelines, wiki).
