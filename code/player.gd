extends RigidBody2D

var wheels = []
var speed = 60000
var max_speed=50

func _ready() -> void:
	wheels = get_tree().get_nodes_in_group("wheel")
	print("Wheels found: ", wheels)  # Debugging


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_right"):  # Use is_action_pressed for continuous rotation
		for wheel in wheels:
			if wheel.angular_velocity < max_speed:
				wheel.apply_torque_impulse(speed * delta *60)
	if Input.is_action_pressed("ui_left"):  # Use is_action_pressed for continuous rotation
		for wheel in wheels:
			if wheel.angular_velocity > -max_speed:
				wheel.apply_torque_impulse(-speed * delta *60)
