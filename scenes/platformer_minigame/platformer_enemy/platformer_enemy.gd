extends CharacterBody2D

@onready var anim_player = $AnimatedSprite2D
@onready var asp = $AudioStreamPlayer
@export var item: PackedScene

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

enum ENEMY_STATE {IDLE, PREATTACK, POSTATTACK}



func _ready():
	anim_player.connect("animation_finished", Callable(self, "_on_animation_finished"))

func _process(delta):
	if Input.is_action_just_pressed("action_B"):
		print("waos")
	

func _on_animated_sprite_2d_animation_finished():
	var current_animation = anim_player.animation
	if current_animation == "pre_attack":
		SoundManager.play_sound(asp, SoundManager.SOUND_PLAT_ENEMY_SHOT)
		spawn_item()
		anim_player.play("post_attack")
	elif current_animation == "pre_attack":
		anim_player.play("idle")
	else:
		anim_player.play("idle")


func spawn_item():
	var new_item = item.instantiate()
	var item_position = Vector2(global_position.x, global_position.y)
	get_parent().add_child(new_item)
	new_item.global_position = item_position
	new_item.scale *= 4




func _on_attack_timer_timeout():
	SoundManager.play_sound(asp, SoundManager.SOUND_PLAT_ENEMY_CHARGE)
	anim_player.play("pre_attack")
