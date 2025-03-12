extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name == "CharacterBody2D"):
		var y_delta = position.y - body.position.y
		var x_delta = body.position.x - position.x
		print(y_delta)
		if(y_delta > -370):
			print("jumppp")
			#queue_free()
			body.jump_bounce(-1450)
			
		$AnimatedSprite2D.play("bounce")
		
		await $AnimatedSprite2D.animation_finished
		$AnimatedSprite2D.play("default")
