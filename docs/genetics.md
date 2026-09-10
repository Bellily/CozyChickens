# Genetik-POC: Tabelle fuer Schritt 0.1

## Modellierungsregeln

Die Tabelle ist ein Zuchtmodell, keine lineare Farb-Rangliste. Ein Huhn besitzt an autosomalen Loci normalerweise zwei Allele. Bei Z-gebundenen Loci besitzen Hennen (ZW) nur ein relevantes Z-Allel, Hahne (ZZ) zwei. Der sichtbare Phanotyp entsteht schichtweise:

1. E-Locus als Grundverteilung von Eu- und Phaeomelanin.
2. Muster- und Schwarzverteilungs-Gene als Modifikatoren.
3. Verdunnungs- und Weiss-Gene.
4. Z-gebundene Gene, die bei Hahn und Henne unterschiedlich erscheinen.
5. Genkopplung und Rekombination, wenn mehrere Loci auf demselben Chromosom liegen.

`Dominant` bedeutet dabei nur, dass eine Kopie sichtbar werden kann. `Unvollstandig dominant` bedeutet, dass eine Kopie und zwei Kopien unterschiedliche Phanotypen erzeugen. `Epistatisch` bedeutet, dass ein Gen die sichtbare Wirkung eines anderen verdecken kann.

## Kern-Tabelle der Farb- und Mustergene

| Locus | Allele / Schreibweise | Vererbung | Wirkung im Phanotyp | Chabo-/POC-Relevanz | Status |
| --- | --- | --- | --- | --- | --- |
| `E` Extension / MC1R | `E`, `ER`, `e^Wh`, `e+`, `e^b` (weitere Nomenklaturen existieren) | autosomal; Chicken-colors beschreibt die Dominanzordnung `E > ER > e^Wh > e+ > e^b` | legt die Grundverteilung von Schwarz (Eumelanin) und Gold/Rot (Phaeomelanin) fest | notwendige Basis fuer Schwarz, Gold, Gelb und komplexe Muster | zuerst implementieren |
| `S` Silver | `S`, `s+` | Z-gebunden; `S` dominant | unterdruckt Phaeomelanin: Gold/Rot wird silbrig-weiss; `s+` steht fuer Gold | relevant fuer weisse/silberne Grundfarben und geschlechtsabhangige Ergebnisse | POC-Erweiterung |
| `B` Barring | `B`, `b+` | Z-gebunden; `B` dominant | periodische Pigmentunterbrechung, gesperbertes/cuckoo Muster | Chabo `gesperbert` auf diesen Mechanismus abbilden | POC-Erweiterung |
| `choc` Chocolate | `choc`, `Choc+` | Z-gebunden; rezessiv | verdunnt Eumelanin zu Braun/Schokoladenbraun | Chabo-Seite zeigt Schokoladenbraun; genaue Zuchtannahme validieren | spaeter |
| `Co` Columbian | `Co`, `co+` | autosomal; Modifikator | lasst mehr Schwarz in Halsbehang und Sattel zu und wirkt als Restriktionsfaktor | Chabo-PDF beschreibt `Co` als Faktor mit ahnlicher, aber nicht identischer Wirkung zu `Db` | POC-Modifikator |
| `Db` Dark Brown | `Db`, `db+` | autosomal; Dosiseffekt/Modifikator | verdrangt Schwarz weitgehend in Schwanz und Schwingen und hellt Gold zu Sandgelb auf | zentral fur Gelb mit schwarzem Schwanz und als Basis weiterer Chabo-Farbenschlage | POC-Modifikator |
| `Ml` Melanotic | `Ml`, `ml+` | autosomal; meist dominant | verstarkt und verschiebt Eumelanin, kann Tiere stark verdunkeln | wichtig, damit Muster nicht isoliert vom E-Locus simuliert werden | spaeter |
| `Pg` Pattern | `Pg`, `pg+` | autosomal; kontextabhangig | organisiert Eumelanin zu Pencilling/Lacing; allein nicht eindeutig sichtbar | Grundlage fur gezeichnete Muster, nicht mit Tupfen verwechseln | spaeter |
| `mo` Mottled | `mo`, `mo+` | autosomal; rezessiv, sichtbare Tupfung meist `mo/mo` | verhindert Pigment an der Federspitze; ein dunkles Band kann sich oberhalb des weissen Tupfens bilden | Chabo-PDF nutzt eine doppelte `mo`-Dosis fuer Porzellan/Dreibunt und Gelb mit weissen Tupfen | POC, korrekt rezessiv |
| `I` Dominant White | `I`, `i+` | autosomal; unvollstandig dominant; eine oder zwei Dosen | wandelt schwarzes Pigment in Weiss um; `I/I` kann auch Gold/Rot stark aufhellen | erklaert Gelb mit weissem Schwanz, Weissschwanzigkeit und sogenannte Weisslinge | POC-Modifikator |
| `c` Recessive White | `c`, `C+` | autosomal; rezessiv | hemmt beide Pigmente erst bei `c/c`, kann andere Genotypen verdecken | erklaert weisse Tiere mit anderer genetischer Basis | spaeter |
| `Bl` Blue | `Bl`, `bl+` | autosomal; unvollstandig dominant | `bl+/bl+` schwarz, `Bl/bl+` blau, `Bl/Bl` splash | Chabo Blau; erzeugt nicht einfach ein rezessives Blau | POC-Erweiterung |
| `lav` Lavender / MLPH | `lav`, `Lav+` | autosomal; rezessiv | verdunnt beide Pigmente gleichmassig: Schwarz zu Perlgrau, Gold zu blassem Strohton | Chabo Perlgrau; zentrale Farbe im POC | POC, korrekt rezessiv |
| `Mh` Mahogany | `Mh`, `mh+` | autosomal; Modifikator | verstarkt Phaeomelanin von Gold in Richtung tiefes Rot/Mahagoni und kann Aufhellung durch `I/I` begrenzen | Chabo-PDF nennt `Mh` zur Stabilisierung der roten Grundfarbe | POC-Modifikator |
| `gold_neck` | `gn`, `gn+` (POC-Marker) | autosomal; vereinfachter Chabo-Marker | kennzeichnet die Goldhalsig-Basis; zusammen mit `I/i+` wird im POC Rotgesattelt ausgegeben | bildet die beschriebene Goldhalsig-Kreuzung ab, bis der genaue Locus validiert ist | vereinfachtes POC |
| `Cb` Champagnerblond | `Cb`, `cb+` | Vererbung und Allelwirkung noch nicht abschliessend geklart | verdunnt rotes Pigment zu cremigem Gelb, Schwarz bleibt weitgehend unbeeinflusst | moeglicher Bestandteil besonders gleichmassiger, heller Gelbvarianten | dokumentieren, validieren |
| `Di` Yellow diluter / Aufhellungsfaktor | `Di`, `di+` | Vererbung und molekulare Zuordnung noch offen | hellt stark auf und reduziert oder verdrangt Schwarz; Wirkung abhangig von Grundfarbe und Modifikatoren | Chabo-PDF nennt `Di` als wichtigen Faktor fuer den gelben Farbschlag | dokumentieren, validieren |
| `Dun` / `Id` | mehrere Allele je nach Nomenklatur | autosomal; Dosiseffekt | Eumelanin-Verdunnung mit heterozygotem und homozygotem Phanotyp | nicht als Chabo-Blau oder Lavender abkurzen | spaeter / validieren |

