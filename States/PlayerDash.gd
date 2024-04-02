extends State
class_name PlayerDash

@export var player : CharacterBody2D
@export var anim : AnimationPlayer
@export var dash : Node2D

func Enter():
	dash.start_dash(player.dashlength)
	print("dashing")
	anim.play("dash")
	
func Update(delta:float):
	if dash.is_dashing():
		player.velocity.x = player.dash_speed * player.horizontal_direction
		player.set_collision_layer_value(1, false)
		player.set_collision_mask_value(1, false)
	else:
		player.velocity.x = player.normal_speed * player.horizontal_direction
		player.set_collision_layer_value(1, true)
		player.set_collision_mask_value(1, true)
		if player.is_on_floor() and player.horizontal_direction != 0:
			Transitioned.emit(self, "PlayerWalk")
		if player.is_on_floor() and player.horizontal_direction == 0:
			Transitioned.emit(self, "PlayerIdle")
		if !player.is_on_floor():
			Transitioned.emit(self, "PlayerJump")

func Physics_Update(delta:float):
	pass

func Exit():
	player.speed = player.normal_speed
	pass
