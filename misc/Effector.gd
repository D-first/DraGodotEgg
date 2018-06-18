extends Tween

var effect_name

func _ready():
	pass

func fade_out(target, sec=1.0):
	effect_name = "fade_out"
	interpolate_property(target, "modulate", Color(1,1,1,1), Color(1,1,1,0), sec, TRANS_LINEAR, EASE_IN)
	set_repeat(false)
	start()

func blink(target, sec=3.0):
	effect_name = "blink"
	interpolate_property(target, "modulate", Color(1,1,1,1), Color(1,1,1,0), 0.5, TRANS_LINEAR, EASE_IN)
	interpolate_property(target, "modulate", Color(1,1,1,0), Color(1,1,1,1), 0.5, TRANS_LINEAR, EASE_IN, 0.5)
	interpolate_property(target, "modulate", Color(1,1,1,1), Color(1,1,1,0), 0.5, TRANS_LINEAR, EASE_IN, 1.0)
	interpolate_property(target, "modulate", Color(1,1,1,0), Color(1,1,1,1), 0.5, TRANS_LINEAR, EASE_IN, 1.5)
	interpolate_property(target, "modulate", Color(1,1,1,1), Color(1,1,1,0), 0.5, TRANS_LINEAR, EASE_IN, 2.0)
	interpolate_property(target, "modulate", Color(1,1,1,0), Color(1,1,1,1), 0.5, TRANS_LINEAR, EASE_IN, 2.5)
	interpolate_property(target, "modulate", Color(1,1,1,1), Color(1,1,1,0), 0.5, TRANS_LINEAR, EASE_IN, 3.0)
	interpolate_property(target, "modulate", Color(1,1,1,0), Color(1,1,1,1), 0.5, TRANS_LINEAR, EASE_IN, 3.5)
	start()