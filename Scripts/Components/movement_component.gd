extends Node
class_name MovementComponent

@export var base_speed:float = 512.0
var speed:float
var speed_multiplier:float = 1.0

@export var dash_dist:float = 0.1
@export var dash_cooldown:float = 1.0
var can_dash:bool = true

@onready var dash_timer:Timer = Timer.new()
@onready var dash_cooldown_timer:Timer = Timer.new()


func set_base_speed(value:float) -> void:
	base_speed = value
	speed = base_speed

func set_dash_dist(value:float) -> void:
	dash_timer.wait_time = value

func set_dash_cooldown(value:float) -> void:
	dash_cooldown_timer.wait_time = value

func _ready() -> void:
	if not (get_parent() is CharacterBody2D):
		push_error("¡El padre de MovableComponent debe ser un CharacterBody2D!")
		queue_free()
	
	speed = base_speed
	
	# Configuración de los timers
	dash_timer.autostart = false
	dash_timer.one_shot = true
	dash_timer.wait_time = dash_dist
	dash_timer.timeout.connect(_on_dash_timer_timeout)
	add_child(dash_timer)
	dash_cooldown_timer.autostart = false
	dash_cooldown_timer.one_shot = true
	dash_cooldown_timer.wait_time = dash_cooldown
	dash_cooldown_timer.timeout.connect(_on_dash_cooldown_timer_timeout)
	add_child(dash_cooldown_timer)


func move(direction:Vector2) -> void:
	get_parent().velocity = direction.normalized() * speed * speed_multiplier
	get_parent().move_and_slide()


func dash() -> void:
	# Para dashear, multiplicamos la velocidad por 3 durante un corto periodo (La duración de dash_timer)
	if can_dash:
		dash_timer.start()
		dash_cooldown_timer.start()
		speed = base_speed * 3
		can_dash = false


func _on_dash_timer_timeout() -> void:
	speed = base_speed

func _on_dash_cooldown_timer_timeout() -> void:
	can_dash = true
