extends Node2D

@export var speed: float = 200.0

var is_game_over = false

func game_over():
	is_game_over = true
	$Timer.stop()
	




func _process(delta: float) -> void:
	get_parent().position.x -= speed * delta
	if get_parent().global_position.x < -200.0:
		get_parent().queue_free()
