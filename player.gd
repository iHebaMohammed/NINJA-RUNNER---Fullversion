extends RigidBody2D


var jump_force=600
var onground=true
var dead=false


func _ready():
	$player_animation.play("Run")


func _on_jump_pressed():	
	if !dead && onground:
		set_axis_velocity(Vector2(0,-jump_force))
		$player_animation.play("Jump")
		onground=false


func _on_player_body_entered(body):
	if body.is_in_group("Obs"):
		$player_animation.play("Dead")
		dead=true
		get_tree().paused=true
			
	if body.is_in_group("Ground") && !dead:
		$player_animation.play("Run")
		onground=true
	
	
