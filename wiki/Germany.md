# Germany (GER) Ship Namelists

Source file: `common/units/names_ships/GER_ship_name.txt` (vanilla's own file name, without the plural "names")

---

## Overview

Three German navies named ships between 1871 and 1945, and each had formulas of its own.

The **Kaiserliche Marine** (1871–1918) sailed under the prefix *SMS* (*Seiner Majestät Schiff*). The Kaiser chose the names:
- **Linienschiffe** after German states, provinces, ruling houses and rulers: *Brandenburg*, *Wittelsbach*, *Kaiser Friedrich III.*, *Nassau*, *Helgoland*, *König*, *Bayern*.
- **Große Kreuzer** after generals and admirals: *Roon*, *Yorck*, *Scharnhorst*, *Blücher*, *Von der Tann*, *Moltke*, *Seydlitz*, *Derfflinger*, *Hindenburg*.
- **Kleine Kreuzer** after figures of classical myth at first (*Gazelle*, *Niobe*, *Medusa*), from 1903 after cities (*Bremen*, *Emden*, *Königsberg*, *Cöln*).
- **Coastal defence ships** after the heroes of the sagas (*Siegfried*, *Beowulf*, *Hagen*), **gunboats** after beasts and insects (*Iltis*, *Panther*, *Wespe*, *Hummel*), **avisos** after swift things (*Blitz*, *Pfeil*, *Jagd*).
- **Torpedo boats and submarines** had no names. A torpedo boat carried the letter of its yard and a number (*V 25*, *S 90*, *G 101*), a submarine the letter U.

The **Reichsmarine** (1921–1935) used no prefix. Its new cruisers took the names of cruisers lost in the war (*Emden*, *Königsberg*, *Karlsruhe*, *Köln*, *Leipzig*, *Nürnberg*), its torpedo boats of 1923 and 1924 the names of birds and beasts of prey (*Falke*, *Seeadler*, *Wolf*, *Tiger*), and its Panzerschiffe began with *Deutschland* and went on with admirals (*Admiral Scheer*, *Admiral Graf Spee*).

The **Kriegsmarine** (1935–1945) named its battleships *Scharnhorst*, *Gneisenau*, *Bismarck* and *Tirpitz* and its heavy cruisers *Admiral Hipper*, *Blücher*, *Prinz Eugen*, *Seydlitz* and *Lützow*. The first 22 destroyers carried the names of naval officers and men of 1914–18 (*Leberecht Maass*, *Georg Thiele*); from Z23 destroyers had numbers only, like the torpedo boats (T), minesweepers (M), fleet escorts (F) and submarines (U). The battleships of the H class never received names; *Ulrich von Hutten* and *Götz von Berlichingen* rest on a reported remark, *Friedrich der Große* and *Peter Strasser* (for the second carrier) on rumour.

In vanilla Hearts of Iron IV, Germany's ship namelist file had these problems:
- **Focus gates:** nearly every list depended on national focuses. When the Kaiser returned, the unprefixed lists were taken away, and the game then renamed the ships that used them.
- **Copied rosters:** the Panzerschiff list repeated the battlecruiser list, the auxiliary carrier list was the rivers pool, and the torpedo boat list repeated part of the animals pool.
- **Unverifiable names:** 24 of 30 battleship names were surnames of obscure knights and officials. Battlecruisers and Panzerschiffe carried Nazi Reichsgaue of 1938–41, and the cruiser and carrier lists held persons who were alive in 1936.
- **Anachronisms:** towns founded after 1936 (*Wolfsburg*, *Salzgitter*, *Eisenhüttenstadt*, *Norderstedt*) and slogans of post-war parties.
- **Invented designations:** the Imperial destroyer list held 100 made-up boat numbers (*G 200* to *T 299*), and the Imperial battleship and battlecruiser lists held cruiser names and one ship split into two (*Schleswig*, *Holstein*).
- **Misspellings:** *York*, *Herta*, *Skaggerak*, *Garmisch-Patenkirchen*, *Orbotrit*, *Max Immelman*, and three of the destroyer namesakes (*Eckholdt*, *Kühne*, *Schmidt* for *Eckoldt*, *Künne*, *Schmitt*).

**ISNE** rebuilds the German namelists as 102 groups in two sets:
- **The main set carries no prefix and no gate.** It serves every government, so no change of government renames the fleet. It has seven hull lists, ten role pools, thirty thematic pools and six ideology pools.
- **Numbered types keep their numbers**, as the German navies numbered them. Destroyers carry the 22 names of 1934–36 (*Z1 Leberecht Maass* to *Z22 Anton Schmitt*) and numbers from *Z23*. Submarines, torpedo boats, minesweepers and fleet escorts are numbered (*U-18*, *T1*, *M1*, *F1*). The lists keep vanilla's entry numbers, because the 1939 start names its destroyers, torpedo boats and submarines by them. The destroyer namesakes also form the pool Naval Heroes.
- **Ships the game starts with stand last in their lists** (*Emden* to *Nürnberg*, *Schlesien*, *Schleswig-Holstein*, *Deutschland*), as in vanilla, so that new ships take other names first.
- **Cruisers, capital ships and carriers are split by formula.** Light cruisers carry cities. Heavy cruisers carry the Hipper class and the commanders of Frederick's wars and the Wars of Liberation. Battleships carry the Kriegsmarine's four, the Linienschiffe the Reichsmarine kept, states and provinces. Battlecruisers carry the Große Kreuzer names the Kriegsmarine left free, field marshals and historic flagships. Carriers carry *Graf Zeppelin* and airmen. No name is shared between these lists.
- **Ten role pools:** Panzerschiffe (admirals), Torpedo Boats, Minesweepers, Fleet Escorts, Merchant Raiders, Auxiliary Carriers, Minelayers, Gunboats & Avisos, Tenders and Scout Cruisers (towns). Six of them keep vanilla's tags, because vanilla assigns three of them to starting ships and a decision.
- **Vanilla's five thematic pools are kept under their tags and repaired**, and 25 pools are new.
- **Ideology pools are gated by government only.** Vanilla's three communist pools lose their focus gate, persons alive in 1936 and opponents of the revolution. New are two democratic pools, one fascism pool and two monarchist pools.
- **The Imperial set (`SMS `) is open to non-aligned and democratic Germany** and mirrors the main set; see the last table.

### Compatibility

Jackhall's *German Ship Names*, Vanilla Navy Rework, Road to 56, Kaiserreich and The New Order each ship a German ship namelist under the same file name, so the mod that loads last names Germany's ships. Use the load order to choose.

---

## Namelist Groups

### Ship-Type Specific Category

Dedicated namelists tied to specific ship hulls and naval classifications:

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `GER_DD_HISTORICAL` | Historical Destroyers | `ship_hull_light destroyer` | Z1 Leberecht Maass, Z2 Georg Thiele, Z3 Max Schultz, Z51, Z100 |
| `GER_SS_HISTORICAL` | Historical Submarines | `ship_hull_submarine submarine` | U-18, U-19, U-20, U-84, U-150 |
| `GER_CL_HISTORICAL` | Historical Light Cruisers | `ship_hull_cruiser light_cruiser` | München, Berlin, Hamburg, Stuttgart, Bremen, Lübeck, Stettin, Dresden, Mainz, Augsburg, Magdeburg, Breslau |
| `GER_CA_HISTORICAL` | Historical Heavy Cruisers | `ship_hull_cruiser heavy_cruiser` | Admiral Hipper, Blücher, Prinz Eugen, Seydlitz, Lützow, Prinz Adalbert, Friedrich Carl, Prinz Heinrich, Hertha, Freya, Vineta, Zieten |
| `GER_BB_HISTORICAL` | Historical Battleships | `ship_hull_heavy battleship` | Scharnhorst, Gneisenau, Bismarck, Tirpitz, Friedrich der Große, Ulrich von Hutten, Götz von Berlichingen, Hannover, Hessen, Braunschweig, Elsaß, Lothringen |
| `GER_BC_HISTORICAL` | Historical Battlecruisers | `ship_hull_heavy battle_cruiser` | Von der Tann, Moltke, Goeben, Derfflinger, Hindenburg, Roon, Yorck, Clausewitz, Schlieffen, Waldersee, Blumenthal, Steinmetz |
| `GER_CV_HISTORICAL` | Historical Carriers | `ship_hull_carrier carrier` | Graf Zeppelin, Peter Strasser, Richthofen, Boelcke, Immelmann, Gunther Plüschow, Hans Rolshoven, Karl Meyer, Max Stinsky, Bernhard von Tschirschky, Hans Albrecht Wedel, Otto Lilienthal |

### Role-Specific Pools (Ship Designer)

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `GER_PZ_HISTORICAL` | Historical Panzerschiffs | Universal | Admiral Scheer, Admiral Graf Spee, Admiral Knorr, Admiral Stosch, Admiral Pohl, Admiral Capelle, Admiral Holtzendorff, Admiral Koester, Admiral Usedom, Admiral Hollmann, Admiral Ludwig von Schröder, Admiral Baudissin |
| `GER_TB_HISTORICAL` | Historical Torpedo Boats | Universal | T1, T2, T3, T107, Leopard |
| `GER_MS_HISTORICAL` | Historical Minesweepers | Universal | M1, M2, M3, M41, M80 |
| `GER_ESCORT_DESTROYERS` | Fleet Escorts | Universal | F1, F2, F3, F16, F30 |
| `GER_MR_HISTORICAL` | Merchant Raiders | Universal | Orion, Atlantis, Widder, Thor, Pinguin, Stier, Komet, Kormoran, Michel, Coronel, Hansa, Doggerbank |
| `GER_CVL_HISTORICAL` | Auxiliary Carriers | Universal | Weser, Jade, Elbe, Europa, Ausonia, Schwabenland, Friesenland, Answald, Santa Elena, Oswald, Ems, Eider |
| `GER_MINELAYERS` | Minelayers | Universal | Tannenberg, Hansestadt Danzig, Königin Luise, Kaiser, Roland, Cobra, Brummer, Bremse, Skagerrak, Ostmark, Drache, Juminda |
| `GER_GUNBOATS` | Gunboats & Avisos | Universal | Eber, Habicht, Adler, Hyäne, Fuchs, Hay, Jäger, Natter, Pfeil, Salamander, Schwalbe, Scorpion |
| `GER_TENDERS` | Tenders | Universal | Tsingtau, Tanga, Carl Peters, Adolf Lüderitz, Hermann von Wißmann, Gustav Nachtigal, Buea, Saar, Lech, Isar, Donau, Weichsel |
| `GER_CS_HISTORICAL` | Scout Cruisers | Universal | Dessau, Witten, Görlitz, Esslingen, Neumünster, Castrop-Rauxel, Gladbeck, Plauen, Lüdenscheid, Ludwigsburg, Worms, Gütersloh |

### Universal Thematic Topic Category (Ship Designer)

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `GER_THEME_ANIMALS` | Animals | Universal | Wolf, Iltis, Luchs, Tiger, Jaguar, Leopard, Panther, Löwe, Eber, Hyäne, Fuchs, Gepard |
| `GER_BIRDS` | Birds | Universal | Möwe, Seeadler, Albatros, Greif, Kondor, Falke, Bussard, Geier, Kormoran, Schwalbe, Sperber, Habicht |
| `GER_THEME_FISH` | Fish & Sea Life | Universal | Zander, Wels, Hering, Aal, Hecht, Flunder, Dorsch, Hai, Stachelrochen, Neunauge, Bitterling, Lachs |
| `GER_INSECTS` | Insects & Reptiles | Universal | Wespe, Viper, Biene, Mücke, Scorpion, Basilisk, Camaeleon, Crocodill, Salamander, Natter, Hummel, Brummer |
| `GER_NATURE` | Wind & Weather | Universal | Blitz, Pfeil, Strahl, Welle, Polarfront, Nordwind, Woge, Monsun, Orkan, Taifun, Sturm, Sturmwind |
| `GER_STARS` | Stars & Planets | Universal | Spica, Regulus, Nordstern, Nadir, Wega, Castor, Pollux, Orion, Komet, Meteor, Planet, Antares |
| `GER_THEME_RIVERS` | Rivers & Lakes | Universal | Weser, Jade, Elbe, Rhein, Recknitz, Neiße, Main, Trave, Uecker, Donau, Oder, Inn |
| `GER_PROVINCES` | States & Provinces | Universal | Preußen, Bayern, Sachsen, Württemberg, Baden, Hessen, Thüringen, Mecklenburg, Oldenburg, Braunschweig, Anhalt, Lippe |
| `GER_HANSE` | Hanseatic Towns | Universal | Lübeck, Hamburg, Bremen, Rostock, Stralsund, Wismar, Lüneburg, Greifswald, Stettin, Kolberg, Anklam, Demmin |
| `GER_ISLANDS` | Islands & Coasts | Universal | Helgoland, Sylt, Föhr, Amrum, Pellworm, Nordstrand, Borkum, Juist, Norderney, Baltrum, Langeoog, Spiekeroog |
| `GER_GEOGRAPHY` | Mountains & Ranges | Universal | Zugspitze, Watzmann, Hochkönig, Wendelstein, Nebelhorn, Brocken, Feldberg, Belchen, Schneekoppe, Zobten, Großer Arber, Fichtelberg |
| `GER_CASTLES` | Castles & Forts | Universal | Wartburg, Burg Hohenzollern, Hohenstaufen, Trifels, Marksburg, Rheinfels, Stolzenfels, Rheinstein, Sooneck, Lahneck, Eltz, Cochem |
| `GER_COLONIES` | Colonies | Universal | Kamerun, Togo, Samoa, Kiautschou, Deutsch-Ostafrika, Deutsch-Südwestafrika, Deutsch-Neuguinea, Kaiser-Wilhelmsland, Bismarck-Archipel, Neupommern, Neumecklenburg, Karolinen |
| `GER_RULERS` | Emperors & Kings | Universal | Karl der Große, Ludwig der Deutsche, Heinrich der Vogler, Otto der Große, Otto II., Otto III., Heinrich II., Konrad II., Heinrich III., Heinrich IV., Lothar von Supplinburg, Konrad III. |
| `GER_GENERALS` | Generals | Universal | Tilly, Wallenstein, Pappenheim, Bernhard von Weimar, Derfflinger, Sparr, Prinz Eugen, Der Alte Dessauer, Graf Schwerin, Keith, Seydlitz, Zieten |
| `GER_ADMIRALS` | Seafarers | Universal | Störtebeker, Gödeke Michels, Paul Beneke, Simon von Utrecht, Johann Wittenborg, Jürgen Wullenwever, Bruno von Warendorp, Hinrich Castorp, Ditmar Koel, Berend Karpfanger, Benjamin Raule, Von der Groeben |
| `GER_HEROES` | Naval Heroes | Universal | Leberecht Maass, Georg Thiele, Max Schultz, Richard Beitzen, Paul Jacobi, Theodor Riedel, Hermann Schoemann, Bruno Heinemann, Wolfgang Zenker, Hans Lody, Bernd von Arnim, Erich Giese |
| `GER_EXPLORERS` | Explorers | Universal | Martin Behaim, Georg Forster, Reinhold Forster, Adelbert von Chamisso, Carsten Niebuhr, Georg Wilhelm Steller, Engelbert Kaempfer, Philipp Franz von Siebold, Krusenstern, Bellingshausen, Otto von Kotzebue, Ferdinand von Wrangel |
| `GER_SCIENTISTS` | Scientists | Universal | Kopernikus, Kepler, Regiomontanus, Leibniz, Otto von Guericke, Fahrenheit, Gauß, Bessel, Fraunhofer, Ohm, Wilhelm Weber, Robert Mayer |
| `GER_WRITERS` | Poets & Thinkers | Universal | Walther von der Vogelweide, Wolfram von Eschenbach, Hartmann von Aue, Gottfried von Straßburg, Hans Sachs, Martin Luther, Melanchthon, Gryphius, Grimmelshausen, Goethe, Schiller, Lessing |
| `GER_COMPOSERS` | Composers | Universal | Heinrich Schütz, Praetorius, Dietrich Buxtehude, Pachelbel, Telemann, Bach, Händel, Graun, Hasse, Quantz, Philipp Emanuel Bach, Gluck |
| `GER_KNIGHTS` | Knights & Orders | Universal | Hermann von Salza, Hermann von Balk, Konrad von Thüringen, Poppo von Osterna, Anno von Sangerhausen, Hartmann von Heldrungen, Siegfried von Feuchtwangen, Karl von Trier, Werner von Orseln, Luther von Braunschweig, Dietrich von Altenburg, Winrich von Kniprode |
| `GER_TRIBES` | Germanic Tribes | Universal | Arminius, Marbod, Ariovist, Thusnelda, Civilis, Ermanarich, Athanarich, Fritigern, Wulfila, Alarich, Geiserich, Gelimer |
| `GER_THEME_GERMANIC` | Germanic Mythology | Universal | Wotan, Donar, Ziu, Frija, Volla, Phol, Balder, Sunna, Sinthgunt, Saxnot, Nerthus, Tamfana |
| `GER_SAGAS` | Heroic Sagas | Universal | Siegfried, Beowulf, Frithjof, Hildebrand, Hagen, Volker, Dietrich von Bern, Alberich, Balmung, Bechelaren, Kriemhild, Brünhild |
| `GER_LEGENDS` | Legends & Tales | Universal | Loreley, Undine, Nixe, Vineta, Schneewittchen, Max, Moritz, Rugard, Rübezahl, Till Eulenspiegel, Münchhausen, Doktor Faust |
| `GER_CLASSICAL` | Classical Myth | Universal | Niobe, Nymphe, Thetis, Ariadne, Amazone, Medusa, Najade, Augusta, Victoria, Nautilus, Cyclop, Triton |
| `GER_THEME_BATTLE` | Famous Battles | Universal | Skagerrak, Teutoburger Wald, Flandern, Verdun, Sedan, Königgrätz, Leuthen, Soor, Tannenberg, Kesselsdorf, Pirmasens, Großbeeren |
| `GER_HISTORIC_SHIPS` | Historic Ships | Universal | Adler von Lübeck, Bunte Kuh, Peter von Danzig, Jesus von Lübeck, Wappen von Hamburg, Leopoldus Primus, Admiralität von Hamburg, Friedrich Wilhelm zu Pferde, Kurprinz, Dorothea, Roter Löwe, Goldener Löwe |
| `GER_VIRTUES` | Virtues | Universal | Flink, Kühn, Scharf, Schütze, Sicher, Tapfer, Vorwärts, Jäger, Wacht, Jagd, Rival, Pionier |

### Ideology-Gated Pools (Ship Designer)

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `GER_PEOPLE_COMMUNIST` | Revolutionary Minds | Universal (communism) | Karl Marx, Friedrich Engels, Karl Liebknecht, Rosa Luxemburg, Leo Jogiches, Eugen Leviné, Franz Mehring, Clara Zetkin, August Bebel, Wilhelm Liebknecht, Wilhelm Weitling, Moses Hess |
| `GER_THEME_COMMUNIST_SLOGANS` | Revolutionary Slogans | Universal (communism) | Die Rote Fahne, Die Internationale, Proletarier aller Länder, Die Freiheit, Roter Oktober, Gegen den Faschismus, Gegen die Bourgeoisie, Gegen den Imperialismus, Es lebe Spartakus, Permanente Revolution, Antifaschistische Aktion, Gegen den Strom |
| `GER_THEME_COMMUNIST_DDR` | Volksmarine Vessels | Universal (communism) | Rostock, Berlin, Halle, Dresden, Stralsund, Wismar, Parchim, Perleberg, Bützow, Prenzlau, Ribnitz-Damgarten, Waren |
| `GER_REPUBLICAN_IDEALS` | Republic & Liberty | Universal (democratic) | Einigkeit, Recht, Freiheit, Schwarz-Rot-Gold, Paulskirche, Reichsverfassung, Grundrechte, Volkssouveränität, Bürgerrecht, Hambacher Fest, Wartburgfest, Märzrevolution |
| `GER_DEMOCRATS` | 1848 & Weimar | Universal (democratic) | Heinrich von Gagern, Robert Blum, Friedrich Hecker, Gustav Struve, Carl Schurz, Franz Sigel, Lorenz Brentano, Jakob Venedey, Arnold Ruge, Johann Jacoby, Eduard Simson, Karl Mathy |
| `GER_MONARCHISM` | Crown & Empire | Universal (non-aligned or democratic) | Kaiser, Kaiserin, Kronprinz, Kronprinzessin, Kaiseradler, Reichsadler, Reichskrone, Kaiserkrone, Reichsapfel, Kaiserstandarte, Schwarzer Adler, Roter Adler |
| `GER_DYNASTIES` | Princely Houses | Universal (non-aligned or democratic) | Wittelsbach, Wettin, Zähringen, Karolinger, Ottonen, Salier, Staufer, Welfen, Habsburg, Luxemburger, Zollern, Askanier |
| `GER_FASCISM` | Third Reich | Universal (fascism) | Horst Wessel, Albert Leo Schlageter, Herbert Norkus, Wilhelm Gustloff, Großdeutschland, Der Deutsche, Moselland, Weser-Ems, Oberdonau, Niederdonau, Wartheland, Westmark |

### Imperial Navy Lists (vanilla set, mirrored)

Vanilla gives Germany a second set of lists under the `SMS ` prefix (`SM ` for submarines) for a restored Empire. This file keeps the set and opens it to non-aligned and democratic Germany, the two governments under which the Kaiser can reign. The seven hull lists carry the rosters of the Kaiserliche Marine. Every role and thematic list of the main set has a copy (`GER_BIRDS_IMPERIAL` copies `GER_BIRDS`, `GER_TB_IMPERIAL` copies `GER_TB_HISTORICAL`), shown in the Ship Designer as "SMS ...". A copy leaves out a name that one of the Imperial cruiser, capital ship or carrier lists holds.

| Group Tag | Topic Name | Ship Types | Sample Names |
| :--- | :--- | :--- | :--- |
| `GER_DD_IMPERIAL` | Imperial Destroyers | `ship_hull_light destroyer` | V 1, V 2, V 3, B 112, S 223 |
| `GER_SS_IMPERIAL` | Imperial Submarines | `ship_hull_submarine submarine` | U-1, U-2, U-3, U-76, U-150 |
| `GER_CL_IMPERIAL` | Imperial Light Cruisers | `ship_hull_cruiser light_cruiser` | Gazelle, Niobe, Nymphe, Thetis, Ariadne, Amazone, Medusa, Frauenlob, Arcona, Undine, Gefion, Irene |
| `GER_CA_IMPERIAL` | Imperial Heavy Cruisers | `ship_hull_cruiser heavy_cruiser` | Fürst Bismarck, Prinz Heinrich, Prinz Adalbert, Friedrich Carl, Roon, Yorck, Blücher, Kaiserin Augusta, Victoria Louise, Hertha, Freya, Vineta |
| `GER_BB_IMPERIAL` | Imperial Battleships | `ship_hull_heavy battleship` | Bayern, Baden, Sachsen, Württemberg, König, Großer Kurfürst, Markgraf, Kronprinz, Kaiser, Friedrich der Große, Kaiserin, König Albert |
| `GER_BC_IMPERIAL` | Imperial Battlecruisers | `ship_hull_heavy battle_cruiser` | Von der Tann, Moltke, Goeben, Seydlitz, Derfflinger, Lützow, Hindenburg, Mackensen, Graf Spee, Prinz Eitel Friedrich, Scharnhorst, Gneisenau |
| `GER_CV_IMPERIAL` | Imperial Carriers | `ship_hull_carrier carrier` | Graf Zeppelin, Peter Strasser, Richthofen, Boelcke, Immelmann, Otto Lilienthal, Gunther Plüschow, Hans Rolshoven, Karl Meyer, Max Stinsky, Bernhard von Tschirschky, Hans Albrecht Wedel |
| `GER_PZ_IMPERIAL` | SMS Panzerschiffe | Universal | Admiral Scheer, Admiral Graf Spee, Admiral Knorr, Admiral Stosch, Admiral Pohl, Admiral Capelle, Admiral Holtzendorff, Admiral Koester, Admiral Usedom, Admiral Hollmann, Admiral Ludwig von Schröder, Admiral Baudissin |
| `GER_TB_IMPERIAL` | SMS Torpedo Boats | Universal | T1, T2, T3, T107, Leopard |
| `GER_MS_IMPERIAL` | SMS Minesweepers | Universal | M1, M2, M3, M41, M80 |
| `GER_ESCORT_DESTROYERS_IMPERIAL` | SMS Fleet Escorts | Universal | F1, F2, F3, F16, F30 |
| `GER_MR_IMPERIAL` | SMS Merchant Raiders | Universal | Orion, Atlantis, Widder, Thor, Pinguin, Stier, Komet, Kormoran, Michel, Coronel, Doggerbank, Cap Trafalgar |
| `GER_CVL_IMPERIAL` | SMS Auxiliary Carriers | Universal | Weser, Jade, Elbe, Europa, Ausonia, Schwabenland, Friesenland, Answald, Santa Elena, Oswald, Ems, Eider |
| `GER_MINELAYERS_IMPERIAL` | SMS Minelayers | Universal | Tannenberg, Hansestadt Danzig, Königin Luise, Roland, Cobra, Skagerrak, Ostmark, Drache, Juminda, Kiebitz, Kehrwieder, Passat |
| `GER_GUNBOATS_IMPERIAL` | SMS Gunboats & Avisos | Universal | Eber, Habicht, Adler, Hyäne, Fuchs, Hay, Jäger, Natter, Pfeil, Salamander, Schwalbe, Scorpion |
| `GER_TENDERS_IMPERIAL` | SMS Tenders | Universal | Tsingtau, Tanga, Carl Peters, Adolf Lüderitz, Hermann von Wißmann, Gustav Nachtigal, Buea, Saar, Lech, Isar, Donau, Weichsel |
| `GER_CS_IMPERIAL` | SMS Scout Cruisers | Universal | Dessau, Witten, Görlitz, Esslingen, Neumünster, Castrop-Rauxel, Gladbeck, Plauen, Lüdenscheid, Ludwigsburg, Worms, Gütersloh |
| `GER_THEME_ANIMALS_IMPERIAL` | SMS Animals | Universal | Wolf, Iltis, Luchs, Tiger, Jaguar, Leopard, Panther, Löwe, Eber, Hyäne, Fuchs, Gepard |
| `GER_BIRDS_IMPERIAL` | SMS Birds | Universal | Möwe, Seeadler, Albatros, Greif, Kondor, Falke, Bussard, Geier, Kormoran, Schwalbe, Sperber, Habicht |
| `GER_THEME_FISH_IMPERIAL` | SMS Fish & Sea Life | Universal | Zander, Wels, Hering, Aal, Hecht, Flunder, Dorsch, Hai, Stachelrochen, Neunauge, Bitterling, Lachs |
| `GER_INSECTS_IMPERIAL` | SMS Insects & Reptiles | Universal | Wespe, Viper, Biene, Mücke, Scorpion, Basilisk, Camaeleon, Crocodill, Salamander, Natter, Hummel, Brummer |
| `GER_NATURE_IMPERIAL` | SMS Wind & Weather | Universal | Blitz, Pfeil, Strahl, Welle, Polarfront, Nordwind, Woge, Monsun, Orkan, Taifun, Sturm, Sturmwind |
| `GER_STARS_IMPERIAL` | SMS Stars & Planets | Universal | Spica, Regulus, Nordstern, Nadir, Wega, Castor, Pollux, Orion, Komet, Meteor, Planet, Antares |
| `GER_THEME_RIVERS_IMPERIAL` | SMS Rivers & Lakes | Universal | Weser, Jade, Elbe, Rhein, Recknitz, Neiße, Main, Trave, Uecker, Donau, Oder, Inn |
| `GER_PROVINCES_IMPERIAL` | SMS States & Provinces | Universal | Preußen, Bayern, Sachsen, Württemberg, Baden, Hessen, Thüringen, Mecklenburg, Oldenburg, Braunschweig, Anhalt, Lippe |
| `GER_HANSE_IMPERIAL` | SMS Hanseatic Towns | Universal | Lübeck, Hamburg, Bremen, Rostock, Stralsund, Wismar, Lüneburg, Greifswald, Stettin, Kolberg, Anklam, Demmin |
| `GER_ISLANDS_IMPERIAL` | SMS Islands & Coasts | Universal | Helgoland, Sylt, Föhr, Amrum, Pellworm, Nordstrand, Borkum, Juist, Norderney, Baltrum, Langeoog, Spiekeroog |
| `GER_GEOGRAPHY_IMPERIAL` | SMS Mountains & Ranges | Universal | Zugspitze, Watzmann, Hochkönig, Wendelstein, Nebelhorn, Brocken, Feldberg, Belchen, Schneekoppe, Zobten, Großer Arber, Fichtelberg |
| `GER_CASTLES_IMPERIAL` | SMS Castles & Forts | Universal | Wartburg, Burg Hohenzollern, Hohenstaufen, Trifels, Marksburg, Rheinfels, Stolzenfels, Rheinstein, Sooneck, Lahneck, Eltz, Cochem |
| `GER_COLONIES_IMPERIAL` | SMS Colonies | Universal | Kamerun, Togo, Samoa, Kiautschou, Deutsch-Ostafrika, Deutsch-Südwestafrika, Deutsch-Neuguinea, Kaiser-Wilhelmsland, Bismarck-Archipel, Neupommern, Neumecklenburg, Karolinen |
| `GER_RULERS_IMPERIAL` | SMS Emperors & Kings | Universal | Karl der Große, Ludwig der Deutsche, Heinrich der Vogler, Otto der Große, Otto II., Otto III., Heinrich II., Konrad II., Heinrich III., Heinrich IV., Lothar von Supplinburg, Konrad III. |
| `GER_GENERALS_IMPERIAL` | SMS Generals | Universal | Tilly, Wallenstein, Pappenheim, Bernhard von Weimar, Derfflinger, Sparr, Prinz Eugen, Der Alte Dessauer, Graf Schwerin, Keith, Seydlitz, Zieten |
| `GER_ADMIRALS_IMPERIAL` | SMS Seafarers | Universal | Störtebeker, Gödeke Michels, Paul Beneke, Simon von Utrecht, Johann Wittenborg, Jürgen Wullenwever, Bruno von Warendorp, Hinrich Castorp, Ditmar Koel, Berend Karpfanger, Benjamin Raule, Von der Groeben |
| `GER_HEROES_IMPERIAL` | SMS Naval Heroes | Universal | Leberecht Maass, Georg Thiele, Max Schultz, Richard Beitzen, Paul Jacobi, Theodor Riedel, Hermann Schoemann, Bruno Heinemann, Wolfgang Zenker, Hans Lody, Bernd von Arnim, Erich Giese |
| `GER_EXPLORERS_IMPERIAL` | SMS Explorers | Universal | Martin Behaim, Georg Forster, Reinhold Forster, Adelbert von Chamisso, Carsten Niebuhr, Georg Wilhelm Steller, Engelbert Kaempfer, Philipp Franz von Siebold, Krusenstern, Bellingshausen, Otto von Kotzebue, Ferdinand von Wrangel |
| `GER_SCIENTISTS_IMPERIAL` | SMS Scientists | Universal | Kopernikus, Kepler, Regiomontanus, Leibniz, Otto von Guericke, Fahrenheit, Gauß, Bessel, Fraunhofer, Ohm, Wilhelm Weber, Robert Mayer |
| `GER_WRITERS_IMPERIAL` | SMS Poets & Thinkers | Universal | Walther von der Vogelweide, Wolfram von Eschenbach, Hartmann von Aue, Gottfried von Straßburg, Hans Sachs, Martin Luther, Melanchthon, Gryphius, Grimmelshausen, Goethe, Schiller, Lessing |
| `GER_COMPOSERS_IMPERIAL` | SMS Composers | Universal | Heinrich Schütz, Praetorius, Dietrich Buxtehude, Pachelbel, Telemann, Bach, Händel, Graun, Hasse, Quantz, Philipp Emanuel Bach, Gluck |
| `GER_KNIGHTS_IMPERIAL` | SMS Knights & Orders | Universal | Hermann von Salza, Hermann von Balk, Konrad von Thüringen, Poppo von Osterna, Anno von Sangerhausen, Hartmann von Heldrungen, Siegfried von Feuchtwangen, Karl von Trier, Werner von Orseln, Luther von Braunschweig, Dietrich von Altenburg, Winrich von Kniprode |
| `GER_TRIBES_IMPERIAL` | SMS Germanic Tribes | Universal | Arminius, Marbod, Ariovist, Thusnelda, Civilis, Ermanarich, Athanarich, Fritigern, Wulfila, Alarich, Geiserich, Gelimer |
| `GER_THEME_GERMANIC_IMPERIAL` | SMS Germanic Myth | Universal | Wotan, Donar, Ziu, Frija, Volla, Phol, Balder, Sunna, Sinthgunt, Saxnot, Nerthus, Tamfana |
| `GER_SAGAS_IMPERIAL` | SMS Heroic Sagas | Universal | Siegfried, Beowulf, Frithjof, Hildebrand, Hagen, Volker, Dietrich von Bern, Alberich, Balmung, Bechelaren, Kriemhild, Brünhild |
| `GER_LEGENDS_IMPERIAL` | SMS Legends & Tales | Universal | Loreley, Undine, Nixe, Vineta, Schneewittchen, Max, Moritz, Rugard, Rübezahl, Till Eulenspiegel, Münchhausen, Doktor Faust |
| `GER_CLASSICAL_IMPERIAL` | SMS Classical Myth | Universal | Niobe, Nymphe, Thetis, Ariadne, Amazone, Medusa, Najade, Augusta, Victoria, Nautilus, Cyclop, Triton |
| `GER_THEME_BATTLE_IMPERIAL` | SMS Famous Battles | Universal | Skagerrak, Teutoburger Wald, Flandern, Verdun, Sedan, Königgrätz, Leuthen, Soor, Tannenberg, Kesselsdorf, Pirmasens, Großbeeren |
| `GER_HISTORIC_SHIPS_IMPERIAL` | SMS Historic Ships | Universal | Adler von Lübeck, Bunte Kuh, Peter von Danzig, Jesus von Lübeck, Wappen von Hamburg, Leopoldus Primus, Admiralität von Hamburg, Friedrich Wilhelm zu Pferde, Kurprinz, Dorothea, Roter Löwe, Goldener Löwe |
| `GER_VIRTUES_IMPERIAL` | SMS Virtues | Universal | Flink, Kühn, Scharf, Schütze, Sicher, Tapfer, Vorwärts, Jäger, Wacht, Jagd, Rival, Pionier |

---

## Scope Notes

- Every vessel name in a section headed by a class, a period or a kind of vessel was carried by a German ship; the rosters come from the German Wikipedia lists of the ships of the Kaiserliche Marine, the Kriegsmarine and the Volksmarine and from its list of German warship names. Sections headed "Expansion" extend a documented formula.
- Persons in the lists died before 1936, unless a German vessel carried the name (the tender *Erwin Waßner*, the Volksmarine's *Ernst Thälmann* and its boats named after the dead of the resistance). The namesakes of four Luftwaffe tenders (*Karl Meyer*, *Max Stinsky*, *Bernhard von Tschirschky*, *Hans Albrecht Wedel*) and of three tenders and trials vessels (*Hille*, *Sundevall*, *Eduard Jungmann*) could not be identified; the names stay as ship names.
- Not every destroyer namesake fell in the war: *Wilhelm Heidkamp* died in 1931, *Hans Lody* was executed as a spy in 1914, and *Hans Lüdemann* is honoured for a rescue in 1913.
- The Imperial destroyer list holds the real torpedo boats and orders of 1911–1918, V 1 to S 223, each with the letter of its yard (V Vulcan, G Germania, S Schichau, B Blohm & Voss, H Howaldt).
- The fascism pool holds only the Reichsgaue that vanilla used for capital ships and names that vessels of 1933–45 carried (*Horst Wessel*, *Albert Leo Schlageter*, *Herbert Norkus*, *Wilhelm Gustloff*). It holds no party leaders.
- The Volksmarine pool is vanilla's and holds names the East German navy gave from 1950, so it reaches past the game's years.
- Ship names keep the spelling the ship carried: *Camaeleon*, *Crocodill*, *Scorpion*, *Cöln* (Imperial set), *Hermann von Wißmann*, *Gunther Plüschow*.
- Vanilla's lists keep their localisation keys, which are translated into every game language. Lists whose content changed take a literal name (Merchant Raiders, Auxiliary Carriers, Scout Cruisers, Fish & Sea Life, Rivers & Lakes), and the Imperial copies are named "SMS ..." so that they can be told from the main lists when both are shown.
