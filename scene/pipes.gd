extends Node2D
@export var speed: float = 200.0

var is_game_over = false

func game_over():
	is_game_over = true
	$Timer.stop()

func _process(delta: float) -> void:
	position.x -= speed * delta
	if global_position.x < -200.0:
		queue_free()



func _on_pipe_collider_body_entered(body: Node2D) -> void:
	if body is Player:
		body.die()
