extends Control

signal mouseCap

func _on_Settings_pressed():
	$Settings.visible = true

func _on_Continue_pressed():
	visible = false
	emit_signal("mouseCap")

func _on_Exit_pressed():
	get_tree().change_scene_to_file("res://Scenes/Title.tscn")
