extends Node

@onready var pause_panel: Panel = %PausePanel
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var esc_pressed = Input.is_action_just_pressed("pause")
	if (esc_pressed == true):
		get_tree().paused = true
		pause_panel.show()


func _on_continue_pressed():
		pause_panel.hide()
		get_tree().paused = false
		
