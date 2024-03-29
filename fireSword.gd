extends Node2D

@export var weapon : Weapon

@onready var animation = $"../AnimationPlayer"

var base_damage : float
var knockback_force : float
var combo_timer
var combo_multiplier : float
var framehit = 0
var isTouching = false
var isCharging = false
var charge_power = 0
var final_damage : float
var actual_enemy : CharacterBody2D

func _ready():
	load_weapon()
	
func load_weapon():
	base_damage = weapon.atk_damage
	knockback_force = weapon.knockback_force


func _on_hitbox_area_body_entered(body):
	if body is Enemy:
		isTouching = true
		actual_enemy = body
	
func _on_hitbox_area_body_exited(body):
	if body is Enemy:
		isTouching = false
	
func tick_hit():
	if isTouching:
		framehit+= 1
		print(framehit)


func _process(delta):
	if isCharging:
		charge_power += delta
		if Input.is_action_just_released("LeftClick"):
				final_damage = base_damage * charge_power
				isCharging = false
				print("parou de segurar, o charge_power foi de ", charge_power)
				animation.play("attack1")
				charge_power = 0
	if charge_power >= 5 and isCharging:
		final_damage = base_damage * charge_power
		isCharging = false
		animation.play("attack1")
		charge_power = 0
		print("o carregamento excedeu")
			
func damage():
	if actual_enemy != null:
		if actual_enemy.has_method("take_damage"):
			var attack = Attack.new()
			attack.attack_damage = final_damage * framehit
			actual_enemy.take_damage(attack)
			print("o inimigo tomou ", round(attack.attack_damage), "de dano")
	framehit = 0	
	
	#attack.knockback_force = knockback_force
func check_hold():
	if Input.is_action_pressed("LeftClick"):
		animation.stop()



