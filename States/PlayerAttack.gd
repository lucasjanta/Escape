extends State
class_name PlayerAttack

@export var player : CharacterBody2D
@export var anim : AnimationPlayer

func Enter():
	print("ataca")
	
func Update(delta:float):
	pass

func Physics_Update(delta:float):
	pass

func Exit():
	pass
