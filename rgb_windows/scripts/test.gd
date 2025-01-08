extends Node

var color_layer = 0

var red = Color8(255,0,0,255)
var green = Color8(0,255,0,255)
var blue = Color8(0,80,255,255)
var semi_transparent = Color8(255,255,255,64)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Window/Red_scene.position = -$Window.position
	$Window2/Green_scene.position = -$Window2.position
	$Window3/Blue_scene.position = -$Window3.position
	
	if Input.is_action_just_pressed("switch_color"):
		color_layer += 1
		if color_layer > 2:
			color_layer = 0
			
	match color_layer:
		0:
			$Window/Red_scene/Red.collision_enabled = true
			$Window2/Green_scene/Red.collision_enabled = true
			$Window3/Blue_scene/Red.collision_enabled = true
			
			$Window/Red_scene/Green.collision_enabled = false
			$Window2/Green_scene/Green.collision_enabled = false
			$Window3/Blue_scene/Green.collision_enabled = false
			
			$Window/Red_scene/Blue.collision_enabled = false
			$Window2/Green_scene/Blue.collision_enabled = false
			$Window3/Blue_scene/Blue.collision_enabled = false
			
			$Window/Red_scene/Player/AnimatedSprite2D.modulate = red
			$Window2/Green_scene/Player/AnimatedSprite2D.modulate = semi_transparent
			$Window3/Blue_scene/Player/AnimatedSprite2D.modulate = semi_transparent
		1:
			$Window/Red_scene/Red.collision_enabled = false
			$Window2/Green_scene/Red.collision_enabled = false
			$Window3/Blue_scene/Red.collision_enabled = false
			
			$Window/Red_scene/Green.collision_enabled = true
			$Window2/Green_scene/Green.collision_enabled = true
			$Window3/Blue_scene/Green.collision_enabled = true
			
			$Window/Red_scene/Blue.collision_enabled = false
			$Window2/Green_scene/Blue.collision_enabled = false
			$Window3/Blue_scene/Blue.collision_enabled = false
			
			$Window/Red_scene/Player/AnimatedSprite2D.modulate = semi_transparent
			$Window2/Green_scene/Player/AnimatedSprite2D.modulate = green
			$Window3/Blue_scene/Player/AnimatedSprite2D.modulate = semi_transparent
		2:
			$Window/Red_scene/Red.collision_enabled = false
			$Window2/Green_scene/Red.collision_enabled = false
			$Window3/Blue_scene/Red.collision_enabled = false
			
			$Window/Red_scene/Green.collision_enabled = false
			$Window2/Green_scene/Green.collision_enabled = false
			$Window3/Blue_scene/Green.collision_enabled = false
			
			$Window/Red_scene/Blue.collision_enabled = true
			$Window2/Green_scene/Blue.collision_enabled = true
			$Window3/Blue_scene/Blue.collision_enabled = true
			
			$Window/Red_scene/Player/AnimatedSprite2D.modulate = semi_transparent
			$Window2/Green_scene/Player/AnimatedSprite2D.modulate = semi_transparent
			$Window3/Blue_scene/Player/AnimatedSprite2D.modulate = blue
