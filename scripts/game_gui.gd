extends CanvasLayer

func _ready():
	var hi_movs = get_node("/root/global").save_info[str(get_node("/root/global").game,"_movs")]
	var hi_time = get_node("/root/global").save_info[str(get_node("/root/global").game,"_time")]
	#print (str(get_node("/root/global").game,"_movs"))
	if hi_time > 0:
		get_node("Label_time_hi").set_text("Hi: " + str(hi_time))
	if hi_movs > 0:
		get_node("Label_movs_hi").set_text("Hi: " + str(hi_movs))


func _notification(what):
    if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST):
        _on_TextureButton_options_pressed()

func _on_TextureButton_options_pressed():
	get_node("/root/sfx").PlaySound("click")
	if get_node("game_menu").is_visible():
		get_node("TextureButton_options").set_pressed(true)
		return
	get_tree().set_pause(true)
	get_node("game_menu").show()


