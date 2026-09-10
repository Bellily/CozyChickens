class_name PocCatalog
extends RefCounted

const GeneModelScript = preload("res://scripts/genetics/gene_model.gd")
const ChickenGenomeScript = preload("res://scripts/genetics/chicken_genome.gd")

static func genome_from_description(color_name: String, pattern_name: String, biological_sex: String = "male") -> ChickenGenome:
	return ChickenGenomeScript.new(_color_genes(color_name), _pattern_genes(pattern_name), _genetic_loci(color_name, pattern_name), biological_sex)

static func available_descriptions() -> String:
	return "Farben: schwarz, schwarz_trager/schwarz_traeger, perlgrau, perlgrau_trager/perlgrau_traeger, weiss, creme, gelb, blau, gold, goldhalsig, gold_mahagoni, silber, perlgrau_silber | Muster: einfarbig, goldhalsig, weisse_tupfen, weisse_tupfen_trager/weisse_tupfen_traeger, porzellan, porzellan_trager/porzellan_traeger, schwarzer_schwanz, gesperbert"

static func is_supported_color(color_name: String) -> bool:
	return color_name.to_lower() in ["schwarz", "schwarz_trager", "schwarz_traeger", "perlgrau", "perlgrau_trager", "perlgrau_traeger", "weiss", "creme", "gelb", "blau", "gold", "goldhalsig", "gold_mahagoni", "silber", "perlgrau_silber"]

static func is_supported_pattern(pattern_name: String) -> bool:
	return pattern_name.to_lower() in ["einfarbig", "weisse_tupfen", "weisse_tupfen_trager", "weisse_tupfen_traeger", "porzellan", "porzellan_trager", "porzellan_traeger", "schwarzer_schwanz", "gesperbert"]

static func _color_genes(color_name: String) -> Array[GeneModel]:
	match color_name.to_lower():
		"schwarz":
			return [GeneModelScript.new("color", "schwarz", 3), GeneModelScript.new("color", "schwarz", 3)]
		"schwarz_trager", "schwarz_traeger":
			return [GeneModelScript.new("color", "schwarz", 3), GeneModelScript.new("color", "perlgrau", 1)]
		"perlgrau_trager", "perlgrau_traeger":
			return [GeneModelScript.new("color", "schwarz", 3), GeneModelScript.new("color", "perlgrau", 1)]
		"weiss":
			return [GeneModelScript.new("color", "weiss", 6), GeneModelScript.new("color", "weiss", 6)]
		"gelb":
			return [GeneModelScript.new("color", "gelb", 2), GeneModelScript.new("color", "gelb", 2)]
		"blau":
			return [GeneModelScript.new("color", "blau", 2), GeneModelScript.new("color", "blau", 2)]
		"gold":
			return [GeneModelScript.new("color", "gold", 2), GeneModelScript.new("color", "gold", 2)]
		"silber":
			return [GeneModelScript.new("color", "silber", 2), GeneModelScript.new("color", "silber", 2)]
		"perlgrau_silber":
			return [GeneModelScript.new("color", "perlgrau_silber", 1), GeneModelScript.new("color", "perlgrau_silber", 1)]
		"creme":
			return [GeneModelScript.new("color", "creme", 2), GeneModelScript.new("color", "creme", 2)]
		"goldhalsig":
			return [GeneModelScript.new("color", "goldhalsig", 2), GeneModelScript.new("color", "goldhalsig", 2)]
		"gold_mahagoni":
			return [GeneModelScript.new("color", "gold_mahagoni", 2), GeneModelScript.new("color", "gold_mahagoni", 2)]
		"perlgrau":
			return [GeneModelScript.new("color", "perlgrau", 1), GeneModelScript.new("color", "perlgrau", 1)]
		_:
			push_error("Unbekannte Farbe: %s" % color_name)
	return []

