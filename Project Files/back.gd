extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"


func _on_Back_pressed():
	get_tree().set_pause(false)
	get_node("/root/global").goto_scene("res://MAIN FILE//MainMenu.scn")
	

