extends Area2D

@onready var game_manager = %GameManager
@onready var animated_sprite = $AnimatedSprite2D 

func _on_body_entered(body):
	if (body.name == "CharacterBody2D"):
		animated_sprite.play("collected")
		
		await animated_sprite.animation_finished
		queue_free()
		game_manager.add_point()
		
		
		
