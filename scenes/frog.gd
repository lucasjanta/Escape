extends CharacterBody2D
class_name Enemy

@onready var show_hit = $show_hit

@export var health : float
@export var base_dmg := 10.0


@export var lick_cooldown := 5.0
var lick_on_cooldown = false

@export var venom_cooldown = 7.0
var venom_on_cooldown = false

var dead = false
var gravity = 100
var show_hit_instance

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity
	move_and_slide()

	if velocity.length() > 0:
		#$AnimationPlayer.play("walk_anim")
		pass
		
	if velocity.x > 0:
		$Sprite2D.flip_h = false
	if velocity.x < 0:
		$Sprite2D.flip_h = true

	if lick_on_cooldown == true:
		if lick_cooldown > 0.0:
			lick_cooldown -= delta
		else:
			lick_cooldown = 5.0
			lick_on_cooldown = false

	if venom_on_cooldown == true:
		if venom_cooldown > 0:
			venom_cooldown -= delta
		else:
			venom_cooldown = 7.0
			venom_on_cooldown = false

func take_damage(attack: Attack):
	health -= round(attack.attack_damage)
	if attack.attack_damage > 0:
		show_hit.textLabel.text = str(round(attack.attack_damage))
		show_hit.play_anim()
	if health <= 0:
		dead = true
		print("morreu")
		
func take_knockback(knockback_force, direction):
	velocity.x = velocity.x * knockback_force * direction
