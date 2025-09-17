extends Area2D
@onready var timer = $Timer
		

func _on_timer_timeout() -> void:
	Engine.time_scale=1
	get_tree().reload_current_scene()
	


func _on_body_entered(body: Node2D) -> void:
	if body.name == "player" and body.chao == "s":
		Engine.time_scale = 0.5
		if body.has_node("colisao"):
			body.get_node("colisao").queue_free()
			timer.start()
		else:
			print("Nó CollisionShape2D não existe no player")




func _on_body_exited(body: Node2D) -> void:
	if body.name == "player" and body.chao == "s":
		Engine.time_scale = 0.5
		if body.has_node("colisao"):
			body.get_node("colisao").queue_free()
			timer.start()
		else:
			print("Nó CollisionShape2D não existe no player")
