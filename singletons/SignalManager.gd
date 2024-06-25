extends Node

###############################################
# 			Señales de uso generico           #
###############################################
signal on_update_lives(lives: int)
signal on_score_update(score : int)

###############################################
# 		Señales exclusivas de minijuego 	  #
###############################################
signal on_kirby_hit()
signal on_waddle_hit()
