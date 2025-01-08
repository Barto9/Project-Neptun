extends Area2D

signal entered
signal exited

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	entered.emit()
	$ColorRect.color = Color(1,1,1,0.5)


func _on_body_exited(body: Node2D) -> void:
	exited.emit()
	$ColorRect.color = Color(1,1,1,0.2)
