@tool
class_name Pickup extends Area2D

@export var item: Item = null: set = set_item

@onready var _sprite_2d: Sprite2D = %Sprite2D
@onready var _audio_stream_player = %AudioStreamPlayer2D
@onready var _animation_player = %AnimationPlayer




func _ready() -> void:
	set_item(item)
	
	#_animation_player.play("idle")
	body_entered.connect(func (body: Node2D) -> void:
		if body is Player:
			item.use(body)
		#_animation_player.play("destroy")
		set_deferred("monitoring", false)
		_audio_stream_player.play()
		_animation_player.animation_finished.connect(func (_animation_name: String) -> void:
			queue_free()
			)
		)
	
func _get_configuration_warning() -> PackedStringArray:
	var warning := PackedStringArray()
	if item == null:
		warning.append("the pickup has no item assigned")
	return warning
	
func set_item(value: Item) -> void:
	item = value
	if _sprite_2d != null:
		_sprite_2d.texture = item.texture
		
	if _audio_stream_player != null:
		_audio_stream_player.stream = item.sound_on_pickup
