
extends Node2D

@export var pipe_scene: PackedScene
@export var spawn_interval: float = 2.0
@export var min_y: float = 150.0
@export var max_y: float = 500.0

@export var gaps_between_pipes := 50
var pipe_counter := 0
var spawn_timer: Timer

var is_game_over = false

func game_over():
	is_game_over = true
	$Timer.stop()
func _ready() -> void:
	spawn_pipe()
	spawn_pipe()
	$Timer.timeout.connect(spawn_pipe)
	GameEvents.gameover.connect(game_over)
	spawn_pipe()



func spawn_pipe() -> void:
	if is_game_over:
		return
	print('test')
	if pipe_scene == null:
		push_error("Pipe scene hasn't been assigned")
		return

	var new_pipe = pipe_scene.instantiate()
	get_parent().add_child(new_pipe)

	var random_y = randf_range(min_y, max_y)

	new_pipe.global_position = Vector2(
		pipe_counter * gaps_between_pipes,
		random_y
	)
	pipe_counter += 1
