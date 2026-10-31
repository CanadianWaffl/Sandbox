extends CharacterBody2D

@onready var state_man: StateManager = $StateManager

var return_point: Vector2

func _ready() -> void:
	modulate = Color(randf(), randf(), randf(), 1.0)
	return_point = position
	print("return point set at " + str(position))
