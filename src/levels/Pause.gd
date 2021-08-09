extends VBoxContainer

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = not get_tree().paused
		get_tree().get_root().get_node("Forest/MenuClick").play()
		get_tree().get_root().get_node("Forest/UI/Pause").visible = not get_tree().get_root().get_node("Forest/UI/Pause").visible

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
