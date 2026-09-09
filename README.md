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

Verfuegbare POC-Profile:

- Farben: `schwarz`, `schwarz_trager`, `weiss`, `gelb`, `blau`, `gold`, `perlgrau`
- Muster: `einfarbig`, `schwarzer_schwanz`, `weisse_tupfen`, `porzellan`, `gesperbert`

Beispiel:

`godot --headless --path . --script res://scripts/poc_cli.gd -- schwarz_trager,einfarbig perlgrau,einfarbig`

Ein `schwarz_trager` besitzt `schwarz/perlgrau`; mit `perlgrau/perlgrau` entstehen deshalb 50% schwarze und 50% perlgraue Nachkommen. Ein rein schwarzes Tier `schwarz/schwarz` erzeugt mit einem rein perlgrauen Tier dagegen nur schwarze, genetisch perlgrau tragende Nachkommen. Die CLI zeigt den Farb- und Mustergenotyp deshalb zusätzlich zum sichtbaren Phänotyp an.

Die Profile `weiss`, `gelb`, `blau`, `gold`, `schwarzer_schwanz`, `porzellan` und `gesperbert` sind im aktuellen POC als testbare Übergangsprofile angelegt. Für die vollständige reale Mehr-Locus-Vererbung werden anschließend die dokumentierten Gene `I`, `Db`, `Co`, `Bl`, `mo`, `B` und weitere Loci separat modelliert.

## Struktur

- `scripts/genetics/`: Genmodell und Zuchtlogik
- `scripts/farm/`: spaetere Stall-, Huhn- und Marktlogik
- `scripts/systems/`: Zeit, Wirtschaft und Speichern
- `scripts/ui/`: spaetere UI-Schicht
- `tests/`: automatisierte POC-Tests
- `docs/`: Gen-Tabelle, Designentscheidungen und Roadmap