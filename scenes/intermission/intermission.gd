extends Control

@onready var asp = $AudioStreamPlayerTrans

# Called when the node enters the scene tree for the first time.
func _ready():
	SoundManager.play_sound(asp, SoundManager.SOUND_INTER_TRANS)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_audio_stream_player_transition_finished():
	#GameManager.load_kirby_scene()
	GameManager.load_platformer_scene()
