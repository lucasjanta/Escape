extends RigidBody2D

var player : CharacterBody2D
var enemy : CharacterBody2D
var target_loc
var venom_height
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("Player")
	target_loc = player.global_position.x - global_position.x
	print(target_loc)
	spit_venom()
	if target_loc < 0:
		set_axis_velocity(Vector2(target_loc - randf_range(0,200), venom_height))
	if target_loc > 0:
		set_axis_velocity(Vector2(target_loc + randf_range(0,200), venom_height))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	

	pass

func _physics_process(delta):
	
	pass
	


func _on_collision_area_body_entered(body):
	if body is Player:
		print("player acertado")
		queue_free()
	if body is TileMap:
		queue_free()

func spit_venom():
	venom_height = randf_range(200,320) * -1
