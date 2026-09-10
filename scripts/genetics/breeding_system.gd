class_name BreedingSystem
extends RefCounted

func possible_offspring(parent_a: ChickenGenome, parent_b: ChickenGenome) -> Array[Dictionary]:
	var outcomes: Dictionary = {}
	var total := 0
	for gamete_a in parent_a.gametes():
		for gamete_b in parent_b.gametes():
			var child_sex := "male" if gamete_a.sex_chromosome == "Z" and gamete_b.sex_chromosome == "Z" else "female"
			var child := ChickenGenome.new(
				[gamete_a.color, gamete_b.color],
				[gamete_a.pattern, gamete_b.pattern],
				_combine_loci(gamete_a.loci, gamete_b.loci, gamete_a.sex_chromosome, gamete_b.sex_chromosome),
				child_sex
			)
			var phenotype := child.phenotype()
			var key := "%s|%s|%s" % [phenotype.color, phenotype.pattern, child_sex]
			if not outcomes.has(key):
				outcomes[key] = {
					"count": 0,
					"color_genotypes": [],
					"pattern_genotypes": []
				}
			outcomes[key].count += 1
			if not phenotype.color_genotype in outcomes[key].color_genotypes:
				outcomes[key].color_genotypes.append(phenotype.color_genotype)
			if not phenotype.pattern_genotype in outcomes[key].pattern_genotypes:
				outcomes[key].pattern_genotypes.append(phenotype.pattern_genotype)
			total += 1

	var result: Array[Dictionary] = []
	for key in outcomes:
		var parts: PackedStringArray = key.split("|")
		var outcome: Dictionary = outcomes[key]
		result.append({
			"color": parts[0],
			"pattern": parts[1],
			"sex": parts[2],
			"color_genotypes": outcome.color_genotypes,
			"pattern_genotypes": outcome.pattern_genotypes,
			"probability": float(outcome.count) / float(total)
		})
	return result

func _combine_loci(loci_a: Dictionary, loci_b: Dictionary, chromosome_a: String, chromosome_b: String) -> Dictionary:
	var combined: Dictionary = {}
	for locus_name in loci_a:
		if loci_b.has(locus_name):
			if locus_name == "silver" or locus_name == "barring":
				if chromosome_a == "W":
					combined[locus_name] = [loci_b[locus_name]]
				elif chromosome_b == "W":
					combined[locus_name] = [loci_a[locus_name]]
				else:
					combined[locus_name] = [loci_a[locus_name], loci_b[locus_name]]
			else:
				combined[locus_name] = [loci_a[locus_name], loci_b[locus_name]]
	return combined