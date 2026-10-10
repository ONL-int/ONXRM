extends CharacterBody2D

var speed = 50
var player_chase = false
var player = null

func _physics_process(delta):
	if player_chase and is_instance_valid(player):
		position += (player.position-position) / speed

		$AnimatedSprite2D.play("walk")
		
		if(player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play("idle")


func _on_area_2d_body_entered(body):
	# Check if the body entering the area is the player
	if body.is_in_group("player"):
		player = body
		player_chase = true


func _on_area_2d_body_exited(body):
	# Only stop chasing if the body leaving is actually the player
	if body.is_in_group("player"):
		player = null
		player_chase = false
	
