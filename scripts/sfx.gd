extends SamplePlayer

func StopAll():
	stop_all()


func PlaySound(which):
	
	if not get_node("/root/global").sound:
		return
	if which == "click":
		play("click")
	elif which == "dialog":
		play("dialog")
	elif which == "gameover":
		play("victory")
	elif which == "swap":
		play("swap")
	else:
		print ("SOUND ERROR")
