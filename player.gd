extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -1000.0

#signal landed_on_platform(new_y, new_score)
signal jumped()
signal game_over()
signal score_increased(new_score)
var sent_landed_signal = false
var last_platform_y
var score = 0
var alive = true
var platforms_landed_on = []

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not alive:
		return
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		emit_signal('jumped')
		sent_landed_signal = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	var collisions = get_slide_collision_count()
	for c_idx in range(collisions):
		var collider = get_slide_collision(c_idx).get_collider()
		if collider.is_in_group('platform') and not collider in platforms_landed_on:
			platforms_landed_on.append(collider)
			score += 1
			emit_signal('score_increased', score)

func _on_killbox_body_entered(body):
	alive = false
	emit_signal('game_over')
