extends Node

var stair_sound = load("res://sounds/stair.mp3")
var door_sound = load("res://sounds/door.wav")
var skelet_sound = load("res://sounds/skeleton.mp3")
var isPlaying = false setget ,get_is_playing

func play_sound(sound):
	match sound:
		'stair':
			$AudioStreamPlayer.stream = stair_sound
		'door':
			$AudioStreamPlayer.stream = door_sound
		'skelet':
			$AudioStreamPlayer.stream = skelet_sound
	$AudioStreamPlayer.play()
	
func play_skelet():
	$AudioStreamPlayer.stream = stair_sound
	$AudioStreamPlayer.play()
	
func stop_music():
	$AudioStreamPlayer.stop()
	
func get_is_playing():
	return $AudioStreamPlayer.playing
	
