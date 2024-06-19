extends CanvasLayer

static var image = load("res://Space_Shooter_Showcase/PNG/UI/playerLife1_blue.png")
var time_elapsed := 0

func _set_health(amount):
	# Remove all children
	for child in $HealthContainer/HBoxContainer.get_children():
		child.queue_free()
	
	# Create new children amount is set by health
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		$HealthContainer/HBoxContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP


func _on_score_timer_timeout():
	time_elapsed += 1
	$TitleContainer/Title.text = str(time_elapsed)
	Global_Space_Shooter.score = time_elapsed
