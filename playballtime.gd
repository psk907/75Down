extends RigidBody2D
var num
var minspeed=13
var maxspeed=780
var maxspeed1=740
var ch=0

func _ready():
	set_fixed_process(true)
	self.set_process_input(true)
	self.set_scale(Vector2(0.2,0.2))
	num=0
	
	

func _fixed_process(delta):
	
	
	var collidedBodies=get_colliding_bodies()
	
	#Extracting the Object that collided with the Ball
	for brick in collidedBodies:
		
		#When the Ball hits the bricks
		if(brick.is_in_group("Bricks")==true):
			brick.queue_free()
			num+=1
			get_parent().get_node("Score").clear()
			get_parent().get_node("Score").add_text(str("Score : ",num))
			get_parent().get_node("s1").play("coin",true)
			
			
		#When the ball hits the GamePad
		if(brick.get_name()=="GamePad"):
			var speed=get_linear_velocity().length()
			var direction=get_pos()-brick.get_node("Anchor").get_global_pos()
			var velocity=direction.normalized()*min(speed*minspeed,maxspeed)
			set_linear_velocity(velocity)
			set_angular_velocity(0)
			get_parent().get_node("s1").play("bump",true)
		
		#When the ball hits the Walls
		if(brick.is_in_group("Walls")==true):
			
			get_parent().get_node("s1").play("bump",true)
		
		#When the Ball hits the Bottom Wall
		if(brick.is_in_group("Dead")==true):
			get_parent().get_node("LoseScreen/Container").show()
			get_parent().get_node("LoseScreen/Container/Panel/StreamPlayer").play()
			queue_free()
			get_parent().get_node("GamePad").queue_free()
			get_parent().get_node("Time/Timer").stop()
			get_parent().get_node("StreamPlayer 2").stop()
		
		
	
	#If the ball happens to fly out of play area due to any bug that arises whilst development
	if(self.get_pos().x>self.get_viewport_rect().size.width||self.get_pos().x<0||self.get_pos().y>self.get_viewport_rect().size.height||self.get_pos().y<0):
		self.set_pos(Vector2(400,450))
		get_parent().get_node("GamePad").set_pos(Vector2(500,658))
		self.set_linear_velocity(Vector2(0,400))
		self.set_angular_velocity(0)
	
	#Centering the Ball Location
	if(Input.is_action_pressed("Center")):
		self.set_pos(Vector2(640,450))
		self.set_linear_velocity(Vector2(0,500))
		self.set_angular_velocity(0)
	
	
	if(num>=75):
		get_node("/root/global").goto_scene("res://MAIN FILE//win.tscn.converted.scn")
		
	