extends Node2D

var all_animated_end = false

signal result_screen_tap
signal game_retry

var already_taped = false

# 画面タップ
func _input(event):
	if all_animated_end && event is InputEventScreenTouch && event.is_pressed() && already_taped == false:
			# 連打対策
			already_taped = true
			
			# シグナル
			emit_signal('result_screen_tap')
			
			# ゲーム開始のタイマー起動
			$GameRetryTimer.start()
			
			# 効果音
			$StartSE.play()

func _on_ScoreControl_score_animated():
	all_animated_end = true

func _on_GameRetryTimer_timeout():
	emit_signal('game_retry')
