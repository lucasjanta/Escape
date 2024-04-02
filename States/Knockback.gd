extends State
class_name Knockback

@export var player : CharacterBody2D
@export var enemy : CharacterBody2D
@export var anim : AnimationPlayer

func Enter():
	print("knockback")
	
func Update(delta:float):
	
	pass

func Physics_Update(delta:float):
	pass

func Exit():
	pass
