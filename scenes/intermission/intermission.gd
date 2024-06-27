extends Control

@onready var aspt = $AudioStreamPlayerTrans
@onready var asps = $AudioStreamPlayerState
@onready var camera = $Camera2D
@onready var coins_container = $CoinsContainer
@onready var score_label = $ScoreLabel
@onready var end_score_label = $EndScoreLabel
@onready var game_over_label = $GameOverLabel
var minigame_id = 0

var coins: Array

# Called when the node enters the scene tree for the first time.
func _ready():
	print(str(GameManager.global_lives))
	coins = coins_container.get_children()
	score_label.text = str(GameManager.global_score)
	end_score_label.visible = false
	game_over_label.visible = false
	
	if GameManager.global_lives == 0:
		score_label.text = "GAME OVER"
		end_score_label.visible = true
		game_over_label.visible = true
		SoundManager.play_sound(asps, SoundManager.SOUND_INTER_GAMEOVER)
	else:
		if GameManager.global_first_last_game_id == -1:
			SoundManager.play_sound(aspt, SoundManager.SOUND_INTER_TRANS)
		else:
			update_game_state()
		select_minigame()

func update_game_state():
	update_coins()
	if GameManager.global_last_game_won:
		SoundManager.play_sound(asps, SoundManager.SOUND_INTER_WIN)
	else:
		SoundManager.play_sound(asps, SoundManager.SOUND_INTER_LOST)

func update_coins():
	for coin_idx in range(coins.size()):
		if coin_idx >= GameManager.global_lives:
			coins[coin_idx].play("coin_destruction")

func select_minigame():
	var min_value = 0
	var max_value = 2
	while true:
		#Elije minijuego de forma aleatoria
		minigame_id = randi() % (max_value - min_value + 1) + min_value
		#Que sea cualquiera si es la primera ronda
		if GameManager.global_first_last_game_id == -1:
			GameManager.global_first_last_game_id = minigame_id
			break
		#Que no se repita el ultimo
		if minigame_id != GameManager.global_first_last_game_id:
			GameManager.global_first_last_game_id = minigame_id
			#GameManager.global_second_last_game_id = GameManager.global_first_last_game_id
			break

func change_scene():
	GameManager.transition_scenes()
	match minigame_id:
		0: GameManager.load_attorney_scene()
		1: GameManager.load_kirby_scene()
		2: GameManager.load_platformer_scene()

func _on_audio_stream_player_transition_finished():
	change_scene()


func _on_audio_stream_player_state_finished():
	SoundManager.play_sound(aspt, SoundManager.SOUND_INTER_TRANS)
