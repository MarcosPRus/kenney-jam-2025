extends CharacterBody2D
class_name Character

@export var character_stats:CharacterStats

enum character_types {ARCHER, SOLDIER, LANCER}
var character_type: character_types
var is_human_player:bool = false

func _ready() -> void:
	$HealthComponent.died.connect(die)
	set_max_health(character_stats.max_health)

func _process(delta: float) -> void:
	if is_human_player:
		look_at(get_global_mouse_position())

func move(direction: Vector2) -> void:
	$MovementComponent.move(direction)

func dash() -> void:
	$MovementComponent.dash()

func die() -> void:
	queue_free()

func set_max_health(value:int) -> void:
	$HealthComponent.set_max_health(value)
