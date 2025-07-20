extends Node

var player:CharacterBody2D
var ai_nodes:Array[AI] = []


func _process(delta: float) -> void:
	for ai in ai_nodes:
		# Para cada nodo, le calculamos lo que le haga falta y se lo mandamos:
		# Enemigo más cercano
		for ai_aux in ai_nodes:
			if ai != ai_aux:
				pass
				#var distance = (ai_aux.cody_position - ai.body_position).size


func get_target(node) -> CharacterBody2D:
	var aux_target:AI = ai_nodes.pick_random()
	while node == aux_target:
		aux_target = ai_nodes.pick_random()
	return aux_target.get_parent()
