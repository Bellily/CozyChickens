class_name ChickenData
extends RefCounted

var id: String
var sex: String
var breed: String
var genome: ChickenGenome

func _init(chicken_id: String, chicken_sex: String, chicken_breed: String, chicken_genome: ChickenGenome) -> void:
	id = chicken_id
	sex = chicken_sex
	breed = chicken_breed
	genome = chicken_genome