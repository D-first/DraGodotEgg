extends StaticBody2D


enum TEMPERATURES {
	HIGH,
	LOW,
	NORMAL
}

export(TEMPERATURES) var temperature_type = NORMAL
var temperature_power = 0

func _ready():
	randomize()
	change_state(temperature_type)

func high():
	$Sprites.play("high")
	temperature_type = TEMPERATURES.HIGH
	temperature_power = 1

func normal():
	$Sprites.play("normal")
	temperature_type = TEMPERATURES.NORMAL
	temperature_power = 0

func low():
	$Sprites.play("low")
	temperature_type = TEMPERATURES.LOW
	temperature_power = -1

func change_state(type):
	match type:
		HIGH:
			high()
		LOW:
			low()
		NORMAL:
			normal()

func _on_HatchingTimer_timeout():
	for body in $HatchingArea.get_overlapping_bodies():
		if body.is_in_group("egg"):
			body.apply_temperature(temperature_power)

func _on_weather_changed(weather):
	var rand = rand_range(1, 101)
	match weather:
		"normal":
			if rand >= 60:
				normal()
		"hot":
			if rand >= 70:
				high()
		"cool":
			if rand >= 80:
				low()
			