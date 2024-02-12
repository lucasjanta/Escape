extends CharacterBody2D

var normal_speed = 300
@export var speed = 300
@export var gravity = 50
@export var jump_force = 300
@export var dash_speed = 600
@export var dashlength = .2

@onready var dash = $Dash

@onready var ap = $AnimationPlayer
@onready var sprite = $Sprite2D


func _physics_process(delta):
	if Input.is_action_just_pressed("dash"):
		dash_action()
	var speed = dash_speed if dash.is_dashing() else normal_speed
	
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 1000:
			velocity.y = 1000
			
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
	
	
	
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	velocity.x = speed * horizontal_direction
	
	if horizontal_direction != 0:
		sprite.flip_h = (horizontal_direction == -1)
	
	
		#dash_action(horizontal_direction)
	move_and_slide()
	
	update_animations(horizontal_direction)

func update_animations(horizontal_direction):
	if is_on_floor():
		if horizontal_direction == 0:
			ap.play("idle")
		else:
			ap.play("run")
	else:
		if velocity.y != 0:
			ap.play("jump")
	
	if dash.is_dashing():
			ap.play("dash")
func dash_action():
	dash.start_dash(dashlength)
	#position.x = position.x + 100 * horizontal_direction
	
	print("oi")
	
