extends RigidBody2D

var deltaX = 0
var deltaY = 0
var newDeltaX = 0
var newDeltaY = 0
var touchPos = Vector2()
var flag = false
var selected = false
var tipo = GLOBAL.APROVECHABLE
var tipo_residuo = ["objAprov1","objAprov2","objAprov3","objAprov4","objAprov5","objAprov6","objAprov7","objAprov8",
"objNoAprov1","objNoAprov2","objNoAprov3","objNoAprov4","objNoAprov5","objNoAprov6","objNoAprov7","objNoAprov8",
"objOrgan1","objOrgan2","objOrgan3","objOrgan4","objOrgan5","objOrgan6","objOrgan7","objOrgan8"]

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
			ajustarScale(0.26,0.43)
		"objAprov4":
			ajustarScale(0.3,0.62)
		"objAprov5":
			ajustarScale(0.42,0.38)
		"objAprov6":
			ajustarScale(0.26,0.6)
		"objAprov7":
			ajustarScale(0.42,0.39)
		"objAprov8":
			ajustarScale(0.42,0.38)
		"objNoAprov1":
			ajustarScale(0.42,0.45)
			tipo = GLOBAL.NO_APROVECHABLE
		"objNoAprov2":
			ajustarScale(0.37,0.42)
			tipo =  GLOBAL.NO_APROVECHABLE
		"objNoAprov3":
			ajustarScale(0.32,0.45)
			tipo =  GLOBAL.NO_APROVECHABLE
		"objNoAprov4":
			ajustarScale(0.26,0.3)
			tipo =  GLOBAL.NO_APROVECHABLE
		"objNoAprov5":
			ajustarScale(0.29,0.42)
			tipo =  GLOBAL.NO_APROVECHABLE
		"objNoAprov6":
			ajustarScale(0.43,0.28)
			tipo =  GLOBAL.NO_APROVECHABLE
		"objNoAprov7":
			ajustarScale(0.4,0.25)
			tipo =  GLOBAL.NO_APROVECHABLE
		"objNoAprov8":
			ajustarScale(0.4,0.25)
			tipo =  GLOBAL.NO_APROVECHABLE
		"objOrgan1":
			ajustarScale(0.28,0.38)
			tipo =  GLOBAL.ORGANICO
		"objOrgan2":
			ajustarScale(0.2,0.44)
			tipo =  GLOBAL.ORGANICO
		"objOrgan3":
			ajustarScale(0.23,0.54)
			tipo =  GLOBAL.ORGANICO
		"objOrgan4":
			ajustarScale(0.38,0.48)
			tipo =  GLOBAL.ORGANICO
		"objOrgan5":
			ajustarScale(0.24,0.49)
			tipo =  GLOBAL.ORGANICO
		"objOrgan6":
			ajustarScale(0.47,0.2)
			tipo =  GLOBAL.ORGANICO
		"objOrgan7":
			ajustarScale(0.44,0.25)
			tipo =  GLOBAL.ORGANICO
		"objOrgan8":
			ajustarScale(0.6,0.16)
			tipo =  GLOBAL.ORGANICO
			

func ajustarScale(x,y):
	$CollisionShape2D.scale.x = x
	$CollisionShape2D.scale.y = y
	$Area2D/Collision_event.scale.x = x
	$Area2D/Collision_event.scale.y = y

func _on_Visibilidad_screen_exited():
	queue_free() #Elimina el Residuo cuando deja de ser visible

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and event.is_pressed():
		ajustar_mascara(true)
		selected = true
		touchPos = event.position
		deltaX = touchPos.x - position.x
		deltaY = touchPos.y - position.y
		$Area2D/Collision_event.scale.x = scale.x*1.2
		$Area2D/Collision_event.scale.y = scale.y*1.2
	elif event is InputEventScreenDrag:
		touchPos = event.get_position()
		newDeltaX = touchPos.x - deltaX
		newDeltaY = touchPos.y - deltaY
		if selected:
			set_position(Vector2(newDeltaX, newDeltaY))
	elif selected:
		if event is InputEventScreenTouch and !event.is_pressed():
			crearObjeto($AnimatedSprite.animation)
			ajustar_mascara(false)
			selected = false


func ajustar_mascara(touch):
	if touch:
		self.layers = 1
		self.linear_velocity = Vector2(0,0)
		self.gravity_scale = 0
		$Area2D.collision_layer = 1
		flag = false
	else:
		self.gravity_scale = 1
		self.linear_velocity = Vector2(0,1)
		self.layers = 2
		$Area2D.collision_layer = 2

func _on_Area2D_body_entered(body):
	if(!flag):
		if(body != self):
			if("Tablero" in body.name):
				flag = true
			if("Residuo" in body.name):
				if(body.flag):
					self.linear_velocity = Vector2(0,0)
					flag = true

