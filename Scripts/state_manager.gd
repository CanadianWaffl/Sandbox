class_name StateManager extends Node

@export var initial_state: State
var current_state: State

signal changing_state

var state_dict: Dictionary[String, State] = {}

func _ready() -> void:
	var initial: State
	
	for child in get_children():
		if child is State:
			if initial == null:
				initial = child
			child.state_manager = self
			state_dict[child.state_name] = child
	
	if initial_state:
		current_state = initial_state
	else:
		current_state = initial
	current_state.enter()


func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)


func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)


func transition_to(new_state: String) -> void:
	var ns: State
	
	if new_state in state_dict:
		ns = state_dict[new_state]
	
	#print("Transitioning states from %s to %s" % [current_state.state_name, new_state])
	
	current_state._cleanup()
	current_state.exit()
	current_state = ns
	current_state.enter()
