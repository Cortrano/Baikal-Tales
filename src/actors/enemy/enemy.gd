extends KinematicBody2D


onready var AI = $AI
onready var posX1 = 10
var curPos
onready var timer = $Timer
var goRight = false

func _ready():
	curPos = position.x

func _process(delta):
	if goRight:
		move_and_slide(Vector2(posX1, 0) * 5)
		if abs(curPos - position.x) >= 300:
			timer.start()
	else:
		move_and_slide(Vector2(-posX1, 0) * 5)
		if abs(curPos - position.x) == 0:
			timer.start()
#	print(abs(curPos - position.x))
#	print(goRight)
	
func _on_Timer_timeout():
	goRight = !goRight
