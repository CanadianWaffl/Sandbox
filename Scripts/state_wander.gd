extends State

const MIN_WANDER: float = 80.0
const MAX_WANDER: float = 150.0

var target_pos := Vector2.INF


func enter() -> void:
	owner.find_child("AnimationPlayer").play("wandering")
	var switch_timer: Timer = Timer.new()
	add_child(switch_timer)
	instanced_children.append(switch_timer)
	switch_timer.timeout.connect(timeout)
	switch_timer.start(2.0)


func exit() -> void:
	for child in instanced_children:
		child.queue_free()
	
	instanced_children = []


func physics_update(delta: float) -> void:
	if target_pos != Vector2.INF:
		owner.position = lerp(owner.position, target_pos, 0.03)
		if owner.position.is_equal_approx(target_pos):
			target_pos = Vector2.INF


func timeout():
	state_manager.transition_to($"../State-Idle")


func _on_wander_timer_timeout() -> void:
	#Don't change targets if not finished
	if not target_pos == Vector2.INF:
		return
	
	var rand_angle = randf_range(0, TAU)
	var rand_dist = randf_range(MIN_WANDER, MAX_WANDER)
	
	target_pos = Vector2(owner.position.x + cos(rand_angle)*rand_dist, owner.position.y + sin(rand_angle)*rand_dist)
	
	#print("Attempting to wander to (%s, %s)" % [target_pos.x, target_pos.y])
