extends Node2D

@onready var label_npc1 = $Label
@onready var mural1 = $NPC1/CanvasLayer/PanelContainer
@onready var mural2 = $NPC2/CanvasLayer/PanelContainer

var player_inside = false
var mural_open = false
var current_mural: Node = null  # mural do NPC atual

func _ready():
	label_npc1.visible = false
	mural1.visible = false
	mural2.visible = false
# deve ser o mesmo nome da funcao ao aplicar o sinal(function)
func _on_area_npc1_body_entered(_body: Node) -> void:
	player_inside = true
	label_npc1.visible = true
	current_mural = mural1

func _on_area_npc1_body_exited(_body: Node) -> void:
	player_inside = false
	label_npc1.visible = false
	current_mural = null

func _on_area_npc2_body_entered(_body: Node) -> void:
	player_inside = true
	label_npc1.visible = true
	current_mural = mural2

func _on_area_npc2_body_exited(_body: Node) -> void:
	player_inside = false
	label_npc1.visible = false
	current_mural = null

func _physics_process(_delta: float) -> void:
	if player_inside and Input.is_action_just_pressed("mural_quests") and current_mural:
		mural_open = not mural_open

		# Fecha todos os murais primeiro
		mural1.visible = false
		mural2.visible = false

		# Abre só o mural atual
		if mural_open:
			current_mural.visible = true
