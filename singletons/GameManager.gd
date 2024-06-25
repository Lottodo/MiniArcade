extends Node

###############################################
# 			Control de Escenas                #
###############################################
var main_menu_scene : PackedScene = preload("res://scenes/main_menu/main_menu.tscn")
var intermission_scene : PackedScene = preload("res://scenes/intermission/intermission.tscn")



###############################################
# 			Funciones de escenas              #
###############################################
func load_main_menu_scene():
	get_tree().change_scene_to_packed(main_menu_scene)

func load_intermission_scene():
	get_tree().change_scene_to_packed(intermission_scene)



###############################################
# 			Función para salir                #
###############################################
func exit_game():
	get_tree().quit()

###############################################
# 			  Plaraformero                    #
###############################################
