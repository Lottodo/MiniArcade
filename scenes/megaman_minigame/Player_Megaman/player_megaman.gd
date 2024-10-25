extends CharacterBody2D

@onready var sprite_2d =$AnimatedSprite2D


const SPEED : float = 120.0
const GRAVITY : float = 900.0
const JUMP_HEIGHT : float = 300.0

enum PLAYER_STATES {IDLE, RUN, JUMP, FALL, SHOOT, RUN_SHOOT}
var current_state: PLAYER_STATES = PLAYER_STATES.IDLE

func _ready():
	pass

func _physics_process(delta):
	if not is_on_floor():
		apply_gravity(delta)
	get_input()
	calculate_state()
	move_and_slide()

func calculate_state():
	if is_on_floor():
		if velocity.x > 0:
			set_state(PLAYER_STATES.RUN)
		elif velocity.x < 0:
			set_state(PLAYER_STATES.RUN)
		else:
			set_state(PLAYER_STATES.IDLE)
	else:
		if velocity.y > 0:
			set_state(PLAYER_STATES.FALL)
		else:
			set_state(PLAYER_STATES.JUMP)

func set_state(new_state : PLAYER_STATES):
	if new_state != current_state:
		##if current_state == PLAYER_STATES.FALL and is_on_floor():
	
		current_state = new_state
		match current_state:
			PLAYER_STATES.RUN:
				sprite_2d.animation = "run"
			PLAYER_STATES.IDLE:
				sprite_2d.animation = "idle"
			PLAYER_STATES.JUMP:
				sprite_2d.animation = "jump"
			PLAYER_STATES.SHOOT:
				sprite_2d.animation = "shoot"
			PLAYER_STATES.FALL:
				sprite_2d.animation = "jump"

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("move_left"):
		velocity.x = -SPEED
		sprite_2d.flip_h = false
	elif Input.is_action_pressed("move_right"):
		velocity.x = SPEED
		sprite_2d.flip_h = true
	
	if Input.is_action_just_pressed("action_A") and is_on_floor():
		velocity.y = -JUMP_HEIGHT

func apply_gravity(delta : float):
	velocity.y += GRAVITY * delta


