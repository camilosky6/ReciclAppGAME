extends CanvasLayer

signal game_over

func _ready():
	GLOBAL.score = 0

func game_over():
	emit_signal("game_over")
	$GameOverContainer.visible = true

func _physics_process(delta):
	$ScoreContainer/HBoxContainer/score.text = str(GLOBAL.score)

func _on_Restart_pressed():
	get_tree().call_deferred("reload_current_scene")


func _on_Menu_pressed():
	get_tree().call_deferred("change_scene","res://assets/menu.tscn")
