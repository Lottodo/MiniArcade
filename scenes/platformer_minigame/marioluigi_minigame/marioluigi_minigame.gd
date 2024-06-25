extends Node2D

@onready var asp = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	SoundManager.play_sound(asp, SoundManager.SOUND_PLAT_BG)
	#pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
