extends Node2D

@export var max_inhabitants: int = 3

const GUY = "res://Scenes/guy.tscn"

var inhabitants: int = 0

func _ready() -> void:
	modulate = Color(randf(), randf(), randf(), 1)
	populate()


func populate() -> void:
	var new_guy = preload(GUY).instantiate()
	new_guy.home = self
	new_guy.position = position + Vector2(0.0, 12.0)
	if get_parent() != get_tree().root:
		get_parent().get_parent().find_child("Entities").add_child(new_guy) #TODO: use signals or something less godawful for placing objects
	else:
		add_child(new_guy) #Failsafe to be able to run as its own scene
	
	inhabitants += 1


func _on_spawn_timer_timeout() -> void:
	if randf() < 0.985:
		return
	
	if inhabitants < max_inhabitants:
		populate()
	else:
		$SpawnTimer.stop()
