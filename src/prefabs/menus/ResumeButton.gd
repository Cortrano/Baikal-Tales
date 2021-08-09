extends TextureButton

func _ready():
	self.connect("pressed", self, "_on_Button_pressed")

func _on_Button_pressed():
	get_tree().paused = not get_tree().paused
	get_tree().get_root().get_node("Forest/MenuClick").play()
	get_tree().get_root().get_node("Forest/UI/Pause").visible = false