## Chabo-Farbenschlaege als sichtbare Zielwerte

Diese Namen sind Phanotypen und duerfen im Datenmodell nicht direkt als einzelne Gene gespeichert werden:

| Sichtbarer Chabo-Farbenschlag | Genetische Modellidee fuer den POC | Sicherheit |
| --- | --- | --- |
| Schwarz | dunkler E-Locus, ohne sichtbare Verdunnung; genaue Chabo-Kombination offen | hoch als Phanotyp, Genotyp offen |
| Weiss | `I/-` oder `c/c` als zwei unterschiedliche Wege; Hintergrund muss gespeichert bleiben | hoch |
| Gelb | vorzugsweise Weizenbasis mit `Db`, `Co` sowie moeglich `Cb` und `Di`; `I` kann stoerendes Schwarz weiter aufhellen | mittel; PDF beschreibt mehrere Wege und keine stabilisierte Einzelformel |
| Gold | Gold-Grundfarbe aus Phaeomelanin mit `s+/s+`; der E-Locus legt die zugrunde liegende Verteilung fest | hoch als Konzept |
| Silber | `S/-` am Z-Locus unterdrueckt Phaeomelanin; der zugrunde liegende E-Locus bleibt erhalten | hoch als Konzept |
| Blau | typischerweise `Bl/bl+`; `Bl/Bl` ergibt Splash und ist nicht dasselbe | hoch |
| Perlgrau | `lav/lav`; Lavender wirkt auch auf den Goldanteil | hoch |
| Silber-Porzellan | `S/-` plus `mo/mo` und Porzellan-Modifikatoren; Silberne Grundfarbe mit schwarzen Zeichnungselementen | hoch als POC-Modell |
| Perlgrau-Silber-Porzellan | `S/-` plus `lav/lav`, `mo/mo` und Porzellan-Modifikatoren; schwarze Zeichnung wird perlgrau | hoch als POC-Modell |
| Goldhalsig | Goldbasis mit dem POC-Marker `gold_neck`; als Ausgangsprofil fuer Rotgesattelt | Chabo-Sondermodell |
| Rotgesattelt | `I/i+` auf Goldbasis plus `gold_neck` oder `Mh`; Name bleibt als sichtbarer Sonderphanotyp erhalten | Chabo-Sondermodell |
| Perlgrau mit weissen Tupfen | `lav/lav` plus `mo/mo` | hoch |
| Gelb mit weissen Tupfen | gelber Hintergrund, `I`/Weissschwanz-Basis und doppelte `mo`-Dosis; exakt lautet der beschriebene Weg Gelb mit weissem Schwanz und weissen Tupfen | hoch als PDF-Modell |
| Weiss mit schwarzem Schwanz | Gelb mit schwarzem Schwanz plus eine oder zwei Dosen `I`; `I` wandelt das Schwarz um | hoch als PDF-Modell |
| Weiss mit blauem Schwanz | kann laut PDF auch reinerbiges `Bl/Bl` (Splash) vortauschen; `I` und `Bl` muessen unterscheidbar gespeichert werden | hoch als Warnhinweis, Genotyp offen |
| Porzellan / Dreibunt | Gelb mit schwarzem Schwanz plus `mo/mo`; weisse Federspitze und dunkles Band erzeugen den dreifarbigen Eindruck | hoch als PDF-Modell |
| Rot mit weissen Tupfen | gelbe Grundfarbe plus autosomales Rot, stabilisiert durch `Mh`, und Tupfung durch `mo/mo` | hoch als PDF-Modell |
| Ganz gelb | moeglich als Kombination mehrerer Faktoren, aber laut PDF schwer stabil zu zuechten; `Cb` und `Di` sind wichtige Kandidaten | mittel; keine einfache Ein-Gen-Farbe |

