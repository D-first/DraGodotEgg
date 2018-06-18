extends Area2D

var flip_h = false setget set_flip_h
var pos

signal pickup(egg)

func _ready():
	pos = position

func pickup():
	for body in get_overlapping_bodies():
		if body.is_in_group("egg"):
			body.pickup(get_parent())
			emit_signal("pickup", body)
			return

func set_flip_h(value):
	if value:
		position = Vector2(-pos.x, pos.y)
	else:
		position = pos
	
	flip_h = value