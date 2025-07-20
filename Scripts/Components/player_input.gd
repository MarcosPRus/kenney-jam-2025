extends Node
class_name PlayerInput

var movement_dir:Vector2
@onready var parent:Character = get_parent()

func _ready() -> void:
	AiOverseer.player = parent
	AiOverseer.characters.append(parent)
	
	if not (parent is CharacterBody2D):
			push_error("¡El padre de MovableComponent debe ser un CharacterBody2D!")
			queue_free()


func _physics_process(delta: float) -> void:
	movement_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	parent.move(movement_dir)
	
	if Input.is_action_just_pressed("dash"):
		parent.dash()
	if Input.is_action_just_pressed("left_click"):
		parent.left_click()
	if Input.is_action_just_pressed("right_click"):
		parent.right_click()
