extends Node


func _on_level_1_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Levels/level1.tscn")


func _on_level_1_bshm_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Levels/level1_bshm.tscn")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
