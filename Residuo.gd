extends RigidBody2D

export (int) var velocidad_min
export (int) var velocidad_max
var selected = false

#Categorias Resiclaje
var tipo_residuo = ["obj","objPlastico1"]
var obj = ["obj","objPlastico1"]

func _ready():
	$AnimatedSprite.animation = tipo_residuo[randi() % tipo_residuo.size()]
	crearObjeto($AnimatedSprite.animation)
	set_process(true)

func crearObjeto(sprite):
	match sprite:
		"obj": 
			$CollisionShape2D.scale.x = 0.5
			$CollisionShape2D.scale.y = 0.5
		"objPlastico1":
			$CollisionShape2D.scale.x = 1
			$CollisionShape2D.scale.y = 1

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
	if event.is_action_released("click"):
		self.linear_velocity = Vector2(0,0)
		selected = false
