extends Button
var buttonclick = preload("res://assets/audio/403007__inspectorj__ui-confirmation-alert-a2.wav")
func _ready():
	var button = get_node(".")
	button.connect("pressed", self, "_button_pressed")
	
func _button_pressed():
	$ButtonClick.play()
	yield(get_tree().create_timer(0.6), "timeout")
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Level3.tscn")
