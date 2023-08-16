extends Node2D

signal title_screen_tap
signal game_start

var already_taped = false

# 画面タップ
func _input(event):
	if event is InputEventScreenTouch && event.is_pressed() && already_taped == false:
			# 連打対策
			already_taped = true
			
			# シグナル
			emit_signal('title_screen_tap')
			
			# ゲーム開始のタイマー起動
			$GameStartTimer.start()
			
			# SE再生
			$StartSE.play()

func _on_GameStartTimer_timeout():
	emit_signal('game_start')
