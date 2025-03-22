@tool

class_name DialogItem extends Node

func _ready() -> void:
	if Engine.is_editor_hint():
		return
