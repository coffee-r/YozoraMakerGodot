extends Sprite

# 回転速度
export var speed = 4.2

# プレイヤーとの距離
export var distance_to_player = 17.0

# 経過した時間のカウント
var delta_count = 0

# 回転させるかどうかのフラグ
var is_moving = true

func _process(delta):
	# 回転させるフラグが立っている時はカウントする
	if is_moving:
		delta_count += delta
	
	# 回転・位置を決定する
	rotation = speed * delta_count
	position = Vector2(1,0).rotated(rotation) * distance_to_player

# 回転させる
func move():
	is_moving = true

# 回転を止める
func stop():
	is_moving = false
