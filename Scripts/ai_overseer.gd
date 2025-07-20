extends Node

var player:Character
var characters:Array[Character] = []


func get_target(asking_character) -> Character:
	if characters.size() >= 2 and player:
		var aux_target:Character = characters.pick_random()
		while asking_character == aux_target:
			aux_target = characters.pick_random()
		return aux_target
	else:
		return player