static func _pattern_genes(pattern_name: String) -> Array[GeneModel]:
	match pattern_name.to_lower():
		"einfarbig":
			return [GeneModelScript.new("pattern", "einfarbig", 0), GeneModelScript.new("pattern", "einfarbig", 0)]
		"goldhalsig":
			return [GeneModelScript.new("pattern", "goldhalsig", 1), GeneModelScript.new("pattern", "goldhalsig", 1)]
		"weisse_tupfen":
			return [GeneModelScript.new("pattern", "weisse_tupfen", -1), GeneModelScript.new("pattern", "weisse_tupfen", -1)]
		"weisse_tupfen_trager", "weisse_tupfen_traeger":
			return [GeneModelScript.new("pattern", "einfarbig", 0), GeneModelScript.new("pattern", "weisse_tupfen", -1)]
		"schwarzer_schwanz":
			return [GeneModelScript.new("pattern", "schwarzer_schwanz", 1), GeneModelScript.new("pattern", "schwarzer_schwanz", 1)]
		"porzellan":
			return [GeneModelScript.new("pattern", "porzellan", -1), GeneModelScript.new("pattern", "porzellan", -1)]
		"porzellan_trager", "porzellan_traeger":
			return [GeneModelScript.new("pattern", "einfarbig", 0), GeneModelScript.new("pattern", "porzellan", -1)]
		"gesperbert":
			return [GeneModelScript.new("pattern", "gesperbert", 2), GeneModelScript.new("pattern", "gesperbert", 2)]
		_:
			push_error("Unbekanntes Muster: %s" % pattern_name)
	return []

static func _genetic_loci(color_name: String, pattern_name: String) -> Dictionary:
	var loci := {
		"extension": _pair("extension", "E", "E", 3),
		"lavender": _pair("lavender", "Lav+", "Lav+", 0),
		"blue": _pair("blue", "bl+", "bl+", 0),
		"dominant_white": _pair("dominant_white", "i+", "i+", 0),
		"dark_brown": _pair("dark_brown", "db+", "db+", 0),
		"mottled": _pair("mottled", "mo+", "mo+", 0),
		"tail": _pair("tail", "normal", "normal", 0),
		"barring": _pair("barring", "b+", "b+", 0),
		"silver": _pair("silver", "s+", "s+", 0),
		"gold_neck": _pair("gold_neck", "gn+", "gn+", 0),
		"mahogany": _pair("mahogany", "mh+", "mh+", 0)
	}
	match color_name.to_lower():
		"schwarz_trager", "schwarz_traeger", "perlgrau_trager", "perlgrau_traeger":
			loci["lavender"] = _pair("lavender", "Lav+", "lav", 0)
		"perlgrau":
			loci["lavender"] = _pair("lavender", "lav", "lav", -1)
		"weiss":
			loci["dominant_white"] = _pair("dominant_white", "I", "I", 2)
		"creme":
			loci["extension"] = _pair("extension", "e+", "e+", 0)
			loci["dominant_white"] = _pair("dominant_white", "I", "I", 2)
		"gelb":
			loci["extension"] = _pair("extension", "e+", "e+", 0)
			loci["dark_brown"] = _pair("dark_brown", "Db", "Db", 1)
		"gold":
			loci["extension"] = _pair("extension", "e+", "e+", 0)
		"silber", "perlgrau_silber":
			loci["extension"] = _pair("extension", "e+", "e+", 0)
			loci["silver"] = _pair("silver", "S", "S", 1)
			if color_name.to_lower() == "perlgrau_silber":
				loci["lavender"] = _pair("lavender", "lav", "lav", -1)
		"goldhalsig":
			loci["extension"] = _pair("extension", "e+", "e+", 0)
			loci["gold_neck"] = _pair("gold_neck", "gn", "gn", 1)
		"gold_mahagoni":
			loci["extension"] = _pair("extension", "e+", "e+", 0)
			loci["mahogany"] = _pair("mahogany", "Mh", "mh+", 1)
		"blau":
			loci["blue"] = _pair("blue", "Bl", "bl+", 1)
	match pattern_name.to_lower():
		"weisse_tupfen":
			loci["mottled"] = _pair("mottled", "mo", "mo", -1)
		"weisse_tupfen_trager", "weisse_tupfen_traeger":
			loci["mottled"] = _pair("mottled", "mo+", "mo", 0)
		"porzellan":
			loci["dark_brown"] = _pair("dark_brown", "Db", "Db", 1)
			loci["mottled"] = _pair("mottled", "mo", "mo", -1)
			loci["tail"] = _pair("tail", "black", "black", 1)
		"porzellan_trager", "porzellan_traeger":
			loci["dark_brown"] = _pair("dark_brown", "Db", "Db", 1)
			loci["mottled"] = _pair("mottled", "mo+", "mo", 0)
			loci["tail"] = _pair("tail", "black", "black", 1)
		"schwarzer_schwanz":
			loci["tail"] = _pair("tail", "black", "black", 1)
		"gesperbert":
			loci["barring"] = _pair("barring", "B", "B", 1)
		"goldhalsig":
			loci["gold_neck"] = _pair("gold_neck", "gn", "gn", 1)
	return loci

static func _pair(locus: String, first: String, second: String, dominance: int) -> Array[GeneModel]:
	return [GeneModelScript.new(locus, first, dominance), GeneModelScript.new(locus, second, dominance)]