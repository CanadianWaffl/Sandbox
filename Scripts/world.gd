extends Node2D

@onready var camera: Camera2D = %Camera2D

var moving_camera: bool = false

func _ready() -> void:
	camera.position = get_viewport_rect().size / 2

func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_MIDDLE and event.pressed:
			moving_camera = true
		elif event.button_index == MOUSE_BUTTON_MIDDLE and not event.pressed:
			moving_camera = false
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			camera.zoom += Vector2(0.1, 0.1)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
			camera.zoom -= Vector2(0.1, 0.1)
	
	if event is InputEventMouseMotion and moving_camera:
		camera.position -= event.relative
