extends CharacterBody2D
class_name Player

var normal_speed = 300
var flipped = false
var horizontal_direction = 0
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
@onready var swordAttack = $"State Machine/PlayerSwordAttack"

func _physics_process(delta):
	flipped = sprite.flip_h

	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 1000:
			velocity.y = 1000
			
	#if Input.is_action_just_pressed("jump") and is_on_floor():
		#velocity.y = -jump_force
	if Input.is_action_just_pressed("jump") and is_on_floor() and dash.is_dashing(): #Propulsor 💨
		velocity.y = -(jump_force + 250)
	
	horizontal_direction = Input.get_axis("move_left", "move_right")
	
	if horizontal_direction != 0 and !swordAttack.isAttacking:
		sprite.flip_h = (horizontal_direction == -1)
		
	#if horizontal_direction != 0 and !fire_sword.isAttacking:
		#sprite.flip_h = (horizontal_direction == -1)
		#esse aqui é o certin?
	
	move_and_slide()
