extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_input():
	if Input.is_action_pressed("interact"):
		if get_node("Detection").is_colliding():
			# warning-ignore:return_value_discarded
			get_tree().change_scene("res://TileMap.tscn")

func _physics_process(_delta):
	get_input()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
