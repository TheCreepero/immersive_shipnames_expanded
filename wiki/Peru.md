# Peru (PRU) Ship Namelists

Source file: `common/units/names_ships/PRU_ship_names.txt`

---

## Overview

The *Marina de Guerra del Perú* dates from the independence squadron of 1821, when Martín Jorge Guise took command of the ships left by San Martín's liberating expedition. Ramón Castilla gave the republic a steam navy in the 1840s and 1850s: the paddle steamer *Rímac* (1848) and the frigates *Amazonas* and *Apurímac*. The ironclads *Huáscar* and *Independencia* and the corvettes *Unión* and *América* followed during the war with Spain, which ended with the combats of Abtao and Dos de Mayo in 1866. The War of the Pacific (1879-1883) destroyed that fleet and gave the navy its roll of honour: Miguel Grau and the officers of the *Huáscar*, lost at Angamos on 8 October 1879.

The twentieth-century navy was small. It had the Vickers scout cruisers *Almirante Grau* and *Coronel Bolognesi* (1906-07), the French-built submarines *Teniente Ferré* and *Teniente Palacios* (1911-13), four Electric Boat R-class submarines (1926-28), and the destroyers *Almirante Guise* and *Almirante Villar*, bought from Estonia in 1933. A separate river flotilla served on the Amazon from the 1860s; its gunboat *América* fought at La Pedrera in 1911. Later classes kept reusing the same names: officers of 1879 for destroyers and frigates, battles for submarines, ports for transports and landing ships.

In vanilla Hearts of Iron IV, Peru's ship namelist file (`PRU_ship_names.txt`) had these problems:
- **Cloned cruisers:** light cruisers (`PRU_CL_HISTORICAL`) and heavy cruisers (`PRU_CA_HISTORICAL`) were the same 10-name list.
- **Cloned capital ships:** battleships (`PRU_BB_HISTORICAL`) and battlecruisers (`PRU_BC_HISTORICAL`) were the same 3-name list.
- **Shared hero names:** *Coronel Bolognesi*, *Capitán Quiñones* and *Aguirre* appeared in destroyers and in both cruiser lists.
- **Missing diacritics and a duplicate:** `Ferre`, `Capitán Quinones`, and `Angamos` twice in the submarine list.
- **An untraceable name:** `Gloriosa`, which matches no Peruvian warship.
- **Thin lists:** 3 carriers, 3 battleships, 12 destroyers and 12 submarines.

**ISNE** rebuilds the Peruvian namelists as 22 groups:
- **Hull lists follow the navy's own formulas.** Destroyers carry naval officers and the small craft of the old navy. Submarines carry the pioneers, the R-class names and battles. Light cruisers carry the historic cruisers, ports and cities. Heavy cruisers carry the ironclads and monitors, Inca war captains and national champions.
- **Battleships and battlecruisers are split by doctrine.** Battleships carry the capital and departments, the founders of the Republic, the Grand Marshals and sovereignty symbols. Battlecruisers carry historic flagships, coastal fortresses and citadels, naval encounters, islands and the sea kingdoms of the coast. No name is shared between them.
- **Carriers** carry Andean ranges and peaks, sky deities, raptors and aviation pioneers.
- **A River Gunboats role pool** holds the names of the Amazon and Titicaca flotilla, extended with further Amazon tributaries in the flotilla's own river formula.
- **Three ideological pools are gated by government through `can_use`.** Republican Ideals is available under democratic or non-aligned governments, because Peru's non-aligned government is the constitutional republic. Socialist Ideals requires communism. Nationalist Ideals requires fascism. APRA names are left out, since the party fits none of the game's ideologies cleanly.
- **Authenticity over padding:** the Nationalist Ideals pool holds 20 names, because few names are specific to the Unión Revolucionaria. It stays short rather than being padded.
- The vanilla prefix `BAP ` is kept on every group.

---

## Namelist Groups

### Ship-Type Specific Category

Dedicated namelists tied to specific ship hulls and naval classifications:

| Group Tag | Type | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `PRU_DD_HISTORICAL` | Destroyers & Escorts | `ship_hull_light destroyer` | Almirante Guise, Almirante Villar, Teniente Rodríguez, Castilla, Palacios, Ferré, García y García, Carvajal, Villavicencio, Montero, Pilcomayo, República, Chasqui, Relámpago |
| `PRU_SS_HISTORICAL` | Submarines | `ship_hull_submarine submarine` | Toro Submarino, Federico Blume, Teniente Ferré, Teniente Palacios, Islay, Casma, Pacocha, Arica, Dos de Mayo, Abtao, Angamos, Iquique, La Pedrera, Tiburón, Cachalote |
| `PRU_CL_HISTORICAL` | Light Cruisers | `ship_hull_cruiser light_cruiser` | Almirante Grau, Coronel Bolognesi, Capitán Quiñones, Aguirre, Callao, Paita, Chimbote, Salaverry, Pisco, Mollendo, Arequipa, Cusco, Trujillo, Chiclayo |
| `PRU_CA_HISTORICAL` | Heavy Cruisers | `ship_hull_cruiser heavy_cruiser` | Huáscar, Independencia, Manco Cápac, Atahualpa, Pachacútec, Túpac Yupanqui, Cahuide, Túpac Amaru, Micaela Bastidas, Mateo Pumacahua, José Olaya, Alfonso Ugarte, Leoncio Prado |
| `PRU_BB_HISTORICAL` | Battleships | `ship_hull_heavy battleship` | Lima, Áncash, Junín, Ayacucho, Cajamarca, La Libertad, Tarapacá, San Martín, Bolívar, Sucre, Mariscal Castilla, Mariscal Cáceres, Perú, República del Perú, Tahuantinsuyo |
| `PRU_BC_HISTORICAL` | Battlecruisers | `ship_hull_heavy battle_cruiser` | Protector, Libertad, Apurímac, Rímac, Unión, Real Felipe, Morro de Arica, Sacsayhuamán, Ollantaytambo, Chan Chan, Machu Picchu, Punta Gruesa, Jambelí, Isla San Lorenzo, Chimor |
| `PRU_CV_HISTORICAL` | Aircraft Carriers | `ship_hull_carrier carrier` | Los Andes, Cordillera Occidental, Cordillera Blanca, Huascarán, Yerupajá, Alpamayo, Salcantay, Misti, Inti, Illapa, Viracocha, Cóndor, Halcón, Jorge Chávez, Juan Bielovucic |

