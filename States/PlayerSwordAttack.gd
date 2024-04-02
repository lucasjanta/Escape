extends State
class_name PlayerSwordAttack
var isAttacking : bool

@export var player : CharacterBody2D
@export var anim : AnimationPlayer
@export var sword : Node2D

func Enter():
	isAttacking = true
	if !player.flipped:
		anim.play("attack1_right")
	else:
		anim.play("attack1_left")
	print("atacando")
	
func Update(delta:float):
	if isAttacking:
		player.velocity.x = (player.speed/3) * player.horizontal_direction
	if !anim.is_playing():
		isAttacking = false
	if player.is_on_floor():
		if !isAttacking and player.horizontal_direction != 0:
			Transitioned.emit(self, "PlayerWalk")
		if !isAttacking and player.horizontal_direction == 0:
			Transitioned.emit(self, "PlayerIdle")
	#if !player.is_on_floor():
		#Transitioned.emit(self, "PlayerJump")
	

func Physics_Update(delta:float):
	#player.speed = 50
	pass

func Exit():
	isAttacking = false
	pass
