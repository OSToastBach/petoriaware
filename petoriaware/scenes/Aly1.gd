extends Node3D

@onready var camera = $"../../Camera3D"
@onready var aly_sprite = $Aly
@onready var music = $Music
@onready var explosion_timer = $ExplosionTimer

@onready var boom_sound = $Boom
@onready var win_sound = $Win

var loss_aly = load("res://sprites/aly1/golden_aly_shocked.jpg")
var win_aly = load("res://sprites/aly1/green_aly.jpg")

var loss_center = Vector3(0.0, -1.9, -10.0)

func mouse_pos_3d(pos):
	var drop_plane = Plane(Vector3(0,0,1),-10)
	return drop_plane.intersects_ray(camera.project_ray_origin(pos), camera.project_ray_normal(pos))

func _input(event):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if event is InputEventMouse:
			var pos = mouse_pos_3d(event.position)
			var dist = aly_sprite.position.distance_to(pos)
			if dist < 1.0:
				aly_sprite.position.x = pos.x
				aly_sprite.position.y = pos.y


func _on_visibility_changed():
	if self.visible:
		music.play()
		explosion_timer.start()


func _on_explosion_timer_timeout():
	if aly_sprite.position.distance_to(loss_center) > 3.0:
		# win
		win_sound.play()
		aly_sprite.texture = win_aly
	else:
		# loss
		boom_sound.play()
		aly_sprite.texture = loss_aly
