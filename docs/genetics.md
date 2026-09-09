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
| `E` Extension / MC1R | `E`, `ER`, `EWh`, `e+`, `eb`, `ey` | autosomal; Allelserie mit Dominanzordnung, Details teils kontextabhangig | legt die Grundverteilung von Schwarz (Eumelanin) und Gold/Rot (Phaeomelanin) fest | notwendige Basis fuer Schwarz, Gold, Gelb und komplexe Muster | zuerst implementieren |
| `S` Silver | `S`, `s+` | Z-gebunden; `S` dominant | unterdruckt Phaeomelanin: Gold/Rot wird silbrig-weiss | relevant fuer weisse/silberne Grundfarben und geschlechtsabhangige Ergebnisse | POC-Erweiterung |
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
| Gold | Gold-Grundfarbe aus E-Locus und Phaeomelanin | hoch als Konzept |
| Blau | typischerweise `Bl/bl+`; `Bl/Bl` ergibt Splash und ist nicht dasselbe | hoch |
| Perlgrau | `lav/lav`; Lavender wirkt auch auf den Goldanteil | hoch |
| Schwarz mit weissen Tupfen | schwarzer Hintergrund plus `mo/mo` | hoch |
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
- **Porzellan ist ein Kombinationsphanotyp:** In der Chabo-PDF wird die alte Porzellan-/Dreibuntfarbe als Gelb mit schwarzem Schwanz plus `mo/mo` beschrieben. `porcelain` darf daher nicht als einzelnes Allel gespeichert werden.
- **Z-Vererbung:** Der Hahn gibt jeder Nachkommenschaft ein Z. Eine Henne gibt ihren Z-Anteil nur an ihre Sohne; ihre Tochter erhalt von ihr W. Deshalb kann eine Henne ein Z-gebundenes Merkmal nicht an ihre Tochter weitergeben.
- **Genkopplung:** `Db`, `Ml` und `Pg` liegen nahe beieinander und sollten spaeter als gekoppelte Gruppe mit Rekombinationsrate modelliert werden, nicht zwingend als unabhangige Wurfe.
- **Phanotyp und Genotyp:** Zwei weisse oder schwarze Huhner koennen verschiedene verdeckte Genotypen besitzen. Die Eingabe fuer die Zucht muss deshalb langfristig Genotypen oder bekannte Traegerstatus statt nur Farbnamen speichern.

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
- `Downloads/Bekannte-und-unbekannte-Varienten-der-Chabo.pdf`, S. 47-52 - Chabo-spezifische Beschreibung von `Db`, `Co`, `mo`, `I`, autosomalem Rot, `Mh`, `Cb` und `Di` sowie der Entstehungswege fuer Gelb mit schwarzem/weissem Schwanz, Porzellan, Gelb mit Tupfen und Rot mit Tupfen. Die Quelle unterscheidet dabei sichtbar beschriebenen Phanotyp und dem Zuchter bekannten Genotyp.

Die bisherigen vereinfachten POC-Werte `color` und `pattern` bleiben als Anzeige- bzw. Kompatibilitaetsschicht bestehen. Fuer realistischere Kreuzungen muessen sie schrittweise durch die oben beschriebenen Loci ersetzt werden.

## POC 0.2: Kreuzungen im Terminal

Die CLI nimmt zwei Elternprofile als Argumente entgegen. Ein Profil besteht aus `farbe,muster`:

```text
godot --headless --path . --script res://scripts/poc_cli.gd -- schwarz,weisse_tupfen perlgrau,weisse_tupfen
```

Aktuelle Profile:

- Farben: `schwarz`, `schwarz_trager`, `perlgrau`
- Muster: `einfarbig`, `weisse_tupfen`

`schwarz_trager` wird als `schwarz/perlgrau` modelliert. Das ist wichtig, weil ein rein schwarzes `schwarz/schwarz` mit einem rein perlgrauen `perlgrau/perlgrau` nur schwarze, verdeckt perlgrau tragende Nachkommen erzeugt. Der Traeger `schwarz/perlgrau` x `perlgrau/perlgrau` erzeugt dagegen 50% schwarze und 50% perlgraue Nachkommen.

Das Muster `weisse_tupfen` wird im aktuellen POC als rezessives `mo/mo` modelliert. Einfarbig ist `mo+/mo+`; die sichtbare Tupfung erscheint erst, wenn beide Eltern das `mo`-Allel weitergeben. Die Profile sind bewusst klein gehalten und werden schrittweise um `Db`, `Co`, `I`, `Bl`, `Mh`, `Cb` und `Di` erweitert.

### Aktuell testbare Profile

Farben:

- `schwarz`
- `schwarz_trager`
- `weiss`
- `gelb`
- `blau`
- `gold`
- `perlgrau`

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
```

Die neuen Profile sind zunächst Eingabe- und Testprofile. Ihre Namen werden bereits als Genotypen durch die Kreuzung geführt, aber die komplexen sichtbaren Kombinationen sind noch nicht vollständig mehrlocusig aufgelöst. Zum Beispiel wird `porzellan` derzeit als eigenes Übergangsprofil geführt; die fachlich korrekte Chabo-Kombination aus Grundfarbe, `Db`/`Co`, `I` und `mo/mo` folgt im nächsten Genetikschritt.