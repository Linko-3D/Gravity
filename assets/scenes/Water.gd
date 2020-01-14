extends Area

func _on_Water_body_entered(body):
	get_tree().reload_current_scene()