extends Button
onready var globals = get_node("/root/Variables")
onready var globals2 = get_node("/root/Variables2")
var buttonclick = preload("res://assets/audio/403007__inspectorj__ui-confirmation-alert-a2.wav")

func _ready():
	var button = get_node(".")
	button.connect("pressed", self, "_button_pressed")
	
func _button_pressed():
	get_parent().get_parent().get_parent().get_node("ButtonClick").play()
	if globals.kills >= 100:
# warning-ignore:return_value_discarded
		globals.set_kills(globals.kills - 100)
		globals.set_level(4)
		globals2.set_luck(false)
		get_tree().change_scene("res://Menu2.tscn")
	else:
		get_parent().get_parent().get_node("Shop-BG/NoMoney").show()
		get_parent().get_parent().get_node("Shop-BG/NoMoney/Stealing").show()
		yield(get_tree().create_timer(3.0), "timeout")
		if get_parent().get_parent().get_node("Shop-BG/NoMoney/Stealing").is_visible():
			get_parent().get_parent().get_node("Shop-BG/NoMoney").hide()
			get_parent().get_parent().get_node("Shop-BG/NoMoney/Stealing").hide()

func get_input():
	if Input.is_action_just_released("escape"):
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Level3.tscn")

func _physics_process(_delta):
	get_input()
