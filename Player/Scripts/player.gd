class_name Player extends CharacterBody2D


@export var move_speed: float = 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction: Vector2  = Vector2.ZERO
	#direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	#direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * move_speed
	pass

func _physics_process(_delta: float) -> void:
	move_and_slide()
