extends CharacterBody2D

const MIN_WANDER: float = 80.0
const MAX_WANDER: float = 150.0

var target_pos := Vector2.INF

func _ready() -> void:
	modulate = Color(randi(), randi(), randi(), 1.0)


func _process(delta: float) -> void:
	
	if target_pos != Vector2.INF:
		position = lerp(position, target_pos, 0.03)
		if position.is_equal_approx(target_pos):
			target_pos = Vector2.INF


func _on_wander_timer_timeout() -> void:
	#Don't change targets if not finished
	if not target_pos == Vector2.INF:
		return
	
	var rand_angle = randf_range(0, TAU)
	var rand_dist = randf_range(MIN_WANDER, MAX_WANDER)
	
	target_pos = Vector2(position.x + cos(rand_angle)*rand_dist, position.y + sin(rand_angle)*rand_dist)
	
	#print("Attempting to wander to (%s, %s)" % [target_pos.x, target_pos.y])
