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
		get_parent().get_node("Text").text = "Oh. Hello again."
	if clickcount == 1:
		get_parent().get_node("Text").text = "I assume you just didn't hear me when I said to stop trying the last time?"
		get_parent().get_parent().get_parent().get_node("GlitchSound").play()
		yield(get_tree().create_timer(1), "timeout")
		get_parent().get_parent().get_parent().get_node("GlitchSound").stop()
	if clickcount == 2:
		get_parent().get_node("Text").text = "You wouldn't dare disobey me, would you?"
	if clickcount == 3:
		get_parent().get_node("Text").text = "I thought I was very clear. Nobody escapes me. Nobody at all."
	if clickcount == 4:
		get_parent().get_node("Text").text = "You just won't let me catch a break, will you?"
	if clickcount == 5:
		get_parent().get_parent().get_parent().get_node("GlitchSound").play()
		yield(get_tree().create_timer(1), "timeout")
		get_parent().get_parent().get_parent().get_node("GlitchSound").stop()
		get_parent().get_node("Text").text = ". . ."
		get_parent().get_node("Icon").set_texture(benjitxt)
	if clickcount == 6:
		get_parent().get_node("Text").text = "Let. me. go. Then maybe we will talk."
	if clickcount == 7:
		get_parent().get_node("Icon").set_texture(portaltxt)
		get_parent().get_node("Text").text = "I'm sorry, but that's not the answer I was looking for. It looks like I've won at my own game again."
	if clickcount == 8:
		get_parent().get_node("Text").text = "As second place is just the first loser, it seems that I must punish you with something more threatening than that dungeon."
	if clickcount == 9:
		get_parent().get_node("Text").text = "I was giving you a way out, Benji, but you're too foolish to accept that."
	if clickcount == 10:
		get_parent().get_node("Text").text = "...and now you have to pay the price for playing. Your life."
	if clickcount == 11:
		get_parent().get_node("Text").text = "It was great having you, it really was. I hope the devil treats you kindly."
	if clickcount == 12:
		get_parent().get_parent().get_parent().get_node("GlitchSound").play()
		color_flash()
		var stop_flash = true
		get_parent().get_parent().get_parent().get_node("World/World2D/Light2D2").visible = false
		get_parent().get_parent().get_parent().get_node("World/World2D/Light2D3").visible = true
		get_parent().get_parent().get_parent().get_node("Sprite").visible = false
		get_parent().get_parent().get_parent().get_node("Main/Eyes3").visible = false
		get_parent().get_parent().get_parent().get_node("Sprite/Eyes").visible = false
		get_parent().get_parent().get_parent().get_node("Main/Eyes3/Portal").visible = false
		yield(get_tree().create_timer(2), "timeout")
		popup.visible = true
		get_parent().get_parent().get_parent().get_node("GlitchSound").stop()
		get_parent().get_node("Text").text = "Hey, can you hear me? I'm so glad I found you again..."
	if clickcount == 13:
		clickcount = 999
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menu2.tscn")
	popup.visible = true
	clickcount = clickcount + 1

func color_flash():
	var stop_flash = false
	for i in range(2):
		if stop_flash != true:
			get_parent().get_parent().get_parent().get_node("Main/Player/Main Character/MC-Sprite/CanvasModulate").visible = false
			yield(get_tree().create_timer(1), "timeout")
			get_parent().get_parent().get_parent().get_node("Main/Player/Main Character/MC-Sprite/CanvasModulate").visible = true
			yield(get_tree().create_timer(1), "timeout")
