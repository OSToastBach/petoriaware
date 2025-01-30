extends Node2D

@onready var peter = $peter

@onready var rope1 = $rope1
@onready var rope2 = $rope2
@onready var rope3 = $rope3
@onready var rope4 = $rope4
@onready var rope5 = $rope5
@onready var rope6 = $rope6
@onready var rope7 = $rope7
@onready var rope8 = $rope8

var sprarray = ["rope8", "rope7", "rope6", "rope5", "rope4", "rope3", "rope2", "rope1"]

var t=0
var cursor = load("res://sprites/test1/cursor.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_custom_mouse_cursor(cursor)
	$AnimationPlayer.play("text")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t+=1
	var t2=t/26
	#print(t2)
	if t2>7:
		t2=7
	var currsprite=get_node(sprarray[t2])
	currsprite.hide()
	peter.rotation_degrees = (t2%2)*16-8
