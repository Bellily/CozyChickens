# Cozy Chickens

Cozy Chickens ist ein 2D-Farm-Sim-Projekt mit Schwerpunkt auf der Zucht von Chabo-Huehnern.

## Aktueller Stand: POC

Der erste Meilenstein testet die genetische Vererbung ohne UI. Die Genetik ist von der Darstellung und der spaeteren Farm-Simulation getrennt, damit sie reproduzierbar getestet und spaeter in Stall, Markt und Brutmechanik verwendet werden kann.

## Voraussetzungen

- Godot 4.x

## Starten

1. `project.godot` in Godot importieren.
2. Das Projekt ausfuehren.
3. Fuer die Headless-Demo: `godot --headless --path . --script res://scripts/poc_cli.gd`

Die Demo nimmt zwei Elternprofile als Terminalargumente entgegen und erzeugt moegliche Nachkommen mit Wahrscheinlichkeiten. Farben und Muster werden als Genotypprofile eingegeben, zum Beispiel `schwarz,weisse_tupfen perlgrau,weisse_tupfen`.

Das Geschlecht kann optional pro Elternprofil angegeben werden: `gold,einfarbig,Hahn silber,einfarbig,Henne`. Ohne Angabe wird aus Kompatibilitaetsgruenden ein Hahn angenommen.

Verfuegbare POC-Profile:

- Farben: `schwarz`, `schwarz_trager` oder `schwarz_traeger`, `perlgrau`, `perlgrau_trager` oder `perlgrau_traeger`, `weiss`, `creme`, `gelb`, `blau`, `gold`, `goldhalsig`, `gold_mahagoni`, `silber`, `perlgrau_silber`
- Muster: `einfarbig`, `weisse_tupfen`, `weisse_tupfen_trager` oder `weisse_tupfen_traeger`, `porzellan`, `porzellan_trager` oder `porzellan_traeger`, `schwarzer_schwanz`, `gesperbert`

Beispiel:

`godot --headless --path . --script res://scripts/poc_cli.gd -- schwarz_trager,einfarbig perlgrau,einfarbig`

Silber-Porzellan und Perlgrau-Silber-Porzellan werden als Farbbasis plus Muster eingegeben:

`godot --headless --path . --script res://scripts/poc_cli.gd -- silber,porzellan perlgrau_silber,porzellan`

Die Sonderkreuzung fuer Rotgesattelt wird im POC so dargestellt:

`godot --headless --path . --script res://scripts/poc_cli.gd -- creme,einfarbig goldhalsig,einfarbig`

Ein geschlechtsgebundenes Beispiel ist:

`godot --headless --path . --script res://scripts/poc_cli.gd -- gold,einfarbig,Hahn silber,einfarbig,Henne`

Ein `schwarz_trager` besitzt `schwarz/perlgrau`; mit `perlgrau/perlgrau` entstehen deshalb 50% schwarze und 50% perlgraue Nachkommen. Ein rein schwarzes Tier `schwarz/schwarz` erzeugt mit einem rein perlgrauen Tier dagegen nur schwarze, genetisch perlgrau tragende Nachkommen. Die CLI zeigt den Farb- und Mustergenotyp deshalb zusätzlich zum sichtbaren Phänotyp an.

Die Profile `weiss`, `gelb`, `blau`, `gold`, `schwarzer_schwanz` und `gesperbert` sind im aktuellen POC als testbare Übergangsprofile angelegt. Die Trägerprofile sind nur für die aktuell rezessiv modellierten Merkmale verfügbar: `perlgrau_traeger`, `weisse_tupfen_traeger` und `porzellan_traeger`. Für die vollständige reale Mehr-Locus-Vererbung werden anschließend die dokumentierten Gene `I`, `Db`, `Co`, `Bl`, `mo`, `B` und weitere Loci separat modelliert.

## Struktur

- `scripts/genetics/`: Genmodell und Zuchtlogik
- `scripts/farm/`: spaetere Stall-, Huhn- und Marktlogik
- `scripts/systems/`: Zeit, Wirtschaft und Speichern
- `scripts/ui/`: spaetere UI-Schicht
- `tests/`: automatisierte POC-Tests
- `docs/`: Gen-Tabelle, Designentscheidungen und Roadmap