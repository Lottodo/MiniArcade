extends Node

const SOUND_MAIN_MENU = "main_menu_theme"
const SOUND_ATTORNEY_OBJECTION = "attorney_objection"
const SOUND_ATTORNEY_FAILURE = "attorney_failure"
const SOUND_ATTORNEY_SELECT = "attorney_select"
const SOUND_ATTORNEY_THINKING = "attorney_thinking"
const SOUND_ATTORNEY_VICTORY = "attorney_victory"

var SOUNDS = {
	SOUND_MAIN_MENU : preload("res://assets/Main_Menu/sound/menu_theme.wav"),
	SOUND_ATTORNEY_OBJECTION : preload("res://assets/Attorney_Minigame/sounds/ace_attorney_objection.wav"),
	SOUND_ATTORNEY_FAILURE : preload("res://assets/Attorney_Minigame/sounds/ace_attorney_failure.wav"),
	SOUND_ATTORNEY_SELECT : preload("res://assets/Attorney_Minigame/sounds/ace_attorney_select.wav"),
	SOUND_ATTORNEY_THINKING : preload("res://assets/Attorney_Minigame/sounds/ace_attorney_thinking.wav"),
	SOUND_ATTORNEY_VICTORY: preload("res://assets/Attorney_Minigame/sounds/ace_attorney_victory.wav")
}

func play_sound(audio_player: AudioStreamPlayer, sound: String):
	if SOUNDS.has(sound):
		audio_player.stream = SOUNDS[sound]
		audio_player.play()
