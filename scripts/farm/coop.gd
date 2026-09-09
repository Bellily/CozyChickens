class_name Coop
extends RefCounted

const MAX_ANIMALS := 20
var animals: Array[ChickenData] = []

func has_space() -> bool:
	return animals.size() < MAX_ANIMALS