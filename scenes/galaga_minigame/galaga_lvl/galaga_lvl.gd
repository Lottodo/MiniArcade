extends Node2D

@onready var ending_timer = $EndingTimer
@onready var asp = $AudioStreamPlayer

var player_lost: bool = true
const SCORE: int = 1

func _ready():
	SoundManager.play_sound(asp, SoundManager.SOUND_GALAGA_SONG)
	SignalManager.on_alien_destroyed.connect(on_player_lost)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_player_lost():
	player_lost = false

func ending_game():
	ending_timer.start()

func _on_game_timer_timeout():
	print("Gameover")
	SignalManager.on_timeout.emit()
	ending_game()

func _on_ending_timer_timeout():
	if player_lost:
		SignalManager.on_minigame_lost.emit()
	else:
		SignalManager.on_minigame_won.emit(1)
	
	GameManager.load_intermission_scene()
