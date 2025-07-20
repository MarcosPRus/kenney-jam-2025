extends Character


const ARROW_SCENE = preload("res://Scenes/arrow.tscn")
var target_position:Vector2


func left_click() -> void:
	if $AnimationPlayer.current_animation != "attack":
		$AnimationPlayer.play("attack")
		await $AnimationPlayer.animation_finished
		
		var arrow = ARROW_SCENE.instantiate()
		var arrow_direction = (get_global_mouse_position() - self.global_position).normalized()
		arrow.direction = arrow_direction
		arrow.rotation = self.rotation + PI/2
		arrow.global_position = self.global_position + arrow_direction * 100
		add_sibling(arrow)
		
		$AnimationPlayer.play("idle")

func right_click() -> void:
	pass
