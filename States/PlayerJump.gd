extends State
class_name PlayerJump

@export var player : CharacterBody2D
@export var anim : AnimationPlayer

func Enter():
	if player.is_on_floor():
		player.velocity.y = -player.jump_force
	print("pulo")
	
	
func Update(delta:float):
	if player.velocity.y < 0:
		anim.play("jump")
		
	if player.is_on_floor() and player.horizontal_direction == 0:
		Transitioned.emit(self, "PlayerIdle")
		
	if player.is_on_floor() and player.horizontal_direction != 0:
		Transitioned.emit(self, "PlayerWalk")
	pass

func Physics_Update(delta:float):
	player.velocity.x = player.speed * player.horizontal_direction
	pass

func Exit():
	pass
