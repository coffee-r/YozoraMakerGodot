extends Camera2D

# 揺れ時間
var time = 0

func _ready():
	# カメラを画面の中心に移動 (解像度を 1024 x 600とした場合)
	position.x = 136 / 2
	position.y = 240 / 2

func _process(delta):
	if time > 0:
		# 揺れ時間が残っていれば揺らす
		time = max(0, time - delta)
		offset.x = 2 * rand_range(-2, 2) * time
		offset.y = 2 * rand_range(-2, 2) * time

func _on_Player_player_death():
	time = 0.3
