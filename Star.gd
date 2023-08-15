extends KinematicBody2D

# 移動の速さ
export var move_speed = 25.0

# 移動ベクトル
var velocity: Vector2

# 移動方向
var move_direction: Vector2

func _physics_process(delta):
	# 衝突判定
	var collision = move_and_collide(velocity * delta)
	
	# 物体と当たったら反射
	if collision:
		velocity = velocity.bounce(collision.get_normal())
	
	# 移動
	position += velocity * delta

func start(start_position: Vector2, start_move_direction: Vector2):
	position = start_position
	velocity = start_move_direction.normalized() * move_speed

func stop():
	velocity = Vector2.ZERO
