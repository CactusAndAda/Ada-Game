extends MarginContainer

#preloads the scenes that could be used
# const is a variable that doesn't change
const mainMenu = preload("res://FirstScene.tscn")

#load all needed assets
onready var selectorOne = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selectorTwo = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Selector
onready var selectorThree = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Selector
onready var selectorFour = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer4/HBoxContainer/Selector
onready var selectorFive = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer5/HBoxContainer/Selector
onready var menuMoveAudio = $MenuMoveAudio
onready var menuAcceptAudio = $MenuAcceptAudio
onready var MenuBG = $MenuBG

var currentSelection = 0 # set the currently selected >

func _ready(): # on start function
	set_currtent_selection(0) # set our current selection to 0

func _process(delta): # always running function
	if MenuBG.playing == false:
		MenuBG.play()
	# the if statements below detect input and take action based on input
	if Input.is_action_just_pressed("ui_down") and currentSelection < 4:
		if menuMoveAudio.playing == false:
			menuMoveAudio.play() # play sound effects
		currentSelection += 1 #add to current selection
		set_currtent_selection(currentSelection) #update the selection
	if Input.is_action_just_pressed("ui_up") and currentSelection > 0:
		if menuMoveAudio.playing == false:
			menuMoveAudio.play() # play sound effects
		currentSelection -= 1 #add to current selection
		set_currtent_selection(currentSelection) #update the selection
	elif Input.is_action_just_pressed("ui_accept"):
		if menuAcceptAudio.playing == false:
			menuAcceptAudio.play()
		handle_selection(currentSelection) # sends to the function below
	elif Input.is_action_just_pressed("back"):
		if menuAcceptAudio.playing == false:
			menuAcceptAudio.play()
		#get_parent().add_child(mainMenu.instance())
		SceneTransition.change_scene('res://MainMenu.tscn')
		#queue_free() # remove the current scene (delete)

func handle_selection(_current_selection):
	# acts on selected action based on whats needed
	if _current_selection == 0:
		print("Volume controls")
	elif _current_selection == 1:
		print("brightness controls")
	elif _current_selection == 2:
		print("sensitivity")
	elif _current_selection == 3:
		print("control settings")
	elif _current_selection == 4:
		print("particle effects")

func set_currtent_selection(_current_selection):
	# set all current selector text to blank (no selection)
	selectorOne.text = ""
	selectorTwo.text = ""
	selectorThree.text = ""
	selectorFour.text = ""
	selectorFive.text = ""
	if _current_selection == 0:
		selectorOne.text = ">" #set the correct selection text to display as if its selecting that option
	elif _current_selection == 1:
		selectorTwo.text = ">"
	elif _current_selection == 2:
		selectorThree.text = ">"
	elif _current_selection == 3:
		selectorFour.text = ">"
	elif _current_selection == 4:
		selectorFive.text = ">"

# ^.^
