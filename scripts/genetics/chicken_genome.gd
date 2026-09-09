class_name ChickenGenome
extends RefCounted

var color: Array[GeneModel]
var pattern: Array[GeneModel]

func _init(color_genes: Array[GeneModel], pattern_genes: Array[GeneModel]) -> void:
	color = color_genes
	pattern = pattern_genes

func phenotype() -> Dictionary:
	return {
		"color": _visible_allele(color),
		"pattern": _visible_allele(pattern),
		"color_genotype": genotype_label(color),
		"pattern_genotype": genotype_label(pattern)
	}

func genotype_label(genes: Array[GeneModel]) -> String:
	return "%s/%s" % [genes[0].allele, genes[1].allele]

func gametes() -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for color_gene in color:
		for pattern_gene in pattern:
			result.append({"color": color_gene.duplicate_gene(), "pattern": pattern_gene.duplicate_gene()})
	return result

func _visible_allele(genes: Array[GeneModel]) -> String:
	var visible := genes[0]
	if genes[0].allele == genes[1].allele:
		return genes[0].allele
	for gene in genes:
		if gene.dominance > visible.dominance:
			visible = gene
	return visible.allele