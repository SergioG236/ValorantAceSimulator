extends Node3D

func _ready():
	$Player.agent = Global.agent
	
	randomize()
	var agents = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]
	var enemies = []
	var maps = [0, 1, 2, 3, 4, 5, 6, 7]
	var map
	
	maps.shuffle()
	
	agents.shuffle()
	
	for i in 5:
		enemies.append(agents.pop_front())
	
	map = maps.pop_front()
	
	$WorldEnvironment/Wall.frame = map
	$WorldEnvironment/Wall2.frame = map
	$WorldEnvironment/Wall3.frame = map
	$WorldEnvironment/Wall4.frame = map
	
	$Enemy/Sprite3D.frame = enemies[0]
	$Enemy2/Sprite3D.frame = enemies[1]
	$Enemy3/Sprite3D.frame = enemies[2]
	$Enemy4/Sprite3D.frame = enemies[3]
	$Enemy5/Sprite3D.frame = enemies[4]

