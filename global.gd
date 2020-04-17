extends Node


var current_scene = null


var time
var movs

var gameover

var score
var sound = true
var game = "2x2"

var save_info = { 	"2x2_movs" : 0,
					"2x2_time" : 0,
					"3x3_movs" : 0,
					"3x3_time" : 0,
					"5x4_movs" : 0,
					"5x4_time" : 0,
					"6x5_movs" : 0,
					"6x5_time" : 0,
					"7x6_movs" : 0,
					"7x6_time" : 0
}


var admob = null;
var admob_interstitial_id = "xxxxxxxxxxxxxxxxx"



func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child( root.get_child_count() -1 )
	
	reset()
	
	load_shits()

##############################################################
	############################### ADMOB ########################
	##############################################################
	

	if Globals.has_singleton("bbAdmob"):
		admob = Globals.get_singleton("bbAdmob")
		#You can call admob.init_admob_test or admob.init_admob_real
		#If the last argument is true, the banner ad will be at the top of the screen
		#Function prototype init_admob_banner_test(int instance_id, string app_banner_id, string app_interstitial_id, boolean isTop)
		#admob.init_admob_test(get_instance_ID(), admob_banner_id, admob_interstitial_id, false)
		admob.init_admob_interstitial_real(get_instance_ID(), admob_interstitial_id, true)

func show_interstitial():
	if admob != null:
		admob.show_interstitial()



func reset():
	score = 0
	time = 0
	movs = 0
	gameover = false


func load_shits():
	var savegame = File.new()
	if not savegame.file_exists("user://pz_1.save"):
		print("Error opening file to load data")
		return
	else:
		savegame.open("user://pz_1.save", File.READ)
		save_info.parse_json(savegame.get_line())
		savegame.close()


func save_game():
	var changed = false
	var savegame = File.new()
	if savegame.open("user://pz_1.save", File.WRITE) != 0:
		print("Error opening file to save")
		return
	
	if  time < int(save_info[str(game,"_time")]) or int(save_info[str(game,"_time")]) == 0:
		save_info[str(game,"_time")] = time
		changed = true
	if movs < int(save_info[str(game,"_movs")]) or int(save_info[str(game,"_movs")]) == 0 :
		save_info[str(game,"_movs")] = movs
		changed = true
	if changed:
		savegame.store_line(save_info.to_json())
	
	savegame.close()



##################################
# SCENE LOGIC
##################################
func goto_scene(path):
	call_deferred("_deferred_goto_scene",path)


func _deferred_goto_scene(path):
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instance()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene( current_scene )

