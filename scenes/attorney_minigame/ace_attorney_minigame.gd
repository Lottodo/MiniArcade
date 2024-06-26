extends Node2D

# Evidence-related nodes
@onready var evidence_silhouette = $EvidenceSilhouette
@onready var evidences = [
	$Evidence1,
	$Evidence2,
	$Evidence3,
	$Evidence4
]

# Players
@onready var attorney_sound_player = $AttorneySoundPlayer
@onready var attorney_music_player = $AttorneyMusicPlayer
@onready var phoenix_animation_player = $PhoenixWright/AnimationPlayer
@onready var objection_animation_player = $Objection/AnimationPlayer

# Timers
@onready var initial_wait_timer = $InitialWaitTimer
@onready var game_duration_timer = $GameDurationTimer
@onready var after_objection_timer = $AfterObjectionTimer

var correct_evidence : String
var correct_evidence_index : int
var evidence_names
var has_player_won : bool

func _ready():
	SoundManager.play_sound(attorney_music_player, SoundManager.SOUND_ATTORNEY_MUSIC)
	initial_wait_timer.start() # When this ends, the evidence is shown so the player can choose

func set_random_evidence():
	# Generate a correct evidence
	correct_evidence_index = randi_range(1, 8)
	correct_evidence = "evidence_" + str(correct_evidence_index)
	
	# Show the correct evidence silhouette
	ImageManager.change_image(evidence_silhouette, correct_evidence + "_hidden")
	
	# Create a list of available evidence indices
	var available_indices = []
	for i in range(1, 8):
		if i != correct_evidence_index:
			available_indices.append(i)
	
	# Randomly select three incorrect evidence indices
	var incorrect_evidence_indices = []
	while incorrect_evidence_indices.size() < 3:
		var random_index = randi_range(0, available_indices.size() - 1)
		incorrect_evidence_indices.append(available_indices[random_index])
		available_indices.remove_at(random_index)
	
	# Create a list of evidence names for the buttons
	evidence_names = [correct_evidence + "_shown"]
	for i in incorrect_evidence_indices:
		evidence_names.append("evidence_" + str(i) + "_shown")
	
	# Shuffle the list of evidence names
	evidence_names.shuffle()
	
	# Assign the evidence names to the buttons
	for i in range(evidences.size()):
		ImageManager.change_image(evidences[i], evidence_names[i])

# Phoenix Wright actions
func phoenix_objects():
	phoenix_animation_player.play("pointing")
	objection_animation_player.play("objection!")
	SoundManager.play_sound(attorney_sound_player, SoundManager.SOUND_ATTORNEY_OBJECTION)
	after_objection_timer.start()

func phoenix_fails():
	phoenix_animation_player.play("failure")
	SoundManager.play_sound(attorney_sound_player, SoundManager.SOUND_ATTORNEY_FAILURE)

func phoenix_thinks():
	phoenix_animation_player.play("thinking")
	SoundManager.play_sound(attorney_sound_player, SoundManager.SOUND_ATTORNEY_THINKING)

func phoenix_wins():
	phoenix_animation_player.play("victory")
	SoundManager.play_sound(attorney_sound_player, SoundManager.SOUND_ATTORNEY_VICTORY)

# Evidence buttons signal functions
func _on_evidence_1_pressed():
	phoenix_objects()
	disable_buttons()
	if evidence_names[0] == correct_evidence + "_shown":
		has_player_won = true
		attorney_music_player.stop()
	else:
		has_player_won = false

func _on_evidence_2_pressed():
	phoenix_objects()
	disable_buttons()
	if evidence_names[1] == correct_evidence + "_shown":
		has_player_won = true
		attorney_music_player.stop()
	else:
		has_player_won = false

func _on_evidence_3_pressed():
	phoenix_objects()
	disable_buttons()
	if evidence_names[2] == correct_evidence + "_shown":
		has_player_won = true
		attorney_music_player.stop()
	else:
		has_player_won = false

func _on_evidence_4_pressed():
	phoenix_objects()
	disable_buttons()
	if evidence_names[3] == correct_evidence + "_shown":
		has_player_won = true
		attorney_music_player.stop()
	else:
		has_player_won = false

func disable_buttons():
	for button in evidences:
		button.disabled = true

# Timeout signal functions
func _on_initial_wait_timer_timeout():
	set_random_evidence()
	phoenix_thinks()

func _on_after_objection_timer_timeout():
	ImageManager.change_image(evidence_silhouette, correct_evidence + "_shown")
	if has_player_won:
		phoenix_wins()
	else:
		phoenix_fails()

func _on_game_duration_timer_timeout():
	print("Game ended!")
