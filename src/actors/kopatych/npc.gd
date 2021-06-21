extends KinematicBody2D

var active = false

func _process(_delta):
	$QuestionMark.visible = active
	
func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
#			get_tree().paused = true
			get_tree().get_root().find_node("Player", true, false).set_active(false)
			set_process_input(false)
			var dialog = Dialogic.start('timeline1')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)

func unpause(_timeline_name):
	get_tree().get_root().find_node("Player", true, false).set_active(true)
	set_process_input(true)
#	get_tree().paused = false
	
func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		active = true

func _on_Area2D_body_exited(body):
	if body.name == 'Player':
		active = false
