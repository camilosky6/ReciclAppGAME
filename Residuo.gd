extends RigidBody2D

export (int) var velocidad_min
export (int) var velocidad_max
var selected = false
var tipo_residuo = ["carton", "papel", "otro"]

func _ready():
	#$AnimatedSprite.animation = tipo_residuo[randi() % tipo_residuo.size()]
	set_process(true)

func _process(delta):
	if selected:
		seguirMouse()

func seguirMouse():
	self.position = get_global_mouse_position()

func _on_Visibilidad_screen_exited():
	queue_free() #Elimina el Residuo cuando deja de ser visible

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		selected = true
		print("se hizo cliccckkkk")
	if event.is_action_released("click"):
		print("se ha soltado")
		selected = false
