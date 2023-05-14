extends Control

func _ready():
	$Background/AnimationPlayer.play("Background")
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -10)
	$AudioStreamPlayer.play()

func _on_Start_pressed():
	$AudioStreamPlayer.stop()
	get_tree().change_scene_to_file("res://Scenes/AgentSelection.tscn")

func _on_Settings_pressed():
	$Settings.visible = true

func _on_Exit_pressed():
	get_tree().quit()
