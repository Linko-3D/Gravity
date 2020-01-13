extends Area

func _process(delta):
	$Ammo1.rotate_z(-0.05)
	$Ammo2.rotate_x(-0.05)

func _on_Ammo_body_entered(body):
	if body.get("ammo") != null:
		body.ammo += 1
		GLOBAL.ammo.text = str(body.ammo)
		queue_free()