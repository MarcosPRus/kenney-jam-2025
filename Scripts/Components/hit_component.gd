extends Area2D

signal hit


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("HurtBox"):
		area.hurt(self, 1)
	hit.emit()


# For collisions against the environment tiles
func _on_body_entered(body: Node2D) -> void:
	hit.emit()
