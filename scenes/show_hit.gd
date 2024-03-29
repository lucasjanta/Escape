extends Node

@onready var anim = $AnimationPlayer
@onready var textLabel = $Label
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func play_anim():
	anim.play("hit")
	
func queue_free_hit():
	queue_free()
