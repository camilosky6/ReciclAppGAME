extends RigidBody2D

export (int) var velocidad_min
export (int) var velocidad_max
var tipo_residuo = ["carton", "papel", "otro"]

func _ready():
	$AnimatedSprite.animation = tipo_residuo[randi() % tipo_residuo.size()]

func _on_Visibilidad_screen_exited():
	queue_free() #Elimina el Residuo cuando deja de ser visible
