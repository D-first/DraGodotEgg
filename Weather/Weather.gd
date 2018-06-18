extends CanvasLayer

signal weather_change_start(weather)
signal weather_changed(weather)

var weather = {
	"normal" : preload("res://Weather/textures/back.png"),
	"hot" : preload("res://Weather/textures/hot_02.png"),
	"cool" : preload("res://Weather/textures/cool_02.png")
}

var forward = {
	"normal" : "normal",
	"hot"    : "sun",
	"cool"   : "snow"
}
var next_weather

func _ready():
	randomize()
	

func next():
#	var rand = rand_range(1, 101)
#	if rand >= 40:
#		next_weather = "normal"
#	elif rand >= 20:
#		next_weather = "hot"
#	else:
#		next_weather = "cool"

	next_weather = weather.keys()[randi() % weather.size()]
	$anim.play("change")
	emit_signal("weather_change_start", next_weather)

func change():
	$Background.texture = weather[next_weather]
	$Forward.animation = forward[next_weather]
	emit_signal("weather_changed", next_weather)