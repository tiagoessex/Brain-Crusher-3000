extends CanvasLayer

func _ready():
	var scores = get_node("/root/global").save_info
	get_node("Label_2x2_movs").set_text(str(scores["2x2_movs"]))
	get_node("Label_2x2_time").set_text(str(scores["2x2_time"]))
	get_node("Label_3x3_movs").set_text(str(scores["3x3_movs"]))
	get_node("Label_3x3_time").set_text(str(scores["3x3_time"]))
	get_node("Label_5x4_movs").set_text(str(scores["5x4_movs"]))
	get_node("Label_5x4_time").set_text(str(scores["5x4_time"]))
	get_node("Label_6x5_movs").set_text(str(scores["6x5_movs"]))
	get_node("Label_6x5_time").set_text(str(scores["6x5_time"]))
	get_node("Label_7x6_movs").set_text(str(scores["7x6_movs"]))
	get_node("Label_7x6_time").set_text(str(scores["7x6_time"]))


func _on_TextureButton_ok_pressed():
	get_node("/root/sfx").PlaySound("click")
	get_node("/root/global").goto_scene("res://scenes/mainmenu.tscn")
