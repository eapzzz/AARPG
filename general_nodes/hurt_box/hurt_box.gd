class_name HurtBox
extends Area2D

@export var damage := 1


func _ready() -> void:
	area_entered.connect(_on_area_entered)


func _on_area_entered(area: Area2D) -> void:
	if area is HitBox:
		area.take_damage(damage)
