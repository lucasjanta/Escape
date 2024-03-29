extends Control

@onready var anim = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("hit")
	print("funfa?")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func queue_free_hit():
	queue_free()
