class_name Bullet
extends Entity

const VELOCITY = 50000

var movement_direction: Vector2

var expiration_time = 2.0
var lifetime = 0.0

func shoot(initial_position: Vector2, direction: float):
	position = initial_position
	movement_direction = Vector2(1, 0).rotated(direction)
	
func _physics_process(delta):
	velocity = movement_direction * VELOCITY * delta
	move_and_slide()
	
	lifetime += delta
	if (lifetime > expiration_time):
		destroy()
	
	for i in get_slide_collision_count():
		var node = get_slide_collision(i).get_collider()
		if (node.is_in_group("asteroid")):
			node.damage()
			destroy()


func destroy():
	queue_free()
