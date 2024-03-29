extends State
class_name EnemyFollow

@export var enemy : CharacterBody2D
@export var initial_speed := 40

var move_speed : float
var player : CharacterBody2D
var jump_height : float
var jump_force : float
var jump_timer := 1.5

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	randomized_jump()
	
func Physics_Update(delta : float):
	jump_height -= delta * jump_force
	if jump_timer > 0:
		jump_timer -= delta
	if jump_timer <= 0 and enemy.is_on_floor():
		randomized_jump()
		jump_timer = 1.5
		
	var distance = player.global_position.x - enemy.global_position.x
	
	if distance >= 400 or distance <= -400:
		Transitioned.emit(self,"idle")
	
	if distance < 400 and distance > -400:
		if !enemy.is_on_floor():
			move_speed = initial_speed * 2
			enemy.velocity.x = distance  * move_speed * delta
		else:
			move_speed = initial_speed
			enemy.velocity.x = 0
		enemy.velocity.y = -jump_height
		
		if distance < 80 and distance > -80 and enemy.lick_on_cooldown == false and enemy.is_on_floor():
			Transitioned.emit(self,"EnemyAttack")
		if distance < 200 and distance > -200 and enemy.venom_on_cooldown == false and enemy.is_on_floor():
			Transitioned.emit(self,"EnemyVenom")
	
func randomized_jump():
		jump_height = randf_range(300,500)
		jump_force = randf_range(1500, 2000)
	

