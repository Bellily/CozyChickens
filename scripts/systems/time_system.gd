class_name TimeSystem
extends RefCounted

signal day_ended(day: int)
var day := 1

func advance_day() -> void:
	day += 1
	day_ended.emit(day)