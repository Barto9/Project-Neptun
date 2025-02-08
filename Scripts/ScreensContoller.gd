extends Node2D

var current_screen_index := 0
@export var tv_screens: Array[Node2D]
@onready var player := %Player
var player_copy = null
var chosen_screen_to_swap := -1

const player_scene: PackedScene = preload("res://Scenes/Components/player.tscn")

# display which screen wants to be swaped
func _process(_delta):
	if chosen_screen_to_swap != -1:
		tv_screens[chosen_screen_to_swap].modulate = Color.LIGHT_CORAL
	else:
		tv_screens.map(func(tv_screen): tv_screen.modulate = Color.WHITE)

func _ready():
	player.reparent(tv_screens[current_screen_index])
	for screen in tv_screens:
		var areas: Array = (screen.get_children().filter( func(child): return (child is Barrier ) ) ) as Array[Barrier]
		for area in areas:
			area.body_entered.connect(func(body: Node2D): startTransporting(body, area))
			area.body_exited.connect(func(body: Node2D): finishTransporting(body, area))
		var clickable_area = screen.get_children().filter( func(child): return child.is_in_group("Clickable_Area") ).front() as Area2D
		clickable_area.input_event.connect(screenSwapEvent.bind(clickable_area))


func startTransporting(body: Node2D, area: Barrier):
	if(body == player && !player.is_dead):
		var entered_direction: Vector2i = area.side
		var current_screen: Vector2i = tv_screens[current_screen_index].get_meta("placement")
		var next_screen: Vector2i = entered_direction + current_screen
		# if character walks out of entire level, they die
		if !( (next_screen.x == 0 || next_screen.x == 1) && (next_screen.y == 0 || next_screen.y == 1) ):
			player.die()
			return
		# creating copy of character on other character
		player_copy = player_scene.instantiate()
		var next_tv_screen := tv_screens[findScreen(next_screen)]
		next_tv_screen.call_deferred("add_child", player_copy)
		player_copy.velocity.y = player.velocity.y
		player_copy.facing_left = player.facing_left
		
		if findScreen(next_screen) == chosen_screen_to_swap:
			chosen_screen_to_swap = -1
		
		var next_screen_barrier = findOppositeBarrier(entered_direction, next_tv_screen)
		# setting respective x or white position to keep illusion consistent
		if entered_direction.x != 0:
			player_copy.position.y = player.position.y
			player_copy.position.x = next_screen_barrier.position.x + barrierOffset(next_screen_barrier, entered_direction)
		elif entered_direction.y != 0:
			player_copy.position.x = player.position.x
			player_copy.position.y = next_screen_barrier.position.y + barrierOffset(next_screen_barrier, entered_direction)

func finishTransporting(body: Node2D, area: Area2D):
	if body == player_copy:
		player.queue_free()
		player = player_copy
		player_copy = null
		current_screen_index = findScreen(player.get_parent().get_meta("placement"))
	elif body == player && !player.is_dead:
		player_copy.queue_free()
		player_copy = null

func screenSwapEvent(viewport: Viewport, event: InputEvent, shape_idx: int, area: Area2D):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if (area.get_parent().get_children().find(player)) != -1 || (area.get_parent().get_children().find(player_copy)) != -1:
				return 
			print("Clicked on Area2D: ", area.name)
			if chosen_screen_to_swap != -1:
				swapScreens(chosen_screen_to_swap, findScreen(area.get_parent().get_meta("placement")))
				chosen_screen_to_swap = -1
			else:
				chosen_screen_to_swap = findScreen(area.get_parent().get_meta("placement"))

func swapScreens(screenA: int, screenB: int):
	var temp_screen_position = tv_screens[screenA].position
	var temp_screen_placement = tv_screens[screenA].get_meta("placement")
	tv_screens[screenA].position = tv_screens[screenB].position
	tv_screens[screenA].set_meta("placement", tv_screens[screenB].get_meta("placement"))
	tv_screens[screenB].position = temp_screen_position
	tv_screens[screenB].set_meta("placement", temp_screen_placement)

func findScreen(screen_vector: Vector2i) -> int:
	for index in tv_screens.size():
		if tv_screens[index].get_meta("placement") == screen_vector:
			return index
	return -1


func findOppositeBarrier(side_vector: Vector2i, screen_node: Node2D) -> Barrier:
	var barrier = screen_node.get_children().filter( func(child): return child is Barrier and child.side == -side_vector ).front()
	return barrier

func barrierOffset(barrier: Area2D, entered_direction: Vector2i) -> float:
	var collision_shape: CollisionShape2D = barrier.get_children().filter( func(child): return child is CollisionShape2D ).front()
	if entered_direction.x != 0:
		return (collision_shape.shape.size.x / 2) * sign(entered_direction.x)
	elif entered_direction.y != 0:
		return (collision_shape.shape.size.y / 2) * sign(entered_direction.y)
	return 0
