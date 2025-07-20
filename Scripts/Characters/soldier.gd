extends Character

var attack_animation:int = 0
var target_position:Vector2

func left_click() -> void:
	if ($AnimationPlayer.current_animation != "attack1") and ($AnimationPlayer.current_animation != "attack2"):
		if attack_animation == 0:
			attack_animation = 1
			$AnimationPlayer.play("attack1")
			$MovementComponent.speed_multiplier = 0.0
			await $AnimationPlayer.animation_finished
			
			$AnimationPlayer.play("idle")
			$MovementComponent.speed_multiplier = 1.0
		else:
			attack_animation = 0
			$AnimationPlayer.play("attack2")
			$MovementComponent.speed_multiplier = 0.0
			await $AnimationPlayer.animation_finished
			
			$AnimationPlayer.play("idle")
			$MovementComponent.speed_multiplier = 1.0

func right_click() -> void:
	pass
