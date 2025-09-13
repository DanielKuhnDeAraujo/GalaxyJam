extends StaticBody2D
@onready var game = get_parent()
@onready var player = game.get_node("player")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.personagem == "sol" : 
		$CollisionShape2D.disabled = true   
	if player.personagem == "lua" : 
		$CollisionShape2D.disabled = false  
