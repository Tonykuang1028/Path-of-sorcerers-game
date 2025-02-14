extends Node2D


@onready var teleporter: Area2D = %Teleporter
@onready var end_screen: EndScreen = $Teleporter/CanvasLayer/EndScreen
@onready var death_screen: DeathScreen = $CanvasLayer/DeathScreen



func _ready() -> void:
	teleporter.body_entered.connect(func (body: Node) -> void:
		if body is Player:
			end_screen.open()
		)
	
