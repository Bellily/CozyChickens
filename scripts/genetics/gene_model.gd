class_name GeneModel
extends RefCounted

var locus: String
var allele: String
var dominance: int

func _init(gene_locus: String, gene_allele: String, gene_dominance: int = 0) -> void:
	locus = gene_locus
	allele = gene_allele
	dominance = gene_dominance

func duplicate_gene() -> GeneModel:
	return GeneModel.new(locus, allele, dominance)