extends Control
class_name CreditsSCreen


func _on_main_menu_btn_pressed() -> void:
	SceneTransitionManager.change_tree_to(SceneTransitionManager.Screens.MAIN_MENU_SCREEN)
