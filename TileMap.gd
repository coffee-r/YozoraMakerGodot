extends TileMap

# 移動速度
const SPEED := 0.5

func _process(delta: float) -> void:
	
	# 移動量を求める
	var velocity = Vector2()
	velocity.x = -1

	# 移動する
	position += velocity * SPEED * delta	
