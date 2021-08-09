extends Area2D

export(String) var monolog 
var inZone = false

func _input(event):
	if get_node_or_null('DialogNode') == null and inZone:
		get_tree().get_root().find_node("Player", true, false).set_active(false)
		set_process_input(false)
		var dialog = Dialogic.start(monolog)
		dialog.pause_mode = Node.PAUSE_MODE_PROCESS
		dialog.connect('timeline_end', self, 'unpause')
		add_child(dialog)

func unpause(_timeline_name):
	get_tree().get_root().find_node("Player", true, false).set_active(true)
	set_process_input(true)
	Status.isMonogue1Done = true
	queue_free()


func _on_monologArea_body_entered(body):
	inZone = true
