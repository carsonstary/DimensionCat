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
	if globals.ShowHowKill == true:
		$Node2D/HowAttack.show()
	if globals.FirstShop == false or globals.kills < 30:
		$Node2D/FirstShop.hide()
	get_node("Node2D/Label").text = "Points: " + str(globals.kills)
	pass

func collision():
	if get_node("MC-Sprite/range").is_colliding():
		var collider = get_node("MC-Sprite/range").get_collider()
		return collider
	elif get_node("MC-Sprite/range2").is_colliding():
		var collider = get_node("MC-Sprite/range2").get_collider()
		return collider

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		get_node("MC-Sprite").set_flip_h(true)
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		get_node("MC-Sprite").set_flip_h(false)
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_select"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
		
	if Input.is_action_just_pressed("ui_accept"):
		if globals.ShowHowKill == true:
			$Node2D/HowAttack.hide()
			globals.set_howkill(false)
		if get_node("MC-Sprite/range").is_colliding() or get_node("MC-Sprite/range2").is_colliding():
			if globals.kills >= 30 && globals.FirstShop == true:
				$Node2D/FirstShop.show()
				globals.set_shop(false)
			if is_instance_valid(collision()):
				randomize()
				var x_range = Vector2(-500, 1500)
				var y_range = Vector2(2500, 3500)
				var random_x = randi() % int(x_range[1]- x_range[0]) + 1 + x_range[0] 
				var random_y =  randi() % int(y_range[1]-y_range[0]) + 1 + y_range[0]
				var random_pos = Vector2(random_x, random_y)

				if int(random_x) % 30 == 0 && get_node("/root/Variables2").LuckPotion == false:
					globals.set_kills(globals.kills + 2)
					get_node("Node2D/Label").text = "Points: " + str(globals.kills)
					if random_pos != self.position:
						get_parent().get_parent().get_node(collision().get_parent().get_path()).position=random_pos
					$Node2D/Label2.hide()
					$Node2D/Label3.show()
					yield(get_tree().create_timer(3.0), "timeout")
					$Node2D/Label3.hide()
					get_parent().get_parent().get_parent().get_node("Shader").visible = true
					yield(get_tree().create_timer(2), "timeout")
					get_parent().get_parent().get_parent().get_node("Shader").visible = false
				elif int(random_x) % 30 != 0 && get_node("/root/Variables2").LuckPotion == false:
					globals.set_kills(globals.kills + 1)
					get_node("Node2D/Label").text = "Points: " + str(globals.kills)
					if random_pos != self.position:
						get_parent().get_parent().get_node(collision().get_parent().get_path()).position=random_pos

				if get_node("/root/Variables2").LuckPotion == true:
					globals.set_shop(false)
					$Node2D/LuckActive.show()
					globals.set_kills(globals.kills + 2)
					get_node("Node2D/Label").text = "Points: " + str(globals.kills)
					if random_pos != self.position:
						get_parent().get_parent().get_node(collision().get_parent().get_path()).position=random_pos
					var LuckActive = true
					if LuckTimer == false && LuckActive == true:
						var LuckTimer = true
						update_lucktimer()

	if Input.is_action_just_released("escape"):
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menu.tscn")

func update_lucktimer():
	yield(get_tree().create_timer(120.0), "timeout")
	globals2.set_luck(false)
	$Node2D/LuckActive.hide()
	var LuckTimer = false
	
func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
	if get_node("MC-Sprite/groundray").is_colliding():
# warning-ignore:return_value_discarded
		# get_tree().reload_current_scene()
# warning-ignore:return_value_discarded
		# get_tree().change_scene("res://Death.tscn")
		if globals.kills >= 3:
			if get_node("MC-Sprite/range").is_colliding() or get_node("MC-Sprite/range2").is_colliding():
				if is_instance_valid(collision()):
					randomize()
					var x_range = Vector2(-500, 1500)
					var y_range = Vector2(2500, 3500)
					var random_x = randi() % int(x_range[1]- x_range[0]) + 1 + x_range[0] 
					var random_y =  randi() % int(y_range[1]-y_range[0]) + 1 + y_range[0]
					var random_pos = Vector2(random_x, random_y)
					
					globals.kills = globals.kills - 3
					get_node("Node2D/Label").text = "Points: " + str(globals.kills)
					if random_pos != self.position:
						get_parent().get_parent().get_node(collision().get_parent().get_path()).position=random_pos
					$Node2D/Label3.hide()
					$Node2D/Label2.show()
					yield(get_tree().create_timer(3.0), "timeout")
					$Node2D/Label2.hide()
		else:
			globals.set_kills(0)
			get_tree().change_scene("res://Death.tscn")
