extends CharacterBody2D

@onready var state_man: StateManager = $StateManager
@onready var statue := "res://Scenes/statue.tscn"

@export var home: Node2D

var body_col: Color

var return_point: Vector2

func _ready() -> void:
	body_col = Color(randf(), randf(), randf(), 1.0)
	modulate = body_col
	return_point = position
	print("return point set at " + str(position))
