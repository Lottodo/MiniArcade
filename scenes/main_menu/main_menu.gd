extends Control

@onready var audio_player = $AudioStreamPlayer

func _ready():
	SoundManager.play_sound(audio_player, SoundManager.SOUND_MAIN_MENU)
	GameManager.global_lives = 4
	GameManager.global_score = 0
	GameManager.global_first_last_game_id = -1

func _process(delta):
	pass

###############################################
# 			Funciones de botones              #
###############################################
func _on_start_button_pressed():
	GameManager.load_intermission_scene()

func _on_exit_button_pressed():
	GameManager.exit_game()
