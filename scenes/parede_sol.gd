extends StaticBody2D
@onready var game = get_parent()
@onready var player = game.get_node("player")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player"  and player.personagem=="sol" and player.speed > 150:
		queue_free()
