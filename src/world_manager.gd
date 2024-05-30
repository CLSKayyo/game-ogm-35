extends Node2D

var spawn_rate = 5.0
var spawn_count = 0

@onready var screensize = get_viewport_rect().size

var comet = preload("res://scenes/asteroid_1.tscn")

func _physics_process(delta):
	spawn_count += delta
	
	if spawn_count >= spawn_rate:
		spawn_comet()
		spawn_count = 0
		spawn_rate = spawn_rate * 0.9

func spawn_comet():
	var instance = comet.instantiate()
	add_child(instance)
	instance.transform.origin.x = screensize.x + (randf() * 20)
	instance.transform.origin.y = screensize.y + (randf() * 20)
