extends Node2D

var time

func _ready():
	Game.godot  = 0
	Game.green  = 0
	Game.peach  = 0
	Game.white  = 0
	Game.gold   = 0
	Game.silver = 0
	$Bgm.play()
	time = 60
	for ground in $Tiles.get_children():
		$Weather.connect("weather_changed", ground, "_on_weather_changed")
	$EggFactory.spawn(6)


func _on_EggFactory_spawn(egg, spawn_pos):
	egg.connect("hatching", self, "_on_hatching")
	egg.global_position = spawn_pos
	$Eggs.add_child(egg)
	$EggFactory/Se.play()


func _on_Timer_timeout():
	$EggFactory.spawn(6)

func _on_hatching(egg):
#	$GameCount.wait_time = $GameCount.time_left + 3.0
	time += 1.0
	match egg.type:
		"godot":
			Game.godot += egg.point
		"green":
			Game.green += egg.point
		"peach":
			Game.peach += egg.point
		"white":
			Game.white += egg.point
		"gold":
			Game.gold += egg.point
		"silver":
			Game.silver += egg.point

	var egg_contents = egg.contents.instance()
	egg_contents.position = egg.global_position
	add_child(egg_contents)

func _on_WeatherTimer_timeout():
	$Weather.next()


func _on_Weather_weather_change_start(weather):
	if weather == "normal":
		return

	$Camera.shake(0.2, 15, 8)
	$papadora/Anim.play(weather)

func _physics_process(delta):
	time -= delta
	$CountdownBar.value = time
	
	if time <= 0:
		get_tree().paused = true
		$Anim.play("timeup")

#func _on_GameCount_timeout():
#	get_tree().paused = true
#	$Anim.play("timeup")

func goto_result():
	get_tree().change_scene("res://Result/Result.tscn")
