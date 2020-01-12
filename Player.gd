extends KinematicBody

export var speed = 6.5

var ammo = 1
var flipped = 1

var jump_force = 5
var movement = Vector3()
var gravity = 9.8

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
	print($Head.global_transform.basis)
	var input_axis = Vector2()
	
	input_axis.y = -Input.get_action_strength("ui_up") + Input.get_action_strength("ui_down")
	input_axis.x = (-Input.get_action_strength("ui_left") + Input.get_action_strength("ui_right")) * flipped
	
	input_axis = input_axis.normalized()
	
	movement.z = input_axis.y * speed
	movement.x = input_axis.x * speed
	movement.y -= gravity * delta

	movement = movement.rotated(global_transform.basis.y, $Head.rotation.y)
	
	if Input.is_action_just_pressed("ui_accept") and ammo > 0:
		rotation_degrees.z += 180
		gravity = gravity * -1
		$Head/Camera.rotation_degrees.x = $Head/Camera.rotation_degrees.x * -1
		ammo -= 1
		GLOBAL.ammo.text = str(ammo)
		flipped *= -1
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

	movement = move_and_slide(movement, Vector3.UP)

func _input(event):
	if event is InputEventMouseMotion:
		$Head.rotation_degrees.y -= event.relative.x / 10
		$Head/Camera.rotation_degrees.x = clamp($Head/Camera.rotation_degrees.x - event.relative.y / 10, -90, 90)