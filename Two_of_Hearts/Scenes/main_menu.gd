class_name MainMenu


extends Control


@onready var level_scene: PackedScene = load("res://Space_Shooter_Showcase/Scenes/level.tscn")
@onready var settings_menu: SettingsMenu = $SettingsMenu
@onready var title_container: MarginContainer = $TitleContainer
@onready var menu_container: MarginContainer = $MenuContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	_handle_connecting_signals()


func _on_play_button_pressed():
	get_tree().change_scene_to_packed(level_scene)


func _on_settings_button_pressed():
	title_container.visible = false
	menu_container.visible = false
	settings_menu.set_process(true)
	settings_menu.visible = true


func _on_quit_button_pressed():
	get_tree().quit()


func _on_exit_button_pressed():
	title_container.visible = true
	menu_container.visible = true
	settings_menu.visible = false


func _handle_connecting_signals():
	settings_menu.exit_button_menu.connect(_on_exit_button_pressed)
