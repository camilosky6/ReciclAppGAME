extends Node2D

var tipo = GLOBAL.APROVECHABLE

func _ready():
	pass

func _on_Area2D_body_entered(body):
	if(body.tipo == tipo):
		GLOBAL.score += 5
		body.queue_free()
	else:
		GLOBAL.score -= 10
		body.queue_free()
	

func inicio(type,pos):
	#show()
	tipo = type
	ajustarCaneca()
	position = pos

func ajustarCaneca():
	match tipo:
		GLOBAL.APROVECHABLE:
			$AnimatedSprite.animation = "CanecaAprovechable"
		GLOBAL.NO_APROVECHABLE:
			$AnimatedSprite.animation = "CanecaNoAprovechable"
		GLOBAL.ORGANICO:
			$AnimatedSprite.animation = "CanecaOrganica"
