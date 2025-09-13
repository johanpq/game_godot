extends Node2D

var qntItems = 0
var finished = false

func _ready():
	qntItems = get_tree().get_nodes_in_group("items").size()
	add_to_group("level") 

func on_item_removed():
	qntItems -= 1
	#print("Quantidade restante:", qntItems)

	if qntItems == 0:
		#print("Todos os itens foram coletados!")
		GlobalVariables.npc1_locked = true
		GlobalVariables.mural1_completed = true

func _process(_delta):
	if finished:
		return

	var qnt_items = get_tree().get_nodes_in_group("items").size()
	if qnt_items == 0:
		on_item_removed()
		finished = true
