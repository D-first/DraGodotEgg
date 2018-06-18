extends Node2D

const Egg = preload("res://egg/Egg.tscn")

signal spawn(egg, spawn_pos)

var eggs = []

var egg_sprites = {
	"godot"  : preload("res://egg/godot.tres"),
	"green"  : preload("res://egg/green.tres"),
	"peach"  : preload("res://egg/peach.tres"),
	"white"  : preload("res://egg/white.tres"),
	"gold"   : preload("res://egg/gold.tres"),
	"silver" : preload("res://egg/sliver.tres")
}

var egg_point = {
	"godot"  : 3,
	"green"  : 2,
	"peach"  : 2,
	"white"  : 1,
	"gold"   : 4,
	"silver" : 2
}

var egg_contens = {
	"godot"  : preload("res://egg/Godot.tscn"),
	"green"  : preload("res://egg/WaterMelon.tscn"),
	"peach"  : preload("res://egg/Ikura.tscn"),
	"white"  : preload("res://egg/Piyo.tscn"),
	"gold"   : preload("res://egg/Dragon.tscn"),
	"silver" : preload("res://egg/Ghost.tscn")
}

func _ready():
	randomize()

func spawn(quantity=1):
	for egg in range(quantity):
		var egg_type = egg_sprites.keys()[randi() % egg_sprites.size()]
		var egg_ins = Egg.instance()
		egg_ins.init(egg_type, egg_point[egg_type], egg_sprites[egg_type], egg_contens[egg_type])
		eggs.append(egg_ins)

func _on_Interval_timeout():
	if eggs.size() > 0:
		emit_signal("spawn", eggs.pop_front(), $SpawnPos.global_position)
