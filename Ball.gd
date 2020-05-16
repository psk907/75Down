extends RigidBody2D

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	var collidedBodies=get_colliding_bodies()
	for brick in collidedBodies:
		print(brick)
		if(brick.is_in_group("Blocks")==true):
			brick.queue_free()
