extends State

func enter() -> void:
	owner.find_child("AnimationPlayer").play("idle")
	
	var switch_timer := Timer.new()
	add_child(switch_timer)
	instanced_children.append(switch_timer)
	switch_timer.timeout.connect(timeout)
	switch_timer.start(2.0)


func exit() -> void:
	for child in instanced_children:
		child.queue_free()
	
	instanced_children = []


func timeout():
	state_manager.transition_to($"../State-Wander")
