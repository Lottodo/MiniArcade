extends CanvasLayer

@onready var anim_player = $AnimationPlayer
@onready var color_rect = $ColorRect

signal on_transition_finished

func _ready():
	color_rect.visible = false

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_black":
		on_transition_finished.emit()
		anim_player.play("fade_normal")
	elif anim_name == "fade_normal":
		color_rect.visible = false

func transition():
	color_rect.visible = true
	anim_player.play("fade_normal")
