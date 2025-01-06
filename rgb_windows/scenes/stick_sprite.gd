extends Sprite2D

@onready var controller: Node2D = $".."

var pressing = false

@export var maxLength = 15
@export var deadzone = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	maxLength *= controller.scale.x
	deadzone *= controller.scale.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if pressing:
		if get_global_mouse_position().distance_to(controller.global_position) <= maxLength:
			global_position = get_global_mouse_position()
		else:
			var angle = controller.global_position.angle_to_point(get_global_mouse_position())
			global_position.x = controller.global_position.x + cos(angle)*maxLength
			global_position.y = controller.global_position.x + sin(angle)*maxLength
	elif position.length() <= deadzone:
		global_position = controller.global_position
	controller.posVector = (global_position - controller.global_position)/maxLength

func _on_button_button_down() -> void:
	pressing = true

func _on_button_button_up() -> void:
	pressing = false
