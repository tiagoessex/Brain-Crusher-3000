extends CanvasLayer


func _ready():
	if get_node("/root/global").sound:
		get_node("TextureButton_sound").set_pressed(false)
	else:
		get_node("TextureButton_sound").set_pressed(true)
	
	get_tree().set_pause(false)
	
	get_tree().set_auto_accept_quit(true)

	if int(rand_range(0,3)) == 0:
		get_node("/root/global").show_interstitial()

func _on_TextureButton_play_pressed():
	get_node("/root/sfx").PlaySound("click")
	get_node("/root/global").goto_scene("res://scenes/game_selection.tscn")
	



func _on_TextureButton_scores_pressed():
	get_node("/root/sfx").PlaySound("click")
	get_node("/root/global").goto_scene("res://scenes/scores.tscn")


func _on_TextureButton_help_pressed():
	get_node("/root/sfx").PlaySound("click")
	get_node("/root/global").goto_scene("res://scenes/help.tscn")


func _on_TextureButton_exit_pressed():
	get_node("/root/sfx").PlaySound("dialog")
	get_node("dlg_exit_2_dos").show()
	get_tree().set_pause(true)


func _on_TextureButton_sound_pressed():
	get_node("/root/sfx").PlaySound("click")
	get_node("/root/global").sound = !get_node("/root/global").sound 


