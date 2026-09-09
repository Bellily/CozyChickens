class_name PocCatalog
extends RefCounted

const GeneModelScript = preload("res://scripts/genetics/gene_model.gd")
const ChickenGenomeScript = preload("res://scripts/genetics/chicken_genome.gd")

static func genome_from_description(color_name: String, pattern_name: String) -> ChickenGenome:
	return ChickenGenomeScript.new(_color_genes(color_name), _pattern_genes(pattern_name))

static func available_descriptions() -> String:
	return "Farben: schwarz, schwarz_trager, weiss, gelb, blau, gold, perlgrau | Muster: einfarbig, schwarzer_schwanz, weisse_tupfen, porzellan, gesperbert"

static func _color_genes(color_name: String) -> Array[GeneModel]:
	match color_name.to_lower():
		"schwarz":
			return [GeneModelScript.new("color", "schwarz", 3), GeneModelScript.new("color", "schwarz", 3)]
		"schwarz_trager":
			return [GeneModelScript.new("color", "schwarz", 3), GeneModelScript.new("color", "perlgrau", 1)]
		"weiss":
			return [GeneModelScript.new("color", "weiss", 6), GeneModelScript.new("color", "weiss", 6)]
		"gelb":
			return [GeneModelScript.new("color", "gelb", 2), GeneModelScript.new("color", "gelb", 2)]
		"blau":
			return [GeneModelScript.new("color", "blau", 2), GeneModelScript.new("color", "blau", 2)]
		"gold":
			return [GeneModelScript.new("color", "gold", 2), GeneModelScript.new("color", "gold", 2)]
		"perlgrau":
			return [GeneModelScript.new("color", "perlgrau", 1), GeneModelScript.new("color", "perlgrau", 1)]
		_:
			push_error("Unbekannte Farbe: %s" % color_name)
	return []

static func _pattern_genes(pattern_name: String) -> Array[GeneModel]:
	match pattern_name.to_lower():
		"einfarbig":
			return [GeneModelScript.new("pattern", "einfarbig", 0), GeneModelScript.new("pattern", "einfarbig", 0)]
		"weisse_tupfen":
			return [GeneModelScript.new("pattern", "weisse_tupfen", -1), GeneModelScript.new("pattern", "weisse_tupfen", -1)]
		"schwarzer_schwanz":
			return [GeneModelScript.new("pattern", "schwarzer_schwanz", 1), GeneModelScript.new("pattern", "schwarzer_schwanz", 1)]
		"porzellan":
			return [GeneModelScript.new("pattern", "porzellan", -1), GeneModelScript.new("pattern", "porzellan", -1)]
		"gesperbert":
			return [GeneModelScript.new("pattern", "gesperbert", 2), GeneModelScript.new("pattern", "gesperbert", 2)]
		_:
			push_error("Unbekanntes Muster: %s" % pattern_name)
	return []