class_name Player extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -450.0
var dJump = false
@onready var start_position: Vector2 = Vector2(459,612)



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		dJump = false
	# Handle double jump
	if Input.is_action_just_pressed("jump") and !is_on_floor() and !dJump:
		velocity.y = JUMP_VELOCITY*0.5
		dJump = true
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.play("run")
		if direction > 0:
			$AnimatedSprite2D.flip_h = false
		elif direction <= 0:
			$AnimatedSprite2D.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("idle")
	if global_position.y > 960:
		var tween = get_tree().create_tween()
		tween.set_ease(Tween.EASE_OUT)
		tween.set_trans(Tween.TRANS_EXPO)
		tween.tween_property(self, "global_position", start_position, 1)
		

	move_and_slide()
