class_name Asteroid
extends Entity

var asteroid_life
var asteroid_velocity

var direction: Vector2

var sprites = [
	'Sprite1',
	'Sprite2',
	'Sprite3'
]

func _ready():
	select_sprite()
	
	rotate(randf_range(0, 7.28))
	
	direction = Vector2(1, 0).rotated(randf_range(0, 7.28))
	

func _physics_process(delta):
	velocity = Vector2(
		direction.x * asteroid_velocity * delta,
		direction.y * asteroid_velocity * delta,
	)
	move_and_slide()

func select_sprite():
	var selected_sprite = get_node(sprites.pick_random())
	
	for spriteName in sprites:
		var sprite = get_node(spriteName)
		if (selected_sprite == sprite):
			sprite.visible = true
			continue
		
		sprite.visible = false

func damage():
	asteroid_life -= 1
	
	if (asteroid_life == 0):
		destroy()

func destroy():
	CometsManager.add_score(1)
	queue_free()
