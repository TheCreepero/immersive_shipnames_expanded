# Brazil (BRA) Ship Namelists

Source file: `common/units/names_ships/BRA_ship_names.txt`

---

## Overview

Brazil possessed one of the premier naval traditions in the Americas, prominently highlighted by the late-19th and early-20th-century South American dreadnought race between the ABC powers (Argentina, Brazil, and Chile). The *Marinha do Brasil* shook global naval design in 1910 with the commissioning of the dreadnoughts *Minas Geraes* and *São Paulo*, followed by extensive domestic destroyer programs (*Marcílio Dias* and *Acre* classes), light cruisers (*Bahia* and *Rio Grande do Sul*), and an active submarine branch.

In vanilla Hearts of Iron IV, Brazil's ship namelist file (`BRA_ship_names.txt`) suffered from several prominent issues:
- Erroneous header comment stating `##### ARGENTINA NAME LISTS #####` due to a base-game copy-paste oversight.
- An unfortunate typo in the battlecruiser fallback name (`"Cuzador Couraçado %d"`).
- Typographical errors in ship names (e.g. `"Marnhão"`, `"Amazona"`).
- Monotonous repetition where the exact same list of federated states was duplicated across light cruisers, heavy cruisers, battleships, battlecruisers, and aircraft carriers.

**ISNE** completely redesigns Brazil's naval namelists into two balanced tiers: dedicated ship-type categories grounded in authentic *Marinha do Brasil* traditions, and expansive universal thematic pools covering Brazilian geography, heritage, rivers, heroes, and fauna.

---

## Namelist Groups

### Ship-Type Specific Category

Dedicated namelists tied to specific ship hulls and naval classifications:

| Group Tag | Type | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `BRA_DD_HISTORICAL` | Destroyers & Escorts | `ship_hull_light destroyer` | Amazonas, Araguari, Ajuricaba, Acre, Marcílio Dias, Greenhalgh, Babitonga, Bertioga, Audaz, Trovão, Relâmpago |
| `BRA_SS_HISTORICAL` | Submarines | `ship_hull_submarine submarine` | Humaitá, Tupi, Timbira, Tamoio, Riachuelo, Guanabara, Tupinambá, Tabajara, Tubarão, Pirarucu, Piranha |
| `BRA_CL_HISTORICAL` | Light Cruisers | `ship_hull_cruiser light_cruiser` | Bahia, Rio Grande do Sul, Recife, Santos, Salvador, Belém, Fortaleza, Vitória, Niterói, Natal, Florianópolis |
| `BRA_CA_HISTORICAL` | Heavy Cruisers & Coastal Defense | `ship_hull_cruiser heavy_cruiser` | Almirante Barroso, Almirante Tamandaré, Deodoro, Floriano, Almirante Cochrane, Inhaúma, Belmonte, Saldanha |
| `BRA_BB_HISTORICAL` | Battleships & Dreadnoughts | `ship_hull_heavy battleship` | Minas Gerais, São Paulo, Rio de Janeiro, Bahia, Pará, Pernambuco, Dom Pedro I, Dom Pedro II, Riachuelo |
| `BRA_BC_HISTORICAL` | Battlecruisers | `ship_hull_heavy battle_cruiser` | Riachuelo, Guararapes, Passo da Pátria, Humaitá, Tuiutí, Itororó, Avaí, Campo Grande, Monte Castelo |
| `BRA_CV_HISTORICAL` | Aircraft Carriers | `ship_hull_carrier carrier` | Minas Gerais, São Paulo, Guanabara, Todos os Santos, Paranaguá, Harpia, Gavião, Carcará, Condor, Urubu-Rei |

---

### Universal Thematic Topic Category (Ship Designer)

Universal selection pools available for any ship hull or squadron in the Ship Designer:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `BRA_CITIES` | Cities | Universal | Rio de Janeiro, São Paulo, Salvador, Recife, Fortaleza, Belo Horizonte, Belém, Curitiba, Porto Alegre, Santos |
| `BRA_STATES` | States | Universal | Minas Gerais, São Paulo, Rio de Janeiro, Bahia, Rio Grande do Sul, Pernambuco, Ceará, Pará, Maranhão, Santa Catarina |
| `BRA_RIVERS` | Rivers | Universal | Amazonas, São Francisco, Paraná, Tocantins, Araguaia, Xingu, Tapajós, Madeira, Rio Negro, Tietê, Paraíba do Sul |
| `BRA_HEROES` | Heroes | Universal | Tamandaré, Barroso, Caxias, Tiradentes, Deodoro, Floriano, Marcílio Dias, Lord Cochrane, Plácido de Castro, Anita Garibaldi |
| `BRA_INDIGENOUS` | Indigenous Tribes | Universal | Tupi, Guarani, Tupinambá, Tamoio, Timbira, Tabajara, Aimoré, Potiguar, Carijó, Xavante, Ajuricaba, Sepé Tiaraju |
| `BRA_BATTLES` | Battles | Universal | Riachuelo, Guararapes, Passo da Pátria, Humaitá, Tuiutí, Itororó, Avaí, Campo Grande, Monte Castelo, Montese |
| `BRA_FAUNA` | Fauna | Universal | Harpia, Gavião, Carcará, Condor, Águia, Onça-Pintada, Jaguar, Puma, Sucuri, Jacaré-Açu, Pirarucu, Lobo-Guará |
