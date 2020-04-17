extends CanvasLayer


func _on_TextureButton_pressed():
	get_node("/root/sfx").PlaySound("click")
	get_node("/root/global").goto_scene("res://scenes/mainmenu.tscn")


func _on_Label_2x2_input_event( ev ):
	if ev.is_pressed():
		get_node("/root/global").game = "2x2"
		get_node("/root/sfx").PlaySound("click")
		get_node("/root/global").goto_scene("res://scenes/level.tscn")

func _on_Label_3x3_input_event( ev ):
	if ev.is_pressed():
		get_node("/root/global").game = "3x3"
		get_node("/root/sfx").PlaySound("click")
		get_node("/root/global").goto_scene("res://scenes/level.tscn")


func _on_Label_5x4_input_event( ev ):
	if ev.is_pressed():
		get_node("/root/global").game = "5x4"
		get_node("/root/sfx").PlaySound("click")
		get_node("/root/global").goto_scene("res://scenes/level.tscn")


func _on_Label_6x5_input_event( ev ):
	if ev.is_pressed():
		get_node("/root/global").game = "6x5"
		get_node("/root/sfx").PlaySound("click")
		get_node("/root/global").goto_scene("res://scenes/level.tscn")


func _on_Label_7x6_input_event( ev ):
	if ev.is_pressed():
		get_node("/root/global").game = "7x6"
		get_node("/root/sfx").PlaySound("click")
		get_node("/root/global").goto_scene("res://scenes/level.tscn")
