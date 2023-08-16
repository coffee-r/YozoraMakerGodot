extends Node2D

signal game_end

func _ready():
	# スコアの初期化
	Score.value = 0

func _on_Player_player_death():
	$GameEndTimer.start()

func _on_GameEndTimer_timeout():

	emit_signal('game_end')
