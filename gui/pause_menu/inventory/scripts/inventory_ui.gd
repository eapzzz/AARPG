class_name InventoryUI
extends Control

const INVENTORY_SLOT = preload("uid://ceoaksai3yr1")

@export var data: InventoryData

var focus_index: int = 0


func _ready() -> void:
	PauseMenu.shown.connect(update_inventory)
	PauseMenu.hidden.connect(clear_inventory)
	clear_inventory()
	data.changed.connect(on_inventory_changed)
	pass


func clear_inventory() -> void:
	for c in get_children():
		c.queue_free()
	pass


func update_inventory(i: int = 0) -> void:
	for idx in data.slots.size():
		var new_slot = INVENTORY_SLOT.instantiate()
		add_child(new_slot)
		new_slot.slot_data = data.slots[idx]
		new_slot.focus_entered.connect(item_focused)

	await get_tree().process_frame
	var count := get_child_count()
	if count > 0:
		get_child(clampi(i, 0, count - 1)).grab_focus()
	pass


func item_focused() -> void:
	for i in range(get_child_count()):
		if get_child(i).has_focus():
			focus_index = i
			return
	pass


func on_inventory_changed() -> void:
	#var i := focus_index
	for idx in range(mini(data.slots.size(), get_child_count())):
		get_child(idx).slot_data = data.slots[idx]
	pass
