extends CharacterBody2D

@export var item: PackedScene

@onready var asp = $AudioStreamPlayer

const SPEED = 900.0
var shoot_cd := false
var can_move: bool = true

func _ready():
	SignalManager.on_timeout.connect(on_gameover)

func _process(delta):
	if Input.is_action_just_pressed("action_A") and can_move:
		if !shoot_cd:
			shoot_cd = true
			shoot()
			await get_tree().create_timer(0.25).timeout
			shoot_cd = false
			
func _physics_process(_delta):
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var max_pos_x = get_viewport().size.x
	global_position.x = clampf(global_position.x, 0, max_pos_x)
	
	move_and_slide()

func shoot():
	SoundManager.play_sound(asp, SoundManager.SOUND_GALAGA_LASER)
	var new_item = item.instantiate()
	var item_position = Vector2(global_position.x, global_position.y)
	get_parent().add_child(new_item)
	new_item.global_position = item_position
	new_item.scale *= 0.05

func on_gameover():
	can_move = false

