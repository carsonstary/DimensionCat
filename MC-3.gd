extends KinematicBody2D
onready var groundray = get_node("MC-Sprite/groundray")
var collider = " "
var timer = Timer.new()
onready var globals = get_node("/root/Variables")
onready var globals2 = get_node("/root/Variables2")
var LuckActive = false
var LuckTimer = false
var enemy_health = 5
var rng = RandomNumberGenerator.new()
export (int) var speed = 800

var velocity = Vector2()
func _ready():
	get_node("Node2D/Label").text = "Po??ts: " + str(globals.kills)
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
		velocity.x += 0.1
		get_node("MC-Sprite").set_flip_h(true)
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 0.1
		get_node("MC-Sprite").set_flip_h(false)
	if Input.is_action_pressed("ui_down"):
		velocity.y += 0.1
	if Input.is_action_pressed("ui_select"):
		velocity.y -= 0.1
	velocity = velocity.normalized() * speed
		
	if Input.is_action_just_pressed("ui_accept"):
		if get_node("MC-Sprite/range").is_colliding() or get_node("MC-Sprite/range2").is_colliding():
			color_flash()
			var stored_collision = collision()
			yield(get_tree().create_timer(0.1), "timeout")
			stored_collision.get_parent().set_modulate(modulate)
			if is_instance_valid(stored_collision):
				randomize()
				var x_range = Vector2(0, 1500)
				var y_range = Vector2(0, 1000)
				var random_x = randi() % int(x_range[1]- x_range[0]) + 1 + x_range[0] 
				var random_y =  randi() % int(y_range[1]-y_range[0]) + 1 + y_range[0]
				var random_pos = Vector2(random_x, random_y)
				if int(random_x) % 30 == 0:
					enemy_health = enemy_health - (int(globals.weapon_level)+3)
				elif int(random_x) % 28 == 0 && globals.immunity == false:
					globals.set_kills(globals.kills - 3)
					get_node("Node2D/Label").text = "Points: " + str(globals.kills)
					$Node2D/Label3.hide()
					$Node2D/LuckActive.hide()
					$Node2D/Label2.show()
					$Node2D/Label4.show()
					yield(get_tree().create_timer(3.0), "timeout")
					$Node2D/Label2.hide()
					$Node2D/Label4.hide()
				else:
					enemy_health = enemy_health - int(globals.weapon_level)
				if enemy_health <= 0:
					enemy_health = 5
					if int(random_x) % 10 == 0 && get_node("/root/Variables2").LuckPotion == false && stored_collision == collision():
						globals.set_kills(globals.kills + 7)
						get_node("Node2D/Label").text = "P?i?ts: " + str(globals.kills)
						if random_pos != self.position:
							get_parent().get_parent().get_node(stored_collision.get_parent().get_path()).position=random_pos
						$Node2D/Label2.hide()
						$Node2D/Label3.show()
						get_parent().get_parent().get_parent().get_node("Shader").visible = true
						get_parent().get_parent().get_parent().get_node("Watching").visible = true
						get_parent().get_parent().get_parent().get_node("Breath").play()
						get_parent().get_parent().get_parent().get_node("HELP").visible = true
						yield(get_tree().create_timer(3.0), "timeout")
						get_parent().get_parent().get_parent().get_node("HELP").visible = false
						get_parent().get_parent().get_parent().get_node("Shader").visible = false
						get_parent().get_parent().get_parent().get_node("Watching").visible = false
						$Node2D/Label3.hide()
					elif int(random_x) % 10 != 0 && get_node("/root/Variables2").LuckPotion == false && stored_collision == collision():
						globals.set_kills(globals.kills + 5)
						get_node("Node2D/Label").text = "?oi?ts: " + str(globals.kills)
						if random_pos != self.position:
							get_parent().get_parent().get_node(stored_collision.get_parent().get_path()).position=random_pos
						if globals.drain == true && globals.immunity == false:
								rng.randomize()
								var random = int(rng.randf_range(0, 100))
								if random % 2:
									globals.set_kills(globals.kills - 7)
									get_node("Node2D/Label").text = "??????: " + str(random)

					if get_node("/root/Variables2").LuckPotion == true && stored_collision == collision():
						globals.set_shop(false)
						$Node2D/LuckActive.show()
						globals.set_kills(globals.kills + 7)
						get_node("Node2D/Label").text = "Poi??s: " + str(globals.kills)
						if random_pos != self.position:
							get_parent().get_parent().get_node(stored_collision.get_parent().get_path()).position=random_pos
						var LuckActive = true
						if LuckTimer == false && LuckActive == true:
							var LuckTimer = true
							update_lucktimer()

	if Input.is_action_just_released("escape"):
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menu.tscn")

func color_flash():
	var modulate = collision().get_parent().get_modulate()
	collision().get_parent().set_modulate(lerp(modulate,Color(0.55, 0, 0, 1),0.5))
	yield(get_tree().create_timer(0.1), "timeout")
	if is_instance_valid(collision()):
		collision().get_parent().set_modulate(modulate)
		
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
		if globals.kills >= 3 or globals.immunity == true:
			if get_node("MC-Sprite/range").is_colliding() or get_node("MC-Sprite/range2").is_colliding():
				if is_instance_valid(collision()):
					collision().get_parent().set_modulate(modulate)
					randomize()
					var x_range = Vector2(0, 1500)
					var y_range = Vector2(0, 1000)
					var random_x = randi() % int(x_range[1]- x_range[0]) + 1 + x_range[0] 
					var random_y =  randi() % int(y_range[1]-y_range[0]) + 1 + y_range[0]
					var random_pos = Vector2(random_x, random_y)
					
					if random_pos != self.position:
							get_parent().get_parent().get_node(collision().get_parent().get_path()).position=random_pos
					if globals.immunity == false:
						globals.kills = globals.kills - 3
						get_node("Node2D/Label").text = "Po?nts: " + str(globals.kills)
						$Node2D/Label3.hide()
						$Node2D/Label2.show()
						yield(get_tree().create_timer(3.0), "timeout")
						$Node2D/Label2.hide()
		elif globals.kills < 3 && globals.immunity == false:
			globals.set_kills(0)
			get_tree().change_scene("res://Death.tscn")
