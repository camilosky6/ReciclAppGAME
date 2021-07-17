extends Node2D

var tipo = GLOBAL.APROVECHABLE

func _ready():
	pass

func _on_Area2D_body_entered(body):
	if(body.tipo == tipo):
		print("material detectado")
	

func inicio(type,pos):
	#show()
	tipo = type
	position = pos
	
