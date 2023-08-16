extends Label

func _ready():
	# テキスト初期化
	text = '0'
	
	# 位置初期化
	rect_position = Vector2(0,-20)
	
	# 位置のアニメーション
	var tween = get_tree().create_tween()
	tween.tween_property(self, "rect_position", Vector2(0, 0), 0.2).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK).set_delay(1)

func _on_Player_add_score(is_graze):
	if is_graze:
		text = "Graze!"
		$ViewGrazingTimer.start()
	else:
		text = String(Score.value)

func _on_ViewGrazingTimer_timeout():
	text = String(Score.value)
