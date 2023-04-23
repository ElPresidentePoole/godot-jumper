extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var player_pos = get_parent().get_node('Player').position
	if player_pos.y - 600 < position.y:
		position.y = player_pos.y - 600

#func _on_player_landed_on_platform(new_y):
#	var tween = get_tree().create_tween()
#	tween.tween_property(self, 'position', Vector2(position.x, new_y - 700), 1)
