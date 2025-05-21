
# ItemList.gd (ItemList 노드에 붙이는 스크립트)
extends ItemList

var gm = GameManager
#func _ready() -> void:
	#set_fixed_icon_size(Vector2i(128, 128))
#
#func _get_drag_data(at_position: Vector2) -> Variant:
	## 마우스 위치에 있는 아이템 인덱스
	#var idx = get_item_at_position(at_position)
	#if idx < 0:
		#return null
	## 아이템의 아이콘(Texture2D)를 꺼내고
	#var tex: Texture2D = get_item_icon(idx)
	## 드래그 미리보기용 Control 생성
	#var preview = TextureRect.new()
	#var fixed_size = Vector2(64, 64)
	#preview.custom_minimum_size = fixed_size
	#preview.size = fixed_size
	#preview.set_anchors_preset(Control.PRESET_TOP_LEFT)
	#preview.set_size(fixed_size)
	#preview.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	#set_drag_preview(preview)
	## 실제 드래그 데이터로 Texture2D 반환
	#return tex

func _ready() -> void:
	
	gm.connect("inventoryUpdate", self._invenUpdate)

	#add_item("빵")
	#add_item("팥")
	gm.itemGet("우유", 3)
	gm.itemGet("빵", 1)
	gm.itemGet("팥", 3)

func _get_drag_data(at_position: Vector2) -> Variant:
	# 마우스 위치에 있는 아이템 인덱스
	var idx = get_item_at_position(at_position)
	if idx < 0:
		return null
	
	
	# 아이템의 아이콘(Texture2D)를 꺼내고
	var tex: Texture2D = get_item_icon(idx)
	# 드래그 미리보기용 Control 생성
	var preview = TextureRect.new()
	var fixed_size = Vector2(64, 64)
	preview.custom_minimum_size = fixed_size
	preview.size = fixed_size
	preview.set_anchors_preset(Control.PRESET_TOP_LEFT)
	preview.set_size(fixed_size)
	preview.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	set_drag_preview(preview)
	
	
	var data = {}
	var item = get_item_text(get_selected_items()[0])
	data['item'] = item
	data['texture'] = tex
	
	return data
	
func _invenUpdate():
	clear()
	var i = 0
	for count in gm.inventory:
		while(count):
			count -= 1 
			add_item(gm.nameList[i])
		i+=1
