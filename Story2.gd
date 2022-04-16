extends Button
onready var popup = get_parent()
var clickcount = 0
var portaltxt = preload("res://assets/placeholder.png")
var benjitxt = preload("res://icon.png")

func _ready():
	var button = get_node(".")
	button.connect("pressed", self, "_button_pressed")
	
func _button_pressed():
	popup.visible = false
	if clickcount == 0:
		get_parent().get_node("Text").text = "But... I guess there's some new friends here?"
		get_parent().get_node("Icon").set_texture(benjitxt)
	if clickcount == 1:
		get_parent().get_node("Text").text = "Maybe I'll go say hi to one of them!"
	if clickcount == 2:
		get_parent().get_node("Text").text = "YOUUUCH~~ IT BIT ME."
	if clickcount == 3:
		get_parent().get_node("Text").text = "THEY ARE DEFINITELY NOT FRIENDS!"
		get_parent().get_parent().get_parent().get_node("GlitchSound").play()
		get_parent().get_parent().get_parent().get_node("World/Eyes").visible = true
		get_parent().get_parent().get_parent().get_node("Shader").visible = true
	if clickcount == 4:
		clickcount = 999
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://TileMap.tscn")
	popup.visible = true
	clickcount = clickcount + 1
