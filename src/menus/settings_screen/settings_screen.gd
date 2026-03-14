extends Control
class_name SettingsScreen


func _on_main_menu_btn_pressed() -> void:
	SceneTransitionManager.change_tree_to(SceneTransitionManager.Screens.MAIN_MENU_SCREEN)
