extends Node

func _on_level_2_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Menu/character_select.tscn")
