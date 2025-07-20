extends Sprite2D

var direction:Vector2
@export var arrow_speed:float = 1500.0


func _ready() -> void:
	$HitComponent.hit.connect(on_hit)


func _process(delta: float) -> void:
	position += direction * delta * arrow_speed


func on_hit() -> void:
	queue_free()


func _on_fall_timer_timeout() -> void:
	queue_free()