---

### Role-Specific Category

Universal pools for ship roles that have no hull token of their own:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `PRU_GUNBOATS` | River Gunboats | Universal | Loreto, Amazonas, Napo, Putumayo, Morona, Pastaza, América, Iquitos, Coronel Portillo, Yavarí, Yapurá, Marañón, Ucayali, Huallaga |

---

### Universal Thematic Topic Category (Ship Designer)

Universal selection pools available for any ship hull or squadron in the Ship Designer:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `PRU_CITIES` | Cities & Ports | Universal | Callao, Paita, Talara, Salaverry, Chimbote, Pisco, Mollendo, Ilo, Lima, Trujillo, Chiclayo, Arequipa, Cusco, Cajamarca, Huancayo, Puno, Iquitos |
| `PRU_DEPARTMENTS` | Departments & Regions | Universal | Amazonas, Áncash, Apurímac, Arequipa, Cusco, Junín, La Libertad, Loreto, Madre de Dios, Tacna, Tarapacá, Maynas, Tahuantinsuyo, Chinchaysuyo, Antisuyo, Collasuyo |
| `PRU_RIVERS` | Rivers & Lakes | Universal | Río Amazonas, Río Marañón, Río Ucayali, Río Huallaga, Río Napo, Río Urubamba, Río Mantaro, Río Rímac, Río Chira, Río Santa, Lago Titicaca, Lago Junín |
| `PRU_GEOGRAPHY` | Mountains | Universal | Huascarán, Huandoy, Alpamayo, Yerupajá, Siula Grande, Salcantay, Ausangate, Coropuna, Misti, Chachani, Ubinas, Los Andes, Cordillera Blanca, Cordillera Huayhuash |
| `PRU_RULERS` | Incas & Rulers | Universal | Manco Cápac, Sinchi Roca, Mayta Cápac, Inca Roca, Pachacútec, Túpac Yupanqui, Huayna Cápac, Huáscar, Atahualpa, Manco Inca, Sayri Túpac, Mama Ocllo, Naylamp, Tacaynamo |
| `PRU_MYTHOLOGY` | Mythology | Universal | Viracocha, Inti, Mama Quilla, Pachamama, Illapa, Mama Cocha, Pachacámac, Supay, Amaru, Pariacaca, Cuniraya, Cahuillaca, Ai Apaec, Yacumama, Chullachaqui |
| `PRU_BATTLES` | Battles | Universal | Junín, Ayacucho, Zepita, Abtao, Dos de Mayo, Iquique, Punta Gruesa, Angamos, Tarapacá, Alto de la Alianza, Arica, Miraflores, Huamachuco, La Pedrera, Zarumilla |
| `PRU_HEROES` | Heroes & Scholars | Universal | Túpac Amaru II, Micaela Bastidas, Mateo Pumacahua, José Olaya, Ramón Castilla, Miguel Grau, Francisco Bolognesi, Alfonso Ugarte, Andrés Avelino Cáceres, Jorge Chávez, Hipólito Unanue, Ricardo Palma |
| `PRU_BIRDS` | Birds | Universal | Cóndor, Águila Mora, Halcón Peregrino, Cernícalo, Guanay, Piquero, Pelícano, Zarcillo, Gallito de las Rocas, Picaflor, Parihuana, Guacamayo, Tucán, Paujil |
| `PRU_FISH` | Aquatic Life | Universal | Anchoveta, Bonito, Jurel, Corvina, Lenguado, Pez Espada, Merlín Negro, Tiburón, Cachalote, Orca, Lobo Marino, Paiche, Gamitana, Bufeo, Manatí |
| `PRU_VIRTUES` | Virtues | Universal | Intrépido, Vencedor, Valiente, Audaz, Invencible, Indomable, Heroico, Leal, Valor, Honor, Gloria, Lealtad, Victoria, Fortaleza, Constancia |
| `PRU_REPUBLICAN_IDEALS` | Republican Ideals | Universal (democratic or non-aligned) | República, Constitución, Congreso Constituyente, Veintiocho de Julio, Independencia, Libertad, Soberanía, Igualdad, Justicia, Sánchez Carrión, Luna Pizarro, Vidaurre |
| `PRU_SOCIALISM` | Socialist Ideals | Universal (communism) | José Carlos Mariátegui, González Prada, Amauta, Siete Ensayos, Ocho Horas, Huelga General, Primero de Mayo, Proletariado, Solidaridad, Indigenismo, Ayllu, Ayni, Minka |
| `PRU_NATIONALISM` | Nationalist Ideals | Universal (fascism) | Unión Revolucionaria, Sánchez Cerro, Revolución de Arequipa, Camisas Negras, Peruanidad, Hispanidad, Nacionalismo, Orden, Autoridad, Jerarquía, Tradición |
