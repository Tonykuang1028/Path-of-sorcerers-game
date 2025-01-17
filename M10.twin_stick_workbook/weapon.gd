extends Node2D

#@export var bullet_scene: PackedScene = preload("res://levels/bullet.tscn")

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
#func shoot() -> void:
	#var bullet: Node = bullet_scene.instantiate()
	#get_tree().current_scene.add_child(bullet)
	
	#bullet.global_positon = global_position
	#bullet.global_rotation = global_rotation
	#bullet.rotation += randf_range(-random_angle / 2.0, random_angle / 2.0)
	
func shoot():
	const BULLET = preload("res://levels/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = $shootleft.global_position
	$shootleft.add_child(new_bullet)
