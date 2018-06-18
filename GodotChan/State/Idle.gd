extends "res://GodotChan/State/OnGround.gd"

func enter(host):
	host.get_node("Sprites").play("idle")

func handle_input(host, event):
	
	return .handle_input(host, event)

func update(host, delta):
	if get_input_direction():
		emit_signal("finished", "walk")
	
	velocity.y += 500 * delta
	velocity = host.move_and_slide(velocity, Vector2(0, -1))