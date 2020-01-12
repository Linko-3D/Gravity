extends Node

var ammo

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pause_mode = PAUSE_MODE_PROCESS

func _process(delta):
	
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
	
	if Input.is_action_just_pressed("ui_cancel"):
		if get_tree().paused:
			get_tree().quit()
		get_tree().paused = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		get_tree().paused = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
