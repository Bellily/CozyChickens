extends SceneTree

const BreedingSystemScript = preload("res://scripts/genetics/breeding_system.gd")
const PocCatalogScript = preload("res://scripts/genetics/poc_catalog.gd")

func _initialize() -> void:
	var arguments := OS.get_cmdline_user_args()
	if arguments.is_empty() or arguments[0] in ["--help", "-h"]:
		_print_help()
		quit()
		return

	var parent_a := _parse_parent(arguments[0])
	var parent_b := _parse_parent(arguments[1] if arguments.size() > 1 else "")
	if parent_a.is_empty() or parent_b.is_empty():
		_print_help()
		quit(1)
		return

	var results: Array[Dictionary] = BreedingSystemScript.new().possible_offspring(parent_a.genome, parent_b.genome)
	print("Cozy Chickens - Genetik-POC 0.2")
	print("Kreuzung: %s x %s" % [parent_a.label, parent_b.label])
	print("Moegliche sichtbare Nachkommen:")
	for result in results:
		print("- %s, %s: %.1f%%" % [result.color, result.pattern, result.probability * 100.0])
		print("  Farbgenotyp(en): %s" % ", ".join(result.color_genotypes))
		print("  Mustergenotyp(en): %s" % ", ".join(result.pattern_genotypes))
	print("Hinweis: Die Prozentwerte beschreiben Genotyp-Kombinationen vor einer zufaelligen Geschlechtsverteilung.")
	quit()

func _parse_parent(value: String) -> Dictionary:
	var parts := value.split(",")
	if parts.size() != 2:
		return {}
	var color_name := parts[0].strip_edges()
	var pattern_name := parts[1].strip_edges()
	return {
		"label": "%s, %s" % [color_name, pattern_name],
		"genome": PocCatalogScript.genome_from_description(color_name, pattern_name)
	}

func _print_help() -> void:
	print("Verwendung:")
	print("godot --headless --path . --script res://scripts/poc_cli.gd -- <Elter 1> <Elter 2>")
	print("Beispiel:")
	print("godot --headless --path . --script res://scripts/poc_cli.gd -- schwarz,weisse_tupfen perlgrau,weisse_tupfen")
	print(PocCatalogScript.available_descriptions())