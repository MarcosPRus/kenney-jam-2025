extends Node2D

@onready var main_screen:Control = $MainScreen

var archer_scene = preload("res://Scenes/Characters/archer.tscn")
var soldier_scene = preload("res://Scenes/Characters/soldier.tscn")
var lancer_scene = preload("res://Scenes/Characters/lancer.tscn")

func _ready() -> void:	
	var archer_button:Button = main_screen.get_node("ArcherButton")
	archer_button.pressed.connect(on_archer_button_pressed)
	
	var soldier_button:Button = main_screen.get_node("SoldierButton")
	soldier_button.pressed.connect(on_soldier_button_pressed)
	
	var lancer_button:Button = main_screen.get_node("LancerButton")
	lancer_button.pressed.connect(on_lancer_button_pressed)


func on_archer_button_pressed() -> void:
	var archer_instance = archer_scene.instantiate()
	archer_instance.is_human_player = true
	add_child(archer_instance)
	main_screen.queue_free()

func on_soldier_button_pressed() -> void:
	var soldier_instance = soldier_scene.instantiate()
	soldier_instance.is_human_player = true
	add_child(soldier_instance)
	main_screen.queue_free()

func on_lancer_button_pressed() -> void:
	var lancer_instance = lancer_scene.instantiate()
	lancer_instance.is_human_player = true
	add_child(lancer_instance)
	main_screen.queue_free()
