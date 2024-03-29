extends State
class_name PlayerWalk

@export var player : CharacterBody2D
@export var anim : AnimationPlayer

func Enter():
	
	print("corre")
	
func Update(delta:float):
	pass
	#player.velocity.x = player.speed * player.horizontal_direction
	#if player.horizontal_direction > 0:
			#player.scale.x = 1
	#if player.horizontal_direction < 0:
		#player.scale.x = -1	
	#if Input.is_action_just_released("move_left") or Input.is_action_just_released("move_right"):
		#player.velocity.x = 0
		#Transitioned.emit(self, "PlayerIdle")

func Physics_Update(delta:float):
	pass

func Exit():
	pass
