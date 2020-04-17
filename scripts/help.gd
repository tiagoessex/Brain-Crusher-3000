extends CanvasLayer



func _on_TextureButton_pressed():
	get_node("/root/sfx").PlaySound("click")
	get_node("/root/global").goto_scene("res://scenes/mainmenu.tscn")


func _on_TextureButton1_pressed():
	get_node("AnimationPlayer").play("New Anim")
