extends Node2D

@export var bullet_scene: PackedScene = preload("res://levels/bullet.tscn")

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
func shoot() -> void:
	var bullet: Node = bullet_scene.instantiate()
	get_tree().current_scene.add_child(bullet)
	

	
