@tool
class_name Pickup extends Area2D

@export var item: Item = null: set = set_item
@onready var _sprite_2d: Sprite2D = %Sprite2D
@onready var _audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

#@onready var _animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	set_item(item)

	#_animation_player.play("idle")
	
	body_entered.connect(func (body: Node2D) -> void:
		if body is Player:
			item.use(body)
		#_animation_player.play("destroy")
		#set_deferred("monitoring", false)
		#_audio_stream_player_2d.play()
		#_animation_player.animation_finished.connect(func (_animation_name: String) -> void:
			queue_free()
		#)
	)
		
		
			
	

func _get_configuration_warnings() -> PackedStringArray:
	var warnings := PackedStringArray()
	if item == null:
		warnings.append("The pickup has no item assigned. Please assign an item to the pickup in the inspector.")
	return warnings


func set_item(value: Item) -> void:
	item = value
	if _sprite_2d != null:
		_sprite_2d.texture = item.texture
	if _audio_stream_player_2d != null:
		_audio_stream_player_2d.stream = item.sound_on_pickup
	
	
	#area_entered.connect(_on_area_entered)
	#play_floating_animation()
	
#func play_floating_animation() -> void:
	#var tween := create_tween()
	#tween.set_trans(Tween.TRANS_SINE)
		#
	#var sprite_2d := get_node("Sprite")
	#var position_offset := Vector2(0.0, 10.0)
	#var duration = randf_range(0.8, 1.2)
	#tween.tween_property(sprite_2d, "position", position_offset, duration)
	#tween.tween_property(sprite_2d, "position",  -1.0 * position_offset, duration)
	#tween.set_loops()
	

func _on_area_entered(area: Area2D) -> void:
	queue_free()
