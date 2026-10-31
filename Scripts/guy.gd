extends CharacterBody2D

@onready var state_man: StateManager = $StateManager

func _ready() -> void:
	modulate = Color(randf(), randf(), randf(), 1.0)


func _process(delta: float) -> void:
	
	pass
