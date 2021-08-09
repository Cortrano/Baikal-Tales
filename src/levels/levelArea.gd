extends Area2D

var active = false
export(String) var scene_to_load
export(String) var sound

func _ready():
	if scene_to_load == "res://src/levels/attic.tscn":
		if Status.stairDisabled:
			queue_free()

func _process(_delta):
	$QuestionMark.visible = active
	
func _input(event):
	if event.is_action_pressed("interact") and active:
		if not MusicController.isPlaying:
			MusicController.play_sound(sound)
		get_tree().change_scene(scene_to_load)

func _on_levelArea_body_entered(body):
	if body.name == 'Player':
		active = true

func _on_levelArea_body_exited(body):
	if body.name == 'Player':
		active = false
