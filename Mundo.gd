extends Node
export (PackedScene) var Residuo
var score

func _ready():
	randomize()

func nuevo_juego():
	score = 0
	$InicioTimer.start() 

func game_over():
	$ScoreTimer.stop()
	$ResiduoTimer.stop()

func _on_InicioTimer_timeout():
	$ResiduoTimer.start()
	$ScoreTimer.start()

func _on_ScoreTimer_timeout():
	#score += 1
	pass


func _on_ResiduoTimer_timeout():
	$Camino/ResiduoPosicion.set_offset(randi())
	var R = Residuo.instance()
	add_child(R)
	R.position = $Camino/ResiduoPosicion.position

	
