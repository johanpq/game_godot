extends Node2D
class_name Items  # nome da classe

@onready var Item : Item = $item
@onready var Label_hint: Label = $item/Area2D/LabelKeyboard/Label
var player_inside = false
	
func _ready():
	Item.addItem()
	Label_hint.visible = false

func in_area(_body: Node) -> void:
	player_inside = true
	Label_hint.text = "F"
	Label_hint.visible = true

func out_area(_body: Node) -> void:
	player_inside = false
	Label_hint.visible = false

func _physics_process(_delta: float) -> void:
	if player_inside and Input.is_action_just_pressed("get_item"):
		Item.remoteItem()
