extends Node3D

@export var top_anim: AnimationPlayer
@export var bot_anim: AnimationPlayer

@export var mg_aly1: Node3D


func _on_minigame_start():
	mg_aly1.visible = true

func _on_minigame_transition():
	top_anim.play("exit_up")
	bot_anim.play("exit_down")
