extends CharacterBody2D

@onready var animated_sprite2D = $AnimatedSprite2D

var can_attack : bool = false
var got_penalized : bool = false
var already_attack : bool = false
var got_hit : bool = false

func _ready():
	SignalManager.on_kirby_can_attack.connect(on_kirby_can_attack)
	SignalManager.on_kirby_hit.connect(on_kirby_hit)
	can_attack = false
	got_penalized = false
	already_attack = false
	animated_sprite2D.animation = "Idle"

func _process(delta):
	if Input.is_action_just_pressed("action_A") and !can_attack:
		got_penalized = true
		SignalManager.on_kirby_got_penalized.emit()
	elif Input.is_action_just_pressed("action_A") and !got_penalized and !already_attack and !got_hit:
		SignalManager.on_player_reaction.emit()
		animated_sprite2D.animation = "Attack"
		position += Vector2(90,0)
		SignalManager.on_waddle_hit.emit()
		SignalManager.on_samurai_attack.emit()
		already_attack = true


func on_kirby_can_attack():
	can_attack = true

func on_kirby_hit():
	got_hit = true
	position += Vector2(90,0)
	animated_sprite2D.animation = "Defeat"

