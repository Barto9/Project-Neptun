extends Node2D

var layer = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var semi_transparent = Color(1,1,1,0.3)
	var red = Color(1,0,0,1)
	var green = Color(0,1,0,1)
	var blue = Color8(0,75,255,255)
	match layer:
		0:
			$Red_layer.modulate = red
			$Red_layer.collision_enabled = true
			
			$Green_layer.modulate = semi_transparent
			$Green_layer.collision_enabled = false
			
			$Blue_layer.modulate = semi_transparent
			$Blue_layer.collision_enabled = false
			
			$Player.modulate = red
		1:
			$Red_layer.modulate = semi_transparent
			$Red_layer.collision_enabled = false
			
			$Green_layer.modulate = green
			$Green_layer.collision_enabled = true
			
			$Blue_layer.modulate = semi_transparent
			$Blue_layer.collision_enabled = false
			
			$Player.modulate = green 
		2:
			$Red_layer.modulate = semi_transparent
			$Red_layer.collision_enabled = false
			
			$Green_layer.modulate = semi_transparent
			$Green_layer.collision_enabled = false
			
			$Blue_layer.modulate = blue
			$Blue_layer.collision_enabled = true
			
			$Player.modulate = blue 
			

func _on_player_switch_color() -> void:
	layer += 1
	if layer > 2:
		layer = 0
