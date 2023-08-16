extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	rect_position = Vector2(0, 410)

func _on_ScoreControl_score_animated():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "rect_position", Vector2(0,180), 1.0).set_trans(Tween.TRANS_SINE).set_delay(0.4)
	
	# 点滅
	tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(1,1,1,1), 1).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "modulate", Color(1,1,1,0), 1).set_trans(Tween.TRANS_CUBIC)
	tween.set_loops()
