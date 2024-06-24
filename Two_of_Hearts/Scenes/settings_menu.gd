class_name SettingsMenu


extends Control


@onready var exit_button: Button = $MarginContainer/VBoxContainer/ExitButton
signal exit_button_menu

# Called when the node enters the scene tree for the first time.
func _ready():
	exit_button.button_down.connect(_on_exit_button_pressed)
	set_process(false)

func _on_exit_button_pressed():
	exit_button_menu.emit()
	set_process(false)
