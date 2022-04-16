extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var theme = preload("res://assets/audio/264295__foolboymedia__sky-loop.wav")
	pass

func _process(delta: float) -> void:
	$AudioStreamPlayer2D.stream = theme
	$AudioStreamPlayer2D.play()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
