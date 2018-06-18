extends TextureButton

const Egg = preload("res://egg/Egg.tscn")

var tex = preload("res://egg/white.tres")
var contents = preload("res://egg/Piyo.tscn")

func _ready():
	$Bgm.play()


func _on_Timer_timeout():
	var egg_ins = Egg.instance()
	var egg_ins2 = Egg.instance()
	egg_ins.init("white", 1, tex, contents)
	egg_ins2.init("white", 1, tex, contents)
	$pos1.add_child(egg_ins)
	$pos2.add_child(egg_ins2)



func _input(event):
	if event.is_action_type():
		get_tree().change_scene("res://World/World.tscn")



func _on_kill_body_entered(body):
	body.queue_free()


func _on_title_pressed():
	get_tree().change_scene("res://World/World.tscn")
