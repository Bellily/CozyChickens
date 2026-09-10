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

	var colors := ["schwarz", "schwarz_trager", "weiss", "creme", "gelb", "blau", "gold", "goldhalsig", "gold_mahagoni", "silber", "perlgrau", "perlgrau_silber"]
	var patterns := ["einfarbig", "schwarzer_schwanz", "weisse_tupfen", "porzellan", "gesperbert"]
	for color_name in colors:
		for pattern_name in patterns:
			var profile := PocCatalogScript.genome_from_description(color_name, pattern_name)
			var profile_results: Array[Dictionary] = BreedingSystemScript.new().possible_offspring(profile, profile)
			assert(not profile_results.is_empty(), "Profil muss kreuzbar sein: %s,%s" % [color_name, pattern_name])

	var gold_profile := PocCatalogScript.genome_from_description("gold", "einfarbig")
	var silver_profile := PocCatalogScript.genome_from_description("silber", "einfarbig")
	var silver_cross: Array[Dictionary] = BreedingSystemScript.new().possible_offspring(gold_profile, silver_profile)
	assert(silver_cross.size() == 1, "Gold x Silber muss einen sichtbaren Phänotyp ergeben.")
	assert(silver_cross[0].color == "silber", "S/s+ muss sichtbares Silber ergeben.")

	var gold_rooster := PocCatalogScript.genome_from_description("gold", "einfarbig", "male")
	var silver_hen := PocCatalogScript.genome_from_description("silber", "einfarbig", "female")
	var sex_linked_silver: Array[Dictionary] = BreedingSystemScript.new().possible_offspring(gold_rooster, silver_hen)
	assert(sex_linked_silver.size() == 2, "Z-Vererbung muss Sohn und Tochter getrennt ausgeben.")
	for outcome in sex_linked_silver:
		if outcome.sex == "male":
			assert(outcome.color == "silber", "Ein Sohn erbt das S-Allel von der Henne.")
		else:
			assert(outcome.color == "gold", "Eine Tochter erbt das W der Henne und bleibt gold.")

	var silver_porcelain := PocCatalogScript.genome_from_description("silber", "porzellan")
	assert(silver_porcelain.phenotype().color == "silber", "Silber-Porzellan muss eine silberne Grundfarbe haben.")
	assert(silver_porcelain.phenotype().pattern == "porzellan", "Silber-Porzellan muss das Porzellanmuster haben.")
	var pearl_silver_porcelain := PocCatalogScript.genome_from_description("perlgrau_silber", "porzellan")
	assert(pearl_silver_porcelain.phenotype().color == "perlgrau_silber", "Perlgrau-Silber-Porzellan muss perlgrau-silber ausgegeben werden.")
	assert(pearl_silver_porcelain.phenotype().pattern == "porzellan", "Perlgrau-Silber-Porzellan muss das Porzellanmuster haben.")

	var gold_neck := PocCatalogScript.genome_from_description("goldhalsig", "einfarbig")
	assert(gold_neck.phenotype().color == "gold", "Goldhalsig bleibt ohne Dominant-Weiss goldfarben.")
	assert(gold_neck.phenotype().pattern == "goldhalsig", "Das Goldhalsig-Merkmal muss sichtbar bleiben.")
	var cream := PocCatalogScript.genome_from_description("creme", "einfarbig")
	assert(cream.phenotype().color == "creme", "I/I auf Goldbasis muss Creme ergeben.")
	var red_saddled_cross: Array[Dictionary] = BreedingSystemScript.new().possible_offspring(cream, gold_neck)
	assert(red_saddled_cross.size() == 1, "Creme x Goldhalsig muss einen sichtbaren Phänotyp ergeben.")
	assert(red_saddled_cross[0].color == "rotgesattelt", "I/i+ mit Goldhalsig muss Rotgesattelt ergeben.")

	var mahogany := PocCatalogScript.genome_from_description("gold_mahagoni", "einfarbig")
	var mahogany_cross: Array[Dictionary] = BreedingSystemScript.new().possible_offspring(cream, mahogany)
	var found_red_saddled := false
	for outcome in mahogany_cross:
		if outcome.color == "rotgesattelt":
			found_red_saddled = true
	assert(found_red_saddled, "I/i+ mit Mh muss auch ohne Goldhalsig Rotgesattelt erzeugen.")

	var lavender_carrier := PocCatalogScript.genome_from_description("perlgrau_traeger", "einfarbig")
	assert(lavender_carrier.phenotype().color == "schwarz", "Perlgrau-Träger muss sichtbar schwarz sein.")
	assert("lavender=Lav+/lav" in lavender_carrier.phenotype().color_genotype, "Perlgrau-Träger muss Lavender tragen.")
	var mottled_carrier := PocCatalogScript.genome_from_description("schwarz", "weisse_tupfen_traeger")
	assert(mottled_carrier.phenotype().pattern == "einfarbig", "Tupfen-Träger muss sichtbar einfarbig sein.")
	assert("mottled=mo+/mo" in mottled_carrier.phenotype().pattern_genotype, "Tupfen-Träger muss mo tragen.")

	var double_carrier_a := PocCatalogScript.genome_from_description("schwarz_trager", "weisse_tupfen_trager")
	var double_carrier_b := PocCatalogScript.genome_from_description("schwarz_trager", "weisse_tupfen_trager")
	var double_carrier_cross: Array[Dictionary] = BreedingSystemScript.new().possible_offspring(double_carrier_a, double_carrier_b)
	assert(double_carrier_cross.size() == 4, "Zwei unabhaengige Trager-Loci muessen vier sichtbare Kombinationen erzeugen.")
	var found_sixteenth := false
	for outcome in double_carrier_cross:
		if is_equal_approx(outcome.probability, 0.0625):
			found_sixteenth = true
	assert(found_sixteenth, "Zwei unabhaengige Trager-Loci muessen auch eine 6,25%-Kombination erzeugen.")

	var gold_porcelain := PocCatalogScript.genome_from_description("gold", "porzellan")
	var lavender_mottled := PocCatalogScript.genome_from_description("perlgrau", "weisse_tupfen")
	var mixed_outcomes: Array[Dictionary] = BreedingSystemScript.new().possible_offspring(gold_porcelain, lavender_mottled)
	assert(mixed_outcomes.size() == 1, "Gold-Porzellan x Perlgrau-Tupfen muss einen sichtbaren Phänotyp ergeben.")
	assert(mixed_outcomes[0].color == "schwarz", "Lav+/lav darf nicht als Perlgrau erscheinen.")
	assert(mixed_outcomes[0].pattern == "weisse_tupfen", "Db/db+ darf nicht automatisch Porzellan auslösen.")
	print("Genetik-Tests erfolgreich")
	quit()