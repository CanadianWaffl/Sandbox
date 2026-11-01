class_name State extends Node

@export var state_manager: StateManager
@export var state_name: String = "Default State"

var instanced_children: Array[Node] = []

func enter() -> void:
	pass

func exit() -> void:
	pass

func _cleanup() -> void:
	for child in instanced_children:
		child.queue_free()
	
	instanced_children = []

func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass
