extends Node


###############################################
# 			Señales de uso generico           #
###############################################
signal on_minigame_won(score : int)
signal on_minigame_lost()
signal on_update_lives(lives: int)
signal on_score_update(score : int)

###############################################
# 		Señales exclusivas de minijuego 	  #
###############################################

# Kirby
signal on_kirby_hit()
signal on_waddle_hit()
signal on_kirby_can_attack()
signal on_kirby_got_penalized()
signal on_samurai_attack()
signal on_player_reaction()

# Ace Attorney
signal on_correct_evidence()
signal on_wrong_evidence()

#Plataformero
signal platformer_on_damage()
signal platformer_on_bullet_out()

#Galaga
signal on_alien_destroyed()
signal on_timeout()
