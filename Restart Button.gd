extends Button
onready var globals = get_node("/root/Variables")
onready var globals2 = get_node("/root/Variables2")

func _ready():
	var button = get_node(".")
	button.connect("pressed", self, "_button_pressed")
	
func _button_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menu.tscn")

func get_input():
	if Input.is_action_just_released("ui_accept"):
# warning-ignore:return_value_discarded
		if globals.level == 1:
			get_tree().change_scene("res://TileMap.tscn")
		if globals.level == 2:
			get_tree().change_scene("res://Level2.tscn")
		if globals.level == 3:
			get_tree().change_scene("res://Level3.tscn")
	if Input.is_action_just_released("escape"):
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menu.tscn")

func _physics_process(_delta):
	get_input()
