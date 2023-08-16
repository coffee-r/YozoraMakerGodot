extends AnimatedSprite

func _ready():
	# 初期位置に配置
	position = Vector2(-68, 120)

func _on_ScoreControl_score_animated():
	# 位置アニメーション
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", Vector2(68, 120), 1).set_trans(Tween.TRANS_CUBIC)


func _on_Result_result_screen_tap():
	# スプライトアニメーション変更
	animation = "Dash"
	
	# 位置アニメーション
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", Vector2(204, 120), 0.75).set_trans(Tween.TRANS_CUBIC)
