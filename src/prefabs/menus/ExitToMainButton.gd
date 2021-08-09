extends TextureButton

export(String) var scene_to_load

func _ready():
	self.connect("pressed", self, "_on_Button_pressed", [scene_to_load])

func _on_Button_pressed(scene_to_load):
	get_tree().paused = false
	get_tree().get_root().get_node("Forest/MenuClick").play()
	get_tree().change_scene(scene_to_load)
