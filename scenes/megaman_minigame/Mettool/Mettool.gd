extends CharacterBody2D

@onready var floor_detection = $FloorDetection
@onready var wall_detection = $WallDetection
@onready var sprite_2d = $Sprite2D
@onready var anim_enemy = $MettoolMove
@onready var audio_player = $SoundEnemy
@onready var jump_collision = $HitBox/CollisionShape2D

const GRAVITY : float = 500.0
const MOVEMENT_SPEED : float = 100.0

enum FACING_DIRECTION {LEFT = -1, RIGHT = 1}
var facing : FACING_DIRECTION = FACING_DIRECTION.LEFT


func _physics_process(delta):
			move_and_slide()
			if not is_on_floor():
				velocity.y += GRAVITY * delta
			else:
				velocity.x = MOVEMENT_SPEED * facing
				
				if wall_detection.is_colliding() or not floor_detection.is_colliding():
					flip_me()

			pass  # No hacer nada mientras está en estado HIDE


func flip_me():
	sprite_2d.flip_h = !sprite_2d.flip_h
	floor_detection.position.x = floor_detection.position.x * -1 
	wall_detection.target_position.x = wall_detection.target_position.x * -1 
	if facing == FACING_DIRECTION.LEFT: 
		facing = FACING_DIRECTION.RIGHT
	else:
		facing = FACING_DIRECTION.LEFT



