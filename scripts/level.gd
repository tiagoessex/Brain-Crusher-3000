extends Node

onready var gui_timer = get_node("game_gui/Label_time_value")
onready var gui_movs = get_node("game_gui/Label_movs_value")
onready var gl = get_node("/root/global")


func _ready():
	gl.reset()
	get_node("Timer_time").start()
	get_tree().set_auto_accept_quit(false)
	

func addMovs():
	gl.movs += 1
	gui_movs.set_text(str(gl.movs))
	

func _on_Timer_time_timeout():
	gl.time += 1
	gui_timer.set_text(str(gl.time))

func GameOver():	
	get_node("game_gui/Label_gameover").show()
	get_node("/root/sfx").PlaySound("gameover")
	get_node("Timer_time").stop()
	get_node("Timer_gameover").start()
	get_tree().set_pause(true)
	get_node("game_gui/AnimationPlayer").play("New Anim")

func _on_Timer_gameover_timeout():
	get_tree().set_pause(false)
	get_node("/root/global").save_game()
	get_node("/root/global").goto_scene("res://scenes/mainmenu.tscn")
