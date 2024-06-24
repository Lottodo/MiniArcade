extends Node2D

@onready var sound_test = $TestSound

func _ready():
	sound_test.play()
