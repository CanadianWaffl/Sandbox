extends State

const WANDER_RANGE: float = 200.0 #If it goes out of this radius it will attempt to return to its 'home position'

const MIN_WANDER: float = 80.0
const MAX_WANDER: float = 150.0

const MOVESPEED: float = 0.8

var target_pos := Vector2.INF
var target_dir := Vector2.INF


func enter() -> void:
	owner.find_child("AnimationPlayer").play("wandering")
	
	var rand_angle = randf_range(0, TAU)
	var rand_dist = randf_range(MIN_WANDER, MAX_WANDER)
	
	if owner.position.distance_to(owner.return_point) > WANDER_RANGE:
		print("Too far from " + str(owner.return_point))
		target_pos = Vector2(owner.return_point.x + cos(rand_angle)*rand_dist, owner.return_point.y + sin(rand_angle)*rand_dist)
	else:
		target_pos = Vector2(owner.position.x + cos(rand_angle)*rand_dist, owner.position.y + sin(rand_angle)*rand_dist)
	
	target_dir = target_pos - owner.position
	target_dir = target_dir.normalized()


func physics_update(delta: float) -> void:
	if target_pos != Vector2.INF:
		owner.position += target_dir * MOVESPEED
		if owner.position.distance_squared_to(target_pos) < 10: #arbitrary value but seems to work well
			owner.position == target_pos
			state_manager.transition_to("Idle")
