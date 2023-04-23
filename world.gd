extends Node2D

const PlatformScene = preload("res://movingplatform.tscn")
@onready var camera = $GameCamera
@onready var player = $Player
@onready var platforms = $Platforms
@onready var first_platform = $Platforms/FirstPlatform

const SPACE_BETWEEN_PLATFORMS = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	var starting_y = first_platform.position.y
	for y in range(1, 10):
		var i = PlatformScene.instantiate()
		i.position.y = -y * SPACE_BETWEEN_PLATFORMS + starting_y
		i.position.x = randi_range(60, 200)
		platforms.add_child(i)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	pass
