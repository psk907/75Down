extends RichTextLabel

var count=0

func _ready():
	self.add_text(" Time remaining:155")



func _on_Timer_timeout():
	count += 1
	self.clear()
	self.add_text(str("Time remaining: ",155-count))
	if(count < 5):
		get_parent().get_node("StartTime").clear()
		get_parent().get_node("StartTime").add_text(str("The Game Begins in ",5-count))
	if(count==5):
		get_parent().get_node("Instruction").clear()
		get_parent().get_node("StartTime").queue_free()
		self.get_parent().get_node("Ball").set_linear_velocity(Vector2(0,500))
		
	if(count>=150):
		get_node("/root/global").goto_scene("res://MAIN FILE//losescreen.scn")
