extends Control
class_name MainMenu


@onready var play_btn: Button = %play_btn
@onready var settings_btn: Button = %settings_btn
@onready var quit_btn: Button = %quit_btn


func _on_play_btn_pressed() -> void:
	SceneTransitionManager.change_tree_to(SceneTransitionManager.Screens.MAIN_GAME_SCREEN)


func _on_settings_btn_pressed() -> void:
	SceneTransitionManager.change_tree_to(SceneTransitionManager.Screens.SETTINGS_SCREEN)


func _on_credits_btn_pressed() -> void:
	SceneTransitionManager.change_tree_to(SceneTransitionManager.Screens.CREDITS_SCREEN)


func _on_quit_btn_pressed() -> void:
	get_tree().quit()
