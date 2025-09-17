extends CharacterBody2D

@onready var cool = $dashcool
@onready var gravitimer = $gravidade
@onready var coyoteTM = $coyoteTM
@onready var inputBuffer = $INP_Buffer
var canJump = true
var SPEED_INI = 70.0
var speed = SPEED_INI
var JUMP_VELOCITY = -300.0
var gravity =980
var dash=1
var dashw=1
var dashdir=1
@onready var animated_sprite = $AnimatedSprite2D
var personagem = "sol"
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		

	if is_on_floor() and !canJump:
		canJump = true
		
	#Começa coyote time
	if canJump and coyoteTM.is_stopped():
		coyoteTM.start()
		
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and canJump:
		velocity.y = JUMP_VELOCITY  
		if !inputBuffer.is_stopped():
			velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("ui_accept") and !canJump:
		inputBuffer.start()
		
	if !inputBuffer.is_stopped() and canJump:
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
	#DASH
	gravity=980
	if	not is_on_floor() and personagem=="lua" and Input.is_action_pressed("shift"):
		gravity=0
		velocity.y= 25
	if is_on_floor() and dashw==1 :
		dash=1
	if Input.is_action_just_pressed("shift") and dash==1 and personagem=="sol" :
		speed=300
		gravity=0
		velocity.y=0
		dash=0
		dashw=0
		
		cool.start()
		gravitimer.start()
	if not Input.is_action_pressed("shift") :
		speed =SPEED_INI
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
		if direction < 0 :
			animated_sprite.flip_h=false
		if direction > 0 :
			animated_sprite.flip_h=true
		#if is_on_floor() :
			#animated_sprite.play("run")
		#else :
			#animated_sprite.play("jump")	
		dashdir=direction
	else:
		
		if speed == 500 : 
			velocity.x = dashdir * speed
		else :
			velocity.x = move_toward(velocity.x, 0, speed)
		#animated_sprite.play("idle")
	
	# Opcional: Limitar quantidade de pontos para não crescer infinitamente
	move_and_slide()



	# Adiciona o ponto atual à linha
	


func _on_gravidade_timeout() -> void:
	gravity=980
	if Input.is_action_pressed("shift"):
		speed=130
	pass # Replace with function body.


func _on_dashcool_timeout() -> void:
	dashw=1
	


func _on_coyote_tm_timeout() -> void: # func do coyote time
	canJump = false


func _on_inp_buffer_timeout() -> void:
	pass # Replace with function body.
