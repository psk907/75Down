extends RichTextLabel

var count=0

func _ready():
	self.add_text(" Time elapsed: -5")



func _on_Timer_timeout():
	count += 1
	self.clear()
	self.add_text(str("Time elapsed: ",-5+count))
	if(count < 5):
		get_parent().get_node("StartTime").clear()
		get_parent().get_node("StartTime").add_text(str("The Game Begins in ",5-count))
	if(count==5):
		get_parent().get_node("Instruction").clear()
		get_parent().get_node("StartTime").queue_free()
		self.get_parent().get_node("Ball").set_linear_velocity(Vector2(0,850))
		
	
	
