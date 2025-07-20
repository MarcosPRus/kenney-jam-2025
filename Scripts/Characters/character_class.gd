extends CharacterBody2D
class_name Character

@export var character_stats:CharacterStats

enum character_types {ARCHER, SOLDIER, LANCER}
var character_type: character_types
var is_human_player:bool = false

func _ready() -> void:
	$AnimationPlayer.animation_changed.connect(_on_animation_player_animation_changed)
	$HealthComponent.died.connect(die)
	$HealthComponent.set_max_health(character_stats.max_health)
	$MovementComponent.set_base_speed(character_stats.base_speed)
	$MovementComponent.set_dash_dist(character_stats.dash_dist)
	$MovementComponent.set_dash_cooldown(character_stats.dash_cooldown)

func _process(delta: float) -> void:
	if is_human_player:
		look_at(get_global_mouse_position())

func move(direction: Vector2) -> void:
	$MovementComponent.move(direction)

func dash() -> void:
	$MovementComponent.dash()

func die() -> void:
	queue_free()

func _on_animation_player_animation_changed(old:StringName, new:StringName) -> void:
	if new != "idle":
		$MovementComponent.speed_multiplier = 0.5
	else:
		$MovementComponent.speed_multiplier = 1.0
