extends MarginContainer


func _ready():
	$VBoxContainer/Play/Button.pressed.connect(_on_play_pressed)

func _on_play_pressed():
	get_tree().change_scene_to_file("res://level1.tscn")
