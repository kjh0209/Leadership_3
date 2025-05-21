extends Label

var gold := 3000
var gold_max := 10000

func _ready():
	update_gold_text()

func set_gold(new_gold: int):
	gold = clamp(new_gold, 0, gold_max)
	update_gold_text()

func add_gold(amount: int):
	set_gold(gold + amount)

func subtract_gold(amount: int):
	set_gold(gold - amount)

func update_gold_text():
	text = " %d / %d" % [gold, gold_max]
