extends Node

signal inventoryUpdate

var data = {}
var nameList = []
var inventory = []
var gold = 0

func _ready():
	var file = FileAccess.open("res://data.json", FileAccess.READ)
	var json_string = file.get_as_text()
	file.close()
	#print(json_string)
	var result = JSON.parse_string(json_string)
	if result == null:
		print("JSON parsing failed.")
		return
	
	data = result
	print('gamemanager Ready')

	for i in range(data.keys().size()):
		inventory.append(0)
		nameList.append(data.keys()[i])
	for key in data:
		data[key]['레시피'] = []
		var a = data[key]['재료1']
		var b = data[key]['재료2']
		if  a != "NaN" and b != "NaN":
			data[key]['레시피'] = [getNum(a), getNum(b)]
			data[key]['레시피'].sort()
		print(data[key]['레시피'])
		
		
func getNum(ingredient):
	if not data.has(ingredient):
		return null
		
	var i = 0
	for key in data:
		if key == ingredient:
			return i
		i+=1
		
	
func cookRecipe(idx1, idx2):
	if idx1 > idx2:
		var tmp = idx1
		idx1 = idx2
		idx2 = tmp
	for key in data:
		var a = data[key]['레시피']
		if a.size() < 2:
			continue
		if idx1 == a[0] and idx2 == a[1]:
			return getNum(key)
	return null
	
func itemGet(item, num):
	if item is String:
		item = getNum(item)
	inventory[item]+=num
	emit_signal("inventoryUpdate")
	
	
	
