extends CharacterBody2D

@onready var animated_sprite2D = $AnimatedSprite2D


func _ready():
	SignalManager.on_waddle_hit.connect(on_waddle_hit)
	SignalManager.on_kirby_hit.connect(on_kirby_hit)
	animated_sprite2D.animation = "Idle"

func _process(delta):
	pass

func on_kirby_hit():
	position += Vector2(-90,0)
	animated_sprite2D.animation = "Attack"
	SignalManager.on_samurai_attack.emit()

func on_waddle_hit():
	position += Vector2(-90,0)
	animated_sprite2D.animation = "Defeat"
