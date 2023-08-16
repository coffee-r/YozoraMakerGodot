extends Control

signal score_animated

func _ready():
	# ペイントアニメーションのアンカーの初期設定
	$BackColorRect.anchor_left = 0
	$BackColorRect.anchor_right = 0
	$FrontColorRect.anchor_left = 0
	$FrontColorRect.anchor_right = 0

func _on_HBoxStarContainer_result_star_animated():
	
	
	# ペイントアニメーション
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property($BackColorRect, "anchor_right", 1, 0.6).set_trans(Tween.TRANS_EXPO)
	tween.tween_property($FrontColorRect, "anchor_right", 1, 0.6).set_trans(Tween.TRANS_EXPO).set_delay(0.1)
	
	# 効果音
	$ResultSE.play()
	
	# スコア表示
	yield(get_tree().create_timer(0.4), "timeout")
	$ScoreLabel.show()
	$ScoreLabel.text = String(Score.value)
	
	# ペイントアニメーション
	tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property($FrontColorRect, "anchor_left", 1, 0.6).set_trans(Tween.TRANS_EXPO)
	tween.tween_property($BackColorRect, "anchor_left", 1, 0.6).set_trans(Tween.TRANS_EXPO).set_delay(0.1)
	
	yield(get_tree().create_timer(0.5), "timeout")
	
	# 位置アニメーション
	tween = get_tree().create_tween()
	tween.tween_property(self, "rect_position", Vector2(0, 50), 0.5).set_trans(Tween.TRANS_CUBIC)
	
	emit_signal('score_animated')

