extends Control

onready var selectorOne = $MarginContainer/CenterContainer/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selectorTwo = $MarginContainer/CenterContainer/VBoxContainer/CenterContainer2/HBoxContainer/Selector
onready var selectorThree = $MarginContainer/CenterContainer/VBoxContainer/CenterContainer3/HBoxContainer/Selector
onready var menuMoveAudio = $MenuMoveAudio
onready var menuAcceptAudio = $MenuAcceptAudio
onready var MenuBG = $MenuBG

var currentSelection = 0

func _ready(): # on start function
	set_currtent_selection(0) # set our current selection to 0

func _input(event):	
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state # halt all processes (physics, etc)
		visible = new_pause_state

func _process(delta): # always running function
	if get_tree().paused == true:
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
				menuMoveAudio.play() # play sound effects
			currentSelection -= 1 #add to current selection
			set_currtent_selection(currentSelection) #update the selection
		elif Input.is_action_just_pressed("ui_accept"):
			if menuAcceptAudio.playing == false:
				menuAcceptAudio.play()
			handle_selection(currentSelection) # sends to the function below

func handle_selection(_current_selection):
	# acts on selected action based on whats needed
	if _current_selection == 0:
		get_tree().quit() #quit game
	elif _current_selection == 1:
		print("volume option")
		get_tree().paused = false # unpause the game so it functions correctly when opening the volume menu
		SceneTransition.change_scene('res://SoundControl.tscn')
	elif _current_selection == 2:
		print("option 3")

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
