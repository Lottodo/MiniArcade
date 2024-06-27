extends Node2D

@onready var player: = $PlayerMegaman
@onready var player_camera: = $Camera2D

func _physics_process(delta):
	player_camera.position = player.position
