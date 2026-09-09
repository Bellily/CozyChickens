class_name BreedingSystem
extends RefCounted

func possible_offspring(parent_a: ChickenGenome, parent_b: ChickenGenome) -> Array[Dictionary]:
	var outcomes: Dictionary = {}
	var total := 0
	for gamete_a in parent_a.gametes():
		for gamete_b in parent_b.gametes():
			var child := ChickenGenome.new(
				[gamete_a.color, gamete_b.color],
				[gamete_a.pattern, gamete_b.pattern]
			)
			var phenotype := child.phenotype()
			var key := "%s|%s" % [phenotype.color, phenotype.pattern]
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
			"color_genotypes": outcome.color_genotypes,
			"pattern_genotypes": outcome.pattern_genotypes,
			"probability": float(outcome.count) / float(total)
		})
	return result