extends Character


const ARROW_SCENE = preload("res://Scenes/arrow.tscn")
var target_position:Vector2


func left_click() -> void:
	if is_human_player:
		target_position = get_global_mouse_position()
	else:
		if $AI.target:
			target_position = $AI.target.global_position
	
	if $AnimationPlayer.current_animation != "attack":
		$AnimationPlayer.play("attack")
		$MovementComponent.speed_multiplier = 0.5
		
		var arrow = ARROW_SCENE.instantiate()
		var arrow_direction = (target_position - self.global_position).normalized()
		arrow.direction = arrow_direction
		arrow.rotation = self.rotation + PI/2
		
		await $AnimationPlayer.animation_finished
	
		arrow.global_position = self.global_position + arrow_direction * 100
		add_sibling(arrow)
		
		$AnimationPlayer.play("idle")
		$MovementComponent.speed_multiplier = 1.0

func right_click() -> void:
	pass
