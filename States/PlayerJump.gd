extends State
class_name PlayerJump

@export var player : CharacterBody2D
@export var anim : AnimationPlayer

func Enter():
	print("pulo")
	
	
func Update(delta:float):
	if player.velocity.y < 0:
		anim.play("jump")
	if player.is_on_floor():
		Transitioned.emit(self, "PlayerIdle")
	pass

func Physics_Update(delta:float):
	pass

func Exit():
	pass
