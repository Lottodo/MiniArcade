extends Node2D

@onready var asp = $AudioStreamPlayer
@onready var ending_timer = $EndingTimer

var player_lost = false
const SCORE: int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	SoundManager.play_sound(asp, SoundManager.SOUND_PLAT_BG)
	SignalManager.platformer_on_damage.connect(on_player_lost)
	SignalManager.platformer_on_bullet_out.connect(ending_game)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_player_lost():
	player_lost = true

func ending_game():
	ending_timer.start()

func _on_ending_timer_timeout():
	if player_lost:
		SignalManager.on_minigame_lost.emit()
	else:
		SignalManager.on_minigame_won.emit(1)
	
	GameManager.load_intermission_scene()
