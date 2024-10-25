extends CharacterBody2D

@onready var anim_player = $AnimatedSprite2D
@onready var asp = $AudioStreamPlayer

const SPEED = 300.0
const JUMP_SPEED: float = 1000
const GRAVITY: float = 3000.0

enum PLAYER_STATE {IDLE, RUN, FALL, JUMP, HURT, WON}

var current_state: PLAYER_STATE = PLAYER_STATE.IDLE
var is_hurt: bool = false
var game_ended: bool = false

func _ready():
	SignalManager.platformer_on_bullet_out.connect(on_game_end)

func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
	if not is_on_floor():
		apply_gravity(delta)
	
	# Handle jump.
	if Input.is_action_just_pressed("action_A") and !is_hurt and !game_ended and is_on_floor():
		velocity.y += -JUMP_SPEED
	
	calculate_state()
	
	move_and_slide()

func apply_gravity(delta: float):
	velocity.y += GRAVITY * delta

func calculate_state():
	if is_hurt:
		set_state(PLAYER_STATE.HURT)
	elif game_ended:
		set_state(PLAYER_STATE.WON)
	else:
		if is_on_floor():
			set_state(PLAYER_STATE.IDLE)
		else:
			if velocity.y > 0: #Caer
				set_state(PLAYER_STATE.FALL)
			else: #Salto
				set_state(PLAYER_STATE.JUMP)

func set_state(new_state: PLAYER_STATE):
	if new_state != current_state:
		if current_state == PLAYER_STATE.FALL and is_on_floor():
			#SoundManager.play_clip(asp, SoundManager.SOUND_LAND)
			anim_player.play("mario_land")
		current_state = new_state
		
		match current_state:
			PLAYER_STATE.IDLE:
				anim_player.play("mario_idle")
			PLAYER_STATE.FALL:
				anim_player.play("mario_fall")
			PLAYER_STATE.JUMP:
				anim_player.play("mario_jump")
				SoundManager.play_sound(asp, SoundManager.SOUND_PLAT_JUMP)
			PLAYER_STATE.HURT:
				anim_player.play("mario_hurt")
				SoundManager.play_sound(asp, SoundManager.SOUND_PLAT_LOST1)
			PLAYER_STATE.WON:
				anim_player.play("mario_win")
				SoundManager.play_sound(asp, SoundManager.SOUND_PLAT_WIN1)

func _on_bullet_area_entered(area):
	is_hurt = true

func on_game_end():
	game_ended = true
