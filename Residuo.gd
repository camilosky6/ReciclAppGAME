extends RigidBody2D

export (int) var velocidad_min
export (int) var velocidad_max
var selected = false

#Categorias Resiclaje
var tipo_residuo = ["objAprov1","objAprov2","objAprov3","objAprov4","objAprov5","objAprov6","objAprov7","objAprov8",
"objNoAprov1","objNoAprov2","objNoAprov3","objNoAprov4","objNoAprov5","objNoAprov6","objNoAprov7","objNoAprov8",
"objOrgan1","objOrgan2","objOrgan3","objOrgan4","objOrgan5","objOrgan6","objOrgan7","objOrgan8"]
var obj = ["obj","objPlastico1"]

func _ready():
	$AnimatedSprite.animation = tipo_residuo[randi() % tipo_residuo.size()]
	crearObjeto($AnimatedSprite.animation)
	set_process(true)

func crearObjeto(sprite):
	match sprite:
		"objAprov1":
			ajustarScale(0.4,0.32)
		"objAprov2":
			ajustarScale(0.3,0.52)
		"objAprov3":
			ajustarScale(0.43,0.3)
		"objAprov4":
			ajustarScale(0.3,0.62)
		"objAprov5":
			ajustarScale(0.34,0.28)
		"objAprov6":
			ajustarScale(0.25,0.32)
		"objAprov7":
			ajustarScale(0.52,0.3)
		"objAprov8":
			ajustarScale(0.42,0.38)
		"objNoAprov1":
			ajustarScale(0.42,0.45)
		"objNoAprov2":
			ajustarScale(0.37,0.42)
		"objNoAprov3":
			ajustarScale(0.32,0.45)
		"objNoAprov4":
			ajustarScale(0.26,0.3)
		"objNoAprov5":
			ajustarScale(0.29,0.42)
		"objNoAprov6":
			ajustarScale(0.43,0.28)
		"objNoAprov7":
			ajustarScale(0.4,0.25)
		"objNoAprov8":
			ajustarScale(0.4,0.25)
		"objOrgan1":
			ajustarScale(0.28,0.38)
		"objOrgan2":
			ajustarScale(0.2,0.44)
		"objOrgan3":
			ajustarScale(0.23,0.54)
		"objOrgan4":
			ajustarScale(0.38,0.48)
		"objOrgan5":
			ajustarScale(0.24,0.49)
		"objOrgan6":
			ajustarScale(0.47,0.2)
		"objOrgan7":
			ajustarScale(0.44,0.25)
		"objOrgan8":
			ajustarScale(0.6,0.16)
			

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
