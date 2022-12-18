extends TextureButton

var masterBus = AudioServer.get_bus_index("Master") #possibly change to music Bus in the future

func _on_ToggleButton_pressed():
	AudioServer.set_bus_mute(masterBus, not AudioServer.is_bus_mute(masterBus))
