extends Button

func _ready():
	var button = get_node(".")
	button.connect("pressed", self, "_button_pressed")
	
func _button_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Story1.tscn")

func get_input():
	if Input.is_action_pressed("ui_accept"):
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Story1.tscn")
	if Input.is_action_pressed("escape"):
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menu.tscn")

func _physics_process(_delta):
	get_input()
