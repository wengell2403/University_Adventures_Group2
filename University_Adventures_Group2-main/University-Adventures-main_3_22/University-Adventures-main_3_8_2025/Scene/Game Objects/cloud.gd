extends TextureRect 

@export var speed: float = 50  # Use @export in Godot 4

func _process(delta: float) -> void:
	position.x += speed * delta  # Use `position` instead of `rect_position`
	
	if position.x > 1920:
		position.x = -texture.get_width()  # Use `size.x` in Godot 4
