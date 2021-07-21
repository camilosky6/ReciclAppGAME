extends CanvasLayer

signal game_over

func _ready():
	GLOBAL.score = 0

func game_over():
	emit_signal("game_over")
	$GameOverContainer/Label.text = "Game Over"
	$GameOverContainer.visible = true

func _physics_process(delta):
	$ScoreContainer/HBoxContainer/Time.text = str(GLOBAL.time)
	$ScoreContainer/HBoxContainer/score.text = str(GLOBAL.score)

func _on_Restart_pressed():
	get_tree().call_deferred("reload_current_scene")
	get_tree().paused = false


func _on_Menu_pressed():
	get_tree().call_deferred("change_scene","res://assets/menu.tscn")
	get_tree().paused = false


func _on_Reanudar_pressed():
	$GameOverContainer.visible = false
	$GameOverContainer/HBoxContainer/Reanudar.visible = false
	get_tree().paused = false

func _on_Pause_pressed():
	$GameOverContainer/Label.text = "Pausa"
	$GameOverContainer/HBoxContainer/Reanudar.visible = true
	$GameOverContainer.visible = true
	get_tree().paused = true
