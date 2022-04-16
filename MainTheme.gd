extends AudioStreamPlayer2D
var themesound = preload("res://assets/audio/264295__foolboymedia__sky-loop.wav")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta: float) -> void:
	if !self.is_playing():
		self.stream = themesound
		self.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
