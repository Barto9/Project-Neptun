extends Node2D

var color_treshold = 120

var semi_transparent = Color(1,1,1,0.3)
var red = Color(1,0,0)
var green = Color(0,1,0)
var blue = Color(0, 0, 1)
var white = Color(1, 1, 1)

@onready var controller: Node2D = $Controller

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if controller.isChanging:
		var r_val = controller.getRed()
		var g_val = controller.getGreen()
		var b_val = controller.getBlue()
		
		$Red_layer.modulate = semi_transparent
		$Red_layer.collision_enabled = false
		
		$Green_layer.modulate = semi_transparent
		$Green_layer.collision_enabled = false
		
		$Blue_layer.modulate = semi_transparent
		$Blue_layer.collision_enabled = false
		
		$Player.modulate = Color(r_val, g_val, b_val) #Nie dziala :(
		
		if(r_val > color_treshold):
			$Red_layer.modulate = red
			$Red_layer.collision_enabled = true
		
		if(g_val > color_treshold):
			$Green_layer.modulate = green
			$Green_layer.collision_enabled = true
		
		if(b_val > color_treshold):
			$Blue_layer.modulate = blue
			$Blue_layer.collision_enabled = true

func _on_player_switch_color() -> void:
	pass
