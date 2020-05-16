extends RigidBody2D
var num
var minspeed=10
var maxspeed=900
var maxspeed1=850
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
		
		#When the ball hits the Bricks
		if(brick.is_in_group("Bricks")==true):
			brick.queue_free()
			num+=1
			get_parent().get_node("Score").clear()
			get_parent().get_node("Score").add_text(str("Score : ",num))
			get_parent().get_node("s1").play("coin",true)
			var speed=get_linear_velocity().length()
			var direction=get_pos()-brick.get_global_pos()
			var velocity=direction.normalized()*min(speed*minspeed,maxspeed1)
			set_linear_velocity(velocity)
			set_angular_velocity(0)
			
		#When the Ball hits the GamePad
		if(brick.get_name()=="GamePad"):
			var speed=get_linear_velocity().length()
			var direction=get_pos()-brick.get_node("Anchor").get_global_pos()
			var velocity=direction.normalized()*min(speed*minspeed,maxspeed)
			set_linear_velocity(velocity)
			set_angular_velocity(0)
			get_parent().get_node("s1").play("bump",true)
			
		#When the Ball hits the wall
		if(brick.is_in_group("Walls")==true):
			
			get_parent().get_node("s1").play("bump",true)
		
		#When the Ball hits the Bottom Wall
		if(brick.is_in_group("Dead")==true):
			ch+=1
			get_parent().get_node("Lives").clear()
			get_parent().get_node("Lives").add_text(str("Lives left : ",3-ch))
		
	
		
	#Centering the Ball Location
	if(Input.is_action_pressed("Center")):
		self.set_pos(Vector2(640,450))
		self.set_linear_velocity(Vector2(0,400))
		self.set_angular_velocity(0)
	if(ch>=3):
		get_parent().get_node("Node/Container").show()
		get_parent().get_node("Node/Container/Panel/StreamPlayer").play()
		get_parent().get_node("GamePad").queue_free()
		queue_free()
		get_parent().get_node("Time/Timer").stop()
		get_parent().get_node("StreamPlayer 2").stop()
	
	if(num>=75):
		get_node("/root/global").goto_scene("res://MAIN FILE//win.tscn.converted.scn")
		
	

