extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property($Sprite2DHolizon, "scale", Vector2(500, 0.0), 0.1).set_delay(1)
	tween.tween_property($Sprite2DVertical, "scale", Vector2(0.0, 500), 0.1).set_delay(1)

