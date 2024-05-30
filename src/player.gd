class_name Player
extends Entity

const MAX_VELOCITY = 400
const ACCEL = 900
const BRAKE = 450
const ROTATION_VEL = 5

@onready var sprite = $AnimatedSprite2D
var bullet_node = preload("res://scenes/bullet.tscn")

func _physics_process(delta):
	rotate_ship(delta)
	move_ship(delta)
	control_animations()
	
	if (Input.is_action_just_pressed("shoot")):
		var bullet = bullet_node.instantiate()
		bullet.shoot(position, rotation)
		add_sibling(bullet)
	

func rotate_ship(delta):
	rotate(Input.get_axis("turn_left", "turn_right") * ROTATION_VEL * delta)

func move_ship(delta):
	var move_force = Input.get_axis("brake", "apply_gas")
	
	var move_direction = Vector2()
	if (move_force > 0):
		move_direction.x = move_force * ACCEL * delta
	elif (move_force < 0):
		move_direction.x = move_force * BRAKE * delta
	
	move_direction = move_direction.rotated(rotation)
	
	velocity = Vector2(
		clampi(velocity.x + move_direction.x, -MAX_VELOCITY, MAX_VELOCITY),
		clampi(velocity.y + move_direction.y, -MAX_VELOCITY, MAX_VELOCITY),
	)
	
	move_and_slide()
	
	for i in get_slide_collision_count():
		var node = get_slide_collision(i).get_collider()
		if (node.is_in_group("asteroid")):
			destroy()

func control_animations():
	if (Input.is_action_pressed("apply_gas")):
		sprite.animation = "engine_on"
	else:
		sprite.animation = "engine_off"

func destroy():
	CometsManager.go_to_scene("res://scenes/game_over.tscn")
