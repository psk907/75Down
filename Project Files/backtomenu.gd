extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_tree().set_pause(false)
	get_parent().get_parent().hide()

	








func _on_Button_pressed():
	
	get_node("/root/global").goto_scene("res://MAIN FILE//MainMenu.scn")




