extends KinematicBody2D
onready var groundray = get_node("Doggy-Sprite/Camera2D/groundray")

export (int) var speed = 800

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		get_node("Doggy-Sprite").set_flip_h(false)
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		get_node("Doggy-Sprite").set_flip_h(true)
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_select"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

# UI_Up functions as escape or exit while playing
	if Input.is_action_pressed("ui_up"):
		get_tree().change_scene("res://Menu.tscn")

func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
