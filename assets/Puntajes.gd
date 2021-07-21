extends Control

func _ready():
	ingresarTablas()

func ingresarTablas():
	$VBoxContainer/ListaPuntaje/VBC/Primero.text =  str(GLOBAL.puntos["primero"])
	$VBoxContainer/ListaPuntaje/VBC/Segundo.text =  str(GLOBAL.puntos["segundo"])
	$VBoxContainer/ListaPuntaje/VBC/Tercero.text =  str(GLOBAL.puntos["tercero"])
	
func _on_Button_pressed():
	get_tree().change_scene("res://assets/menu.tscn")

