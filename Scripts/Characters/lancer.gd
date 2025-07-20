extends Character

var target_position:Vector2


func left_click() -> void:
	if $AnimationPlayer.current_animation != "attack":
		$AnimationPlayer.play("attack")
		$MovementComponent.speed_multiplier = 0.7
		await $AnimationPlayer.animation_finished
			
		$AnimationPlayer.play("idle")
		$MovementComponent.speed_multiplier = 1.0


func right_click() -> void:
	pass
