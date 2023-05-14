extends CharacterBody3D

const MOVE_SPEED = 4
const MOUSE_SENS = 0.5

@onready var animPlayer = $CanvasLayer/Control/Sprite2D/AnimationPlayer
@onready var animAce = $CanvasLayer/Ace/AnimationPlayer
@onready var raycast = $RayCast3D

var agent = 0
var kills = 0
var mouseCap

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	mouseCap = true
#	await get_tree().idle_frame
	get_tree().call_group("Enemies", "setPlayer", self)

func _input(event):
	if event is InputEventMouseMotion and mouseCap:
		rotation_degrees.y -= MOUSE_SENS * event.relative.x
		rotation_degrees.x -= MOUSE_SENS * event.relative.y

func _process(delta):
	if Input.is_action_just_pressed("menu") and mouseCap:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		mouseCap = false
		$CanvasLayer/Menu.visible = true
	elif Input.is_action_just_pressed("menu") and !mouseCap:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		mouseCap = true
		$CanvasLayer/Menu.visible = false

func _physics_process(delta):
	if Input.is_action_pressed("shoot") and !animPlayer.is_playing() and mouseCap:
		animPlayer.play("Shoot")
		var coll = raycast.get_collider()
		if raycast.is_colliding() and coll.has_method("kill"):
			kills += 1
			print(kills)
			coll.kill()
			match kills:
				1:
					$Audios/Ace/Ace1.play()
					$CanvasLayer/First/AnimationPlayer.play("Kill")
				2:
					$Audios/Ace/Ace1.stop()
					$Audios/Ace/Ace2.play()
					$CanvasLayer/First/AnimationPlayer.stop()
					$CanvasLayer/First/AnimationPlayer.play("RESET")
					$CanvasLayer/Second/AnimationPlayer.play("Kill")
				3:
					$Audios/Ace/Ace2.stop()
					$Audios/Ace/Ace3.play()
					$CanvasLayer/Second/AnimationPlayer.stop()
					$CanvasLayer/Second/AnimationPlayer.play("RESET")
					$CanvasLayer/Third/AnimationPlayer.play("Kill")
				4:
					$Audios/Ace/Ace3.stop()
					$Audios/Ace/Ace4.play()
					$CanvasLayer/Third/AnimationPlayer.stop()
					$CanvasLayer/Third/AnimationPlayer.play("RESET")
					$CanvasLayer/Fourth/AnimationPlayer.play("Kill")
				5:
					$Audios/Ace/Ace4.stop()
					$Audios/Ace/Ace5.play()
					$CanvasLayer/Fourth/AnimationPlayer.stop()
					$CanvasLayer/Fourth/AnimationPlayer.play("RESET")
					$CanvasLayer/Fifth/AnimationPlayer.play("Kill")
			
	if kills == 5:
		print("ACE")
		animAce.play("Ace")
		kills = 0
		
		await get_tree().create_timer(2.0).timeout
		
		match agent:
				0:
					$Audios/Agents/Cypher.play()
				1:
					$Audios/Agents/Breach.play()
				2:
					$Audios/Agents/Raze.play()
				3:
					$Audios/Agents/Phoenix.play()
				4:
					$Audios/Agents/Yoru.play()
				5:
					$Audios/Agents/Brimstone.play()
				6:
					$Audios/Agents/Skye.play()
				7:
					$Audios/Agents/Neon.play()
				8:
					$Audios/Agents/Astra.play()
				9:
					$Audios/Agents/Chamber.play()
				10:
					$Audios/Agents/Reyna.play()
				11:
					$Audios/Agents/Omen.play()
				12:
					$Audios/Agents/Kayo.play()
				13:
					$Audios/Agents/Sova.play()
				14:
					$Audios/Agents/Killjoy.play()
				15:
					$Audios/Agents/Sage.play()
				16:
					$Audios/Agents/Jett.play()
				17:
					$Audios/Agents/Viper.play()
		
		$CanvasLayer/Replay/AnimationPlayer.play("Replay")

func _on_Menu_mouseCap():
	mouseCap = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
