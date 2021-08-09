extends TextureButton

func _ready():
	self.connect("pressed", self, "_on_Button_pressed")

func _on_Button_pressed():
	get_tree().get_root().get_node("TitleScreen/MenuClick").play()
	get_tree().get_root().get_node("TitleScreen/CanvasLayer/Menu").visible = true
	get_tree().get_root().get_node("TitleScreen/CanvasLayer/Settings").visible = false
	get_tree().get_root().get_node("TitleScreen/CanvasLayer/Credits").visible = false
