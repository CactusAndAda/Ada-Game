extends MarginContainer

#preloads the scenes that could be used
# const is a variable that doesn't change
const firstScene = preload("res://NEXUSLAB.tscn")
const optionsMenu = preload("res://OptionsMenu.tscn")   

onready var selectorOne = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selectorTwo = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Selector
onready var selectorThree = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Selector
onready var menuMoveAudio = $MenuMoveAudio
onready var menuAcceptAudio = $MenuAcceptAudio
onready var MenuBG = $MenuBG

var currentSelection = 0 # set the currently selected >

func _ready(): # on start function
	set_currtent_selection(0) # set our current selection to 0
	MenuBG.play()

func _process(delta): # always running function
	if MenuBG.playing == false:
		MenuBG.play()
	# the if statements below detect input and take action based on input
	if Input.is_action_just_pressed("ui_down") and currentSelection < 2:
		if menuMoveAudio.playing == false:
			menuMoveAudio.play() # play sound effects
		currentSelection += 1 #add to current selection
		set_currtent_selection(currentSelection) #update the selection
	if Input.is_action_just_pressed("ui_up") and currentSelection > 0:
		if menuMoveAudio.playing == false:
			menuMoveAudio.play()
		currentSelection -= 1 #add to current selection
		set_currtent_selection(currentSelection) #update the selection
	elif Input.is_action_just_pressed("ui_accept"):
		if menuAcceptAudio.playing == false:
			menuAcceptAudio.play()
		handle_selection(currentSelection) # sends to the function below

func handle_selection(_current_selection):
	# acts on selected action based on whats needed
	if _current_selection == 0:
		#get_parent().add_child(firstScene.instance())
		SceneTransition.change_scene('res://NEXUSLAB.tscn')
		#queue_free() # remove the current scene (delete)
	elif _current_selection == 1:
		#get_parent().add_child(optionsMenu.instance())
		SceneTransition.change_scene('res://OptionsMenu.tscn')
		#queue_free() # remove the current scene (delete)
	elif _current_selection == 2:
		get_tree().quit() #quit game

func set_currtent_selection(_current_selection):
	# set all current selector text to blank (no selection)
	selectorOne.text = ""
	selectorTwo.text = ""
	selectorThree.text = ""
	if _current_selection == 0:
		selectorOne.text = ">" #set the correct selection text to display as if its selecting that option
	elif _current_selection == 1:
		selectorTwo.text = ">"
	elif _current_selection == 2:
		selectorThree.text = ">"

# ^.^
