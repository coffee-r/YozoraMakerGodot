extends KinematicBody2D

# スコア追加シグナル
signal add_score

# 移動速度
export var move_speed: float = 25.0

# 星
export var star_scene : PackedScene

# ヒットエフェクト
export var hit_scene : PackedScene

# 死亡フラグ
var is_dead: bool = false

# 移動ベクトル
var velocity: Vector2

# 移動方向
var move_direction: Vector2

# クールタイムが終了していて、マウスorタップ入力された時
func _input(event):
	if is_dead == false && $ShootCoolTimeTimer.is_stopped() &&  event is InputEventScreenTouch && event.is_pressed():
			# 各種タイマーを開始
			$ShootWaitTimer.start()
			$ShootCoolTimeTimer.start()
			
			# 回転方向オブジェクトを停止
			$ShootDirector.stop()

func _physics_process(delta):
	# 移動
	var collision: KinematicCollision2D
	if ($ShootWaitTimer.is_stopped()):
		collision = move_and_collide(velocity * delta)
	else:
		collision = move_and_collide(Vector2.ZERO)
	
	# 物体(壁)と当たったら反射
	if collision:
		velocity = velocity.bounce(collision.get_normal())
	
	# 死亡している場合はプレイヤーと星を動かさない
	if is_dead:
		velocity = Vector2.ZERO
		get_tree().call_group("stars", "stop")

func _on_ShootWaitTimer_timeout():
	# スコア追加通知
	emit_add_score()
	
	# 移動の向きを決定する
	move_direction = $ShootDirector.position.rotated(deg2rad(180)).normalized()
	
	# 移動速度を決定する
	velocity = move_direction * move_speed
	
	# 星を発射する
	var star = star_scene.instance()
	star.z_index = -1
	star.start($ShootDirector.global_position, $ShootDirector.position.normalized())
	get_parent().add_child(star)
	
	# 回転方向オブジェクトを動かす
	$ShootDirector.move()

func _on_PlayerLife_body_entered(body):
	# 死亡判定
	is_dead = true
	
	# 発射矢印隠す
	$ShootDirector.hide()
	
	# ヒットエフェクト再生
	var hit_effect = hit_scene.instance()
	hit_effect.z_index = -2
	hit_effect.position = body.position
	get_parent().add_child(hit_effect)

func emit_add_score():
	# 追加スコア定義
	var add_score = 1
	
	# グレイズフラグ
	var is_graze = false
	
	# グレイズスコアの計算
	if $PlayerGrazeArea.get_grazing_count() >= 1:
		# (星の数 + 1) * グレイズ数を加算
		var star_count = get_tree().get_nodes_in_group('stars').size() + 1
		add_score += star_count * $PlayerGrazeArea.get_grazing_count()
		
		# グレイズフラグを立てる
		is_graze = true
	
	# スコア追加
	Score.value += add_score
	
	# シグナル流す
	emit_signal("add_score", is_graze)



