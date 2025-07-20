extends Area2D

# Señal que emitiremos cuando la vida llegue a 0
signal died

@export var max_health:int = 100
var current_health:int


func set_max_health(value:int) -> void:
	max_health = value
	current_health = max_health

# Función pública para que otros objetos puedan hacerle daño
func hurt(aggresor: Area2D, damage: int) -> void:
	current_health -= damage
	print(str(get_parent().get_instance_id()) + " ha recibido " + str(damage) + " de daño. Vida restante: " + str(current_health))
	
	if current_health <= 0:
		died.emit()
		# La lógica de que hacer cuando se muere se deja al nodo que reciba esta señal
