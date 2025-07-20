extends Node2D

var game_started:bool = false

@onready var main_screen:Control = $MainScreen
var spawn_points:Array[SpawnPoint] = []

var archer_scene:PackedScene = preload("res://Scenes/Characters/archer.tscn")
var soldier_scene:PackedScene = preload("res://Scenes/Characters/soldier.tscn")
var lancer_scene:PackedScene = preload("res://Scenes/Characters/lancer.tscn")

func _ready() -> void:	
	## Connect buttons signals
	var archer_button:Button = main_screen.get_node("ArcherButton")
	archer_button.pressed.connect(on_archer_button_pressed)
	
	var soldier_button:Button = main_screen.get_node("SoldierButton")
	soldier_button.pressed.connect(on_soldier_button_pressed)
	
	var lancer_button:Button = main_screen.get_node("LancerButton")
	lancer_button.pressed.connect(on_lancer_button_pressed)
	
	## Search for spawn points
	for child in get_children():
		if child is SpawnPoint:
			spawn_points.append(child)


func on_archer_button_pressed() -> void:
	instance_character(archer_scene, 1, 0)
	instance_character(soldier_scene, 0, 1)
	instance_character(lancer_scene, 0, 2)
	game_started = true

func on_soldier_button_pressed() -> void:
	instance_character(archer_scene, 0, 0)
	instance_character(soldier_scene, 1, 1)
	instance_character(lancer_scene, 0, 2)
	game_started = true

func on_lancer_button_pressed() -> void:
	instance_character(archer_scene, 0, 0)
	instance_character(soldier_scene, 0, 1)
	instance_character(lancer_scene, 1, 2)
	game_started = true
	


func instance_character(scene:PackedScene, is_player:bool, spawn_point_index:int) -> void:
	var instance = scene.instantiate()
	instance.is_human_player = is_player
	instance.global_position = spawn_points[spawn_point_index].global_position
	add_child(instance)
	main_screen.queue_free()

func _physics_process(delta: float) -> void:
	if game_started:
		var characters_count:int = 0
		for child in get_children():
			if child is Character:
				characters_count += 1
		
		if characters_count <= 1:
			get_tree().reload_current_scene()
