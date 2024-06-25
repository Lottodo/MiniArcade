extends Node

const SOUND_MAIN_MENU = "main_menu_theme"
#Sonidos Attorney
const SOUND_ATTORNEY_OBJECTION = "attorney_objection"
const SOUND_ATTORNEY_FAILURE = "attorney_failure"
const SOUND_ATTORNEY_SELECT = "attorney_select"
const SOUND_ATTORNEY_THINKING = "attorney_thinking"
const SOUND_ATTORNEY_VICTORY = "attorney_victory"
#Sonidos Plataformero
const SOUND_PLAT_JUMP = "plat_jump"
const SOUND_PLAT_BG = "plat_background_music"
const SOUND_PLAT_WIN1 = "plat_win"
const SOUND_PLAT_LOST1 = "plat_lost"
const SOUND_PLAT_ENEMY_CHARGE = "plat_enemy_charge"
const SOUND_PLAT_ENEMY_SHOT = "plat_enemy_shot"

var SOUNDS = {
	SOUND_MAIN_MENU : preload("res://assets/Main_Menu/sound/menu_theme.wav"),
	#Sonidos Attorney
	SOUND_ATTORNEY_OBJECTION : preload("res://assets/Attorney_Minigame/sounds/ace_attorney_objection.wav"),
	SOUND_ATTORNEY_FAILURE : preload("res://assets/Attorney_Minigame/sounds/ace_attorney_failure.wav"),
	SOUND_ATTORNEY_SELECT : preload("res://assets/Attorney_Minigame/sounds/ace_attorney_select.wav"),
	SOUND_ATTORNEY_THINKING : preload("res://assets/Attorney_Minigame/sounds/ace_attorney_thinking.wav"),
	SOUND_ATTORNEY_VICTORY: preload("res://assets/Attorney_Minigame/sounds/ace_attorney_victory.wav"),
	#Sonidos Plataformero
	SOUND_PLAT_BG : preload("res://assets/Platformer_Minigame/sound/battle_song.mp3"),
	SOUND_PLAT_JUMP : preload("res://assets/Platformer_Minigame/sound/jump.wav"),
	SOUND_PLAT_WIN1 : preload("res://assets/Platformer_Minigame/sound/mario_win.wav"),
	SOUND_PLAT_LOST1 : preload("res://assets/Platformer_Minigame/sound/mario_lost.wav"),
	SOUND_PLAT_ENEMY_CHARGE : preload("res://assets/Platformer_Minigame/sound/enemy_prepare.wav"),
	SOUND_PLAT_ENEMY_SHOT : preload("res://assets/Platformer_Minigame/sound/enemy_shot.wav"),
}

func play_sound(audio_player: AudioStreamPlayer, sound: String):
	if SOUNDS.has(sound):
		audio_player.stream = SOUNDS[sound]
		audio_player.play()
