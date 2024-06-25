extends Control

func _process(delta):
	pass

###############################################
# 			Funciones de botones              #
###############################################
func _on_start_button_pressed():
	GameManager.load_intermission_scene()

func _on_exit_button_pressed():
	GameManager.exit_game()
