extends State

const WANDER_RANGE: float = 200.0 #If it goes out of this radius it will attempt to return to its 'home position'

const MIN_WANDER: float = 80.0
const MAX_WANDER: float = 150.0

func _ready() -> void:
	owner.move_finished.connect(move_finished)

func enter() -> void:
	owner.find_child("AnimationPlayer").play("wandering")
	
	if owner.position.distance_to(owner.return_point) > WANDER_RANGE:
		#print("Too far from " + str(owner.return_point))
		choose_destination(owner.return_point, 0, WANDER_RANGE)
	else:
		choose_destination(owner.position, MIN_WANDER, MAX_WANDER)


func choose_destination(center: Vector2, min_dist: float, max_dist: float, min_angle := 0.0, max_angle := TAU):
	var target_pos := Vector2.ZERO
	
	var rand_angle = randf_range(min_angle, max_angle)
	var rand_dist = randf_range(min_dist, max_dist)
	
	target_pos = Vector2(center.x + cos(rand_angle)*rand_dist, center.y + sin(rand_angle)*rand_dist)
	
	owner.move_to(target_pos)
	


func move_finished() -> void:
	if randf() < 0.05:
		state_manager.transition_to("Build")
	else:
		state_manager.transition_to("Idle")
