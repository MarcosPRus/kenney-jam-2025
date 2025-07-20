extends Character

var target_position:Vector2


func left_click() -> void:
	if $AnimationPlayer.current_animation != "attack":
		$AnimationPlayer.play("attack")
		await $AnimationPlayer.animation_finished
			
		$AnimationPlayer.play("idle")


func right_click() -> void:
	pass
