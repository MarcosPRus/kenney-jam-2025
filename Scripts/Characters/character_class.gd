extends CharacterBody2D
class_name Character

@export var character_stats:CharacterStats
@export var is_human_player:bool = false

enum character_types {ARCHER, SOLDIER, LANCER}
var character_type: character_types


func _ready() -> void:
	if is_human_player:
		var player_input_component:PlayerInput = PlayerInput.new()
		var player_camera:PlayerCamera = PlayerCamera.new()
		add_child(player_input_component)
		add_child(player_camera)
	else:
		var ai_component:AI = AI.new()
		ai_component.name = "AI"
		add_child(ai_component)
	
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
	if is_human_player:
		get_tree().reload_current_scene()
	else:
		queue_free()
