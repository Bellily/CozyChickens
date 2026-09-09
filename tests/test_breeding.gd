extends SceneTree

const BreedingSystemScript = preload("res://scripts/genetics/breeding_system.gd")
const ChickenGenomeScript = preload("res://scripts/genetics/chicken_genome.gd")
const GeneModelScript = preload("res://scripts/genetics/gene_model.gd")
const PocCatalogScript = preload("res://scripts/genetics/poc_catalog.gd")

func _initialize() -> void:
	var dominant := GeneModelScript.new("color", "schwarz", 3)
	var recessive := GeneModelScript.new("color", "perlgrau", 1)
	var plain := GeneModelScript.new("pattern", "einfarbig", 0)
	var mottled := GeneModelScript.new("pattern", "weisse Tupfen", 1)
	var parent_a := ChickenGenomeScript.new([dominant, recessive], [mottled, plain])
	var parent_b := ChickenGenomeScript.new([recessive, recessive], [plain, plain])
	var outcomes: Array[Dictionary] = BreedingSystemScript.new().possible_offspring(parent_a, parent_b)

	assert(outcomes.size() == 4, "Es werden vier sichtbare Farb-/Musterkombinationen erwartet.")
	var probability_sum := 0.0
	for outcome in outcomes:
		probability_sum += outcome.probability
	assert(is_equal_approx(probability_sum, 1.0), "Wahrscheinlichkeiten muessen 100% ergeben.")

	var carrier := PocCatalogScript.genome_from_description("schwarz_trager", "einfarbig")
	var lavender := PocCatalogScript.genome_from_description("perlgrau", "einfarbig")
	var carrier_cross: Array[Dictionary] = BreedingSystemScript.new().possible_offspring(carrier, lavender)
	assert(carrier_cross.size() == 2, "Traeger x perlgrau muss zwei Farbphaenotypen erzeugen.")
	for outcome in carrier_cross:
		assert(is_equal_approx(outcome.probability, 0.5), "Jede Farbe muss 50% Wahrscheinlichkeit haben.")

	var plain_parent := PocCatalogScript.genome_from_description("schwarz", "einfarbig")
	var mottled_parent := PocCatalogScript.genome_from_description("perlgrau", "weisse_tupfen")
	var pattern_cross: Array[Dictionary] = BreedingSystemScript.new().possible_offspring(plain_parent, mottled_parent)
	assert(pattern_cross.size() == 1, "Einfarbig x weisse Tupfen muss einen sichtbaren Muster-Phänotyp ergeben.")
	assert(pattern_cross[0].pattern == "einfarbig", "Das rezessive Tupfen-Allel bleibt bei mischerbigen Nachkommen unsichtbar.")
	assert(is_equal_approx(pattern_cross[0].probability, 1.0), "Einfarbig muss in diesem Kreuz 100% sichtbar sein.")

	var colors := ["schwarz", "schwarz_trager", "weiss", "gelb", "blau", "gold", "perlgrau"]
	var patterns := ["einfarbig", "schwarzer_schwanz", "weisse_tupfen", "porzellan", "gesperbert"]
	for color_name in colors:
		for pattern_name in patterns:
			var profile := PocCatalogScript.genome_from_description(color_name, pattern_name)
			var profile_results: Array[Dictionary] = BreedingSystemScript.new().possible_offspring(profile, profile)
			assert(not profile_results.is_empty(), "Profil muss kreuzbar sein: %s,%s" % [color_name, pattern_name])
	print("Genetik-Tests erfolgreich")
	quit()