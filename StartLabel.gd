extends Label

func _ready():
	# 点滅
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(1,1,1,0), 1).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "modulate", Color(1,1,1,1), 1).set_trans(Tween.TRANS_CUBIC)
	tween.set_loops()

func _on_Title_title_screen_tap():
	# 速い点滅
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(1,1,1,0), 0.2).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "modulate", Color(1,1,1,1), 0.2).set_trans(Tween.TRANS_CUBIC)
	tween.set_loops()
