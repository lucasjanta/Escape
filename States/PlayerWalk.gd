extends State
class_name PlayerWalk

@export var player : CharacterBody2D
@export var anim : AnimationPlayer

func Enter():
	anim.play("run")
	print("corre")
	
func Update(delta:float):
	if player.horizontal_direction == 0 and player.is_on_floor():
		Transitioned.emit(self, "PlayerIdle")
		
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		Transitioned.emit(self, "PlayerJump")
		
	if Input.is_action_just_pressed("dash"):
		Transitioned.emit(self, "PlayerDash")
		
	if Input.is_action_just_pressed("LeftClick"):
		Transitioned.emit(self, "PlayerSwordAttack")

func Physics_Update(delta:float):
	player.velocity.x = player.speed * player.horizontal_direction
	pass

func Exit():
	pass
