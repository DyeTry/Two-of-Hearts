extends Control

var level_scene: PackedScene = load("res://Space_Shooter_Showcase/Scenes/level.tscn")

func _ready():
	$CenterContainer/VBoxContainer/ScoreText.text = $CenterContainer/VBoxContainer/ScoreText.text + str(Global_Space_Shooter.score)

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		get_tree().change_scene_to_packed(level_scene)
