extends Area2D
@onready var game = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name=="player" :
		get_tree().change_scene_to_file(game.next)
		#"res://scenes/cutscene.tscn"
		pass
