# Mexico (MEX) Ship Namelists

Source file: `common/units/names_ships/MEX_ship_names.txt`

---

## Overview

The *Armada de México* (Mexican Navy) trace their origins to the War of Independence and the historic capture of the Spanish stronghold of San Juan de Ulúa in November 1825 under Commodore Pedro Sainz de Baranda. Throughout the 19th and early 20th centuries, Mexico maintained an active coastal gunboat and transport fleet (*Zaragoza*, *Bravo*, *Morelos*, *Veracruz*), and in April 1914 saw naval action during the defense of Veracruz against US landing forces and the naval engagement at the Battle of Topolobampo. During the interwar and Cárdenas administrations, modern gunboats and escorts (*Guanajuato*, *Durango*, *Querétaro*, *Potosí*) were ordered from Spanish and domestic yards, followed by World War II convoy escort and anti-submarine operations in the Gulf of Mexico following the sinking of the tankers *Potrero del Llano* and *Faja de Oro*.

In vanilla Hearts of Iron IV, Mexico's ship namelist file (`MEX_ship_names.txt`) suffered from extensive structural and historical issues:
- **Verbatim Cruiser Cloning:** Light cruisers (`MEX_CL_HISTORICAL`) and heavy cruisers (`MEX_CA_HISTORICAL`) were verbatim identical 16-name lists.
- **Verbatim Capital Ship Cloning:** Battleships (`MEX_BB_HISTORICAL`) and battlecruisers (`MEX_BC_HISTORICAL`) were verbatim identical 8-name lists.
- **Submarine Roster Duplication:** Submarines (`MEX_SS_HISTORICAL`) was an exact duplicate of the admirals/heroes subset from the destroyer roster.
- **Doctrinal Blur & Kitchen Sink Lists:** Destroyers mixed Aztec emperors, admirals, state names, rivers, and weather descriptors in a single unstructured list.
- **Severe Typographical & Date Errors:** Included corrupted names like `"Chuela"` (likely intended as Cholula), `"Zacatacas"` (Zacatecas), and the anachronistic `"18 de Mayo"` (instead of Cinco de Mayo).
- **Inconsistent Nahuatl Diacritics:** Inconsistent accents between lists (e.g. *Quetzalcóatl* vs. *Quetzalcoatl*, *Netzahualcóyotl* vs. *Nezahualcoyotl*).
- **Mixed Deities and Monarchs:** Vanilla `MEX_AZTECS` blended mythic deities with historical tlatoanis.
- **Missing Fallback Names:** Thematic pools lacked fallback naming templates.

**ISNE** completely overhauls Mexican naval namelists into a clean 19-group architecture:
- Merging BB and BC into a cohesive capital ship roster covering historical regions and states.
- Providing dedicated, doctrine-aligned rosters across all combat hulls.
- Establishing 13 universal thematic pools in the Ship Designer.
- **Authenticity over Artificial Padding:** The `MEX_ADMIRALS` roster contains 25 verified historical naval commanders from independence through the mid-20th century. In accordance with ISNE guidelines, this list prioritizes 100% verified historical figures over synthetic or fabricated filler.
- **Ideological Separation:** Slogans and concepts from opposing political paths are strictly segregated into dedicated pools for Republican, Socialist, and Nationalist ideals.

---

## Namelist Groups

### Ship-Type Specific Category

Dedicated namelists tied to specific ship hulls and naval classifications:

| Group Tag | Type | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `MEX_DD_HISTORICAL` | Destroyers & Escorts | `ship_hull_light destroyer` | Juan Aldama, Mariano Matamoros, Hermenegildo Galeana, Francisco Xavier Mina, Santos Degollado, Jesús González Ortega, Felipe Ángeles, Salvador Alvarado, Lucio Blanco, Manuel Diéguez |
| `MEX_SS_HISTORICAL` | Submarines | `ship_hull_submarine submarine` | Tiburón, Delfín, Ballena, Manta, Raya, Pulpo, Cachalote, Barracuda, Pez Espada, Tláloc, Chalchiuhtlicue, Chaac, Huixtocíhuatl, Opochtli, Atlaua, Amimitl |
| `MEX_CL_HISTORICAL` | Light Cruisers | `ship_hull_cruiser light_cruiser` | Ensenada, Guaymas, Mazatlán, San Blas, Puerto Vallarta, Manzanillo, Acapulco, Salina Cruz, Tampico, Tuxpan, Veracruz, Coatzacoalcos, Campeche, Progreso, Chetumal |
| `MEX_CA_HISTORICAL` | Heavy Cruisers | `ship_hull_cruiser heavy_cruiser` | Miguel Hidalgo, José María Morelos, Benito Juárez, Ignacio Zaragoza, Francisco I. Madero, Venustiano Carranza, Álvaro Obregón, Cuauhtémoc, Cuitláhuac, Nezahualcóyotl, Moctezuma |
| `MEX_BB_HISTORICAL` | Battleships & Battlecruisers | `ship_hull_heavy battleship battle_cruiser` | Anáhuac, Nueva España, Nueva Galicia, Tenochtitlan, Aztlán, México, Jalisco, Puebla, Veracruz, Sonora, Chihuahua, Nuevo León, Yucatán, Oaxaca, Michoacán |
| `MEX_CV_HISTORICAL` | Aircraft Carriers | `ship_hull_carrier carrier` | República, Independencia, Libertad, Democracia, Soberanía, Revolución, Constitución, Águila Real, Quetzal, Cóndor, Huitzilopochtli, Tonatiuh, Ehécatl |

