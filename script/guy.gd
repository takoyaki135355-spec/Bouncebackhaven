
extends RigidBody2D
class_name Player
@export var spawnPoint: Marker2D

var is_game_over := false

func _ready() -> void:
	lock_rotation = true
	if spawnPoint == null:
		push_error("SpawnPoint Marker2D is not assigned!")
		return
	global_position = spawnPoint.global_position
	linear_velocity = Vector2.ZERO
	angular_velocity = 0.0

func die():
	$CanvasLayer/TextureRect.show()
	if not is_game_over:
		GameEvents.gameover.emit()
		is_game_over = true
		sleeping = true

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	die()
