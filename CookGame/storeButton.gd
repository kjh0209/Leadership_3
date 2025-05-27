extends Button

func _ready() -> void: print("hi")

func _on_store_button_pressed() -> void:
	var storeUI = $"../../storeUI"
	storeUI.show()
	return 
