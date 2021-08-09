extends Area2D

var active = false
export(String) var scene_to_load

func _on_levelArea_body_entered(body):
	if body.name == 'Player':
		get_tree().change_scene(scene_to_load)
