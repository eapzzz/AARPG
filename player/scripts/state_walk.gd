class_name StateWalk
extends State

@export var move_speed := 100.0

@onready var idle: StateIdle = $"../Idle"
@onready var attack: StateAttack = $"../Attack"


## What happens when the player enters this State.
func enter() -> void:
	player.update_animation("walk")


## What happens when the player exits this State.
func exit() -> void:
	pass


## What happens during the _process update in this State.
func process(_delta: float) -> State:
	if player.direction == Vector2.ZERO:
		return idle

	player.velocity = player.direction * move_speed

	if player.set_direction():
		player.update_animation("walk")

	return null


## What happens during the _physics_process in this State.
func physics(_delta: float) -> State:
	return null


## What happens with input events in this State.
func handle_input(_event: InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	if _event.is_action_pressed("interact"):
		PlayerManager.interact_pressed.emit()
	return null
