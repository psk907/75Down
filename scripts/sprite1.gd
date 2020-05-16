extends Sprite


func _ready():
	self.set_process(true)
	

func _process (delta):
	var posn=self.get_pos();
	
	if(Input.is_key_pressed(KEY_RIGHT)):
		if (self.get_pos().x>self.get_viewport_rect().size.width- self.get_item_rect().size.width ):
			self.set_pos(posn)
		else:
			posn.x += 900*delta
			self.set_pos(posn)
			
	if(Input.is_key_pressed(KEY_LEFT)):
		if (posn.x<self.get_item_rect().size.width):
			self.set_pos(posn)
		else:
			posn.x -=900*delta
			self.set_pos(posn)
			