extends TextureRect

var itemCode = -1
#var itemTexture = ? 
var gm = GameManager


#func _ready() -> void:
	#gm.connect("inventoryUpdate", self._invenUpdate)

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return "item" in data and "location" in data

func _drop_data(at_position: Vector2, data: Variant) -> void:

	print(data)
	if (data["location"] != "cooker") :
		itemCode = data["item"]
		#itemTexture = data["texture"]
		#gm.itemGet(data["item"], -1)
	
#func _get_drag_data(at_position: Vector2) -> Variant:	
	#
	#var res = {}
	#res["location"] = "cooker"
	#res["item"] = itemCode
	#itemCode = -1
	#return res
