extends State
class_name EnemyVenom
var player : CharacterBody2D
@export var enemy : CharacterBody2D
@export var damage_mult := 1.6
@onready var animation = $"../../AnimationPlayer"
@onready var venom = preload("res://scenes/venom.tscn")

var venom_instance
var distance
# Called when the node enters the scene tree for the first time.
func Enter():
	player = get_tree().get_first_node_in_group("Player")
	distance = player.global_position.x - enemy.global_position.x
	#if distance < 0:
		#print("na esquerda")
		#animation.play("attack_left")
	#if distance > 0:
		#animation.play("attack_right")
	if !enemy.venom_on_cooldown:
		animation.play("venom_right")
			
func Physics_Update(delta:float):
	
	if venom_instance == null:
		Transitioned.emit(self,"Follow")
		enemy.venom_on_cooldown = true

	
func Update(delta:float):
	pass
	
func Exit():
	pass

func venom_spit():
	venom_instance = venom.instantiate()
	venom_instance.position.x = enemy.position.x
	venom_instance.position.y = enemy.position.y - 20
	add_child(venom_instance)
