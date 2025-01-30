extends Area2D

var clickcount = 0
var soundplayed = false

var bnin1 = load("res://sprites/test1/bninja.png")
var bnin2 = load("res://sprites/test1/bninja2.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	$bninjasw.hide()
	pass

func _input(event):
	if mouse_entered:
		if event is InputEventMouse && event.is_pressed():
			print("click", clickcount)
			clickcount+=1
			$click.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if clickcount==0:
		$bninja.texture = bnin1
	
	if clickcount==1:
		$bninja.texture = bnin2
	
	if clickcount==2:
		$bninjasw.show()
		if !soundplayed:
			soundplayed = true
			$exellente.play()
