extends Node2D
class_name Item  # nome da classe

@onready var label_hint: Label = $Area2D/LabelKeyboard/Label
var player_inside = false

func addItem():
	add_to_group(("items"))

func remoteItem():
	queue_free()  # remove o item da cena
	get_tree().call_group("level", "on_item_removed")
	
func _ready():
	# garante que o label começa invisível
	addItem()
	label_hint.visible = false

func _on_area_2d_body_entered(_body: Node) -> void:
	# verifica se o corpo entrou
		player_inside = true
		label_hint.text = "F"
		label_hint.visible = true

func _on_area_2d_body_exited(_body: Node) -> void:
	# verifica se o corpo saiu
		player_inside = false
		label_hint.visible = false

func _physics_process(_delta: float) -> void:
	if player_inside and Input.is_action_just_pressed("get_item"):
		remoteItem()
