extends KinematicBody2D
onready var groundray = get_node("MC-Sprite/groundray")
var collider = " "
var timer = Timer.new()
onready var globals = get_node("/root/Variables")
onready var globals2 = get_node("/root/Variables2")
var LuckActive = false
var LuckTimer = false
export (int) var speed = 800

var velocity = Vector2()
func _ready():
	pass

func collision():
	if get_node("MC-Sprite/range").is_colliding():
		var collider = get_node("MC-Sprite/range").get_collider()
		return collider
	elif get_node("MC-Sprite/range2").is_colliding():
		var collider = get_node("MC-Sprite/range2").get_collider()
		return collider

#func get_input():
	#velocity = Vector2()
	#if Input.is_action_pressed("ui_right"):
	#	velocity.x += 1
	#	get_node("MC-Sprite").set_flip_h(true)
	#if Input.is_action_pressed("ui_left"):
	#	velocity.x -= 1
	#	get_node("MC-Sprite").set_flip_h(false)
	#if Input.is_action_pressed("ui_down"):
	#	velocity.y += 1
	#if Input.is_action_pressed("ui_select"):
	#	velocity.y -= 1
	#velocity = velocity.normalized() * speed

	if Input.is_action_just_released("escape"):
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menu.tscn")

func update_lucktimer():
	yield(get_tree().create_timer(120.0), "timeout")
	globals2.set_luck(false)
	var LuckTimer = false
