extends Area2D

var entered = false
var timer = true

func _process(_delta):
	if Status.dialogedWithNpc:
		queue_free()

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if entered and timer:
			timer = false
			$Timer.start()
#			get_tree().paused = true
			get_tree().get_root().find_node("Player", true, false).set_active(false)
			set_process_input(false)
			var dialog = Dialogic.start('early')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)

func unpause(_timeline_name):
	get_tree().get_root().find_node("Player", true, false).set_active(true)
	set_process_input(true)
#	get_tree().paused = false

func _on_earlyArea_body_entered(body):
	if body.name == 'Player':
		entered = true


func _on_earlyArea_body_exited(body):
	if body.name == 'Player':
		entered = false


func _on_Timer_timeout():
	timer = true
