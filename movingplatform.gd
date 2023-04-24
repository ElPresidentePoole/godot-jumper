extends AnimatableBody2D

const MIN_X = 32
const MAX_X = 328
var moving_speed = 100
var moving_right = true
var score_counted = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if moving_right:
		if position.x > MAX_X:
			moving_right = false
		else:
			position.x += delta * moving_speed
	else:
		if position.x < MIN_X:
			moving_right = true
		else:
			position.x -= delta * moving_speed
