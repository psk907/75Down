extends VideoPlayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
func _ready():
	set_process(true)
	show()
func _process(delta):
	if(self.is_playing()==false):
		get_node("/root/global").goto_scene("res://MAIN FILE//MainMenu.scn")
		
func _on_Button_pressed():
	
	get_node("/root/global").goto_scene("res://MAIN FILE//MainMenu.scn")