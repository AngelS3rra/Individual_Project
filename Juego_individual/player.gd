extends CharacterBody2D

const SPEED = 200
const JUMP = -400
const GRAVITY = 900

func _physics_process(delta):
	# Aplicar gravedad
	velocity.y += GRAVITY * delta

	# Movimiento horizontal
	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = direction * SPEED

	# Saltar
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP

	# Mover al personaje
	move_and_slide()
