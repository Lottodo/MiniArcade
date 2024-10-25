extends Area2D

@onready var sprite = $AnimatedSprite2D

const SPEED = 900

func _physics_process(delta):
	global_position.y += -SPEED * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
