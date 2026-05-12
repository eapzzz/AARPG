class_name LevelTileMap
extends TileMapLayer


func _ready() -> void:
	LevelManager.change_tilemap_bounds(_get_tile_map_bounds())
	pass


func _get_tile_map_bounds() -> Array[Vector2]:
	var bounds: Array[Vector2] = []
	bounds.append(Vector2(get_used_rect().position * rendering_quadrant_size))
	bounds.append(Vector2(get_used_rect().end * rendering_quadrant_size))
	return bounds
