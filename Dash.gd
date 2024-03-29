extends Node2D

@onready var timer = $dashtimer
@onready var player = $".."

func start_dash(dur):
	timer.wait_time = dur
	player.jump_force = 1000
	timer.start()
	
func is_dashing():
	player.jump_force = 800
	return !timer.is_stopped()
