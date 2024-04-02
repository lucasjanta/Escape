extends State
class_name EnemyIdle

var player : CharacterBody2D
@export var enemy : CharacterBody2D
@export var move_speed := 50.0

var move_direction
var wander_time : float



func Enter():
	player = get_tree().get_first_node_in_group("Player")
	randomize_wander()
	
func Update(delta: float):
	if wander_time > 0:
		wander_time -= delta 
	else:
		randomize_wander()
	#print(wander_time)
		
func Physics_Update(delta):
	if enemy:
		enemy.velocity.x = move_direction * move_speed
		enemy.velocity.y = 0

	var distance = player.global_position.x - enemy.global_position.x
	
	if distance < 300 and distance > -300:
		Transitioned.emit(self, "Follow")

func randomize_wander():
	move_direction = randi_range(-1,1)
	wander_time = randf_range(1,3)
	print(move_direction)
