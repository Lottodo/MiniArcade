extends Control

@onready var asp = $AudioStreamPlayerTrans
var minigame_id = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	SoundManager.play_sound(asp, SoundManager.SOUND_INTER_TRANS)
	select_minigame()
	

func select_minigame():
	var min_value = 0
	var max_value = 2
	while true:
		#Elije minijuego de forma aleatoria
		minigame_id = randi() % (max_value - min_value + 1) + min_value
		#Que sea cualquiera si es la primera ronda
		if GameManager.global_first_last_game_id == -1:
			break
		#Que no se repita el ultimo
		if minigame_id != GameManager.global_first_last_game_id:
			GameManager.global_first_last_game_id = minigame_id
			#GameManager.global_second_last_game_id = GameManager.global_first_last_game_id
			break

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_audio_stream_player_transition_finished():
	match minigame_id:
		0: GameManager.load_attorney_scene()
		1: GameManager.load_kirby_scene()
		2: GameManager.load_platformer_scene()
