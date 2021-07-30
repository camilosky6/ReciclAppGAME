extends Node

onready var time : int
onready var score : int
enum {APROVECHABLE, NO_APROVECHABLE, ORGANICO}
onready var puntos

func ajustarPuntaje():
	puntos = PERSISTENCE.get_data()
	if(puntos.size() == 0):
		puntos["primero"] = 0
		puntos["segundo"] = 0
		puntos["tercero"] = 0
		PERSISTENCE.save_data()

func ajustarRanked(p):
	var aux = 0
	if( puntos["primero"] < p):
		aux = puntos["primero"]
		puntos["primero"] = p
		ajustarRanked(aux)
	elif( puntos["segundo"] < p):
		aux = puntos["segundo"]
		puntos["segundo"] = p
		ajustarRanked(aux)
	elif( puntos["tercero"] < p):
		puntos["tercero"] = p
