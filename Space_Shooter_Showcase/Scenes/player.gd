extends CharacterBody2D

# @export allows variables to be changed outside of code
@export var speed: int = 500
var can_shoot: bool = true

signal laser(pos)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	velocity = direction * speed
	move_and_slide()
	
	# Shoot laser
	if Input.is_action_just_pressed("shoot") and can_shoot:
		laser.emit($LaserStartPos.global_position)
		can_shoot = false
		$LaserTimer.start()


func _on_laser_timer_timeout():
	can_shoot = true
