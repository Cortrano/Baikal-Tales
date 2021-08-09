extends Node2D

var active = false
var pressed = false
export(String) var sound

func _process(_delta):
	$QuestionMark.visible = active

func _input(event):
	if event.is_action_pressed("interact") and active and not pressed:
		if not MusicController.isPlaying:
			MusicController.play_sound("skelet")
		get_tree().get_root().find_node("BckgMusic", true, false).stop()
		get_tree().get_root().find_node("BckgMusic2", true, false).play()
		get_tree().get_root().find_node("skelet1", true, false).visible = false
		get_tree().get_root().find_node("skelet2", true, false).visible = true
		get_tree().get_root().get_node("Forest/monologArea").monitoring = true
		Status.stairDisabled = true
		pressed = true
		
		


func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		active = true


func _on_Area2D_body_exited(body):
	if body.name == 'Player':
		active = false
