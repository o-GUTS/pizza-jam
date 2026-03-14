extends Node
## A autoload to manage scene transitions
## Usage:
##[codeblock]
##SceneTransitionManager.change_tree_to(SceneTransitionManager.Screens.MAIN_GAME_SCREEN)
##[\codeblock]


## Private scenes UID's
const _MAIN_GAME_SCENE_UID: String = "uid://dk83b8asdsqkd"
const _MAIN_MENU_SCREEN_SCENE_UID: String = "uid://c0kklm6epasnv"
const _SETTINGS_SCREEN_SCENE_UID: String = "uid://bq01ysaw7qik1"
const _CREDITS_SCREEN_SCENE_UID: String = "uid://cb1usjdg0tq8e"

## Scenes available for transition
enum Screens {
	MAIN_GAME_SCREEN,
	MAIN_MENU_SCREEN,
	SETTINGS_SCREEN,
	CREDITS_SCREEN,
}


func change_tree_to(screen: Screens) -> void:
	match screen:
		Screens.MAIN_GAME_SCREEN:
			get_tree().change_scene_to_file(_MAIN_GAME_SCENE_UID)
		Screens.MAIN_MENU_SCREEN:
			get_tree().change_scene_to_file(_MAIN_MENU_SCREEN_SCENE_UID)
		Screens.SETTINGS_SCREEN:
			get_tree().change_scene_to_file(_SETTINGS_SCREEN_SCENE_UID)
		Screens.CREDITS_SCREEN:
			get_tree().change_scene_to_file(_CREDITS_SCREEN_SCENE_UID)
		_:
			assert(false, "Unreachable code")
