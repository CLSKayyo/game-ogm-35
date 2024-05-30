extends Control

@onready var score_txt = %Score

func _ready():
	score_txt.text = str(CometsManager.score)
	CometsManager.score = 0

func _on_play_again_pressed():
	CometsManager.go_to_scene('res://scenes/world.tscn')


func _on_main_menu_pressed():
	CometsManager.go_to_scene('res://scenes/main_menu.tscn')
