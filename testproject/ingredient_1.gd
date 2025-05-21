extends TextureRect

var itemName = "빵"

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:

	return data is Dictionary

func _drop_data(at_position: Vector2, data: Variant) -> void:

	print(data)
	itemName = data['item']
	#texture = data['texture']
