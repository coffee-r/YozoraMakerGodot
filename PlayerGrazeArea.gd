extends Area2D

# 掠り中の星の数
var grazing_count = 0

# 掠り判定に星が入った時
func _on_PlayerGrazeArea_body_entered(body):
	grazing_count += 1
	print('graze in ' + String(grazing_count))

func _on_PlayerGrazeArea_body_exited(body):
	grazing_count -= 1
	print('graze out ' + String(grazing_count))

func get_grazing_count():
	return grazing_count
