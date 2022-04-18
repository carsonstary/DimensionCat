extends Button
onready var popup = get_parent()
var clickcount = 0
var portaltxt = preload("res://assets/placeholder.png")
var baguettetxt = preload("res://assets/BaguetteMan.png")
var benjitxt = preload("res://icon.png")

func _ready():
	var button = get_node(".")
	button.connect("pressed", self, "_button_pressed")
	
func _button_pressed():
	popup.visible = false
	if clickcount == 0:
		get_parent().get_node("Text").text = "Oh look!"
	if clickcount == 1:
		get_parent().get_node("Text").text = "I didn't expect you to be back so soon!"
		get_parent().get_parent().get_parent().get_node("GlitchSound").play()
		yield(get_tree().create_timer(1), "timeout")
		get_parent().get_parent().get_parent().get_node("GlitchSound").stop()
	if clickcount == 2:
		get_parent().get_node("Text").text = "I put traps in there and everything to stop your escape."
	if clickcount == 3:
		get_parent().get_node("Text").text = "You must be stronger than I thought..."
	if clickcount == 4:
		get_parent().get_node("Text").text = "You just won't let me catch a break, will you?"
	if clickcount == 5:
		get_parent().get_parent().get_parent().get_node("GlitchSound").play()
		yield(get_tree().create_timer(1), "timeout")
		get_parent().get_parent().get_parent().get_node("GlitchSound").stop()
		get_parent().get_node("Text").text = ". . ."
	if clickcount == 6:
		get_parent().get_node("Text").text = "Even if I have to use all my energy to trap you in that little dungeon-"
	if clickcount == 7:
		get_parent().get_node("Text").text = "I'll do it. No matter what, Benji."
	if clickcount == 8:
		clickcount = 999
		get_parent().get_parent().get_parent().get_node("GlitchSound").play()
		yield(get_tree().create_timer(3), "timeout")
		get_parent().get_parent().get_parent().get_node("GlitchSound").stop()
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menu2.tscn")
	popup.visible = true
	clickcount = clickcount + 1
