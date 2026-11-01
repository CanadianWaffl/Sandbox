extends Node2D

@onready var base_col: Color
@onready var top_col: Color

func _ready() -> void:
	var points: int = randi_range(2, 8) * 2
	var step: float = TAU / points
	var scale: float = 8.0
	
	var arr: Array[Vector2] = []
	
	for p in range(points):
		arr.append(Vector2(cos(p * step) * scale, sin(p * step) * scale))
	
	$Top.polygon = PackedVector2Array(arr)
	
	$Base.color = base_col
	$Top.color = top_col
