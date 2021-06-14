extends KinematicBody2D

export var speed = 80

var motion = Vector2()
var facing_right = true

#func _ready():
#	$AnimationPlayer.play("player_walk")
	
func _physics_process(delta):
	if facing_right == true:
		$Sprite.scale.x = 1
	else:
		$Sprite.scale.x = -1

	if Input.is_action_pressed("right"):
		motion.x = speed
		facing_right = true
		$AnimationPlayer.play("player_walk")
	elif Input.is_action_pressed("left"):
		motion.x = -speed
		facing_right = false
		$AnimationPlayer.play("player_walk")
	else:
		motion.x = 0
		$AnimationPlayer.stop()
	motion = move_and_slide(motion, Vector2(0,0))

