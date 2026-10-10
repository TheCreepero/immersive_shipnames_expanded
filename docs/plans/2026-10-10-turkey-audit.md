# Turkey (TUR) Namelist Audit - 2026-10-10

File: `common/units/names_ships/TUR_ship_names.txt`

## Initial report (`-Audit TUR`)
- AUDIT SUMMARY TUR: FAIL=5 WARN=0 INFO=4
- [FAIL] CrossClass CA/BB : Edirne
- [FAIL] CrossClass BB/BC : Yavuz Sultan Selim, Yıldırım Bayezid
- [FAIL] CrossClass CL/CV : Samsun, Bandırma
- [FAIL] CrossClass CL/CA : Çanakkale, Yalova, Edirne, Urla
- [FAIL] CrossClass CL/BB : İstanbul, Edirne, Bursa
- [INFO] CrossClassPerson BC/CV : Battal Gazi ~ Gazi, Danişmend Gazi ~ Gazi, Mengücek Gazi ~ Gazi
- [INFO] CrossClassPerson BB/CV : Muin-i Zafer ~ Zafer, Orhan Gazi ~ Gazi, Osman Gazi ~ Gazi
- [INFO] CrossClassPerson BB/BC : Yavuz Sultan Selim ~ Selim
- [INFO] PlanFile - : No docs/plans/*-turkey-*.md (create one with -AuditPlan TUR before review)
- Found on manual review (the script cannot see these; all hull and thematic depth targets were met):
  - Same person under two or three forms inside one group: BB *Gazi Mustafa Kemal* / *Atatürk*, *Fatih* / *Fatih Sultan Mehmed*, *Kanuni* / *Sultan Süleyman*, *Sultan Osman-ı Evvel* / *Osman Gazi*; BC *Yavuz* / *Yavuz Sultan Selim* / *Selim* and *Yıldırım* / *Yıldırım Bayezid*; SS *Uluç Ali Reis* / *Kılıç Ali Reis* / *Uluç Reis*; ADMIRALS *Kılıç Ali Paşa* / *Uluç Ali Reis*, *Murat Reis* / *Koca Murat Reis*, *Rauf Orbay* / *Hüseyin Rauf*. One battle under two names in BATTLES (*Bafeus* = *Koyunhisar*).
  - Same person across exclusive classes: CV *Gazi* (Atatürk's 1921 Assembly title, filed under republican ideals) against BB *Atatürk*. Same city across exclusive classes: BB *Konstantiniyye* against CL *İstanbul*.
  - Fabrications and mislabels: SS *Üçüncü İnönü* and *Dördüncü İnönü* (only two battles of İnönü were fought), twelve unattested verb + *-ay* coinages in SS (*Korkutay* … *Parılday*), SS *Karamürsel Reis* (he is Karamürsel Bey / Alp, never styled Reis), ADMIRALS *Patrona Halil* (leader of the 1730 revolt, not an admiral or corsair), RULERS *Kül Tigin* (a prince and general who never ruled), BC *Yıldırım Kemal* (a War of Independence junior officer filed under the wind names).
  - Unplaced persons sent to research: ADMIRALS *Kalyonlar Kaptanı Mustafa Paşa*, *Ali Maçiko Reis*, *Kalyoncu Ali Reis*, *Fahri Engin*, *Şükür Okan* (form), *Bozcaadalı Hasan Paşa* (form); SS and ADMIRALS *Hasan Reis*, *Cafer Reis*, *Memi Reis*.
  - Display names against content: BIRDS "Birds of Prey" also holds a raven, a crane, a swan and two mythical birds; VIRTUES "Martial Virtues" holds *Cumhuriyet*, *Millet*, *Vatan*, *Hâkimiyet*; RIVERS "Rivers & Waterways" holds only rivers; MOUNTAINS "Peaks & Landmarks" holds only mountains and hills, plus the town *Kandıra*; PROVINCES holds two dynasty names (*Karamanoğlu*, *Candaroğlu*).
  - Orthography: BB *Asar-ı Tevfik* beside *Âsâr-ı Şevket*; DD *Cüretkar*; VIRTUES *Fedakarlık*, *Hakimiyet*; BATTLES *Dandanaqan* (English transliteration) and *Maritsa* (non-Turkish name of the battle of Çirmen); CA *Dardanel* (French-derived exonym for the strait already present as *Çanakkale*).
  - English homonyms: DD *Ok*, RIVERS *Zap*, CITIES *Van*; SS *Fok* reads as a joke beside the compound *Akdeniz Foku*.
  - Noun-pool slips: BIRDS *Yoz Atmaca*, *Gökçe Doğan* (not species names) and *Akdoğan* (the same bird as *Sungur*); BEASTS *Alpago*, *Karasamur* (not placeable as species); FISH *Kılıç* / *Kılıçbalığı* and *Mersin* / *Mersinbalığı* (one fish twice).

## User decisions
None required at the checkpoint: no `VanillaPrefix`, `Depth` or `ThemeCount` finding fired, so no group is topped up beyond replacing what the audit removes.

This audit ran without a live checkpoint. The decisions below are orchestrator decisions made on the user's behalf (drafted by the audit agent on a conservative reading of `CLAUDE.md` §2–3, accepted by the orchestrator) and can be reversed by the author:
- Research rulings: an entry the researcher could not verify is dropped, not parked for confirmation (*Hasan Reis*, *Cafer Reis*, *Kalyonlar Kaptanı Mustafa Paşa*, *Ali Maçiko Reis*, *Kalyoncu Ali Reis*, *Fahri Engin*; no substitution by Fahri Korutürk). The five draft candidates the researcher did not reach (*Hadım Süleyman Paşa*, *Selman Reis*, *Sefer Reis*, *Mir Ali Bey*, *İshak Reis*) were not added, since ADMIRALS reaches its target without them.
- DD *Burak* was renamed *Burak Reis*: it sits beside *Sakız* in the gunboat lineage, and the only vessel of that name the researcher found is the Reis-class gunboat *Burak Reis* (Navypedia: Aydın Reis).
- DD vessel names the researcher's pages did not list (*Alpagot*, *Antalya*, *Zuhaf*, *Sed-ül Bahir*) stay untouched: they are vessel or place names, not persons, and the group meets its target.
- All three researched role pools are skipped (see Role pools).
- SS: the twelve verb + *-ay* coinages were dropped as unattested rather than kept as "plausible expansion"; the real Ay-class names (*Atılay*, *Saldıray*, *Batıray*, *Yıldıray*, *Doğanay*, *Dolunay*) stay, and depth holds without the coinages.
- BB: *Konstantiniyye* was dropped as the same city as CL *İstanbul* under its Ottoman name (the by-eye exonym rule), not kept as a realm-level title.
- CV: *Gazi* was dropped as Atatürk by title (BB keeps *Atatürk*), not kept as a generic honorific.
- CA: *Dardanel* was dropped as an exonym of the strait the group already names *Çanakkale*.
- BC: *Yıldırım Kemal* was dropped rather than researched and moved (off BC doctrine, DD needs no names).
- English homonyms: CITIES *Van* was replaced by another eastern city because the city has no qualified native form; RIVERS *Zap* became *Büyük Zap*; DD *Ok* was replaced by the attested ship name *Zıpkın*.

## Research
One dispatch of `isne-audit-researcher` (25 of 25 web calls): 9 suspects, 4 low-confidence candidates, the high-confidence ADMIRALS candidates, 3 role rows.

| Entry | Verdict | Source |
|---|---|---|
| Hasan Reis (SS, ADMIRALS) | dropped; ADMIRALS takes *Uluç Hasan Paşa* instead | one bare mention in Kure Ansiklopedi: Preveze Deniz Muharebesi, not identifiable; Uluç Hasan Paşa in Wikipedia: List of Kapudan Pashas (1588–91) |
| Cafer Reis (SS, ADMIRALS) | dropped | unverified |
| Memi Reis (SS, ADMIRALS) | respelled *Arnavut Memi Reis* | Wikipedia: Arnaut Mami (captain of the Algiers galleys, captured Cervantes in 1575) |
| Kalyonlar Kaptanı Mustafa Paşa | dropped | unverified; only the rank word in TDV İslâm Ansiklopedisi: Kalyoncu |
| Ali Maçiko Reis | dropped | unverified |
| Kalyoncu Ali Reis | dropped | unverified |
| Fahri Engin | dropped | unverified; no such admiral in Wikipedia: List of commanders of the Turkish Naval Forces |
| Şükür Okan | respelled *Şükrü Okan* | Wikipedia: Şükrü Okan (1880–1957, admiral) |
| Bozcaadalı Hasan Paşa | respelled *Bozcaadalı Hasan Hüsnü Paşa* | Wikipedia: Bozcaadalı Hasan Hüsnü Pasha; TDV İslâm Ansiklopedisi: Bahriye Nezâreti |
| ADMIRALS candidates | 12 added | see Persons verified |
| DD *Nimet*, *Tarık* | kept | torpedo boats in Wikipedia: List of major surface ships of the Ottoman steam navy |

Other pages used: Wikipedia: List of fleet commanders of the Ottoman Navy, World War I naval ships of the Ottoman Empire, List of mine warfare vessels of the Turkish Navy; Navypedia: Atak, Sivrihisar, İsa Reis, Aydın Reis.

Everything else (same-person duplicates, the two invented İnönü battles, the *-ay* coinages, display names, orthography, noun-pool slips, cross-class assignments) was settled by the audit agent without research.

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| DD_HISTORICAL | 126 -> 126 | Burak Reis, Zıpkın, Cüretkâr | Burak, Ok, Cüretkar | - |
| SS_HISTORICAL | 80 -> 62 | Arnavut Memi Reis, Müstecip Onbaşı, Abdülhamid, Abdülmecid | Üçüncü İnönü, Dördüncü İnönü, Korkutay, Vuray, Pusulay, Koparay, Kıray, Dalay, Yıkay, Yakasay, Bozay, Avlay, Işılay, Parılday, Pusuda, Kılıç Ali Reis, Uluç Reis, Hasan Reis, Karamürsel Reis, Cafer Reis, Memi Reis, Fok | - |
| CL_HISTORICAL | 69 -> 69 | Erdek, Lapseki | Bandırma, Çanakkale | - |
| CA_HISTORICAL | 42 -> 38 | - | Edirne, Dardanel, Yalova, Urla | - |
| BB_HISTORICAL | 44 -> 36 | Âsâr-ı Tevfik, Kanuni Sultan Süleyman, Ankara, Misak-ı Millî | Asar-ı Tevfik, Gazi Mustafa Kemal, Fatih, Kanuni, Yavuz Sultan Selim, Sultan Süleyman, Osman Gazi, Yıldırım Bayezid, İstanbul, Konstantiniyye, Bursa, Edirne | - |
| BC_HISTORICAL | 39 -> 35 | - | Yavuz Sultan Selim, Yıldırım, Selim, Yıldırım Kemal | - |
| CV_HISTORICAL | 39 -> 37 | Hâkimiyet-i Milliye, Tuğrul Kuşu | Samsun, Millet, Gazi, Tuğrul | - |
| RULERS | 41 -> 40 | - | Kül Tigin | - |
| ADMIRALS | 36 -> 38 | Bozcaadalı Hasan Hüsnü Paşa, Şükrü Okan, Arnavut Memi Reis, Baltaoğlu Süleyman Bey, Gedik Ahmed Paşa, Hersekzade Ahmed Paşa, Uluç Hasan Paşa, Cığalazade Yusuf Sinan Paşa, Canım Hoca Mehmed Paşa, Kaymak Mustafa Paşa, Küçük Hüseyin Paşa, Nasuhzade Ali Paşa, Şuluk Mehmed Paşa, Çengeloğlu Tahir Paşa, Ahmet Saffet Bey | Uluç Ali Reis, Koca Murat Reis, Patrona Halil, Bozcaadalı Hasan Paşa, Kalyonlar Kaptanı Mustafa Paşa, Hüseyin Rauf, Fahri Engin, Şükür Okan, Hasan Reis, Cafer Reis, Memi Reis, Ali Maçiko Reis, Kalyoncu Ali Reis | - |
| CITIES | 53 -> 53 | Erzincan | Van | - |
| PROVINCES | 38 -> 37 | Karaman | Karamanoğlu, Candaroğlu | - |
| RIVERS | 36 -> 36 | Büyük Zap | Zap | ThemeName 'Rivers & Waterways' -> 'Rivers' |
| MOUNTAINS | 36 -> 36 | Karacadağ | Kandıra | ThemeName 'Peaks & Landmarks' -> 'Mountains & Hills' |
| BATTLES | 36 -> 36 | Dandanakan, Haçova, Çirmen | Dandanaqan, Bafeus, Maritsa | - |
| BIRDS | 37 -> 36 | Yaz Atmacası, Gökçe Delice | Akdoğan, Yoz Atmaca, Gökçe Doğan | ThemeName 'Birds of Prey' -> 'Birds' |
| FISH | 38 -> 36 | - | Kılıç, Mersin | - |
| BEASTS | 35 -> 35 | Hazar Kaplanı, Saz Kedisi, Engerek | Karasamur, Alpago, Kır Kurdu | - |
| VIRTUES | 36 -> 36 | Millî İrade, Fedakârlık, Hâkimiyet | Millet, Fedakarlık, Hakimiyet | ThemeName 'Martial Virtues' -> 'Virtues & Ideals' |
<!-- END CHANGE TABLE -->

## Rationale
**Cross-class collisions (§2).** Cities belong to CL, so CL keeps *İstanbul*, *Bursa*, *Edirne*, *Yalova*, *Urla* and *Samsun*; BB, CA and CV lose them. CA keeps *Çanakkale* as the strait and fortified zone, and CL substitutes the port opposite it, *Lapseki*. CV keeps *Bandırma* as the steamer of 19 May 1919, and CL substitutes the neighbouring port *Erdek*. BB takes the republican capital *Ankara* and the founding compact *Misak-ı Millî* in place of the three city names. BC keeps the flagship name *Yavuz* and the conqueror *Yıldırım Bayezid*; BB drops both sultans.

**One person, one form per group.** BB keeps *Atatürk*, *Fatih Sultan Mehmed*, *Kanuni Sultan Süleyman* (merged from *Kanuni* and *Sultan Süleyman*) and the historic dreadnought name *Sultan Osman-ı Evvel* (so *Osman Gazi* leaves). BC keeps *Yavuz* (the ship's name from 1936) and drops *Yavuz Sultan Selim*, *Selim* and the bare *Yıldırım*. SS keeps *Uluç Ali Reis*, the form a Turkish submarine bore. ADMIRALS keeps *Kılıç Ali Paşa*, *Murat Reis* and *Rauf Orbay*. CV *Gazi* and BB *Konstantiniyye* leave as second forms of BB *Atatürk* and CL *İstanbul*.

**Fabrications and mislabels removed (§3).** SS: *Üçüncü İnönü* and *Dördüncü İnönü* (no such battles), the twelve *-ay* coinages, *Karamürsel Reis* (invented title). ADMIRALS: *Patrona Halil* (rebel leader of 1730). RULERS: *Kül Tigin* (never ruled; he stays in BC as a commander). BC: *Yıldırım Kemal* (a junior officer filed under the wind names). CA: *Dardanel* (exonym). BATTLES: *Bafeus* (the battle of Koyunhisar under its Greek name), replaced by *Haçova*.

**SS additions.** *Müstecip Onbaşı*, *Abdülhamid* and *Abdülmecid* are the three submarines the Ottoman navy named; they replace removed fabrications and keep the group above its target of 60.

**Respellings** (each shows as removed + added in the table): BB *Asar-ı Tevfik* → *Âsâr-ı Tevfik* (matches *Âsâr-ı Şevket*); BB *Kanuni* → *Kanuni Sultan Süleyman*; DD *Cüretkar* → *Cüretkâr*, *Burak* → *Burak Reis*; VIRTUES *Fedakarlık* → *Fedakârlık*, *Hakimiyet* → *Hâkimiyet* (TDK circumflex forms); BATTLES *Dandanaqan* → *Dandanakan*, *Maritsa* → *Çirmen* (Turkish name of the 1371 battle); SS and ADMIRALS *Memi Reis* → *Arnavut Memi Reis*; ADMIRALS *Şükür Okan* → *Şükrü Okan*, *Bozcaadalı Hasan Paşa* → *Bozcaadalı Hasan Hüsnü Paşa*; BIRDS *Yoz Atmaca* → *Yaz Atmacası* (Levant sparrowhawk), *Gökçe Doğan* → *Gökçe Delice* (hen harrier); PROVINCES *Karamanoğlu* → *Karaman* (the eyalet, not the dynasty).

**English homonyms (§3).** DD *Ok* → *Zıpkın* (a name Turkish fast attack craft have borne); RIVERS *Zap* → *Büyük Zap*; CITIES *Van* → *Erzincan* (the city has no qualified native form, so another eastern city replaces it); SS *Fok* dropped beside the compound *Akdeniz Foku*. After review: CV *Millet* → *Hâkimiyet-i Milliye* ("national sovereignty", the title of the Ankara newspaper of 1920) and VIRTUES *Millet* → *Millî İrade* ("national will"), both qualified forms of the same word.

**Noun-pool slips.** BIRDS drops *Akdoğan* (in dictionary usage the same bird as *Sungur*, the gyrfalcon). BEASTS replaces *Alpago* and *Karasamur*, neither placeable as a species, with *Saz Kedisi* (jungle cat) and *Hazar Kaplanı* (Caspian tiger). FISH drops the short forms *Kılıç* and *Mersin* beside *Kılıçbalığı* and *Mersinbalığı*. After review, BEASTS also replaces the North American *Kır Kurdu* (coyote) with *Engerek* (viper; several species are native to Anatolia), and SS drops *Pusuda*, a locative ("in ambush") rather than a name form. MOUNTAINS replaces the town *Kandıra* with *Karacadağ*. PROVINCES drops the dynasty name *Candaroğlu* (its territory is already present as *Kastamonu*).

**Display names (§2).** "Birds of Prey" → "Birds" (the pool also holds a raven, a crane, a swan and two mythical birds); "Martial Virtues" → "Virtues & Ideals" (it holds *Cumhuriyet*, *Millet*, *Vatan*, *Hâkimiyet*); "Rivers & Waterways" → "Rivers"; "Peaks & Landmarks" → "Mountains & Hills" (true mountains and ranges beside six *-tepe* battle hills; no other landmarks). "Sultans & Khans", "Admirals & Corsairs" and "Fauna & Predators" describe their final lists and stay. No fallback changed: all are native indefinite forms.

**Section comments.** BB "Historic realm foundations & imperial capitals" → "Realm foundations, republican capital & founding compact"; BIRDS header widened to match the pool; SS gained "Historic Ottoman submarines" and lost the emptied coinage header.

## Persons verified
Every person the file keeps after the audit. "Well documented" marks heads of state, founders and famous commanders the audit agent identified without research.

- **BB** (well documented): *Sultan Osman-ı Evvel* (Osman I; the dreadnought bought in 1913 and seized as HMS Agincourt), *Fatih Sultan Mehmed* (Mehmed II; the battleship ordered in 1914), *Barbaros Hayreddin* and *Turgut Reis* (the admirals; also the two ex-German battleships bought in 1910), *Atatürk*, *Kanuni Sultan Süleyman*, *Alp Arslan*, *Orhan Gazi*, *Murad Hüdavendigâr* (Murad I), *İkinci Murad*, *Çelebi Mehmed* (Mehmed I), *Sultan Mehmed Reşad* (Mehmed V), *Alaeddin Keykubad* (Kayqubad I of Rum). The *-iye* entries (*Reşadiye*, *Mahmudiye*, *Orhaniye*, *Osmaniye*, *Aziziye*) are historic ship names derived from sultans' names, not persons.
- **BC** (well documented): *Yavuz* (Selim I, and the battlecruiser), *Yıldırım Bayezid* (Bayezid I), *Attila*, *Timur*, *Subutay* (general of Genghis Khan), *Cengiz Han*, *Kılıç Arslan*, *Tuğrul Bey* and *Çağrı Bey* (founders of the Great Seljuk state), *Babür Şah* (founder of the Mughal empire), *Baybars* (Mamluk sultan), *Bilge Kağan* and *Kül Tigin* (Göktürk khagan and his brother, of the Orkhon inscriptions), *Oğuz Kağan* (legendary ancestor of the Oghuz), *Battal Gazi* (frontier hero of the Battalname epic), *Danişmend Gazi*, *Saltuk Bey*, *Mengücek Gazi* and *Artuk Bey* (founders of the Danishmendid, Saltukid, Mengücek and Artuqid principalities after 1071), *Çaka Bey* (emir of Smyrna, built the first Turkish fleet in the 1080s), *Gazi Umur Bey* (naval emir of Aydın, d. 1348), *Karamürsel Bey* (first Ottoman naval commander).
- **CV, CA, CL**: no persons. CV *Tuğrul Kuşu* is the mythical bird, CV *Bandırma* the steamer; CL *Hamidiye* and *Mecidiye* are cruiser names.
- **DD** (well documented): *Alp Arslan*, *Mareşal Fevzi Çakmak* (Chief of the General Staff 1921–44), *Kılıç Ali Paşa*, *Piyale Paşa* and *Cezayirli Gazi Hasan Paşa* (kapudan pashas), *Gazi Turhan Bey* (Turahan Bey, Ottoman march lord of Thessaly, d. 1456), *Karamürsel* (Karamürsel Bey and the naval town named after him), *Gazi Umur Bey*, *Seydi Ali Reis*, *Kemal Reis*, *Turgut Reis*, *Burak Reis* (d. 1499 at Zonchio; also a Reis-class gunboat). *Kemalyeri* is a Gallipoli position named after Mustafa Kemal (a place).
- **SS** (well documented): *Oruç Reis*, *Hızır Reis* (Barbaros Hayreddin), *Murat Reis* (the Elder), *Burak Reis*, *Seydi Ali Reis*, *Piri Reis*, *Turgut Reis*, *Salih Reis*, *Uluç Ali Reis* (Kılıç Ali Paşa), *Kemal Reis*, *Aydın Reis* (Barbarossa's lieutenant, victor off Formentera in 1529), *Kurdoğlu Muslihiddin Reis*, *Sinan Reis* (Barbarossa's lieutenant). The reviewer corroborated *Aydın Reis*, *Sinan Reis* and *Kurdoğlu Muslihiddin Reis* (c. 1487–c. 1535; Wikipedia titles its article Kurtoğlu, its Kapudan list has Kurdoğlu, so the form stands).
  - *Abdülhamid* and *Abdülmecid* (Abdülhamid II and Abdülmecid I): the Nordenfelt submarines of 1886 and 1887; Wikipedia: Ottoman submarine Abdül Hamid (confirmed by the reviewer).
  - *Müstecip Onbaşı* (the corporal whose gun disabled the French submarine Turquoise in 1915, after whom the captured boat was renamed): Wikipedia: Turquoise (1908) (confirmed by the reviewer).
  - *Arnavut Memi Reis*: Wikipedia: Arnaut Mami.
- **RULERS** (well documented, all 40): the Ottoman sultans from Osman I to Mehmed V under their usual Turkish styles; the Seljuks *Alp Arslan*, *Tuğrul Bey*, *Çağrı Bey*, *Kılıç Arslan*, *Alaeddin Keykubad*; *Attila*; the Göktürk rulers *Bumin Kağan*, *İstemi Yabgu*, *Bilge Kağan*; *Oğuz Kağan* (legendary); *Mete Han* (Modu Chanyu of the Xiongnu).
- **ADMIRALS**, well documented: *Çaka Bey*, *Barbaros Hayreddin Paşa*, *Turgut Reis*, *Piri Reis*, *Oruç Reis*, *Kılıç Ali Paşa*, *Piyale Paşa*, *Seydi Ali Reis*, *Murat Reis*, *Burak Reis*, *Salih Reis*, *Kemal Reis*, *Aydın Reis*, *Karamürsel Bey*, *Gazi Umur Bey*, *Cezayirli Gazi Hasan Paşa*, *Mezomorto Hüseyin Paşa* (Kapudan Pasha 1695–1701), *Rauf Orbay* (captain of Hamidiye on the 1912–13 raid, Minister of Marine 1918), *Kurdoğlu Muslihiddin Reis*, *Sinan Reis*, *Koca Hüsrev Mehmed Paşa* (Kapudan Pasha 1811–18 and 1822–27).
  - *Damad Halil Paşa*: Wikipedia: Damat Halil Pasha (d. 1629; appointed Kapudan Pasha on 16 February 1609). The pool keeps the spelling *Damad*, in line with its *Mehmed* / *Ahmed* / *Murad* convention.
- **ADMIRALS**, sourced by the researcher:
  - Wikipedia: List of Kapudan Pashas: *Müezzinzade Ali Paşa* (1567–71), *Baltaoğlu Süleyman Bey* (1451–53), *Gedik Ahmed Paşa* (1478–80), *Hersekzade Ahmed Paşa* (1506–11), *Uluç Hasan Paşa* (1588–91), *Cığalazade Yusuf Sinan Paşa* (1591–95, 1599–1604), *Canım Hoca Mehmed Paşa* (three terms 1714–36), *Kaymak Mustafa Paşa* (1721–30), *Küçük Hüseyin Paşa* (1792–1803), *Nasuhzade Ali Paşa* (1821–22), *Çengeloğlu Tahir Paşa* (1832–36).
  - *Şuluk Mehmed Paşa*: Wikipedia: Mahomet Sirocco (bey of Alexandria, Ottoman right wing at Lepanto).
  - *Ahmet Saffet Bey*: Wikipedia: Ahmet Saffet Okay; TDV İslâm Ansiklopedisi: Saffet Bey (commander of Muavenet-i Milliye, which sank HMS Goliath in 1915).
  - *Arnavut Memi Reis*: Wikipedia: Arnaut Mami.
  - *Bozcaadalı Hasan Hüsnü Paşa*: Wikipedia: Bozcaadalı Hasan Hüsnü Pasha; TDV İslâm Ansiklopedisi: Bahriye Nezâreti (Minister of the Navy from 1880).
  - *Şükrü Okan*: Wikipedia: Şükrü Okan (1880–1957, admiral; his fleet command is only weakly sourced).
- **BATTLES** and the other pools: no persons.

## Author confirmation
None. Unverified persons were dropped (see User decisions), and no unsourced candidate was added.

## Kept on judgment
No WARN is kept.

- **`CrossClassPerson` BB/CV *Muin-i Zafer* ~ *Zafer*** (INFO): not a person. *Muin-i Zafer* ("aid to victory") is the ironclad of 1869; *Zafer* is the noun "victory".
- **BC *Tuğrul Bey* and CV *Tuğrul Kuşu***: different referents (the Seljuk sultan; the mythical raptor in the carrier's bird section). After review the carrier entry became *Tuğrul Kuşu* so the two no longer read as one name; BIRDS keeps the bare *Tuğrul*.
- **SS descriptors and marine fauna** (*Hilal*, *Yeniay*, *Derin*, *Dalgıç*, *Sualtı* and the 26 fauna names): not attested submarine names, kept as plausible extrapolation under §3 because they are real Turkish words in ordinary name form. The twelve verb + *-ay* entries were removed because they were invented non-words, and *Pusuda* because a locative is not a name form. The wiki scope note states which SS sections are attested and which are extrapolated.
- **SS and ADMIRALS *Arnavut Memi Reis***: the person is confirmed (Wikipedia: Arnaut Mami). No Turkish-language headword was found, so the form follows scholarly usage ("Arnavud Memi" in Türkçelik) with the pool's *Reis* style.
- **BB *-iye* names beside the sovereigns** (*Orhaniye* / *Orhan Gazi*, *Osmaniye* / *Sultan Osman-ı Evvel*, *Reşadiye* / *Sultan Mehmed Reşad*): the *-iye* forms are the navy's own historic ironclad and dreadnought names, kept as derived ship names like places named after people.
- **Names shared between DD or SS and a capital class** (*Turgut Reis* in BB, DD and SS; *Alp Arslan* in BB and DD; wind names in BC and DD; *Kanlısırt* and *Conkbayırı* in CA and DD; *Antalya*, *Giresun*, *İskenderun*, *Bartın*, *Samsun* in CL and DD): §2 exclusivity covers CL/CA/BB/BC/CV only, and most are attested destroyer, torpedo-boat or submarine names.
- **DD vessel names not on the researcher's pages** (*Alpagot*, *Antalya*, *Zuhaf*, *Sed-ül Bahir*): vessel and place names, not persons; kept by orchestrator ruling.
- **DD *-tepe* hill names without a known battle** (*Kandiltepe*, *Karasutepe*, *Gözcütepe*, *Tilkitepe*, *Şehittepe*, *Bayraktepe*, *Sivritepe*): common Turkish toponyms extending the documented *-tepe* destroyer convention; places, not persons, and the group needs no change.
- **English homonyms kept**: DD *Berk* (the historic ship name) and FISH *Lagos* (the grouper; a place-name coincidence, not a common English word). *Millet* was replaced by qualified forms after review (see Rationale).
- **BATTLES *Çimpe***: the 1352 seizure of a castle rather than a pitched battle, kept as the first Ottoman foothold in Europe. *Kutülamare* keeps its common simplified spelling.
- **CA *Çimenlik* and *Sultaniye***: both name fortifications at Çanakkale but are distinct attested names (the castle; Kale-i Sultaniye), so both stay.
- **CL *Hatay*, *Didim*, *Gazipaşa***: names slightly later than 1936 or outside 1936 borders, kept as plausible within the game's timeframe.
- **Persons living in 1936** (*Atatürk*, *Mareşal Fevzi Çakmak*, *Rauf Orbay*, *Şükrü Okan*): legacy entries kept; no further serving officers were added.
- **BEASTS** stays at its 35-name floor with its generic and specific pairs (*Kurt* / *Bozkurt*, *Tilki* / *Kızıl Tilki*); none breaks a rule and no top-up was requested. *Engerek* is the pool's one reptile, which "Fauna & Predators" covers.
- **MOUNTAINS *-tepe* hills** (*Kocatepe*, *Adatepe*, *Tınaztepe*, *Metristepe*, *Duatepe*, *Çaltepe*): kept in the pool; the display name "Mountains & Hills" now covers them.

## Role pools
| Role | Verdict | Reason |
|---|---|---|
| Minelayers | considered, skipped | Researched: no naming convention and fewer than 10 names before 1950 (*Nusret*, *İntibah*, *Nilüfer*, *Atak*, *Sivrihisar*, *Yüzbaşı Hakkı*); the post-war M-class town names collide with CL |
| Gunboats | considered, skipped | Researched: the Reis class gives fewer than 10 names, and its corsair names are already in SS, DD and ADMIRALS |
| Frigates, corvettes, sloops, avisos | considered, skipped | Researched: the Ottoman steam frigates and corvettes share no convention, and their place and ruler names collide with CL and BB; later frigate names are covered by DD |
| Minesweepers | considered, skipped: covered by CL | Coastal-town names by class letter, the CL convention |
| Torpedo boats | considered, skipped: covered by DD | Demirhisar, Akhisar and Antalya class names are in DD |
| Fast attack craft | considered, skipped: covered by DD | Wind, raptor and weapon names are in DD |
| Escort destroyers, patrol vessels | considered, skipped: covered by DD | No distinct class or convention |
| Coastal defense, monitors, armored cruisers | considered, skipped: covered by BB | The ironclad lineage is in BB |
| Submarine sub-types | considered, skipped: covered by SS | No sub-type with its own convention |
| Scout cruisers, flotilla leaders, fast battleships, large cruisers | considered, skipped | No Turkish or Ottoman class |
| Escort carriers, light carriers, seaplane tenders | considered, skipped | No Turkish or Ottoman class |
| Auxiliary cruisers, training ships, icebreakers, submarine tenders, state yachts | considered, skipped | Too few names for the floor (*Erkin*; *Ertuğrul*, *Savarona*) and no convention |

## Review
`isne-code-reviewer` verdict: **PASS**. No Critical finding, one Important, several Minor.

**Confirmed by the reviewer.** The change table matches `-DiffNames TUR` row for row. Every named person in the file is on Persons verified, and those checked hold up (the three SS additions, *Gazi Turhan Bey*, *Aydın Reis*, *Sinan Reis*, *Kurdoğlu Muslihiddin Reis*, *Ahmet Saffet Bey*, *Şuluk Mehmed Paşa*, *Bozcaadalı Hasan Hüsnü Paşa*, *Şükrü Okan* and the Kapudan-list additions). No pool needs gating. BATTLES *Çirmen* (1371) and *Sırpsındığı* (1364) are two battles. Orthography of all new and respelled entries is correct. BB and BC are not mirrors.

| Finding | Severity | Handling |
|---|---|---|
| Wiki scope note claimed SS lists "only attested names" while the marine-fauna and descriptor sections remain | Important | Fixed: the note now names what is attested (vessel names, corsair captains) and what is extrapolated (fauna, descriptors). SS *Pusuda* dropped as a locative. The other five descriptors and the fauna stay (Kept on judgment). |
| Wiki said Atatürk "coined" the Ay-class names, unsourced | Minor | Fixed: reads "the *Ay*-class names". |
| Wiki said each person appears "under a single form" although BB keeps *-iye* ship names beside sovereigns | Minor | Fixed: one personal form, with the historic *-iye* ship names kept beside them. |
| CV *Tuğrul* reads as the same name as BC *Tuğrul Bey* | Minor | Fixed: CV *Tuğrul Kuşu*. |
| *Millet* is a bare English homonym (CV, VIRTUES) | Minor | Fixed: CV *Hâkimiyet-i Milliye*, VIRTUES *Millî İrade*. |
| MOUNTAINS display name "Mountains" with six *-tepe* hills in the pool | Minor | Fixed: "Mountains & Hills"; wiki and workshop bullet synced. |
| *Damad Halil Paşa* gloss not corroborated | Minor | Fixed: now cites Wikipedia: Damat Halil Pasha. |
| *Arnavut Memi Reis* has no Turkish-language headword | Minor | Accepted: person confirmed; form justified under Kept on judgment. |
| BEASTS *Kır Kurdu* is non-native | Minor | Fixed: replaced by *Engerek*. |
| DD *Berk*, FISH *Lagos* as possible homonyms | Minor | Accepted: a historic ship name and a place-name coincidence. |

Re-verified after the fixes with `-Audit TUR`, `-ValidateOnly` and `-Test`.