## Genetische Sonderfaelle fuer die Implementierung

- **Epistasis:** `c/c` kann die sichtbare Farbe verdecken, obwohl der Vogel genetisch beispielsweise schwarz oder lavender ist.
- **Blue-Dosiseffekt:** Ein `Bl`-Allel ergibt Blau, zwei `Bl`-Allele Splash. Das ist kein einfaches dominant/rezessiv-Schema.
- **Lavender:** `lav` ist rezessiv. Ein Trager bleibt phanotypisch nicht automatisch perlgrau.
- **Chabo-Gelb:** `Db` verdrangt Schwarz in die Peripherie und hellt Gold auf; `Co` kann ahnlich wirken. `Cb` hellt Rot zu Cremegelb auf, `Di` reduziert oder verdrangt Schwarz noch starker. Die PDF beschreibt dies als mehrfaktorielle, teilweise unerforschte Kombination.
- **Dominant-Weiss-Dosis:** Eine Dosis `I` kann schwarzes Pigment in Weiss umwandeln. Bei `I/I` wird auch die goldene oder rote Grundfarbe oft aufgehellt; `Mh` kann diese Aufhellung abschwachen.
- **Rotgesattelt / Goldhalsig:** Im Chabo-POC wird `I/i+` auf einer Goldbasis weitgehend gold belassen. `I/I` ergibt auf derselben Basis Creme. Wird ein Creme-Tier mit Goldhalsig gekreuzt, erzeugt die Kombination `I/i+` plus `gold_neck` Rotgesattelt. Ein vererbtes `Mh` kann `gold_neck` in diesem Modell ersetzen.
- **Porzellan ist ein Kombinationsphanotyp:** In der Chabo-PDF wird die alte Porzellan-/Dreibuntfarbe als Gelb mit schwarzem Schwanz plus `mo/mo` beschrieben. `porcelain` darf daher nicht als einzelnes Allel gespeichert werden.
- **Gold-Porzellan ist nicht automatisch Mahagoni:** Die PDF nennt Gold-Porzellan als Zwischenschritt zum Erklären von Gelb/Rot mit Tupfen. Sie beschreibt autosomales Rot und `Mh` separat als Grundlage fuer die dunklere rote Variante. Ohne `Mh`-Genotyp darf ein Gold-Porzellan-Huhn daher nicht als Mahagoni ausgegeben werden.
- **Warum wird die Kreuzung schwarz?** Das aktuelle Profil `gold` verwendet `e+/e+`, das Profil `perlgrau` `E/E`. Nach der E-Locus-Dominanz aus Kippenjungle/Chicken Color Standards ist `E` gegenueber `e+` dominant; die Nachkommen sind `E/e+` und werden im POC schwarz. Das ist eine Folge der angenommenen Eltern-Genotypen, nicht der Bezeichnung Gold-Porzellan.
- **Z-Vererbung:** Der Hahn gibt jeder Nachkommenschaft ein Z. Eine Henne gibt ihren Z-Anteil nur an ihre Sohne; ihre Tochter erhalt von ihr W. Deshalb kann eine Henne ein Z-gebundenes Merkmal nicht an ihre Tochter weitergeben.
- **Z-Vererbung im POC:** Elternprofile koennen optional als `Hahn` oder `Henne` eingegeben werden. Ein Hahn gibt nur Z, eine Henne Z oder W. `S` und `B` werden bei Hennen haploid bewertet. Dadurch kann zum Beispiel `gold,Hahn x silber,Henne` silberne Soehne und goldene Toechter erzeugen.
- **Genkopplung:** `Db`, `Ml` und `Pg` liegen nahe beieinander und sollten spaeter als gekoppelte Gruppe mit Rekombinationsrate modelliert werden, nicht zwingend als unabhangige Wurfe.
- **Phanotyp und Genotyp:** Zwei weisse oder schwarze Huhner koennen verschiedene verdeckte Genotypen besitzen. Die Eingabe fuer die Zucht muss deshalb langfristig Genotypen oder bekannte Traegerstatus statt nur Farbnamen speichern.
- **E-Locus und Gold/Silber trennen:** Chicken-colors beschreibt die E-Serie als Allelreihe `E > ER > e^Wh > e+ > e^b`. Gold und Silber werden dort zusaetzlich ueber `s+` beziehungsweise `S` bezeichnet. Ein Gold-Phanotyp darf deshalb langfristig nicht allein aus `e+` abgeleitet werden; der POC fuehrt diesen Zusammenhang derzeit noch vereinfacht.

