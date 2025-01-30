extends Node2D

@onready var peter = $peter
@onready var arrow = $arrow

@onready var joey = $joey
@onready var sweat = $sweat

var hasplayed = false

var sprarray = ["rope8", "rope7", "rope6", "rope5", "rope4", "rope3", "rope2", "rope1"]

var t=0
# Called when the node enters the scene tree for the first time.
func _ready():
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
	
	if !t2==7:
		if t%16>8:
			$arrow.hide()
		else:
			$arrow.show()

	joey.position.x+=sin(t)*2
	joey.position.y+=sin(t*2+1)*2
		
	sweat.position.y=t%27+72
	
	if t2==7:
		if !hasplayed:
			hasplayed=true
			$kiss.play()
			$girl1.texture = load("res://sprites/test2/mwah.png")
		
