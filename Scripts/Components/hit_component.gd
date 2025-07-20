extends Area2D

signal hit
var damage:int

func _ready() -> void:
	var parent_name = get_parent().name
	
	if parent_name == "Sword":
		damage = 10
	elif parent_name == "Spear":
		damage = 7
	elif parent_name == "Arrow":
		damage = 5

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("HurtBox"):
		area.hurt(self, damage)
	hit.emit()


# For collisions against the environment tiles
func _on_body_entered(body: Node2D) -> void:
	hit.emit()
