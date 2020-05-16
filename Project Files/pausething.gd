extends Node


var num=0
func _ready():
	get_node("Container").hide()
	set_process(true)

func _process(delta):
	if(Input.is_action_pressed("ui_cancel")==true):
		get_tree().set_pause(true)
		get_node("Container").show()
		
	if(Input.is_mouse_button_pressed(BUTTON_RIGHT)):
		get_tree().set_pause(false)
		get_node("Container").hide()
		get_node("Container/Panel/PopupDialog").hide()



func _on_TOmenu_pressed():
	get_node("/root/global").goto_scene("res://MAIN FILE/MainMenu.scn")
	


func _on_Quit_pressed():
	get_tree().quit()
