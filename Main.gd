extends Node2D

export var game_scene: PackedScene
export var result_scene: PackedScene

func _on_Title_game_start():
	$TransitionUI.transition()
	
	yield(get_tree().create_timer(0.4), "timeout")
	
	# タイトルシーンを削除
	$Title.queue_free()
	
	# ゲームシーンをインスタンス
	var game = game_scene.instance()
	add_child(game)
	
	game.connect('game_end', self, '_on_game_end')
	
func _on_game_end():
	$TransitionUI.transition()
	
	yield(get_tree().create_timer(0.4), "timeout")
	
	# ゲームシーンを削除
	$Game.queue_free()
	
	# リザルトシーンをインスタンス
	var result = result_scene.instance()
	add_child(result)
	
	result.connect('game_retry', self, '_on_game_retry')

func _on_game_retry():
	$TransitionUI.transition()
	
	yield(get_tree().create_timer(0.4), "timeout")
	
	# リザルトシーンを削除
	$Result.queue_free()
	
	# ゲームシーンをインスタンス
	var game = game_scene.instance()
	add_child(game)
	
	game.connect('game_end', self, '_on_game_end')
	
