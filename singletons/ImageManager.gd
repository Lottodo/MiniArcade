extends Node

#Attorney minigame images
const IMAGE_ATTORNEY_EVIDENCE_EMPTY = "evidence_0_empty"
const IMAGE_ATTORNEY_EVIDENCE_SHOWN_1 = "evidence_1_shown"
const IMAGE_ATTORNEY_EVIDENCE_SHOWN_2 = "evidence_2_shown"
const IMAGE_ATTORNEY_EVIDENCE_SHOWN_3 = "evidence_3_shown"
const IMAGE_ATTORNEY_EVIDENCE_SHOWN_4 = "evidence_4_shown"
const IMAGE_ATTORNEY_EVIDENCE_SHOWN_5 = "evidence_5_shown"
const IMAGE_ATTORNEY_EVIDENCE_SHOWN_6 = "evidence_6_shown"
const IMAGE_ATTORNEY_EVIDENCE_SHOWN_7 = "evidence_7_shown"
const IMAGE_ATTORNEY_EVIDENCE_SHOWN_8 = "evidence_8_shown"
const IMAGE_ATTORNEY_EVIDENCE_HIDDEN_1 = "evidence_1_hidden"
const IMAGE_ATTORNEY_EVIDENCE_HIDDEN_2 = "evidence_2_hidden"
const IMAGE_ATTORNEY_EVIDENCE_HIDDEN_3 = "evidence_3_hidden"
const IMAGE_ATTORNEY_EVIDENCE_HIDDEN_4 = "evidence_4_hidden"
const IMAGE_ATTORNEY_EVIDENCE_HIDDEN_5 = "evidence_5_hidden"
const IMAGE_ATTORNEY_EVIDENCE_HIDDEN_6 = "evidence_6_hidden"
const IMAGE_ATTORNEY_EVIDENCE_HIDDEN_7 = "evidence_7_hidden"
const IMAGE_ATTORNEY_EVIDENCE_HIDDEN_8 = "evidence_8_hidden"


var images_attorney_evidences = {
	IMAGE_ATTORNEY_EVIDENCE_EMPTY : preload("res://assets/Attorney_Minigame/images/evidence_shown/0.png"),
	IMAGE_ATTORNEY_EVIDENCE_SHOWN_1 : preload("res://assets/Attorney_Minigame/images/evidence_shown/1.png"),
	IMAGE_ATTORNEY_EVIDENCE_SHOWN_2 : preload("res://assets/Attorney_Minigame/images/evidence_shown/2.png"),
	IMAGE_ATTORNEY_EVIDENCE_SHOWN_3 : preload("res://assets/Attorney_Minigame/images/evidence_shown/3.png"),
	IMAGE_ATTORNEY_EVIDENCE_SHOWN_4 : preload("res://assets/Attorney_Minigame/images/evidence_shown/4.png"),
	IMAGE_ATTORNEY_EVIDENCE_SHOWN_5 : preload("res://assets/Attorney_Minigame/images/evidence_shown/5.png"),
	IMAGE_ATTORNEY_EVIDENCE_SHOWN_6 : preload("res://assets/Attorney_Minigame/images/evidence_shown/6.png"),
	IMAGE_ATTORNEY_EVIDENCE_SHOWN_7 : preload("res://assets/Attorney_Minigame/images/evidence_shown/7.png"),
	IMAGE_ATTORNEY_EVIDENCE_SHOWN_8 : preload("res://assets/Attorney_Minigame/images/evidence_shown/8.png"),
	IMAGE_ATTORNEY_EVIDENCE_HIDDEN_1 : preload("res://assets/Attorney_Minigame/images/evidence_hidden/1.png"),
	IMAGE_ATTORNEY_EVIDENCE_HIDDEN_2 : preload("res://assets/Attorney_Minigame/images/evidence_hidden/2.png"),
	IMAGE_ATTORNEY_EVIDENCE_HIDDEN_3 : preload("res://assets/Attorney_Minigame/images/evidence_hidden/3.png"),
	IMAGE_ATTORNEY_EVIDENCE_HIDDEN_4 : preload("res://assets/Attorney_Minigame/images/evidence_hidden/4.png"),
	IMAGE_ATTORNEY_EVIDENCE_HIDDEN_5 : preload("res://assets/Attorney_Minigame/images/evidence_hidden/5.png"),
	IMAGE_ATTORNEY_EVIDENCE_HIDDEN_6 : preload("res://assets/Attorney_Minigame/images/evidence_hidden/6.png"),
	IMAGE_ATTORNEY_EVIDENCE_HIDDEN_7 : preload("res://assets/Attorney_Minigame/images/evidence_hidden/7.png"),
	IMAGE_ATTORNEY_EVIDENCE_HIDDEN_8 : preload("res://assets/Attorney_Minigame/images/evidence_hidden/8.png")
}

func change_image(texture_button: TextureButton, image: String):
	texture_button.texture_normal = ImageManager.images_attorney_evidences[image]
