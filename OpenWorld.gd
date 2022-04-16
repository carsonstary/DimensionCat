extends Button
var buttonclick = preload("res://assets/audio/403007__inspectorj__ui-confirmation-alert-a2.wav")
onready var globals = get_node("/root/Variables")
onready var globals2 = get_node("/root/Variables2")

func _ready():
	var button = get_node(".")
	button.connect("pressed", self, "_button_pressed")
	
func _button_pressed():
	$ButtonClick.play()
	yield(get_tree().create_timer(0.6), "timeout")
	# warning-ignore:return_value_discarded
	if globals.level == 1:
		get_tree().change_scene("res://Story1.tscn")
	if globals.level == 2:
		get_tree().change_scene("res://Level2.tscn")
	if globals.level == 3:
		get_tree().change_scene("res://Level3.tscn")
