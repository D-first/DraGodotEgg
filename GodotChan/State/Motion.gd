extends "./State.gd"

func _ready():
	pass

func get_input_direction():
	return Vector2(int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")), 0)