extends CharacterBody2D
class_name Player

var normal_speed = 300
var flipped : bool
@export var speed = 300
@export var gravity = 50
@export var jump_force = 300
@export var dash_speed = 900
@export var dashlength = .2

@onready var dash = $Dash
@onready var ap = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var collision = $CollisionShape2D
@onready var fire_sword = $fireSword
@onready var sm = $"State Machine"

func _physics_process(delta):
	if Input.is_action_just_pressed("dash"):
		dash_action()
	speed = dash_speed if dash.is_dashing() else normal_speed
	
	if dash.is_dashing():
		set_collision_layer_value(1, false)
		set_collision_mask_value(1, false)
	else:
		set_collision_layer_value(1, true)
		set_collision_mask_value(1, true)
	
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 1000:
			velocity.y = 1000
			
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
	if Input.is_action_just_pressed("jump") and is_on_floor() and dash.is_dashing(): #Propulsor 💨
		velocity.y = -(jump_force + 250)

		
	
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	if Input.is_action_pressed("RightClick"):
		velocity.x = (speed/3) * horizontal_direction
	else:
		velocity.x = speed * horizontal_direction
	
	if horizontal_direction != 0 and !fire_sword.isAttacking:
		sprite.flip_h = (horizontal_direction == -1)
		flipped = (horizontal_direction == -1)
		
	move_and_slide()
	
	update_animations(horizontal_direction)
	update_state(horizontal_direction, velocity.y)
#TODO porra cu
func update_animations(horizontal_direction):
	if is_on_floor():
		if Input.is_action_just_pressed("RightClick"):
			ap.play("attack1")
			fire_sword.isCharging = true
			
			
		if ap.current_animation != "attack1":
			if horizontal_direction == 0:
				ap.play("idle")
			else:
				ap.play("run")
	
	if dash.is_dashing():
			ap.play("dash")
	
func dash_action():
	dash.start_dash(dashlength)
		
	#position.x = position.x + 100 * horizontal_direction

func update_state(horizontal_dir, vertical_speed):
	
	pass
