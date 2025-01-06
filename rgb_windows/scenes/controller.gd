extends Node2D

var posVector: Vector2
var isChanging

#ToDo cos jest niesymetrycznie, lekko zawyza wartosc Red

func getRed() -> float:
	return 1 - (posVector.distance_to(Vector2(0, -1))/2)

func getBlue() -> float:
	return 1 - (posVector.distance_to(Vector2(-0.86603, 0.5))/2)

func getGreen() -> float:
	return 1 - (posVector.distance_to(Vector2(0.86603, 0.5))/2)
