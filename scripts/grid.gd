extends Node2D

const EMPTY	= false
const PIECE	= true

var grid_at
var cell_size
var grid_size_x
var grid_size_y
var scale
var hidden
var what

var grid = {}
var grid_pieces = {}

var piece = preload("res://scenes/piece2.tscn")

var grid_at_pos = {	"2x2" : Vector2(90,90),
					"3x3" : Vector2(90,90),
					"5x4" : Vector2(40,40),
					"6x5" : Vector2(40,40),
					"7x6" : Vector2(30,30)}

var scales		= {	"2x2" : 0.58,
					"3x3" : 0.39,
					"5x4" : 0.39,
					"6x5" : 0.3125,
					"7x6" : 0.2734}


var cell_sizes	= {	"2x2" : 150,
					"3x3" : 100,
					"5x4" : 100,
					"6x5" : 80,
					"7x6" : 70}

var hiddens		= {	"2x2" : 1,
					"3x3" : 3,
					"5x4" : 7,
					"6x5" : 10,
					"7x6" : 13}



func _ready():	
	set_process_input(true)
	randomize()
	what = get_node("/root/global").game
	grid_size_x = int(what.left(1))
	grid_size_y = int(what.right(2))
	grid_at = grid_at_pos[what]
	get_node(".").set_pos(grid_at)
	scale = scales[what]
	cell_size = cell_sizes[what]
	hidden = hiddens[what]

	initializeGrid()
	#displayGrid()

func _draw():
	# horizontal lines
	for i in range(grid_size_y + 1):
		draw_line(Vector2(0,cell_size * i), Vector2(grid_size_x * cell_size, cell_size * i), Color(255, 255, 0), 3)
	# vertical lines
	for i in range(grid_size_x + 1):
		draw_line(Vector2(cell_size * i,0), Vector2(cell_size * i, grid_size_y * cell_size), Color(255, 255, 0), 3)


func _input(event):
	#if event.type != InputEvent.SCREEN_TOUCH:
	#	return
	if not event.is_action_pressed("touch"):
		return


	event = get_node(".").make_input_local(event)  # this line runs at every input event is it good ?
	#if (event.type == InputEvent.SCREEN_TOUCH):
	#print(event.pos)



	#print (event.pos)
	#var touched_at = get_viewport().get_mouse_pos()
	var touched_at = event.pos
	if touched_at.x < 0 or touched_at.y < 0:
		return
		
	#var selected_cell_x = int ((touched_at.x - grid_at.x) /cell_size)
	#var selected_cell_y = int ((touched_at.y - grid_at.y) /cell_size)
	var selected_cell_x = int ((touched_at.x) /cell_size)
	var selected_cell_y = int ((touched_at.y) /cell_size)
	
	if selected_cell_x > grid_size_x - 1 or selected_cell_y > grid_size_y - 1:
		return
	
	makeMove(selected_cell_x, selected_cell_y)
	
	get_node("..").addMovs()


# invert the value in both grids: bools and visibility
func invertValue(x,y):	
	if grid[Vector2(x,y)]:
		grid_pieces[Vector2(x,y)].hide()
	else:
		grid_pieces[Vector2(x,y)].show()
	grid[Vector2(x,y)] = not grid[Vector2(x,y)]



# show/hide all pieces in cross around the touch
func makeMove(x, y):
	get_node("/root/sfx").PlaySound("swap")	
	invertValue(x,y)
	if x > 0:
		invertValue(x-1,y)
	if x < grid_size_x - 1:
		invertValue(x+1,y)
	if y > 0:
		invertValue(x,y-1)
	if y < grid_size_y - 1:
		invertValue(x,y+1)
	
	if isComplete():
		GameOver()
	
	#displayGrid()

# check if board is complete
func isComplete():
	for i in range(grid_size_x):
		for k in range(grid_size_y):
			if not grid[Vector2(i,k)]:
				return false
	return true

func GameOver():
	get_node("..").GameOver()



# put and show a piece at x,y
func putPieceAt(x,y):
	var piece_instance = null
	piece_instance = piece.instance()
	piece_instance.set_pos(Vector2(x * cell_size, y * cell_size))
	piece_instance.set_scale(Vector2(scale,scale))
	add_child(piece_instance)
	# piece_instance = null
	return piece_instance


# init all grids and hide the initial number of pieces
func initializeGrid():
	for i in range(grid_size_x):
		for k in range(grid_size_y):
			grid[Vector2(i,k)] = PIECE
			grid_pieces[Vector2(i,k)] = putPieceAt(i,k)

	# hide pieces
	initHide()


# hide all the init pieces
func initHide():
	var current = 0
	while current < hidden:
		var x = int(rand_range(0,grid_size_x))
		var y = int(rand_range(0,grid_size_y))
		if grid[Vector2(x,y)]:
			current = current + 1
			grid[Vector2(x,y)] = EMPTY
			grid_pieces[Vector2(x,y)].hide()
		#	print ("hidding > ", x, ",",y)
	
# just for debug - show in console
func displayGrid():
	print ("------------------")
	var line
	for i in range(grid_size_y):
		line = ""
		for k in range(grid_size_x):
			if grid[Vector2(k,i)]:
				line += str(1) + "  "
			else:
				line += str(0) + "  "
		print (line)
