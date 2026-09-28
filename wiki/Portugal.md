# Portugal (POR) Ship Namelists

Source file: `common/units/names_ships/POR_ship_names.txt`

---

## Overview

The Portuguese Navy (*Marinha Portuguesa*), operating under the *Navio da República Portuguesa* (`NRP`) prefix adopted after the 1910 revolution, drew on centuries of Age-of-Discovery seafaring tradition alongside a modest but persistent interwar modernization effort. The 1912 Naval Program envisioned dreadnoughts, scout cruisers, destroyers and submarines but was cut back sharply after only a year; the more modest 1930 Programa Naval, carried out under Navy Minister Aníbal de Mesquita Guimarães from 1932, delivered the *Vouga*-class river-named destroyers, *Delfim*-class marine-life-named submarines, and navigator-named avisos that anchor this mod's destroyer and escort roster. Portugal remained neutral for most of World War II but maintained a colonial navy spanning Angola, Mozambique, Portuguese Guinea, Cape Verde, São Tomé e Príncipe, Goa, Macau and Timor, giving its heavy cruiser doctrine a distinctly imperial character.

In vanilla Hearts of Iron IV, the Portuguese namelist file suffered from a severe content-integrity bug well beyond a simple copy-paste error:
- **Mislabeled & Foreign Content**: The file's header comment read `##### ARGENTINA NAME LISTS #####`, and its battleship roster (`POR_BB_HISTORICAL`) was not Argentine *or* Portuguese — it was a near-complete list of real Brazilian Navy ship/state names (*Minas Gerais*, *São Paulo*, *Santa Catarina* [duplicated], *Rio de Janeiro*, *Maranhão*, and 20 more Brazilian states), likely because the real 1912 Portuguese dreadnought program was informally called the "Minas Gerais type" after the Brazilian design it copied.
- **Verbatim Cross-Class Cloning**: `POR_CL_HISTORICAL` and `POR_CA_HISTORICAL` shared an identical 6-name roster, leaving light and heavy cruisers indistinguishable in the Ship Designer.
- **Missing Diacritics & Typos**: Names like "Tamega", "Nazare", "Marinha Granda", "Principe Real" and the anglicized "St Sebastiao" were missing accents or misspelled.
- **Mistranslated Fallback**: The battlecruiser fallback `"Cuzador Couraçado %d"` was both a typo and a mistranslation — *cruzador couraçado* means *armoured cruiser*, not *battlecruiser*.
- **Word-Order Calque**: The vanilla battlecruiser entry "Novo Estado" inverted the real Estado Novo regime name.
- **Severe Depth Deficits**: All hulls fell far short of ISNE's tiered depth standards (13 destroyers, 11 submarines, 6 cruisers of each type, 3 battlecruisers), and no universal thematic pools existed.

*Immersive Ship Names Expanded* provides complete, historically and linguistically authentic namelists for Portugal, featuring 7 expanded ship-type specific groups (431 names) and 7 universal thematic/ideological pools for the Ship Designer, fully decoupled with zero cross-class name collisions. Destroyers draw on the historical river-naming tradition (*contratorpedeiro*) alongside Age-of-Discovery navigators and 19th-20th century naval officers; submarines continue the authentic marine-life tradition; light cruisers cover metropolitan and island ports, while heavy cruisers cover the colonial empire's ports (Angola, Mozambique, Guinea, Cape Verde, São Tomé, Goa, Macau, Timor); battleships draw on sovereignty symbols, historical provinces and founding monarchs; battlecruisers draw on Age-of-Discovery flagships, decisive naval battles and colonial fortresses; and carriers draw on naval aviation pioneers and celestial navigation terminology. All ships carry the historical prefix `NRP ` (*Navio da República Portuguesa*), matching vanilla convention.

---

## Namelist Groups

### Ship-Type Specific Category

| Group Tag | Type | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `POR_DD_HISTORICAL` | Destroyers & Escorts | `ship_hull_light destroyer` | Douro, Tâmega, Vouga, Lima, Dão, Tejo, Lis, Guadiana, Zambeze, Limpopo, Gil Eanes, Nuno Tristão, Diogo Cão, Bartolomeu Dias, Afonso de Albuquerque, Dom Francisco de Almeida, Carvalho Araújo, Ferreira do Amaral |
| `POR_SS_HISTORICAL` | Submarines | `ship_hull_submarine submarine` | Delfim, Espadarte, Golfinho, Narval, Náutilo, Albacora, Barracuda, Cachalote, Tubarão, Orca, Baleia, Atum, Robalo, Polvo, Lagosta |
| `POR_CL_HISTORICAL` | Light Cruisers | `ship_hull_cruiser light_cruiser` | Matosinhos, Vila Nova de Gaia, Figueira da Foz, Marinha Grande, Nazaré, Setúbal, Sesimbra, Faro, Lagos, Funchal, Ponta Delgada, Angra do Heroísmo |
| `POR_CA_HISTORICAL` | Heavy Cruisers & Coastal Defense | `ship_hull_cruiser heavy_cruiser` | Luanda, Lobito, Benguela, Lourenço Marques, Beira, Ilha de Moçambique, Bissau, Cidade de São Tomé, Nova Goa, Macau, Díli, Ceuta, Mombaça |
| `POR_BB_HISTORICAL` | Battleships | `ship_hull_heavy battleship` | Portugal, Lusitânia, Restauração, Entre-Douro-e-Minho, Beira Alta, Estremadura, Algarve, Açores, Madeira, Angola, Moçambique, Lisboa, Porto, Afonso Henriques, Dom Manuel I, Infante Dom Henrique |
| `POR_BC_HISTORICAL` | Battlecruisers | `ship_hull_heavy battle_cruiser` | São Gabriel, São Rafael, Bérrio, Flor de la Mar, Príncipe Real, Vasco da Gama, Diu, Goa, Malaca, Cabo de São Vicente, São Jorge da Mina, Sagres, Mazagão |
| `POR_CV_HISTORICAL` | Aircraft Carriers | `ship_hull_carrier carrier` | Gago Coutinho, Sacadura Cabral, Bartolomeu de Gusmão, Pátria, Santa Cruz, Argos, Alverca, Amadora, Cruzeiro do Sul, Estrela Polar, Astrolábio, Rosa dos Ventos, Aurora |

