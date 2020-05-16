extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_PAUSE_pressed():
	get_node("/root/global").goto_scene("res://MAIN FILE//pausescreen.scn")

