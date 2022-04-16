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
		get_parent().get_node("Text").text = "Ooh! I think I see someone!"
		get_parent().get_node("Icon").set_texture(benjitxt)
	if clickcount == 1:
		get_parent().get_node("Text").text = "Hey! Who are you!"
		get_parent().get_parent().get_parent().get_node("GlitchSound").play()
		get_parent().get_parent().get_parent().get_node("Shader").visible = true
		yield(get_tree().create_timer(2), "timeout")
		get_parent().get_parent().get_parent().get_node("GlitchSound").stop()
		get_parent().get_parent().get_parent().get_node("Shader").visible = false
	if clickcount == 2:
		get_parent().get_node("Text").text = "I-uh.. I guess I'll have to go over there."
	if clickcount == 3:
		get_parent().get_node("Text").text = "STAY BACK! I HAVE A WEAPON!"
		get_parent().get_node("Icon").set_texture(baguettetxt)
	if clickcount == 4:
		get_parent().get_node("Text").text = "Hey, hey! I don't mean any trouble...please."
		get_parent().get_node("Icon").set_texture(benjitxt)
	if clickcount == 5: 
		get_parent().get_parent().get_parent().get_node("GlitchSound").play()
		get_parent().get_parent().get_parent().get_node("Shader").visible = true
		get_parent().get_parent().get_parent().get_node("Breath").play()
		yield(get_tree().create_timer(1), "timeout")
		get_parent().get_parent().get_parent().get_node("GlitchSound").stop()
		get_parent().get_parent().get_parent().get_node("Shader").visible = false
		get_parent().get_node("Text").text = "Oh, I see. It's nice to meet you."
		get_parent().get_node("Icon").set_texture(baguettetxt)
	if clickcount == 6:
		get_parent().get_node("Text").text = "I guess those spiders have me on edge, ah."
	if clickcount == 7:
		get_parent().get_node("Text").text = "You know what... why don't you go down there and fight some for me?"
	if clickcount == 8:
		get_parent().get_node("Text").text = "I could really use a break from this whole *thing*"
	if clickcount == 9:
		get_parent().get_node("Text").text = "I-i don't know. That sounds awfully dangerous..."
		get_parent().get_node("Icon").set_texture(benjitxt)
	if clickcount == 10:
		get_parent().get_node("Text").text = "Great! I'll see you down there."
		get_parent().get_node("Icon").set_texture(baguettetxt)
	if clickcount == 11:
		clickcount = 999
		get_parent().get_parent().get_parent().get_node("GlitchSound").play()
		get_parent().get_parent().get_parent().get_node("Shader").visible = true
		yield(get_tree().create_timer(2), "timeout")
		get_parent().get_parent().get_parent().get_node("GlitchSound").stop()
		get_parent().get_parent().get_parent().get_node("Shader").visible = false
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Level2.tscn")
	popup.visible = true
	clickcount = clickcount + 1
