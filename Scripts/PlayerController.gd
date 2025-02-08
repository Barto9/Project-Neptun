extends CharacterBody2D

@export var speed: float = 100.0
@export var jump_velocity: float = 100.0
var facing_left: bool = false
var is_dead: bool = false

@onready var sprite: Sprite2D = $Sprite2D
@onready var animator: AnimationPlayer = $AnimationPlayer
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _ready():
	sprite.flip_h = facing_left

func _process(delta):
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	
	velocity.x = Input.get_axis("left", "right") * speed

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_velocity
	
	#flip to direction
	if (!facing_left && velocity.x < -0.01) || (facing_left && velocity.x > 0.01):
		facing_left = !facing_left
		sprite.flip_h = facing_left

func _physics_process(delta):
	velocity.y -= Constants.GRAVITY * delta
	if is_dead:
		return
	move_and_slide()


func die():
	is_dead = true
	sprite.self_modulate = Color.RED
