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
		if globals.drain == true:
			globals.set_kills(globals.kills - 100)
			globals.set_drain(false)
			globals.set_weapon(3)
			get_tree().change_scene("res://Level2.tscn")
		else:
			get_parent().get_parent().get_node("Shop-BG/AlreadyUpgrade").show()
			yield(get_tree().create_timer(3.0), "timeout")
			get_parent().get_parent().get_node("Shop-BG/AlreadyUpgrade").hide()
		get_tree().change_scene("res://Level2.tscn")
	else:
		get_parent().get_parent().get_node("Shop-BG/NoMoney").show()
		get_parent().get_parent().get_node("Shop-BG/NoMoney/Stealing").show()
		yield(get_tree().create_timer(3.0), "timeout")
		if get_parent().get_parent().get_node("Shop-BG/NoMoney/Stealing").is_visible():
			get_parent().get_parent().get_node("Shop-BG/NoMoney").hide()
			get_parent().get_parent().get_node("Shop-BG/NoMoney/Stealing").hide()
