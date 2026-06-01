@tool
@icon("res://npc/icons/npc.svg")
class_name NPC
extends CharacterBody2D

signal do_behaviour_enabled

@export var npc_resource: NPCResource: set = _set_npc_resource

var state: String = "idle"
var direction: Vector2 = Vector2.DOWN
var direction_name: String = "down"
var do_behaviour: bool = true

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	setup_npc()
	if Engine.is_editor_hint():
		return
	do_behaviour_enabled.emit()
	pass


func _physics_process(_delta: float) -> void:
	move_and_slide()
	pass


func update_animation() -> void:
	animation.play(state + "_" + direction_name)
	pass


func update_direction(target_position: Vector2) -> void:
	direction = global_position.direction_to(target_position)
	update_direction_name()
	if direction_name == "side" and direction.x < 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
	pass

func update_direction_name() -> void: 
	var threshold: float = 0.45
	if direction.y < -threshold:
		direction_name = "up"
	elif direction.y > threshold:
		direction_name = "down"
	elif direction.x > threshold or direction.x < -threshold:
		direction_name = "side"
	pass


func setup_npc() -> void:
	if npc_resource:
		if sprite:
			sprite.texture = npc_resource.sprite
	pass


func _set_npc_resource(_npc: NPCResource) -> void:
	npc_resource = _npc
	setup_npc()
	pass
