extends Control


func _ready():
	GLOBAL.ajustarPuntaje()

func _on_Jugar_pressed():
	get_tree().change_scene("res://assets/Mundo.tscn")


func _on_puntuacion_pressed():
	get_tree().change_scene("res://assets/Puntajes.tscn")


func _on_Credito_pressed():
	$Creditos.visible = true


func _on_exit_pressed():
	$Creditos.visible = false


func _on_Help_pressed():
	$Help.visible = true


func _on_exit_help_pressed():
	$Help.visible = false


func _on_Home_pressed():
	print("home")
