extends Area2D

var speed: int
var rotation_speed: int
var direction_x: float

func _ready():
	var rng := RandomNumberGenerator.new()
	
	# Texture
	var path: String = "res://Space_Shooter_Showcase/PNG/Meteors/meteorBrown_big" + str(rng.randi_range(1,4)) + ".png"
	$MeteorImage.texture = load(path)
	
	# Start position
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150, -50)
	position = Vector2(random_x, random_y)
	
	# Speed / Rotation / Direction
	speed = rng.randi_range(200, 500)
	direction_x = rng.randf_range(-1, 1)
	rotation_speed = rng.randi_range(40, 100)

func _process(delta):
	position += Vector2(direction_x, 1.0) * speed * delta
	rotation_degrees += rotation_speed * delta

func _on_body_entered(_body):
	print("Body entered")
