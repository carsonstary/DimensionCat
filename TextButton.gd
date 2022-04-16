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
		get_parent().get_node("Text").text = "Uhh...This isn't where I wanted to go!"
	if clickcount == 1:
		get_parent().get_node("Text").text = "Join us. Join us. JOIN us. JOIN US. JOIN US. JOIN USSSS. JOIIIIN USSSSSSSS!!"
		get_parent().get_node("Icon").set_texture(portaltxt)
	if clickcount == 2:
		get_parent().get_node("Text").text = "Uuugh~ My head hurts so bad, I'm starting to hear voices. Must've had some intergalactic turbulence!"
		get_parent().get_node("Icon").set_texture(benjitxt)
	if clickcount == 3:
		get_parent().get_node("Text").text = "Maybe if I just walking back in... it'll all be okay."
	if clickcount == 4:
		clickcount = 999
		get_parent().get_parent().get_parent().get_node("Main/Portal").visible = false
		get_parent().get_parent().get_parent().get_node("MainTheme").stop()
		get_parent().get_parent().get_parent().get_node("GlitchSound").play()
		get_parent().get_parent().get_parent().get_node("Shader").visible = true
		yield(get_tree().create_timer(1), "timeout")
		popup.visible = true
		get_parent().get_node("Text").text = "WHATS GOING ON!?"
		yield(get_tree().create_timer(1), "timeout")
		get_parent().get_node("Text").text = "THIS ISNT SUPPOSED TO HAPPEN!"
		get_parent().get_parent().get_parent().get_node("Main/Player/Main Character/MC-Sprite").visible = false
		get_parent().get_parent().get_parent().get_node("Main/Player/Main Character/MC-Sprite3").visible = true
		get_parent().get_node("Text").text = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA!!!"
		yield(get_tree().create_timer(2), "timeout")
		#get_parent().get_parent().get_parent().get_node("Main/Player/Main Character/MC-Sprite3").visible = false
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Story2.tscn")
	popup.visible = true
	clickcount = clickcount + 1
