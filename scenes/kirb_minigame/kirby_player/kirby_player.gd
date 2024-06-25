extends CharacterBody2D

@onready var animated_sprite2D = $AnimatedSprite2D

enum PLAYER_STATES {IDLE, ATTACK, DEFEAT}
var current_state : PLAYER_STATES = PLAYER_STATES.IDLE
var got_hit : bool = false

func _ready():
	pass

func _process(delta):
	pass
	
