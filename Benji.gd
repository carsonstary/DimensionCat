extends Button
onready var texture

func _ready():
	var button = get_node(".")
	button.connect("pressed", self, "_button_pressed")
	
func _button_pressed():
	get_tree().reload_current_scene()
	texture = true
	get_tree().change_scene("res://Menu.tscn")
