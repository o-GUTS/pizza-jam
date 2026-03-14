extends Control
class_name SettingsScreen


@onready var resolution_options: OptionButton = %resolution_options
@onready var fullscreen_checkbox: CheckBox = %fullscreen_checkbox
@onready var vsync_checkbox: CheckBox = %vsync_checkbox


func _ready() -> void:
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		fullscreen_checkbox.button_pressed = true
	
	if DisplayServer.window_get_vsync_mode() == DisplayServer.VSYNC_ENABLED:
		vsync_checkbox.button_pressed = true


func _on_main_menu_btn_pressed() -> void:
	SceneTransitionManager.change_tree_to(SceneTransitionManager.Screens.MAIN_MENU_SCREEN)


func _on_resolution_options_item_selected(index: int) -> void:
	var values: PackedFloat64Array = resolution_options.get_item_text(index).split_floats('x', false)
	get_window().content_scale_size = Vector2i(int(values[0]), int(values[1]))


func _on_fullscreen_checkbox_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_vsync_checkbox_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
