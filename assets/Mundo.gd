extends Node
export (PackedScene) var Residuo
export (PackedScene) var Caneca
var score = 0
var time = 0
var puntos = 0

func _ready():
	randomize()

func nuevo_juego():
	score = 0
	time = 0
	$InicioTimer.start() 
	#crearCaneca()

func crearCaneca(tipo, pos):
	var C = Caneca.instance()
	add_child(C)
	C.inicio(tipo, pos)

func game_over():
	$ScoreTimer.stop()
	$ResiduoTimer.stop()
	get_tree().paused = true

func _on_InicioTimer_timeout():
	$ResiduoTimer.start()
	$ScoreTimer.start()
	crearCaneca(GLOBAL.APROVECHABLE, $PositionCanecaAprovechable.position)
	crearCaneca(GLOBAL.NO_APROVECHABLE, $PositionCanecaNoAprovechable.position)
	crearCaneca(GLOBAL.ORGANICO, $PositionCanecaOrganica.position)

func _on_ScoreTimer_timeout():
	time += 1
	GLOBAL.time =  time
	if($ResiduoTimer.wait_time > 0.5):
		if($ResiduoTimer.wait_time < 1):
			$ResiduoTimer.wait_time -= (time*0.00001)
		else:
			$ResiduoTimer.wait_time -= (time*0.0001)

func _on_ResiduoTimer_timeout():
	$Camino/ResiduoPosicion.set_offset(randi())
	var R = Residuo.instance()
	add_child(R)
	R.position = $Camino/ResiduoPosicion.position


func _on_Top_body_entered(body):
	if("Residuo" in body.name):
		if(body.flag):
			$HUD.game_over()

func _on_Botton_body_entered(body):
	GLOBAL.score -= 10
	body.queue_free()

func _on_HUD_game_over():
	GLOBAL.ajustarRanked(GLOBAL.score)
	PERSISTENCE.save_data()
	game_over()

