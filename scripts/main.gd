extends Control

const BreedingSystemScript = preload("res://scripts/genetics/breeding_system.gd")
const PocCatalogScript = preload("res://scripts/genetics/poc_catalog.gd")

var parent_controls: Array[Dictionary] = []
var results_container: VBoxContainer
var status_label: Label
var selected_chicken_label: Label

func _ready() -> void:
	_build_interface()
	_run_cross()

func _build_interface() -> void:
	var root := self
	root.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	var background := TextureRect.new()
	background.texture = load("res://assets/stall.png")
	background.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	background.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
	background.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	root.add_child(background)

	_add_chicken("Schwarzer Hahn", "res://assets/rooster.png", Vector2(0.52, 0.50), "schwarz_trager", "weisse_tupfen_trager", "male")
	_add_chicken("Schwarze Henne", "res://assets/hen.png", Vector2(0.30, 0.55), "schwarz", "weisse_tupfen", "female")
	_add_chicken("Perlgraue Henne", "res://assets/hen_perlgrau.png", Vector2(0.70, 0.47), "perlgrau", "weisse_tupfen", "female")

	var title_panel := _panel_at(Vector2(0.03, 0.035), Vector2(300, 112), Vector2(0, 0))
	root.add_child(title_panel)
	var title_column := VBoxContainer.new()
	title_column.add_theme_constant_override("separation", 4)
	title_panel.get_child(0).add_child(title_column)
	var heading := Label.new()
	heading.text = "COZY CHICKENS"
	heading.add_theme_font_size_override("font_size", 25)
	heading.add_theme_color_override("font_color", Color("#f6d79b"))
	title_column.add_child(heading)
	var subtitle := Label.new()
	subtitle.text = "Mein kleiner Stall"
	subtitle.add_theme_color_override("font_color", Color("#d2e0d1"))
	title_column.add_child(subtitle)
	selected_chicken_label = Label.new()
	selected_chicken_label.text = "Wähle ein Huhn aus"
	selected_chicken_label.add_theme_color_override("font_color", Color("#f6d79b"))
	title_column.add_child(selected_chicken_label)

	var breeding_panel := _panel_at(Vector2(0.03, 0.67), Vector2(530, 260), Vector2(0, 0))
	root.add_child(breeding_panel)
	var breeding_column := VBoxContainer.new()
	breeding_column.add_theme_constant_override("separation", 8)
	breeding_panel.get_child(0).add_child(breeding_column)
	var breeding_heading := Label.new()
	breeding_heading.text = "Zuchtmenü"
	breeding_heading.add_theme_font_size_override("font_size", 20)
	breeding_heading.add_theme_color_override("font_color", Color("#f6d79b"))
	breeding_column.add_child(breeding_heading)
	var parents := HBoxContainer.new()
	parents.add_theme_constant_override("separation", 10)
	breeding_column.add_child(parents)
	parents.add_child(_build_parent_card("Elter 1", "gold", "porzellan", "male"))
	parents.add_child(_build_parent_card("Elter 2", "perlgrau", "weisse_tupfen", "female"))
	var action_row := HBoxContainer.new()
	action_row.add_theme_constant_override("separation", 12)
	breeding_column.add_child(action_row)
	var breed_button := Button.new()
	breed_button.text = "Kreuzung berechnen"
	breed_button.custom_minimum_size = Vector2(200, 38)
	breed_button.pressed.connect(_run_cross)
	action_row.add_child(breed_button)
	status_label = Label.new()
	status_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	status_label.add_theme_color_override("font_color", Color("#d2e0d1"))
	action_row.add_child(status_label)

	var results_panel := _panel_at(Vector2(0.68, 0.67), Vector2(0, 260), Vector2(0, 0))
	results_panel.anchor_right = 1.0
	results_panel.offset_right = -28
	root.add_child(results_panel)
	var result_column := VBoxContainer.new()
	result_column.add_theme_constant_override("separation", 8)
	results_panel.get_child(0).add_child(result_column)
	var result_heading := Label.new()
	result_heading.text = "Mögliche Nachkommen"
	result_heading.add_theme_font_size_override("font_size", 18)
	result_heading.add_theme_color_override("font_color", Color("#f6d79b"))
	result_column.add_child(result_heading)
	var results_scroll := ScrollContainer.new()
	results_scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	results_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	result_column.add_child(results_scroll)
	results_container = VBoxContainer.new()
	results_container.add_theme_constant_override("separation", 8)
	results_container.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	results_scroll.add_child(results_container)

func _panel_at(anchor: Vector2, size: Vector2, offset: Vector2) -> PanelContainer:
	var panel := PanelContainer.new()
	panel.set_anchors_preset(Control.PRESET_TOP_LEFT)
	panel.anchor_left = anchor.x
	panel.anchor_top = anchor.y
	panel.anchor_right = anchor.x
	panel.anchor_bottom = anchor.y
	panel.offset_left = offset.x
	panel.offset_top = offset.y
	panel.offset_right = offset.x + size.x
	panel.offset_bottom = offset.y + size.y
	panel.add_theme_stylebox_override("panel", _style(Color("#17231fe8"), Color("#d2a66a"), 1, 12))
	var margin := MarginContainer.new()
	for side in ["left", "top", "right", "bottom"]:
		margin.add_theme_constant_override("margin_%s" % side, 12)
	panel.add_child(margin)
	return panel

