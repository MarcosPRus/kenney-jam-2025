extends Camera2D
class_name PlayerCamera


func _ready() -> void:
	position_smoothing_enabled = true
	zoom = Vector2(0.3, 0.3)
