extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var anim : AnimatedSprite2D = $animacao

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	
	var direction := Input.get_axis("esquerda", "direita")
	if direction:
		if direction > 0:
			anim.scale.x = 3.0
		if direction < 0:
			anim.scale.x = -3.0
		velocity.x = direction * SPEED
		anim.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim.play("idle")

	move_and_slide()
