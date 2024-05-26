extends Asteroid

var asteroid_node = preload("res://scenes/asteroid_3.tscn")

func _init():
	asteroid_life = 2
	asteroid_velocity = 6000

func destroy():
	var asteroid = asteroid_node.instantiate()
	var asteroid2 = asteroid_node.instantiate()
	asteroid.position = position
	asteroid2.position = position
	add_sibling(asteroid)
	add_sibling(asteroid2)
	super.destroy()
