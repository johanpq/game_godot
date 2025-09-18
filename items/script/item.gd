extends Node2D
class_name Item  # nome da classe

# Adiciona o item no grupo
func addItem():
	add_to_group(("items"))

# Remove o item da cena
func remoteItem():
	queue_free()
	get_tree().call_group("level", "on_item_removed")
