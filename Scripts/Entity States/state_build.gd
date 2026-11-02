extends State

var build_locations: Array[Vector2i]

func enter() -> void:
	owner.find_child("AnimationPlayer").play("building")
	
	var switch_timer := Timer.new()
	make_child(switch_timer)
	switch_timer.timeout.connect(timeout)
	switch_timer.start(2.0)


func timeout():
	var statue = load(owner.statue).instantiate()
	statue.base_col = owner.body_col
	statue.top_col = Color(randf(), randf(), randf(), randf_range(0.5, 1.0))
	statue.position = owner.position + Vector2(0, 4)
	build_locations.append(statue.position)
	
	var target_parent = owner.get_parent().find_child("Buildings")
	
	if target_parent != null:
		owner.get_parent().find_child("Buildings").add_child(statue)
	else:
		get_parent().add_child(statue)
	
	state_manager.transition_to("Wander")