func _add_chicken(label_text: String, texture_path: String, anchor: Vector2, color_name: String, pattern_name: String, sex: String) -> void:
	var chicken := TextureButton.new()
	var texture: Texture2D = load(texture_path)
	chicken.texture_normal = texture
	chicken.ignore_texture_size = false
	chicken.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
	chicken.set_anchors_preset(Control.PRESET_TOP_LEFT)
	chicken.anchor_left = anchor.x
	chicken.anchor_top = anchor.y
	chicken.anchor_right = anchor.x
	chicken.anchor_bottom = anchor.y
	var texture_size := texture.get_size()
	chicken.offset_left = -texture_size.x / 2.0
	chicken.offset_top = -texture_size.y / 2.0
	chicken.offset_right = texture_size.x / 2.0
	chicken.offset_bottom = texture_size.y / 2.0
	chicken.tooltip_text = label_text
	chicken.pressed.connect(_on_chicken_selected.bind(label_text, color_name, pattern_name, sex))
	add_child(chicken)

func _on_chicken_selected(label_text: String, color_name: String, pattern_name: String, sex: String) -> void:
	selected_chicken_label.text = "%s ausgewählt" % label_text
	var parent_index := 0 if sex == "male" else 1
	var controls: Dictionary = parent_controls[parent_index]
	_select_option(controls.color, color_name)
	_select_option(controls.pattern, pattern_name)
	controls.sex.select(0 if sex == "male" else 1)

func _build_parent_card(title: String, default_color: String, default_pattern: String, default_sex: String) -> PanelContainer:
	var card := PanelContainer.new()
	card.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	card.add_theme_stylebox_override("panel", _style(Color("#17231f"), Color("#2f493e"), 1, 14))
	var margin := MarginContainer.new()
	for side in ["left", "top", "right", "bottom"]:
		margin.add_theme_constant_override("margin_%s" % side, 16)
	card.add_child(margin)
	var column := VBoxContainer.new()
	column.add_theme_constant_override("separation", 9)
	margin.add_child(column)
	var label := Label.new()
	label.text = title
	label.add_theme_font_size_override("font_size", 17)
	label.add_theme_color_override("font_color", Color("#f6d79b"))
	column.add_child(label)
	var color_select := OptionButton.new()
	_add_options(color_select, ["schwarz", "schwarz_trager", "perlgrau", "perlgrau_trager", "weiss", "creme", "gelb", "blau", "gold", "goldhalsig", "gold_mahagoni", "silber", "perlgrau_silber"])
	_select_option(color_select, default_color)
	column.add_child(color_select)
	var pattern_select := OptionButton.new()
	_add_options(pattern_select, ["einfarbig", "goldhalsig", "weisse_tupfen", "weisse_tupfen_trager", "porzellan", "schwarzer_schwanz", "gesperbert"])
	_select_option(pattern_select, default_pattern)
	column.add_child(pattern_select)
	var sex_select := OptionButton.new()
	_add_options(sex_select, ["male", "female"])
	sex_select.set_item_text(0, "Hahn")
	sex_select.set_item_text(1, "Henne")
	sex_select.select(0 if default_sex == "male" else 1)
	column.add_child(sex_select)
	parent_controls.append({"color": color_select, "pattern": pattern_select, "sex": sex_select})
	return card

func _add_options(select: OptionButton, options: Array[String]) -> void:
	for option in options:
		select.add_item(option)

func _select_option(select: OptionButton, value: String) -> void:
	for index in select.item_count:
		if select.get_item_text(index) == value:
			select.select(index)
			return

func _run_cross() -> void:
	if results_container == null:
		return
	for child in results_container.get_children():
		child.queue_free()
	var parents: Array[ChickenGenome] = []
	for controls in parent_controls:
		var sex := "female" if controls.sex.selected == 1 else "male"
		parents.append(PocCatalogScript.genome_from_description(controls.color.get_item_text(controls.color.selected), controls.pattern.get_item_text(controls.pattern.selected), sex))
	var results: Array[Dictionary] = BreedingSystemScript.new().possible_offspring(parents[0], parents[1])
	status_label.text = "%d sichtbare Kombinationen" % results.size()
	for result in results:
		results_container.add_child(_build_result_row(result))

func _build_result_row(result: Dictionary) -> PanelContainer:
	var row := PanelContainer.new()
	row.add_theme_stylebox_override("panel", _style(Color("#20332b"), Color("#365447"), 1, 9))
	var margin := MarginContainer.new()
	for side in ["left", "top", "right", "bottom"]:
		margin.add_theme_constant_override("margin_%s" % side, 10)
	row.add_child(margin)
	var line := HBoxContainer.new()
	line.add_theme_constant_override("separation", 16)
	margin.add_child(line)
	var name := Label.new()
	name.text = "%s  /  %s" % [result.color, result.pattern]
	name.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	name.add_theme_font_size_override("font_size", 16)
	line.add_child(name)
	var sex := Label.new()
	sex.text = "Henne" if result.sex == "female" else "Hahn"
	sex.custom_minimum_size.x = 70
	sex.add_theme_color_override("font_color", Color("#b7cbbd"))
	line.add_child(sex)
	var chance := Label.new()
	chance.text = "%.1f%%" % (result.probability * 100.0)
	chance.custom_minimum_size.x = 70
	chance.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	chance.add_theme_color_override("font_color", Color("#f6d79b"))
	line.add_child(chance)
	return row

func _style(fill: Color, border: Color, width: int, radius: int) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = fill
	style.border_color = border
	style.set_border_width_all(width)
	style.set_corner_radius_all(radius)
	return style