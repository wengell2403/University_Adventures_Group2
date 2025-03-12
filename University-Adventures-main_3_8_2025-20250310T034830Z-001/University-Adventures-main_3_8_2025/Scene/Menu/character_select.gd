extends Node


func _on_level_1_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Levels/level1.tscn")
