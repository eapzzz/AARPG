@tool
extends NPCBehaviour

const DIRECTIONS = [Vector2.UP, Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT]

@export var wander_range: int = 2: set = _set_wander_range
@export var wander_speed: float = 30.0
@export var wander_duration: float = 1.0
@export var idle_duration: float = 1.0

var original_position: Vector2 


func _ready() -> void:
	if Engine.is_editor_hint():
		return
	super()
	$CollisionShape2D.queue_free()
	original_position = npc.global_position
	pass


func start() -> void:
	## idle phase
	if npc.do_behaviour == false:
		return
	npc.state = "idle"
	npc.velocity = Vector2.ZERO
	npc.update_animation()
	await get_tree().create_timer(randf() * idle_duration + idle_duration * 0.5).timeout
	
	## walk phase
	if npc.do_behaviour == false:
		return
	npc.state = "walk"
	var _dir: Vector2
	if global_position.distance_to(original_position) > wander_range * 32:
		var to_home: Vector2 = original_position - global_position
		if abs(to_home.x) > abs(to_home.y):
			_dir = Vector2.RIGHT if to_home.x > 0 else Vector2.LEFT
		else:
			_dir = Vector2.DOWN if to_home.y > 0 else Vector2.UP
	else:
		_dir = DIRECTIONS[randi_range(0, 3)]
		
	npc.direction = _dir
	npc.velocity = wander_speed * _dir
	npc.update_direction(global_position + _dir)
	npc.update_animation()
	await get_tree().create_timer(randf() * wander_duration + wander_duration * 0.5).timeout
	
	## repeat
	if npc.do_behaviour == false:
		return
	start()
	pass


func _set_wander_range(v: int) -> void:
	wander_range = v
	$CollisionShape2D.shape.radius = v * 32
	pass