## POC-Datenschnittstelle

Fuer jedes Merkmal werden folgende Werte benoetigt:

| Feld | Zweck |
| --- | --- |
| `locus` | genetischer Ort, zum Beispiel `lav` oder `Bl` |
| `alleles` | ein oder zwei Allele; bei Z-Loci bei Hennen auch ein einzelnes Z-Allel |
| `inheritance_mode` | `autosomal`, `z_linked`, `incomplete_dominance` oder `linked_group` |
| `dominance_order` | Prioritaet einer Allelserie, falls zutreffend |
| `dosage_rule` | sichtbare Wirkung bei einer bzw. zwei Kopien |
| `epistasis` | Bedingungen, die andere Loci verdecken oder veraendern |
| `phenotype_mapper` | Funktion, die aus Genotyp, Geschlecht und Kontext die Anzeige erzeugt |
| `source_status` | `confirmed`, `simplified_poc` oder `needs_validation` |

Damit werden sichtbare Werte wie `perlgrau mit weissen Tupfen` aus Genen berechnet, statt als unvererbbares Textlabel gespeichert zu werden.

## Quellen und Einordnung

- [Club der Chabozuechter: Farbenschlaege](https://chaboclub.de/die-rasse-chabo/farbenschlaege/) - Chabo-Farbenschlaege und sichtbare Bezeichnungen, darunter Schwarz, Weiss, Blau, Perlgrau, Gesperbert, Tupfen sowie schwarze/blaue Schwaenze.
- [Kippenjungle: Genetics of Chickencolors and Basics](https://kippenjungle.nl/basisEN.htm) - Grundlagen zu Genotyp/Phanotyp, E-Serie, Epistasis, Blue, Lavender, Mottled, Dominant White, Columbian, Pattern, Melanotic, Z-Vererbung und Kopplung.
- [Chicken Color Standards: How Chicken Colour Genetics Works](https://chickencolorstandards.com/chicken-colour-genetics.html) - moderne Zusammenfassung von Pigmenten, E-Locus, Dominanz, Blue-Dosierung, Lavender, Weiss, Z-gebundenen Loci und Genkopplung mit Literaturhinweisen.
- [Chicken-colors: Color determining genes, E-series](https://www.chicken-colors.info/color-determining-genes-e-series) - E-Allele und die dort angegebene Dominanzordnung `E > ER > e^Wh > e+ > e^b`; nennt `s+` (Gold) und `S` (Silber) als separate Bezeichnungen.
- `Downloads/Bekannte-und-unbekannte-Varienten-der-Chabo.pdf`, S. 47-52 - Chabo-spezifische Beschreibung von `Db`, `Co`, `mo`, `I`, autosomalem Rot, `Mh`, `Cb` und `Di` sowie der Entstehungswege fuer Gelb mit schwarzem/weissem Schwanz, Porzellan, Gelb mit Tupfen und Rot mit Tupfen. Die Quelle unterscheidet dabei sichtbar beschriebenen Phanotyp und dem Zuchter bekannten Genotyp.

Die bisherigen vereinfachten POC-Werte `color` und `pattern` bleiben als Anzeige- bzw. Kompatibilitaetsschicht bestehen. Fuer realistischere Kreuzungen muessen sie schrittweise durch die oben beschriebenen Loci ersetzt werden.

## POC 0.2: Kreuzungen im Terminal

Die CLI nimmt zwei Elternprofile als Argumente entgegen. Ein Profil besteht aus `farbe,muster`:

```text
godot --headless --path . --script res://scripts/poc_cli.gd -- schwarz,weisse_tupfen perlgrau,weisse_tupfen
```

Aktuelle Profile:

- Farben: `schwarz`, `schwarz_trager`, `perlgrau`, `gold`, `silber`
- Muster: `einfarbig`, `weisse_tupfen`

`schwarz_trager` wird als `schwarz/perlgrau` modelliert. Das ist wichtig, weil ein rein schwarzes `schwarz/schwarz` mit einem rein perlgrauen `perlgrau/perlgrau` nur schwarze, verdeckt perlgrau tragende Nachkommen erzeugt. Der Traeger `schwarz/perlgrau` x `perlgrau/perlgrau` erzeugt dagegen 50% schwarze und 50% perlgraue Nachkommen.

Das Muster `weisse_tupfen` wird im aktuellen POC als rezessives `mo/mo` modelliert. Einfarbig ist `mo+/mo+`; die sichtbare Tupfung erscheint erst, wenn beide Eltern das `mo`-Allel weitergeben. Das erste Mehr-Locus-Modell bildet `E`, `lav`, `Bl`, `I`, `Db`, `mo`, einen Schwanzfaktor und `B` fuer Sperberung ab. `Co`, `Mh`, `Cb` und `Di` bleiben als fachlich zu validierende Erweiterungen offen.

### Aktuell testbare Profile

Farben:

- `schwarz`
- `schwarz_trager`
- `weiss`
- `gelb`
- `blau`
- `gold`
- `goldhalsig`
- `gold_mahagoni`
- `silber`
- `perlgrau`
- `perlgrau_silber`
- `creme`

Muster:

- `einfarbig`
- `schwarzer_schwanz`
- `weisse_tupfen`
- `porzellan`
- `gesperbert`

Beispiele:

```text
godot --headless --path . --script res://scripts/poc_cli.gd -- gelb,schwarzer_schwanz gold,porzellan
godot --headless --path . --script res://scripts/poc_cli.gd -- weiss,gesperbert blau,weisse_tupfen
godot --headless --path . --script res://scripts/poc_cli.gd -- silber,porzellan perlgrau_silber,porzellan
godot --headless --path . --script res://scripts/poc_cli.gd -- creme,einfarbig goldhalsig,einfarbig
```

Die Profile werden als Genotypen durch die Kreuzung geführt. `gold` verwendet im POC `s+/s+`; `silber` verwendet `S/S`, sodass `gold x silber` sichtbares `S/s+` und damit Silber erzeugt. `perlgrau_silber` kombiniert `S/S` mit `lav/lav`; dadurch wird das dunkle Pigment perlgrau statt schwarz. Das aktuelle POC speichert den S-Locus noch als gewöhnliches Allelpaar, weil Geschlecht und ZW/ZZ-Vererbung noch nicht implementiert sind. `porzellan` ist kein eigenes Einzelgen mehr, sondern wird aus einer Gelb-/Schwarzer-Schwanz-Basis (`Db/Db` plus schwarzer Schwanz) und `mo/mo` abgeleitet. Die Auswertung ist weiterhin ein POC: `Co`, `Mh`, `Cb` und `Di`, Genkopplung, Z-Vererbung und die vollständige Interaktion aller Farbloci folgen in weiteren Schritten.