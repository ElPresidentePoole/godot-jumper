extends Node2D

const PlatformScene = preload("res://movingplatform.tscn")
@onready var camera = $GameCamera
@onready var player = $Player
@onready var platforms = $Platforms
@onready var first_platform = $Platforms/FirstPlatform
@onready var score_label = $CanvasLayer/ScoreLabel
@onready var game_over_container = $CanvasLayer/GameOverContainer
@onready var game_over_score = $CanvasLayer/GameOverContainer/VBoxContainer/Label

const SPACE_BETWEEN_PLATFORMS = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	var starting_y = first_platform.position.y
	for y in range(1, 10):
		var i = PlatformScene.instantiate()
		i.position.y = -y * SPACE_BETWEEN_PLATFORMS + starting_y
		i.position.x = randi_range(60, 200)
		i.moving_right = randi() % 2 == 0 # 50/50
		platforms.add_child(i)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	pass

func _on_player_game_over():
	game_over_container.visible = true
	score_label.visible = false

func _on_player_score_increased(new_score):
	score_label.text = "Score: %s" % [new_score]
	game_over_score.text = "Game over!\nFinal score: %s" % [new_score]

func _on_quit_button_pressed():
	get_tree().quit()
