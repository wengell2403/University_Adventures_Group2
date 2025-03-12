@tool

class_name DialogInteraction extends Area2D

signal player_interacted
signal finished

var dialog_items : Array[ DialogItem ]

@onready var sprite_2d: AnimatedSprite2D = %Sprite2D


func _ready() -> void:
	if Engine.is_editor_hint():
		return

	area_entered.connect ( _on_area_enter )
	area_exited.connect ( _on_area_exit )
	 
	for c in get_children():
		if c is DialogItem:
			dialog_items.append ( c )
	pass
	
func _on_area_enter ( _a : Area2D ) -> void:
	pass

func _on_area_exit ( _a : Area2D ) -> void:
	pass

func _get_configuration_warnings() -> PackedStringArray:
	if _check_for_dialog_items() == false:
		return ["Requires at least one DialogItem Node"]
	else:
		return []
	pass

func _check_for_dialog_items() -> bool:
	for c in get_children():
		if c is DialogItem:
			return true
	return false


func _on_area_entered(area: Area2D) -> void:
	pass # Replace with function body.


func _on_area_exited(area: Area2D) -> void:
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	player_interacted.emit()
	await get_tree().process_frame
	await get_tree().process_frame
	DialogSystem.show_dialog( dialog_items )
	
	pass # Replace with function body.
