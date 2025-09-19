
extends Area2D
@onready var timer = $Timer
func _on_body_entered(body: Node2D) -> void:
		if body.name =="player" :
			get_tree().call_deferred("reload_current_scene")

func _on_timer_timeout() -> void:
	pass
	
