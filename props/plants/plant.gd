class_name Plant
extends Node2D


func _ready() -> void:
	$HitBox.damaged.connect(_take_damage)
	pass


func _take_damage(_damage: HurtBox) -> void:
	queue_free()
	pass
