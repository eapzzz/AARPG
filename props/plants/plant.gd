class_name Plant
extends Node2D


func _ready() -> void:
	$HitBox.damaged.connect(_take_damage)


func _take_damage(_damage: int) -> void:
	queue_free()
