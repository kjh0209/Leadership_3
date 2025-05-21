extends Button

var gm = GameManager

func _ready() -> void:
	print('Button')


func _cookButton_pressed() -> void:
	#print(GameManager.my_dict)
	var num1 = gm.getNum($"../Ingredient1".itemName)
	var num2 = gm.getNum($"../Ingredient2".itemName)
	if gm.inventory[num1] >= 1 and gm.inventory[num2]>=1:
			
		var result = gm.cookRecipe(num1, num2)
		
		if result == null:
			print('no recipe')
			return
		else:
			print('cook')
			gm.itemGet(result, 1)
			gm.itemGet(num1, -1)
			gm.itemGet(num2, -1)
	else:
		#cookfail
		pass
	
