extends Node2D

signal state_changed(new_state)

enum State {
	PATROL, #waypoints walk
	ENGAGE, #running after the player and kill if in attackZone
	SEARCH, #afer player hides stands near and starts miniGame (kill/patrol)
}

onready var playerDetector: Area2D = $PlayerDetector

var player: Player = null
var current_state: int = State.PATROL setget set_state

func set_state(new_state: int):
	if new_state == current_state:
		return
	current_state = new_state

