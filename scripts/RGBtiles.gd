extends Node

var change = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	# Display the tiles based on the button of color pressed
	if event.is_action_pressed("green") and not $Green.visible and not change:
		change = true
		$Green.visible = true 
		$Green.set_collision_enabled(true)
		await get_tree().create_timer(1.0).timeout
		$Red.visible = false
		$Red.set_collision_enabled(false)
		$Blue.visible = false
		$Blue.set_collision_enabled(false)
		change = false
	elif event.is_action_pressed("blue") and not $Blue.visible and not change:
		change = true
		$Blue.visible = true
		$Blue.set_collision_enabled(true)
		await get_tree().create_timer(1.0).timeout
		$Red.visible = false
		$Red.set_collision_enabled(false)
		$Green.visible = false
		$Green.set_collision_enabled(false)
		change = false
	elif event.is_action_pressed("red") and not $Red.visible and not change:
		change = true
		$Red.visible = true
		$Red.set_collision_enabled(true)
		await get_tree().create_timer(1.0).timeout
		$Green.visible = false
		$Green.set_collision_enabled(false)
		$Blue.visible = false
		$Blue.set_collision_enabled(false)
		change = false
