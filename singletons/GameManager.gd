extends Node

var global_lives : int = 4
var global_score : int = 0
var global_first_last_game_id: int = -1
var global_second_last_game_id: int = 1

###############################################
# 			Control de Escenas                #
###############################################
var main_menu_scene : PackedScene = preload("res://scenes/main_menu/main_menu.tscn")
var intermission_scene : PackedScene = preload("res://scenes/intermission/intermission.tscn")
var kirby_scene : PackedScene = preload("res://scenes/kirb_minigame/samurai_minigame/kirb_minigame.tscn")
var platformer_scene : PackedScene = preload("res://scenes/platformer_minigame/superstarsaga_lvl/superstarsaga_lvl.tscn")
var attorney_scene : PackedScene = preload("res://scenes/attorney_minigame/ace_attorney_minigame.tscn")

###############################################
#				Funcion Ready				  #
###############################################
func _ready():
	SignalManager.on_minigame_won.connect(on_minigame_won)
	SignalManager.on_minigame_lost.connect(on_minigame_lost)

###############################################
# 			Funciones de escenas              #
###############################################
func load_main_menu_scene():
	get_tree().change_scene_to_packed(main_menu_scene)

func load_intermission_scene():
	get_tree().change_scene_to_packed(intermission_scene)

func load_kirby_scene():
	get_tree().change_scene_to_packed(kirby_scene)

func load_platformer_scene():
	get_tree().change_scene_to_packed(platformer_scene)

func load_attorney_scene():
	get_tree().change_scene_to_packed(attorney_scene)

###############################################
# 			Funciones Generales               #
###############################################

func on_minigame_won(score: int):
	global_score += score
	SignalManager.on_score_update.emit(global_score)

func on_minigame_lost():
	global_lives -= 1
	SignalManager.on_update_lives.emit(global_lives)

###############################################
# 			Función para salir                #
###############################################
func exit_game():
	get_tree().quit()

###############################################
# 			  Plaraformero                    #
###############################################

###############################################
#					Kirby				      #
###############################################
func on_kirby_can_attack():
	SignalManager.on_kirby_can_attack.emit()

func on_kirby_get_penalized():
	SignalManager.on_kirby_got_penalized.emit()
