extends CharacterBody2D


var SPEED = 130.0
var JUMP_VELOCITY = -300.0
var gravity =980
@onready var animated_sprite = $AnimatedSprite2D
var personagem = "lua"


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
		
		#Trocar Lua Sol
	if Input.is_action_just_pressed("z") :
		if personagem == "lua" :
			personagem = "sol"
		elif personagem == "sol" :
			personagem ="lua"
			
	if personagem == "lua" :
		JUMP_VELOCITY=-280
	if personagem =="sol" :
		JUMP_VELOCITY=-200
	
	if personagem == "lua" :
		animated_sprite.play("idlelua")
	if personagem == "sol" :
		animated_sprite.play("idlesol")
		
		
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if direction < 0 :
			animated_sprite.flip_h=false
		if direction > 0 :
			animated_sprite.flip_h=true
		#if is_on_floor() :
			#animated_sprite.play("run")
		#else :
			#animated_sprite.play("jump")	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		#animated_sprite.play("idle")

	move_and_slide()
