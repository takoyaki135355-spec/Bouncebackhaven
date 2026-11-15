extends Node2D

@export var bounce_force: float = 800.0

func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		body.linear_velocity.y = 0.0
		body.apply_central_impulse(Vector2.UP * bounce_force)
# 	 im sad u think we used ai :(
#	 why u checking my code
#	 check res://script/hello.gd
