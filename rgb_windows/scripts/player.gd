extends CharacterBody2D

signal switch_color

@export var speed = 300.0
@export var jump_velocity = 400.0

func _ready() -> void:
	$AnimatedSprite2D.play()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("switch_color"):
		switch_color.emit()
	
func _physics_process(delta: float) -> void:
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = -jump_velocity
			$AnimatedSprite2D.animation = "jump"
		if velocity.x != 0:
			$AnimatedSprite2D.animation = "walk"
		if velocity.x == 0:
			$AnimatedSprite2D.animation = "idle"
	else:
		$AnimatedSprite2D.animation = "fall"
	
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	move_and_slide()
