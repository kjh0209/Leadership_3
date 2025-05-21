extends Button

var gm = GameManager

func _ready() -> void:
	print('Button')


func _cookButton_pressed() -> void:
	#print(GameManager.my_dict)
	var num1 = $"../Ingredient1".itemCode
	var num2 = $"../Ingredient2".itemCode
	if num1 == -1 or num2 == -1:
		return
	
	if ((num1 == num2 && gm.inventory[num1] < 2) || (gm.inventory[num1] < 1) || (gm.inventory[num2] < 1)) :
		print('aaa')
		return 
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
	
