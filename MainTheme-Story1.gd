extends AudioStreamPlayer2D
var themesound = preload("res://assets/audio/171967__setuniman__dramatic-0v15m.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta: float) -> void:
	if !self.is_playing():
		self.stream = themesound
		self.play()
	#if get_parent().get_node("Main/Portal/PortalNoise").is_playing():
		#self.stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
