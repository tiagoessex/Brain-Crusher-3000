extends Control



func _ready():
	if get_node("/root/global").sound:
		get_node("Label_sound").set_text("Sound OFF")
		get_node("TextureButton_sound").set_pressed(false)
	else:
		get_node("Label_sound").set_text("Sound ON")
		get_node("TextureButton_sound").set_pressed(true)



func _on_TextureButton_menu_pressed():
	get_node("/root/sfx").PlaySound("click")
	get_node("/root/global").goto_scene("res://scenes/mainmenu.tscn")


func _on_TextureButton_sound_pressed():
	get_node("/root/sfx").PlaySound("click")
	get_node("/root/global").sound = !get_node("/root/global").sound 
	if get_node("/root/global").sound:
		get_node("Label_sound").set_text("Sound OFF")
	else:
		get_node("Label_sound").set_text("Sound ON")

func _on_TextureButton_return_pressed():
	get_node("/root/sfx").PlaySound("click")
	get_node(".").hide()
	get_node("../TextureButton_options").set_pressed(false)
	get_tree().set_pause(false)
