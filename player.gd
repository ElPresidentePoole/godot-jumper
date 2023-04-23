extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -1000.0

signal landed_on_platform(new_y, new_score)
var sent_landed_signal = false
var last_platform_y
var score = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if is_on_floor():
		if not sent_landed_signal:
			sent_landed_signal = true
			emit_signal('landed_on_platform', position.y, score)
	else:
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sent_landed_signal = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
