extends Node2D

@onready var label_hint = $Area2D/Label
var player_inside = false

func _ready():
	# garante que o label começa invisível
	label_hint.visible = false

func _on_area_2d_body_entered(_body: Node) -> void:
	# verifica se o corpo entrou
		player_inside = true
		label_hint.visible = true

func _on_area_2d_body_exited(_body: Node) -> void:
	# verifica se o corpo saiu
		player_inside = false
		label_hint.visible = false

func _physics_process(_delta: float) -> void:
	if player_inside and Input.is_action_just_pressed("get_item"):
		#print("Pegou o item!")
		queue_free()  # remove o item da cena
