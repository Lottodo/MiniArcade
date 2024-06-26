extends Area2D

@onready var sprite = $AnimatedSprite2D
@onready var ending_timer = $EndingTimer

var speed = -1400
var rot_speed: float = 3.0 * PI * 2.0
var time: float

func _ready():
	var min_value = 1.0
	var max_value = 1.5
	#speed *= randf_range(min_value, max_value)
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
	ending_timer.start()
	
	#queue_free()



func _on_ending_timer_timeout():
	SignalManager.platformer_on_game_end.emit()
