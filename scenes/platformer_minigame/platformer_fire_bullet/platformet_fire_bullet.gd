extends Area2D

@onready var sprite = $AnimatedSprite2D

var speed = -1000
var rot_speed: float = 3.0 * PI * 2.0
var time: float

func _ready():
	sprite.flip_h = true

func _physics_process(delta):
	
	position.x += speed * delta
	rotation -= rot_speed * delta #que gire
	
	#que se mueva arriba-abajo
	time += delta
	position.y += sin(time * 1500)*150 * delta

func get_sin():
	var amplitude = 150
	var frequency = 100
	return sin(time * frequency) * amplitude




func _on_screen_exited():
	get_tree().call_group("Player", "on_proyectil_screen_exited")
	#queue_free()
