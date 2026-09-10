class_name ChickenGenome
extends RefCounted

var color: Array[GeneModel]
var pattern: Array[GeneModel]
var loci: Dictionary
var sex: String

func _init(color_genes: Array[GeneModel], pattern_genes: Array[GeneModel], genetic_loci: Dictionary = {}, biological_sex: String = "male") -> void:
	color = color_genes
	pattern = pattern_genes
	loci = genetic_loci if not genetic_loci.is_empty() else {"color": color_genes, "pattern": pattern_genes}
	sex = biological_sex

func phenotype() -> Dictionary:
	if loci.has("extension"):
		return _locus_phenotype()
	return {
		"color": _visible_allele(color),
		"pattern": _visible_allele(pattern),
		"color_genotype": genotype_label(color),
		"pattern_genotype": genotype_label(pattern)
	}

func genotype_label(genes: Array) -> String:
	if genes.size() == 1:
		return genes[0].allele
	return "%s/%s" % [genes[0].allele, genes[1].allele]

func gametes() -> Array[Dictionary]:
	return _build_gametes(loci.keys(), 0, {})

func _build_gametes(locus_names: Array, index: int, selected: Dictionary) -> Array[Dictionary]:
	if index >= locus_names.size():
		var gamete := {"loci": selected.duplicate(true)}
		gamete["sex_chromosome"] = selected.get("sex_chromosome", "Z")
		gamete["color"] = selected.get("color", color[0]).duplicate_gene()
		gamete["pattern"] = selected.get("pattern", pattern[0]).duplicate_gene()
		return [gamete]
	var locus_name: String = locus_names[index]
	var result: Array[Dictionary] = []
	var unique_alleles: Dictionary = {}
	var genes: Array = loci[locus_name]
	if sex == "female" and _is_z_locus(locus_name):
		genes = [genes[0]]
	for gene in genes:
		unique_alleles[gene.allele] = gene
	for gene in unique_alleles.values():
		var next_selected := selected.duplicate(true)
		next_selected[locus_name] = gene.duplicate_gene()
		if sex == "female" and locus_name == "silver":
			for chromosome in ["Z", "W"]:
				var sex_selected := next_selected.duplicate(true)
				sex_selected["sex_chromosome"] = chromosome
				result.append_array(_build_gametes(locus_names, index + 1, sex_selected))
			continue
		result.append_array(_build_gametes(locus_names, index + 1, next_selected))
	return result

func _locus_phenotype() -> Dictionary:
	var extension := _visible_locus_allele("extension")
	var color_name := "silber" if extension == "e+" and _has_allele("silver", "S") else ("gold" if extension == "e+" else "schwarz")
	var dominant_white_count := _allele_count("dominant_white", "I")
	var has_gold_modifier := _has_allele("gold_neck", "gn") or _has_allele("mahogany", "Mh")
	if dominant_white_count == 2:
		color_name = "creme" if extension == "e+" else "weiss"
	elif dominant_white_count == 1:
		if extension == "e+":
			color_name = "rotgesattelt" if has_gold_modifier else "gold"
		else:
			color_name = "weiss"
	elif extension == "e+" and _has_allele("silver", "S") and _allele_count("lavender", "lav") == 2:
		color_name = "perlgrau_silber"
	elif _allele_count("lavender", "lav") == 2 and extension == "E":
		color_name = "perlgrau"
	elif _allele_count("blue", "Bl") == 2 and extension == "E":
		color_name = "splash"
	elif _allele_count("blue", "Bl") == 1 and extension == "E":
		color_name = "blau"
	elif _has_allele("dark_brown", "Db") and extension == "e+" and not _has_allele("silver", "S"):
		color_name = "gelb"
	var pattern_name := "einfarbig"
	if color_name == "rotgesattelt":
		pattern_name = "einfarbig"
	elif _has_allele("barring", "B"):
		pattern_name = "gesperbert"
	elif _has_allele("gold_neck", "gn"):
		pattern_name = "goldhalsig"
	elif _has_allele("tail", "black"):
		pattern_name = "schwarzer_schwanz"
	if _allele_count("mottled", "mo") == 2:
		pattern_name = "porzellan" if _allele_count("dark_brown", "Db") == 2 else "weisse_tupfen"
	return {
		"color": color_name,
		"pattern": pattern_name,
		"color_genotype": _locus_genotype_label("extension", "silver", "lavender", "blue", "dominant_white"),
		"pattern_genotype": _locus_genotype_label("mottled", "tail", "barring")
	}

func _visible_locus_allele(locus_name: String) -> String:
	var genes: Array = loci[locus_name]
	var visible: GeneModel = genes[0]
	for gene in genes:
		if gene.dominance > visible.dominance:
			visible = gene
	return visible.allele

func _has_allele(locus_name: String, allele: String) -> bool:
	if not loci.has(locus_name):
		return false
	for gene in loci[locus_name]:
		if gene.allele == allele:
			return true
	return false

func _allele_count(locus_name: String, allele: String) -> int:
	var count := 0
	if not loci.has(locus_name):
		return count
	for gene in loci[locus_name]:
		if gene.allele == allele:
			count += 1
	return count

func _locus_genotype_label(first_locus: String, second_locus: String, third_locus: String = "", fourth_locus: String = "", fifth_locus: String = "") -> String:
	var labels: Array[String] = []
	for locus_name in [first_locus, second_locus, third_locus, fourth_locus, fifth_locus]:
		if locus_name != "" and loci.has(locus_name):
			labels.append("%s=%s" % [locus_name, genotype_label(loci[locus_name])])
	return "; ".join(labels)

func _visible_allele(genes: Array[GeneModel]) -> String:
	var visible := genes[0]
	if genes[0].allele == genes[1].allele:
		return genes[0].allele
	for gene in genes:
		if gene.dominance > visible.dominance:
			visible = gene
	return visible.allele

func _is_z_locus(locus_name: String) -> bool:
	return locus_name == "silver" or locus_name == "barring"