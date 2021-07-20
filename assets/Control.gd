extends Control


func _ready():
	pass # Replace with function body.


func _on_Jugar_pressed():
	get_tree().change_scene("res://assets/Mundo.tscn")


func _on_puntuacion_pressed():
	get_tree().change_scene("res://assets/Puntajes.tscn")


func _on_Credito_pressed():
	$Creditos.visible = true


func _on_exit_pressed():
	$Creditos.visible = false
