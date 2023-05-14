extends CharacterBody3D

var player = null
var dead = false

@onready var raycast = $RayCast3D

func _ready():
	add_to_group("Enemies")

func _physics_process(delta):
	if dead:
		return
	if player == null:
		return
	
	if raycast.is_colliding():
		var coll = raycast.get_collider()
		if coll != null and coll.name == "Player":
			coll.kill()

func setPlayer(p):
	player = p

func kill():
	dead = true
	$CollisionShape3D.disabled = true
	$Sprite3D.visible = false