---

### Universal Thematic Topic Category (Ship Designer)

Universal selection pools available for any ship hull or squadron:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `POR_BIRDS` | Birds | Universal | Águia-Real, Falcão-Peregrino, Milhafre, Grifo, Bufo-Real, Coruja, Gaivota, Albatroz, Cagarra, Garça, Cegonha, Flamingo, Rouxinol, Pega-Azul |
| `POR_AQUATIC` | Aquatic Life | Universal | Faneca, Abrótea, Boga, Salema, Estrela-do-Mar, Búzio, Caranguejo, Amêijoa, Mexilhão, Ostra, Percebe, Camarão, Vieira, Água-Viva |
| `POR_LEGENDS` | Legends | Universal | Endovélico, Ataegina, Luso, Ulisses, Adamastor, Tágides, Encoberto, Desejado, Quinto Império, Bandarra, Moura Encantada, Lobisomem, Galo de Barcelos, Antília, Sete Cidades |
| `POR_HEROES` | Heroes | Universal | Camões, Fernando Pessoa, Gil Vicente, Alexandre Herculano, Eça de Queirós, Garcia de Orta, Marquês de Pombal, Egas Moniz, Inês de Castro, Mouzinho de Albuquerque, Serpa Pinto |
| `POR_VIRTUES` | Virtues & Traditions | Universal | Honra, Glória, Lealdade, Coragem, Fé, Vitória, Fortaleza, Perseverança, Intrépido, Destemido, Invicta, Vingança, Minerva |
| `POR_MONARCHS` | Monarchs | Universal | Dom Sancho I, Dom Afonso IV, Dom Pedro I, Dom Duarte, Dom Sebastião, Dom João IV, Dom José I, Dona Maria I, Dom Pedro IV, Dom Luís I, Dom Carlos I, Rainha Dona Amélia |
| `POR_ESTADO_NOVO` | Estado Novo | Universal | Estado Novo, Revolução Nacional, Vinte e Oito de Maio, Império, Ultramar, Acto Colonial, Mundo Português, Mocidade Portuguesa, Gomes da Costa, Marechal Carmona, Américo Tomás |

---

## Historical Notes & Vanilla Fixes

- **Content-Integrity Purge**: The vanilla header's false "ARGENTINA NAME LISTS" claim was corrected, and all 25 unique real Brazilian Navy ship/state names (26 entries, including one duplicate) in the battleship roster were purged and replaced with authentic Portuguese sovereignty symbols, historical provinces, overseas territories and founding monarchs.
- **Cross-Class Decoupling**: `POR_CL_HISTORICAL` (metropolitan/island ports) and `POR_CA_HISTORICAL` (colonial/imperial ports) were split into fully independent rosters; `POR_BB_HISTORICAL` (sovereignty/provinces/founders) and `POR_BC_HISTORICAL` (Age-of-Discovery flagships/naval battles/fortresses) follow distinct doctrines per ISNE's Capital Ship Doctrine Specialization standard. Verified with zero overlapping names across `CL`/`CA`/`BB`/`BC`/`CV` via an automated set-intersection check.
- **Diacritic & Spelling Restoration**: Fixed `Tamega`→`Tâmega`, `Nazare`→`Nazaré`, `Marinha Granda`→`Marinha Grande`, `Principe Real`→`Príncipe Real`, and dropped the anglicized `St Sebastiao` in favor of proper Portuguese forms.
- **Fallback Terminology**: Corrected the vanilla battlecruiser fallback `"Cuzador Couraçado %d"` (a typo for *armoured cruiser*, not *battlecruiser*) to the authentic term `"Cruzador de Batalha %d"`. Battleship fallback uses the European Portuguese `"Couraçado %d"`, deliberately distinct from ISNE_BRA's Brazilian Portuguese `"Encouraçado %d"`.
- **Word-Order Calque**: Vanilla's inverted "Novo Estado" was corrected to the real regime name "Estado Novo" and relocated to the dedicated `POR_ESTADO_NOVO` ideological pool.
- **Prefix**: Retained vanilla's `NRP ` (*Navio da República Portuguesa*) prefix for parity across all groups, including the new thematic pools.
- **Scope Note**: This pass authors a moderate set of 7 universal thematic pools (author decision), consolidating colonial content into the `CA` roster rather than a separate pool. A future expansion could add the dossier-supported `Cities`, `Islands`, `Landmarks`, `Battles`, `Elements`, `Republic` (First Republic, 1910-26), `Monarchism` (restoration path) and `Socialism` (PCP/CGT labor movement) pools without touching the ship-type specific groups. `POR_ESTADO_NOVO` deliberately excludes the sitting dictator's personal name (Salazar) and the Tarrafal concentration camp, using regime concepts, events and non-contentious figures instead — an intentionally shorter, authenticity-first roster rather than one padded to the general 35-60 thematic target.
