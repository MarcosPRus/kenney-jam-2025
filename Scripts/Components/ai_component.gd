extends Node2D
class_name AI

@onready var parent:Character = get_parent() as Character
@onready var nav_agent:NavigationAgent2D = NavigationAgent2D.new()

var target:Character

var movement_dir:Vector2 = Vector2.ZERO


func _ready() -> void:
	if not parent:
		push_error("¡El padre de AI debe ser un Character!")
		queue_free()
	
	if not (parent is Character):
		push_error("¡El padre de AI debe ser un Character!")
		queue_free()
	
	AiOverseer.characters.append(parent)
	
	tree_exiting.connect(_on_tree_exiting)
	
	setup_nav_agent()


func _physics_process(delta: float) -> void:
	if target:
		# Move the Character towards the target
		if parent.name == "Archer":
			var direction_from_target = target.global_position.direction_to(parent.global_position)
			var standoff_position = target.global_position + direction_from_target * 1024
			make_path(standoff_position)
		else:
			make_path(target.global_position)
		var next_path_pos = nav_agent.get_next_path_position()
		var direction = parent.global_position.direction_to(next_path_pos)
		nav_agent.velocity = direction
		
		# Always look at the target
		parent.look_at(target.global_position)
		
		# Soldier and lancer attack only when the enemy is in range, Archer always attacks
		if parent.name == "Soldier":
			if (target.global_position - parent.global_position).length() <= 180:
				parent.left_click()
		elif parent.name == "Lancer":
			if (target.global_position - parent.global_position).length() <= 256:
				parent.left_click()
		else:
			parent.left_click()
		
	else:
		target = AiOverseer.get_target(parent)


func setup_nav_agent() -> void:
	nav_agent.path_desired_distance = 10.0
	nav_agent.target_desired_distance = 10.0
	nav_agent.radius = 90.0
	nav_agent.debug_enabled = false
	nav_agent.avoidance_enabled = true
	nav_agent.velocity_computed.connect(_on_nav_agent_2d_velocity_computed)
	nav_agent.path_postprocessing = NavigationPathQueryParameters2D.PATH_POSTPROCESSING_EDGECENTERED
	nav_agent.set_navigation_map(get_world_2d().get_navigation_map())
	add_child(nav_agent)


func make_path(position:Vector2) -> void:
	nav_agent.target_position = position


func _on_nav_agent_2d_velocity_computed(safe_velocity) -> void:
	get_parent().move(safe_velocity)


func _on_tree_exiting() -> void:
	AiOverseer.characters.erase(parent)
