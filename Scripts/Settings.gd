extends Control

var masterBus = AudioServer.get_bus_index("Master")

func _on_Exit_pressed():
	visible = false

func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(masterBus, value)
	
	if value == -30:
		AudioServer.set_bus_mute(masterBus, true)
	else:
		AudioServer.set_bus_mute(masterBus, false)
