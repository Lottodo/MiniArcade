extends CharacterBody2D

@onready var sprite_2d = $Sprite2D
var _movement_speed : float = 0.0 : set = set_movement_speed , get = get_movement_speed
var _gravity_force : float = 0.0 : set = set_gravity_force , get = get_gravity_force

func _physics_process(delta):
	velocity.x = 0
	if Input.is_action_pressed("move_left"):
		velocity.x = -_movement_speed
		sprite_2d.flip_h = true
	elif Input.is_action_pressed("move_right"):
		velocity.x = _movement_speed
		sprite_2d.flip_h = false


func set_movement_speed(new_speed : float) -> void:
	_movement_speed = new_speed	

func set_gravity_force(new_gravity : float) -> void:
	_gravity_force = new_gravity

func get_movement_speed() -> float:
	return _movement_speed

func get_gravity_force() -> float:
	return _gravity_force
