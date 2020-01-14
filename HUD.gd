extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	GLOBAL.ammo = $Ammo

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print($Timer.time_left)


func _on_Timer_timeout():
	pass # Replace with function body.
