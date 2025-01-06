extends Node2D

var posVector: Vector2
var isChanging

#ToDo cos jest niesymetrycznie, lekko zawyza wartosc Red

func getRed() -> float:
	return map_angle_to_RGB(posVector.distance_to(Vector2(0, -1)))

func getBlue() -> float:
	return map_angle_to_RGB(posVector.distance_to(Vector2(-1, 1)))

func getGreen() -> float:
	return map_angle_to_RGB(posVector.distance_to(Vector2(1, 1)))

func map_angle_to_RGB(value: float) -> float:
	var temp = inverse_lerp(0, 3.1416, abs(value))
	return lerp(255, 0, temp)
