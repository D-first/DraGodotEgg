extends "res://GodotChan/State/OnGround.gd"


func enter(host):
	speed = 300
	velocity = Vector2()
	host.get_node("Sprites").play("walk")

func handle_input(host, event):
	return .handle_input(host, event)

func update(host, delta):
	var input_direction = get_input_direction()
	if not input_direction:
		emit_signal("finished", "idle")

	velocity.x = input_direction.x * speed
	velocity.y += 500 * delta
	velocity = host.move_and_slide(velocity, Vector2(0, -1))