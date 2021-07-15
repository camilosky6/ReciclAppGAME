extends RigidBody2D

export (int) var velocidad_min
export (int) var velocidad_max
var selected = false

#Categorias Resiclaje
var tipo_residuo = ["obj","objCarton1","objPlastico1", "objAprov1"]
var obj = ["obj","objPlastico1"]

func _ready():
	$AnimatedSprite.animation = tipo_residuo[randi() % tipo_residuo.size()]
	crearObjeto($AnimatedSprite.animation)
	set_process(true)

func crearObjeto(sprite):
	match sprite:
		"obj": 
			ajustarScale(0.5,0.5)
		"objPlastico1":
			ajustarScale(0.2,0.2)
		"objAprov1":
			ajustarScale(0.4,0.32)

func ajustarScale(x,y):
	$CollisionShape2D.scale.x = x
	$CollisionShape2D.scale.y = y
	$Area2D/Collision_event.scale.x = x
	$Area2D/Collision_event.scale.y = y

func _process(delta):
	if selected:
		seguirMouse()

func seguirMouse():
	self.position = get_global_mouse_position()

func _on_Visibilidad_screen_exited():
	queue_free() #Elimina el Residuo cuando deja de ser visible

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		self.layers = 1
		selected = true
	if event.is_action_released("click"):
		self.linear_velocity = Vector2(0,0)
		self.layers = 2
		selected = false
