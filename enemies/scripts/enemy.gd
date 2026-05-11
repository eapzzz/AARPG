class_name Enemy
extends CharacterBody2D

signal direction_changed(new_direction: Vector2)
signal enemy_damaged()

const DIR_4: Array[Vector2] = [Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]

@export var hp := 3

var cardinal_direction := Vector2.DOWN
var direction := Vector2.ZERO
var player: Player
var invulnerable := false

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
#@onready var hit_box: HitBox = $HitBox
@onready var state_machine: EnemyStateMachine = $EnemyStateMachine


func _ready() -> void:
	state_machine.initialize(self)
	player = PlayerManager.player
	pass


func _process(_delta: float) -> void:
	pass


func _physics_process(_delta: float) -> void:
	move_and_slide()
	pass


func set_direction(_new_direction: Vector2) -> bool:
	direction = _new_direction
	if direction == Vector2.ZERO:
		return false

	var angle := (direction + cardinal_direction * 0.1).angle()
	var direction_id := int(round(angle / TAU * DIR_4.size()))
	var new_dir := DIR_4[direction_id]

	if cardinal_direction == new_dir:
		return false

	cardinal_direction = new_dir
	direction_changed.emit(new_dir)
	sprite.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
	return true


func update_animation(state: String) -> void:
	animation_player.play(state + "_" + anim_direction())
	pass


func anim_direction() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"
