extends Node2D

@onready var kirby_player = $KirbyPlayer
@onready var waddle_enemy = $WaddleEnemy
@onready var attention_animation = $AnimationPlayer
@onready var audio_player = $AudioStreamPlayer
@onready var wait_timer = $WaitingTimer
@onready var action_timer = $ActionTimer

func _ready():
	SoundManager.play_sound(audio_player, SoundManager.SOUND_KIRBY_START)
	var rng = RandomNumberGenerator.new()
	wait_timer.wait_time = rng.randf_range(3.0,5.0)
	action_timer.wait_time = rng.randf_range(0.5,1.0)
	wait_timer.start()

func _on_waiting_timer_timeout():
	attention_animation.play("attention")
	SoundManager.play_sound(audio_player, SoundManager.SOUND_KIRBY_ALERT)
	action_timer.start()

func _on_action_timer_timeout():
	attention_animation.play("flash")
	SoundManager.play_sound(audio_player, SoundManager.SOUND_KIRBY_BONK)
