extends Area

func _process(delta):
	rotate_z(0.05)

func _on_Ammo_body_entered(body):
	if body.get("ammo") != null:
		body.ammo += 1
		GLOBAL.ammo.text = str(body.ammo)
		queue_free()