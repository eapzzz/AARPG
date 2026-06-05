@icon("res://npc/icons/npc_behavior.svg")
class_name NPCBehaviour
extends Node2D

var npc: NPC


func _ready() -> void:
	var p = get_parent()
	if p is NPC:
		npc = p as NPC
		npc.do_behaviour_enabled.connect(start)
	pass


func start() -> void:
	pass
