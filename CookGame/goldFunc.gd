extends Label

#var gold := 3000
#var gold_max := 10000
var gm = GameManager

func _ready():
	update_gold_text()

func set_gold(new_gold: int):
	gm.gold = new_gold
	update_gold_text()

func add_gold(amount: int):
	set_gold(gm.gold + amount)

func subtract_gold(amount: int):
	set_gold(gm.gold - amount)

func update_gold_text():
	text = " %d" % [gm.gold]
