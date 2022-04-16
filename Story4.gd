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
		get_parent().get_parent().get_parent().get_node("Breath").play()
		get_parent().get_node("Text").text = "Hello, Benji. I'm so glad to finally meet you in person."
	if clickcount == 1:
		get_parent().get_node("Text").text = "H-HUH? How do you know my name?!"
		get_parent().get_parent().get_parent().get_node("GlitchSound").play()
		get_parent().get_parent().get_parent().get_node("Shader").visible = true
		yield(get_tree().create_timer(1), "timeout")
		get_parent().get_parent().get_parent().get_node("GlitchSound").stop()
		get_parent().get_parent().get_parent().get_node("Shader").visible = false
	if clickcount == 2:
		get_parent().get_node("Text").text = "You really are clueless, aren't you?"
	if clickcount == 3:
		get_parent().get_node("Text").text = "I never expected you to get so far with so little...brain."
	if clickcount == 4:
		get_parent().get_node("Text").text = "However, I'm sure you've noticed that things are different in this world?"
	if clickcount == 5:
		get_parent().get_node("Text").text = "I don't know what you're talking about! You're crazy!"
	if clickcount == 6:
		get_parent().get_node("Text").text = "My my my- I know you're from another world, child. You don't have to lie to me."
	if clickcount == 7:
		get_parent().get_node("Text").text = "I also know... that you haven't been able to get out of this one. Would you like to guess why?"
	if clickcount == 8:
		get_parent().get_node("Text").text = "I- Uhmm.. I-i don't know."
	if clickcount == 9:
		get_parent().get_node("Text").text = "I'm the god here, Benji. I make the very rules of this world."
	if clickcount == 10:
		get_parent().get_node("Text").text = "Everywhere you've been teleporting to is my doing!"
	if clickcount == 11:
		get_parent().get_node("Text").text = "I've been watching every little step you take! I have eyes everywhere."
	if clickcount == 12:
		get_parent().get_node("Text").text = "You can't just leave without ever meeting me, that would be shameful."
	if clickcount == 13:
		get_parent().get_node("Text").text = "Well..you've met me! Now let me go!"
	if clickcount == 14:
		get_parent().get_node("Text").text = "Ah ah ahh- You aren't strong enough to leave on your own and I certainly won't permit you to."
		get_parent().get_parent().get_parent().get_node("GlitchSound").play()
		get_parent().get_parent().get_parent().get_node("Shader").visible = true
		yield(get_tree().create_timer(2), "timeout")
		get_parent().get_parent().get_parent().get_node("GlitchSound").stop()
		get_parent().get_parent().get_parent().get_node("Shader").visible = false
	if clickcount == 15:
		get_parent().get_node("Text").text = "Nonononono- My story can't just end like this! You're sick!"
	if clickcount == 16:
		get_parent().get_node("Text").text = "I guess you'll just have to learn to beat me."
	if clickcount == 17:
		get_parent().get_node("Text").text = "...or die trying."
	if clickcount == 18:
		get_parent().get_node("Text").text = "Good luck, little one. Give me something to look forward to."
	if clickcount == 19:
		clickcount = 999
		get_parent().get_parent().get_parent().get_node("GlitchSound").play()
		get_parent().get_parent().get_parent().get_node("Shader").visible = true
		yield(get_tree().create_timer(3), "timeout")
		get_parent().get_parent().get_parent().get_node("GlitchSound").stop()
		get_parent().get_parent().get_parent().get_node("Shader").visible = false
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Level3.tscn")
	popup.visible = true
	clickcount = clickcount + 1
