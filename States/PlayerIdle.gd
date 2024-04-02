extends State
class_name PlayerIdle

@export var player : CharacterBody2D
@export var anim : AnimationPlayer

func Enter():
	player.velocity.x = 0
	anim.play("idle")
	print("está em idle")
	
func Update(delta:float):
	if player.horizontal_direction != 0 and player.is_on_floor():
		Transitioned.emit(self, "PlayerWalk")
		
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		Transitioned.emit(self, "PlayerJump")
		
	if Input.is_action_just_pressed("LeftClick"):
		Transitioned.emit(self, "PlayerSwordAttack")
	
func Physics_Update(delta:float):
	if player.velocity.x > 0:
		player.velocity.x -= delta * 250
	else:
		player.velocity.x = 0
	pass

func Exit():
	pass
