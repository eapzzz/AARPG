class_name PlayerAbilities
extends Node

const BOOMERANG = preload("uid://c75dbl2sfaye8")

enum Abilities {BOOMERANG, GRAPPLE}

var selected_ability = Abilities.BOOMERANG
var player: Player
var boomerang_instance: Boomerang = null


func _ready() -> void:
	player = PlayerManager.player
	pass


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ability") and selected_ability == Abilities.BOOMERANG:
		boomerang_ability()
	pass


func boomerang_ability() -> void:
	if boomerang_instance:
		return
	
	var _b = BOOMERANG.instantiate() as Boomerang
	player.add_sibling(_b)
	_b.global_position = player.global_position
	
	var throw_direction = player.direction
	if throw_direction == Vector2.ZERO:
		throw_direction = player.cardinal_direction
	_b.throw(throw_direction)
	boomerang_instance = _b
	pass
