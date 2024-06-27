extends Area2D

@onready var sprite = $AnimatedSprite2D

var SPEED = 1000
var direction = 1

func _physics_process(delta):
	global_position.x += SPEED * direction * delta
	
	var max_pos_x = get_viewport().size.x
	
	if global_position.x >= max_pos_x:
		direction = -1
		
	
	if global_position.x <= 0:
		direction = 1

func die():
	queue_free()


func _on_area_entered(area):
	SPEED = 0
	sprite.play("explosion")
