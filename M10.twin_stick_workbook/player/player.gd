class_name Player extends CharacterBody2D

const GODOT_DOWN = preload("res://player/godot_bottom.png")
const GODOT_UP_RIGHT = preload("res://player/godot_up_right.png")
const GODOT_BOTTOM_RIGHT = preload("res://player/godot_bottom_right.png")
const GODOT_RIGHT = preload("res://player/godot_right.png")
const GODOT_UP = preload("res://player/godot_up.png")

const UP_RIGHT = Vector2.UP + Vector2.RIGHT
const UP_LEFT = Vector2.UP + Vector2.LEFT
const DOWN_RIGHT = Vector2.DOWN + Vector2.RIGHT
const DOWN_LEFT = Vector2.DOWN + Vector2.LEFT

var max_speed := 600.0
@export var max_health := 100
var health := max_health: set = set_health

@onready var health_bar: ProgressBar = $UI/HealthBar
@onready var collision_shape_2d: CollisionShape2D = %CollisionShape2D


@onready var _skin: Sprite2D = %Skin

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * max_speed
	move_and_slide()

	var direction_discrete := direction.sign()
	match direction_discrete:
		Vector2.RIGHT, Vector2.LEFT:
			_skin.texture = GODOT_RIGHT
		Vector2.UP:
			_skin.texture = GODOT_UP
		Vector2.DOWN:
			_skin.texture = GODOT_DOWN
		UP_RIGHT, UP_LEFT:
			_skin.texture = GODOT_UP_RIGHT
		DOWN_RIGHT, DOWN_LEFT:
			_skin.texture = GODOT_BOTTOM_RIGHT
			
	if direction_discrete.length() > 0:
		_skin.flip_h = direction.x < 0.0
	
func _ready() -> void:
	health_bar.max_value = max_health
	health_bar.value = health


func set_health(new_health: int) -> void:
	var previous_health := health
	health = clampi(new_health, 0, max_health)
	health_bar.value = health
	

	if health == 0:
		die()
		
func die() -> void:
	queue_free()
