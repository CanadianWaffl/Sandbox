extends CharacterBody2D

@onready var state_man: StateManager = %StateManager
@onready var statue := "res://Scenes/statue.tscn"

@export var attributes: GuyAttributes = GuyAttributes.new()
@export var home: Node2D

const MOVESPEED: float = 0.8

var body_col: Color
var return_point: Vector2

var target_pos: Vector2 = Vector2.INF
var target_dir: Vector2 = Vector2.ZERO

signal move_finished

func _ready() -> void:
	body_col = Color(randf(), randf(), randf(), 1.0)
	modulate = body_col
	return_point = position
	set_attributes()


func _process(delta: float) -> void:
	if target_pos != Vector2.INF:
		position += target_dir * MOVESPEED
		if position.distance_squared_to(target_pos) < 10: #arbitrary value but seems to work well
			position == target_pos
			target_pos = Vector2.INF
			move_finished.emit()
	pass


func set_attributes() -> void:
	attributes.creativity = randf()
	attributes.creativity = randf()


func move_to(target: Vector2):
	target_pos = target
	target_dir = target_pos - position
	target_dir = target_dir.normalized()
