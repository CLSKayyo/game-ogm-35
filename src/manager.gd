class_name Manager
extends Node

var score = 0

func go_to_scene(scene: String):
	get_tree().change_scene_to_file(scene)
	
func add_score(value: int):
	score += value
