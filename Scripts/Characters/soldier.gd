extends Character

var attack_animation:int = 0
var target_position:Vector2

func left_click() -> void:
	if ($AnimationPlayer.current_animation != "attack1") and ($AnimationPlayer.current_animation != "attack2"):
		if attack_animation == 0:
			attack_animation = 1
			$AnimationPlayer.play("attack1")
			await $AnimationPlayer.animation_finished
			
			$AnimationPlayer.play("idle")
		else:
			attack_animation = 0
			$AnimationPlayer.play("attack2")
			await $AnimationPlayer.animation_finished
			
			$AnimationPlayer.play("idle")

func right_click() -> void:
	pass
