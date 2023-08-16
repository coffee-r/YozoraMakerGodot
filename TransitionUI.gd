extends CanvasLayer

func _ready():
	$ColorRect.anchor_left = 0
	$ColorRect.anchor_right = 0

func transition():
	$ColorRect.anchor_left = 0
	$ColorRect.anchor_right = 0
	
	# ペイントトランジション
	var tween = get_tree().create_tween()
	tween.tween_property($ColorRect, "anchor_right", 1, 0.4).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property($ColorRect, "anchor_left", 1, 0.4).set_trans(Tween.TRANS_CUBIC).set_delay(0.1)

