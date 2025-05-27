extends Control

var gm = GameManager
var gold
var normal = []
var rare = []
var special = []

func _ready() -> void : 
	gold = $"background/goldbar/viewGold"

func _on_buy_1000_gold_button_pressed() -> void:
	print("1000")
	gold.add_gold(1000)

func _on_buy_3000_gold_button_2_pressed() -> void:
	print("3000")
	gold.add_gold(3000)
	
func _on_buy_5000_gold_button_3_pressed() -> void:
	print("5000")
	gold.add_gold(5000)

func _on_buy_10000_gold_button_4_pressed() -> void:
	print("10000")
	gold.add_gold(10000)
