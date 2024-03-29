extends State
class_name PlayerIdle

@export var player : CharacterBody2D
@export var anim : AnimationPlayer

func Enter():
	anim.play("idle")
	print("está em idle")
	
func Update(delta:float):
	if Input.is_action_just_pressed("jump"):
		Transitioned.emit(self, "PlayerJump")
	#if player.horizontal_direction != 0:
		#Transitioned.emit(self, "PlayerWalk")
	pass

func Physics_Update(delta:float):
	pass

func Exit():
	pass
