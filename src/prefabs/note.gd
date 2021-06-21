extends Sprite

var active = false
var opened = false

func _process(_delta):
	$QuestionMark.visible = active
	
func _input(event):
	if opened == false:
		if event.is_action_pressed("interact") and active:
			$AudioStreamPlayer2D.play()
#			get_tree().paused = true
			get_tree().get_root().find_node("Player", true, false).set_active(false)
#			set_process_input(false)
			get_tree().get_root().find_node("NoteCanvas", true, false).visible = true
			opened = true
#			var dialog = Dialogic.start('timeline1')
#			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
#			dialog.connect('timeline_end', self, 'unpause')
#			add_child(dialog)
	else:
		if event.is_action_pressed("interact") and active:
			$AudioStreamPlayer2D.play()
			unpause()

func unpause():
	get_tree().get_root().find_node("Player", true, false).set_active(true)
	set_process_input(true)
	get_tree().get_root().find_node("NoteCanvas", true, false).visible = false
	opened = false
#	get_tree().paused = false
	
func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		active = true

func _on_Area2D_body_exited(body):
	if body.name == 'Player':
		active = false
