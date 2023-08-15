extends Label

func _ready():
	text = String(Score.value)

func _on_Player_add_score(is_graze):
	if is_graze:
		text = "Grazing!"
		$ViewGrazingTimer.start()
	else:
		text = String(Score.value)

func _on_ViewGrazingTimer_timeout():
	text = String(Score.value)
