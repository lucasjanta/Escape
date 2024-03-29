extends State
class_name EnemyAttack1

@export var enemy : CharacterBody2D
@export var damage_mult := 1.2

var player: CharacterBody2D
var flipped = false

@onready var animation = $"../../AnimationPlayer"
var lick_on_cool
func Enter():
	player = get_tree().get_first_node_in_group("Player")
	var distance = player.global_position.x - enemy.global_position.x
	if distance < 0:
		print("na esquerda")
		animation.play("attack_left")
	if distance > 0:
		animation.play("attack_right")
	
	
	#print("teste")
	
func Update(delta:float):
	enemy.velocity.x = 0
	if !animation.current_animation:
		enemy.lick_on_cooldown = true
		Transitioned.emit(self,"Follow")
func Physics_Update(delta:float):
	pass
	
func Exit():
	pass
	



func _on_hit_area_body_entered(body):
	if body is Player:
		print("dano no player")
	
