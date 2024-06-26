extends Node2D

@onready var kirby_player = $KirbyPlayer
@onready var waddle_enemy = $WaddleEnemy
@onready var attention_animation = $AnimationPlayer
@onready var audio_player = $AudioStreamPlayer
@onready var wait_timer = $WaitingTimer
@onready var action_timer = $ActionTimer
@onready var penalty_mark = $PenaltyMark
@onready var ending_timer = $EndingTimer
const SCORE : int = 1

var player_react : bool = false
var player_lost : bool = false

func _ready():
	SignalManager.on_minigame_lost.connect(on_minigame_lost)
	SignalManager.on_minigame_won.connect(on_minigame_won)
	SignalManager.on_samurai_attack.connect(on_samurai_attack)
	SignalManager.on_player_reaction.connect(on_player_reaction)
	SignalManager.on_kirby_got_penalized.connect(on_kirby_got_penalized)
	SoundManager.play_sound(audio_player, SoundManager.SOUND_KIRBY_START)
	var rng = RandomNumberGenerator.new()
	wait_timer.wait_time = rng.randf_range(3.0,5.0)
	action_timer.wait_time = rng.randf_range(0.5,1.0)
	wait_timer.start()

func _on_waiting_timer_timeout():
	attention_animation.play("attention")
	SoundManager.play_sound(audio_player, SoundManager.SOUND_KIRBY_ALERT)
	action_timer.start()
	SignalManager.on_kirby_can_attack.emit()

func _on_action_timer_timeout():
	if !player_react:
		SignalManager.on_kirby_hit.emit()
		on_minigame_lost()
	else:
		on_minigame_won()

func on_kirby_got_penalized():
	penalty_mark.visible = true
	SoundManager.play_sound(audio_player, SoundManager.SOUND_KIRBY_WRONG)

func on_minigame_won():
	print("Kirby Ganó!")
	ending_timer.start()

func on_minigame_lost():
	print("Kirby Perdió!")
	ending_timer.start()

func on_player_reaction():
	player_react = true

func on_samurai_attack():
	attention_animation.play("flash")
	SoundManager.play_sound(audio_player, SoundManager.SOUND_KIRBY_BONK)
	

func on_scene_change():
	GameManager.load_intermission_scene()

func _on_ending_timer_timeout():
	if player_lost:
		SignalManager.on_minigame_lost.emit()
	else:
		SignalManager.on_minigame_won.emit(SCORE)
	on_scene_change()
