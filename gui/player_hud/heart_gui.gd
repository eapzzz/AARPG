class_name HeartGui
extends Control

var value: int = 2:
	set(_value):
		value = _value
		update_sprite()

@onready var sprite: Sprite2D = $Sprite2D


func update_sprite() -> void:
	sprite.frame = value
	pass
