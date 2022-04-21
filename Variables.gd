extends TileMap
var kills = 0
var FirstShop = true
var ShowHowKill = true
var drain = true
var level = 1
var weapon_level = 1
var immunity = false

func set_kills(value):
	kills = value
func get_kills():
	return kills

func set_shop(value):
	FirstShop = value
func set_howkill(value):
	ShowHowKill = value
func set_level(value):
	level = value
func set_drain(value):
	drain = value
func set_weapon(value):
	weapon_level = value
func set_immune(value):
	immunity = value

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
