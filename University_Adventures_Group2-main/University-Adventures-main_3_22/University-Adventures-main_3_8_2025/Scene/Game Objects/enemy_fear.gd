extends RigidBody2D

@onready var game_manager = %GameManager


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body):
	if(body.name == "CharacterBody2D"):
		var y_delta = position.y - body.position.y
		var x_delta = body.position.x - position.x
		print(y_delta)
		if(y_delta > 450):
			print("Destroy Enemy")
			queue_free()
			body.jump_bounce(-500)
		else:
			print("Decrease health")
			game_manager.decrease_health()
			if(x_delta > 0):
				body.jump_side(500)
			else:
				body.jump_side(-500)
