extends Resource
class_name CharacterStats

enum character_types {ARCHER, SOLDIER, LANCER}
@export var character_type:character_types

@export var max_health:int = 100
@export var base_speed:float = 512.0
@export var dash_dist:float = 0.1
@export var dash_cooldown:float = 1.0
