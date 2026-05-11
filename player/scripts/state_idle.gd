class_name StateIdle
extends State

@onready var walk: StateWalk = $"../Walk"
@onready var attack: StateAttack = $"../Attack"


## What happens when the player enters this State.
func enter() -> void:
	player.update_animation("idle")


## What happens when the player exits this State.
func exit() -> void:
	pass


## What happens during the _process update in this State.
func process(_delta: float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	player.velocity = Vector2.ZERO
	return null


## What happens during the _physics_process in this State.
func physics(_delta: float) -> State:
	return null


## What happens with input events in this State.
func handle_input(_event: InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
