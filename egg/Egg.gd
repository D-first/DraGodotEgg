extends RigidBody2D

var is_placed
var is_hatching
var hatching_point = 0
var godot_chan
var type
var point = 0
var contents

signal hatching(egg)

func init(type, point, tex, contents):
	self.type = type
	self.point = point
	self.contents = contents
	$Sprites.frames = tex

func _ready():
	apply_impulse(Vector2(-50, 0), Vector2(-100, -10))

func pickup(godot_chan):
	is_placed = false
	self.godot_chan = godot_chan
	gravity_scale = 0.2
	apply_impulse(Vector2(), Vector2(0, -10))

func puton(direction):
	gravity_scale = 1
	apply_impulse(Vector2(), Vector2(godot_chan.velocity.x + (100 * direction), -50))
	is_placed = true
	godot_chan = null

func apply_temperature(power):
	if is_hatching:
		return
	
	if hatching_point + power < -5:
		return

	hatching_point = hatching_point + power
	$Sprites.modulate = $Sprites.modulate + Color(0, -0.2 * power, -0.2 * power, 0)
	if hatching_point == 5:
		$Se.play()
		is_hatching = true
		$Sprites.play("hatching")
		emit_signal("hatching", self)
		$Effector.fade_out(self)

func _integrate_forces(state):
	if godot_chan:
		var xform = state.get_transform()
		xform.origin = godot_chan.get_node("hold_pos").global_position
		state.set_transform(xform)

func _on_Effector_tween_completed(object, key):
	queue_free()
