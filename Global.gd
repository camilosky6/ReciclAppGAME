extends Node

onready var time : int
onready var score : int
onready var rng : RandomNumberGenerator = RandomNumberGenerator.new()
enum {APROVECHABLE, NO_APROVECHABLE, ORGANICO}

func random(min_number, max_number):
	rng.randomize()
	var random = rng.randf_range(min_number, max_number)
	return random
