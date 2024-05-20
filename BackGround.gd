extends Node2D


export var speed=300
export var limit=-3000
export var reloop_pos=-400


func _process(delta):
	translate(Vector2(-speed*delta,0))
	if position.x<=limit:
		position.x=reloop_pos


func _on_restart_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false
