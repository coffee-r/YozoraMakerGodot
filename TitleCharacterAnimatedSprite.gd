extends AnimatedSprite

func _ready():
	# 初期位置に配置
	position = Vector2(-68, 120)
	
	# 位置アニメーション
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", Vector2(68, 120), 1).set_delay(1).set_trans(Tween.TRANS_CUBIC)
	

func _on_Title_title_screen_tap():
	# スプライトアニメーション変更
	animation = "Dash"
	
	# 位置アニメーション
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", Vector2(32, 120), 0.5).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "position", Vector2(204, 120), 0.75).set_trans(Tween.TRANS_CUBIC)
