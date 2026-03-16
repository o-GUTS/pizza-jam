extends Node3D
class_name DayNightManager


@onready var sun: DirectionalLight3D = %sun
@onready var moon: DirectionalLight3D = %moon
@onready var progress_bar: ProgressBar = %progress_bar
@onready var world_environment: WorldEnvironment = %world_environment

const NIGHT_DURATION_SECONDS: float = 10
const DAY_DURATION_SECONDS: float = 5

#var fog_density_start: float = 2.5
var fog_density_end: float = 0

#var moon_color_start := Color("9d9d9dff")
var moon_color_end := Color("#ffff")
#var moon_angle_degrees_start: float = -115.0
var moon_angle_degrees_end: float = -270.0

#var sun_angle_degrees_start: float = 25.0
var sun_angle_degrees_end: float = -50.0


func _ready():
	var day_tween: Tween = create_tween().set_parallel()
	day_tween.tween_property(
		sun, "rotation_degrees:x",
		sun_angle_degrees_end, DAY_DURATION_SECONDS
	)
	day_tween.set_trans(Tween.TRANS_CUBIC)
	day_tween.pause()
	
	var night_tween: Tween = create_tween().set_parallel()
	night_tween.set_trans(Tween.TRANS_CUBIC)
	night_tween.tween_property(
		world_environment.environment, "fog_density",
		fog_density_end, NIGHT_DURATION_SECONDS
	)
	night_tween.tween_property(
		moon, "light_color",
		moon_color_end, NIGHT_DURATION_SECONDS
	)
	night_tween.tween_property(
		moon, "rotation_degrees:x",
		moon_angle_degrees_end, NIGHT_DURATION_SECONDS
	)
	night_tween.finished.connect(
		# Starts the day cycle when night finishes
		func() -> void:
			moon.hide()
			sun.show()
			day_tween.play()
	)
	
	create_tween().tween_property(
		progress_bar, "value", 1, DAY_DURATION_SECONDS + NIGHT_DURATION_SECONDS
	)