---

### Universal Thematic Topic Category (Ship Designer)

Universal selection pools available for any ship hull or squadron in the Ship Designer:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `MEX_ADMIRALS` | Admirals | Universal | Pedro Sainz de Baranda, David Porter, Virgilio Uribe, Blas Godínez, Tomás Marín, Manuel Azueta, José Azueta, Othón P. Blanco, Hilario Rodríguez Malpica, Sebastián José Holzinger |
| `MEX_SAINTS` | Saints | Universal | San Juan de Ulúa, San Blas, Santa Cruz, San Ignacio, San Francisco Javier, Santo Tomás, San Telmo, Santa Bárbara, San Miguel, San Gabriel, San Rafael, Virgen de Guadalupe |
| `MEX_PORTS` | Ports | Universal | Ensenada, Guaymas, Mazatlán, San Blas, Puerto Vallarta, Manzanillo, Zihuatanejo, Acapulco, Salina Cruz, Tampico, Tuxpan, Veracruz, Coatzacoalcos, Campeche, Progreso |
| `MEX_WATERS` | Bodies of Water | Universal | Golfo de México, Golfo de California, Mar de Cortés, Bahía de Banderas, Bahía de Acapulco, Laguna de Términos, Laguna de Chapala, Lago de Pátzcuaro, Canal de Yucatán |
| `MEX_RULERS` | Monarchs & Rulers | Universal | Acamapichtli, Itzcóatl, Moctezuma Ilhuicamina, Axayácatl, Nezahualcóyotl, Agustín de Iturbide, Maximiliano, Antonio de Mendoza, Bernardo de Gálvez, Carlos V, Felipe II |
| `MEX_REPUBLICAN_IDEALS` | Republican Ideals | Universal | República, Independencia, Libertad, Democracia, Soberanía, Constitución, Sufragio Efectivo, No Reelección, Pacto Federal, Estado Laico, Garantías Individuales |
| `MEX_SOCIALISM` | Socialist Ideals | Universal | Justicia Social, Reforma Agraria, Tierra y Libertad, Derechos Obreros, Educación Laica, Solidaridad Obrera, Emancipación Proletaria, Comuna, Sindicato, Expropiación Petrolera |
| `MEX_NATIONALISM` | Nationalist Ideals | Universal | Viva Cristo Rey, Sinarquismo, Hispanidad, Tradición, Patria y Fe, Dios Patria Libertad, Cruzada, Orden Nuevo, Disciplina, Camisas Doradas, Imperio Mexicano, Raza Cósmica |
| `MEX_MYTHOLOGY` | Mythology | Universal | Quetzalcóatl, Tezcatlipoca, Tláloc, Huitzilopochtli, Xipe Tótec, Mictlantecuhtli, Kukulkán, Chaac, Ixchel, Itzamná, Ah Puch, Kinich Ahau, Hunahpú, Ixbalanqué |
| `MEX_BIRDS` | Birds | Universal | Águila Real, Águila Arpía, Quetzal, Halcón Peregrino, Cóndor, Gavilán, Zopilote, Búho, Lechuza, Gaviota, Pelícano, Albatros, Flamenco, Tucán, Guacamaya |
| `MEX_STATES` | States | Universal | México, Distrito Federal, Jalisco, Puebla, Guanajuato, Chiapas, Nuevo León, Michoacán, Oaxaca, Chihuahua, Guerrero, Tamaulipas, Veracruz, Yucatán, Sinaloa |
| `MEX_CITIES` | Cities | Universal | Ciudad de México, Guadalajara, Puebla, Tijuana, León, Monterrey, Culiacán, Mérida, San Luis Potosí, Hermosillo, Saltillo, Querétaro, Morelia, Toluca, Oaxaca |
| `MEX_RIVERS` | Rivers | Universal | Río Bravo, Río Colorado, Río Lerma, Río Balsas, Río Usumacinta, Río Grijalva, Río Papaloapan, Río Coatzacoalcos, Río Pánuco, Río Yaqui, Río Mayo, Río Fuerte |
