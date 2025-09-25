extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventController.connect("coin_collected", on_coin_collected)


func on_coin_collected(value: int) -> void:
	if value >= 6:
		GameController.total_coins = 0
		get_tree().change_scene_to_file("res://Scenes/level3.tscn")
