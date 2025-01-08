extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Window/Red_scene.position = -$Window.position
	$Window2/Green_scene.position = -$Window2.position
	$Window3/Blue_scene.position = -$Window3.position
