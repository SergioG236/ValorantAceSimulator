extends Control

onready var agent = $Agent

func _ready():
	$AudioStreamPlayer.play()

func _on_Brimstone_pressed():
	agent.frame = 5
	agent.visible = true

func _on_Jett_pressed():
	agent.frame = 16
	agent.visible = true

func _on_Killjoy_pressed():
	agent.frame = 14
	agent.visible = true

func _on_Neon_pressed():
	agent.frame = 7
	agent.visible = true

func _on_Phoenix_pressed():
	agent.frame = 3
	agent.visible = true

func _on_Reyna_pressed():
	agent.frame = 10
	agent.visible = true

func _on_Raze_pressed():
	agent.frame = 2
	agent.visible = true

func _on_Sage_pressed():
	agent.frame = 15
	agent.visible = true

func _on_Skye_pressed():
	agent.frame = 6
	agent.visible = true

func _on_Sova_pressed():
	agent.frame = 13
	agent.visible = true

func _on_Viper_pressed():
	agent.frame = 17
	agent.visible = true

func _on_Astra_pressed():
	agent.frame = 8
	agent.visible = true

func _on_Breach_pressed():
	agent.frame = 1
	agent.visible = true

func _on_Chamber_pressed():
	agent.frame = 9
	agent.visible = true

func _on_Cypher_pressed():
	agent.frame = 0
	agent.visible = true

func _on_Kayo_pressed():
	agent.frame = 12
	agent.visible = true

func _on_Omen_pressed():
	agent.frame = 11
	agent.visible = true

func _on_Yoru_pressed():
	agent.frame = 4
	agent.visible = true

func _on_TextureButton_pressed():
	if agent.visible == true:
		Global.agent = agent.frame
		get_tree().change_scene("res://Scenes/World.tscn")
