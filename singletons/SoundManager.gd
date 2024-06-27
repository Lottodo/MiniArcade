extends Node

const SOUND_MAIN_MENU = "main_menu_theme"
const SOUND_ATTORNEY_MUSIC = "attorney_questioning_allegro_2001"
#Sonidos Intermission
const SOUND_INTER_TRANS = "intermission_transition"
const SOUND_INTER_WIN = "intermission_win"
const SOUND_INTER_LOST = "intermission_lost"
const SOUND_INTER_GAMEOVER = "intermission_gameover"
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
#Sonidos Kirby
const SOUND_KIRBY_START = "kirby_start"
const SOUND_KIRBY_ALERT = "kirby_alert"
const SOUND_KIRBY_BONK = "kirby_bonk"
const SOUND_KIRBY_WRONG = "kirby_wrong"
#Sonidos Galaga
const SOUND_GALAGA_SONG = "galaga_song"

var SOUNDS = {
	SOUND_MAIN_MENU : preload("res://assets/Main_Menu/sound/menu_theme.wav"),
	#Sonidos Intermission
	SOUND_INTER_TRANS : preload("res://assets/intermission/sounds/lvl_transition.wav"),
	SOUND_INTER_WIN : preload("res://assets/intermission/sounds/lvl_win.wav"),
	SOUND_INTER_LOST : preload("res://assets/intermission/sounds/lvl_lost.wav"),
	SOUND_INTER_GAMEOVER : preload("res://assets/intermission/sounds/gameover.wav"),
	#Sonidos Attorney
	SOUND_ATTORNEY_MUSIC : preload("res://assets/Attorney_Minigame/music/ace_attorney_questioning_allegro_2001.wav"),
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
	#Sonidos Kirby
	SOUND_KIRBY_START : preload("res://assets/Kirb_Minigame/sounds/Samurai_Kirby_Intro.mp3"),
	SOUND_KIRBY_ALERT : preload("res://assets/Kirb_Minigame/sounds/Attention_Sound.wav"),
	SOUND_KIRBY_BONK : preload("res://assets/Kirb_Minigame/sounds/Bonk.wav"),
	SOUND_KIRBY_WRONG : preload("res://assets/Kirb_Minigame/sounds/Wrong.wav"),
	#Sonidos Galaga
	SOUND_GALAGA_SONG : preload("res://assets/Galaga_Minigame/sounds/galaga_song.wav"),
}

func play_sound(audio_player: AudioStreamPlayer, sound: String):
	if SOUNDS.has(sound):
		audio_player.stream = SOUNDS[sound]
		audio_player.play()
