extends Area

func _on_Ammo_body_entered(body):
	if body.get("ammo") != null:
		body.ammo += 1
		GLOBAL.ammo.text = str(body.ammo)
		queue_free()