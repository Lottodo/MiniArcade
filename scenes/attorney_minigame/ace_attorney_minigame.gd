extends Node2D

@onready var evidence_silhouette = $EvidenceSilhouette
@onready var evidence_1 = $Evidence1
@onready var evidence_2 = $Evidence2
@onready var evidence_3 = $Evidence3
@onready var evidence_4 = $Evidence4

var correct_evidence : String

func _ready():
	correct_evidence = "evidence_" + str(randi_range(1,8))
	
