class_name Entity
extends CharacterBody2D

@onready var screensize = get_viewport_rect().size

func _process(_delta):
	transform.origin.x = wrapf(transform.origin.x, 0, screensize.x)
	transform.origin.y = wrapf(transform.origin.y, 0, screensize.y)
