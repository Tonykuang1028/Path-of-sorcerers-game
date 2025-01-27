extends Node2D

#@export var bullet_scene: PackedScene = preload("res://levels/bullet.tscn")

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()
		shoot2()
	
func shoot() -> void:
	const BULLET = preload("res://levels/bullet.tscn")
	var new_bullet = BULLET.instantiate()
  
	new_bullet.top_level = true
	new_bullet.global_position = $shootleft.global_position
	new_bullet.global_rotation = $shootleft.global_rotation
	$shootleft.add_child(new_bullet)
	
func shoot2() -> void:
	const BULLET = preload("res://levels/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.top_level = true
	new_bullet.global_position = $shootright.global_position
	new_bullet.global_rotation = $shootright.global_rotation
	$shootright.add_child(new_bullet)
	
	
	
	
	#if bullet_scene:
		#var bullet: Node = bullet_scene.instantiate()
		#bullet.global_positon = $shootleft.global_position
		#bullet.global_rotation = global_rotation
		#get_tree().current_scene.add_child(bullet)
		#
	#else:
		#print("error_not_work")
	
	
	
	
	
	
	#bullet.rotation += randf_range(-random_angle / 2.0, random_angle / 2.0)
	
#func shoot():
	#const BULLET = preload("res://levels/bullet.tscn")
	#var new_bullet = BULLET.instantiate()
	#new_bullet.global_position = $shootleft.global_position
	#$shootleft.add_child(new_bullet)
