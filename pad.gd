extends RigidBody2D




func _ready():
	self.set_process(true)
	self.set_process_input(true)


func _process (delta):
	var posn=self.get_pos();
	var mouse=get_global_mouse_pos()
	self.set_pos(Vector2(mouse.x,self.get_pos().y))
	if(Input.is_action_pressed("Move Right")):
		if (self.get_pos().x>self.get_viewport_rect().size.width- self.get_item_rect().size.width*2 ):
			self.set_pos(posn)
		else:
			posn.x += 900*delta
			self.set_pos(posn)
			
	if(Input.is_action_pressed("Move Left")):
		if (posn.x<self.get_item_rect().size.width*2):
			self.set_pos(posn)
		else:
			posn.x -=900*delta
			self.set_pos(posn)
			
	#Emmision part
	if(self.get_linear_velocity()>Vector2(0,0)):
		get_node("Particles2D").set_emitting(true)
		get_node("Particles2D1").set_emitting(true)
	else:
		get_node("Particles2D").set_emitting(false)
		get_node("Particles2D1").set_emitting(false)


