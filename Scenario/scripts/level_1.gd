extends Node2D

var qntItems = 0
var finished = false

func _ready():
	qntItems = get_tree().get_nodes_in_group("items").size()
	#print("Itens iniciais:", qntItems)
	add_to_group("level")

func on_item_removed():
	if finished:
		return
	qntItems -= 1
	print("Quantidade restante:", qntItems)
	if qntItems <= 0:
		#print("Todos os itens foram coletados!")
		GlobalVariables.quest_completed.append("Brendo")
		finished = true
